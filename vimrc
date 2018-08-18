" This vimrc is opmtimized for Go programming language.
" To use this configuration, make sure you have
" installed Go ( http://golang.org ). Once you installed
" Go environment, use the following commands to install
" other tools:
"
"   go get github.com/bradfitz/goimports
"   go get code.google.com/p/rog-go/exp/cmd/godef
"   go get github.com/nsf/gocode
"   go get github.com/jstemmer/gotags
"   go get github.com/golang/lint/golint
"
set nocompatible " be iMproved, required


" Set the leader
let mapleader = ','

" Setup Vundle
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/Vundle.vim'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" NERDTree
Plugin 'scrooloose/nerdtree'
" 这个Toggle是什么意思
nmap <F5> :NERDTreeToggle<CR> 
"nnoremap <leader>ne :NERDTree<CR>

Plugin 'git@github.com:spf13/spf13-vim.git'
"Plugin 'spf13/vim-colors' "这种方式默认使用https协议，因为https方式git clone报ssl错误，故改成ssh方式，如上

" fugitive.vim: A Git wrapper so awesome, it should be illegal.
Plugin 'git@github.com:tpope/vim-fugitive.git'
"Plugin 'tpope/vim-fugitive'

Plugin 'git@github.com:nsf/gocode.git'

" YouCompleteMe
" https://github.com/Valloric/YouCompleteMe
"
" To use this on Ubuntu, we need to update vim to the latest version.
" Use this PPA: https://launchpad.net/~nmi/+archive/vim-snapshots
"
" sudo add-apt-repository ppa:nmi/vim-snapshots
" sudo apt-get update
" sudo apt-get dist-upgrade
"
" Then compile YCM:
"
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev
"
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer
"Plugin 'git@github.com:Valloric/YouCompleteMe.git'
"Plugin 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_log_level = 'debug'
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Works best with YCM
Plugin 'git@github.com:vim-syntastic/syntastic.git'
"Plugin 'scrooloose/syntastic'

" We have to use LaTeX. It's not perfect, but it's the only game in this town.
" And it's much better than others.
"Plugin 'jcf/vim-latex'

" Easy motion. A tutorial could be found here:
" http://net.tutsplus.com/tutorials/other/vim-essential-plugin-easymotion/
" Note: The default leader has been changed to <Leader><Leader>
" Type ,,w to see the magic happens.
Plugin 'git@github.com:easymotion/vim-easymotion.git'
"Plugin 'Lokaltog/vim-easymotion'

" tmux navigator.
" More details:
" http://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
Plugin 'git@github.com:christoomey/vim-tmux-navigator.git'
"Plugin 'christoomey/vim-tmux-navigator'

" protobuf
"Plugin 'uarun/vim-protobuf'

" Go
Plugin 'fatih/vim-go'
" Use goimports instead of gofmt.
let g:go_fmt_command = "goimports"
let g:go_fmt_autofmt = 1

au FileType go nmap <Leader>i <Plug>(go-import)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Rust
"Plugin 'rust-lang/rust.vim'

"Plugin 'git@github.com:SirVer/ultisnips.git'
"Plugin 'SirVer/ultisnips'

" Handle the issues between utilsnips and YCM
let g:UltiSnipsExpandTrigger = '<c-j>'


" Markdown
"Plugin 'monnand/vim-markdown'

" HTML
" Plugin "mattn/emmet-vim"

" Tagbar
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" .po file
"Plugin 'po.vim'

" color scheme
"Plugin 'molokai'


"Plugin 'dgryski/vim-godef'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---------------- Some general hack --------------
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on


" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easily change my vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Easily quote something
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>l

" do not use <esc>
inoremap jk <esc>
vnoremap jk <esc>

" Tips:
" - normal mode, :Vex[plore] :Ex[plore] :Sex[plore]

" movement mapping. See LVSH (Learn VIM Script the Hardway) 15.1
onoremap p i(

"
" Set status line
if has('statusline')
	set laststatus=2

	" Broken down into easily includeable segments
	set statusline=%<%f\ " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=\ [%{&ff}/%Y] " filetype
	" csindent.vim
	" http://www.vim.org/scripts/script.php?script_id=2633
	"set statusline+=\ [%{CodingStyleIndent()}] " csindent
	set statusline+=\ [%{getcwd()}] " current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

set foldenable " auto fold code
set hlsearch " highlite search
set showmatch " show matching {}/()


" set cursor line and column
"光标显示列线和行线
"set cursorline
set cursorcolumn


set pastetoggle=<F12>	" pastetoggle

" Yank from the cursor to the end of the line
nnoremap Y y$

" -------------------------------------------


" Python indent
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Go tags
" To install gotags:
"     go get -u github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Translator information
let g:po_translator = "Nan Deng <monnand@gmail.com>"
let g:po_lang_team = "Chinese (Simplified)"


" TeX file should be aligned
autocmd BufWritePre *.tex :set tw=80

" golint
" To install golint:
"   go get github.com/golang/lint/golint
" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" tags
" C-\ - Open the definition in a new tab
" A-] - Open the definition in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"remember last update or view postion"
" Only do this part when compiled with support for autocommands 
if has("autocmd")
" In text files, always limit the width of text to 78 characters 
autocmd BufRead *.txt set tw=78
" When editing a file, always jump to the last cursor position 
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif 
endif

"set nu ts=4 sw=4
set pastetoggle=<F9>


"let g:go_version_warning = 0
let g:godef_split = 0
let g:tagbar_width = 50

set number
filetype on
set background=dark
syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4

"将tab显示为竖线
set list lcs=tab:\|\ "最后有个空格


set laststatus=2
set backspace=2 "设置backspace可以删除字符
set foldmethod=indent "使用indent折叠方式 缩进折叠
set foldcolumn=4
set foldlevelstart=99 "打开文件后默认不折叠

set confirm
set ruler
"set autochdir
set incsearch
"set showcmd
set ignorecase smartcase
set cmdheight=2
"set linebreak
highlight search ctermbg=yellow ctermfg=black
"highlight matchparen cterm=underline ctermbg=none ctermfg=none
set history=1000
