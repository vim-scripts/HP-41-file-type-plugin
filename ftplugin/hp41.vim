" Vim filetype plugin
" Language:     HP-41
" Version:	0.8.3
" Maintainer:   Geir Isene
" Last Change:  2012-02-05
" URL:          http://isene.com/

" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
    finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

set nrformats-=octal

map <CR> :call Renumber()<CR>
imap <CR> <CR><C-Y><C-Y><C-Y><SPACE><ESC>0<C-A>:call Renumber()<CR>A
iab a AVIEW
iab A AVIEW
iab c CLX
iab C CLX
iab d DSE
iab D DSE
iab g GTO
iab G GTO
iab i ISG
iab I ISG
iab l <LEFT>*LBL
iab L <LEFT>*LBL
iab p PROMPT
iab P PROMPT
iab q XEQ
iab Q XEQ
iab r RCL
iab R RCL
iab s STO
iab S STO
iab t RTN
iab T RTN
iab v VIEW
iab V VIEW
iab < X<>Y
iab . STOP

if !exists("*s:Renumber")
    function Renumber()
	let s:linenumber = line(".")
	let s:colnumber = col(".")
	call cursor(2,1)
	let @r = 1
        exe "normal 0cw".printf("%03d", @r)
	2,$s#^\d\d\d#\=printf("%03d", @r + setreg('r', @r+1))#
	call cursor(s:linenumber,s:colnumber)
    endfunction
endif
