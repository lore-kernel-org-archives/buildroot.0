From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 19 Jul 2010 11:31:45 +0100
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <1279288154.15465.18.camel@dubciaranr1.verifone.com>
References: <1279123755.7058.242.camel@cabbage.rehill.info>
	<4C3E102D.50105@zacarias.com.ar>
	<1279192188.6184.2.camel@dubciaranr1.verifone.com>
	<AANLkTinsUwFgYEaRhtAwzO2I5Y2frnUunmtzBKTSveF9@mail.gmail.com>
	<1279202763.3572.22.camel@dubciaranr1.verifone.com>
	<AANLkTiks30hgwzuxxsGuxSPsP2iO1S7b1avRHCV9JllD@mail.gmail.com>
	<1279205058.3572.29.camel@dubciaranr1.verifone.com>
	<AANLkTiknnWawF0mRHGu73MxCCuAcGpYWxK-i-uaUKXub@mail.gmail.com>
	<1279212734.3572.42.camel@dubciaranr1.verifone.com>
	<AANLkTikfJUKA0Y1Wv8iJ2Wa8w4IspA5wY-WkhBmkWueV@mail.gmail.com>
	<1279272306.3572.93.camel@dubciaranr1.verifone.com>
	<AANLkTim6BMXBWILqIwNMe02j3PDl9TAWhT1n_pkUdBBI@mail.gmail.com>
	<1279288154.15465.18.camel@dubciaranr1.verifone.com>
Message-ID: <1279535505.22010.3.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Replies fell off the list so resending...]

Ar Aoine, 2010-07-16 ag 22:07 +1000, scr?obh Mitch Davis:

> Yeah you're keen :-)

Keen to get the damn thing fixed, alright! ;-)

> I think you're right, this 2006 software is too old for the data
> that's being put through it.  Even if you find the problem, no-one
> will want the patch when a modern tic works ok.  To help yourself, is
> it possible to self compile a newer tic and have it in the path?
> 
> Good luck dude!

OK, thanks for the tips, I'll either stick with 5.6 for now or do as you
say.

BTW, do you have any idea why, if I have a build that fails in ncurses
and I just do "rm -rf output/build/ncurses-5.7" and "make", it fails
making the static library because $(AR_FLAGS) is empty?

        /home/qvr/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-ar  ../lib/libncurses.a ../objects/hardscroll.o ../objects/hashmap.o ../objects/lib_addch.o ../objects/lib_addstr.o ../objects/lib_beep.o ../objects/lib_bkgd.o ../objects/lib_box.o ../objects/lib_chgat.o ../objects/lib_clear.o ../objects/lib_clearok.o ../objects/lib_clrbot.o ../objects/lib_clreol.o ../objects/lib_color.o ../objects/lib_colorset.o ../objects/lib_delch.o ../objects/lib_delwin.o ../objects/lib_echo.o ../objects/lib_endwin.o ../objects/lib_erase.o ../objects/lib_flash.o ../objects/lib_gen.o ../objects/lib_getch.o ../objects/lib_getstr.o ../objects/lib_hline.o ../objects/lib_immedok.o ../objects/lib_inchstr.o ../objects/lib_initscr.o ../objects/lib_insch.o ../objects/lib_insdel.o ../objects/lib_insnstr.o ../objects/lib_instr.o ../objects/lib_isendwin.o ../objects/lib_leaveok.o ../objects/lib_mouse.o ../objects/lib_move.o ../objects/lib_mvcur.o ../objects/lib_mvwin.o ../objects/lib_newterm.o ../objects/lib_newwin.o ../objects/lib_nl.o ../objects/lib_overlay.o ../objects/lib_pad.o ../objects/lib_printw.o ../objects/lib_redrawln.o ../objects/lib_refresh.o ../objects/lib_restart.o ../objects/lib_scanw.o ../objects/lib_screen.o ../objects/lib_scroll.o ../objects/lib_scrollok.o ../objects/lib_scrreg.o ../objects/lib_set_term.o ../objects/lib_slk.o ../objects/lib_slkatr_set.o ../objects/lib_slkatrof.o ../objects/lib_slkatron.o ../objects/lib_slkatrset.o ../objects/lib_slkattr.o ../objects/lib_slkclear.o ../objects/lib_slkcolor.o ../objects/lib_slkinit.o ../objects/lib_slklab.o ../objects/lib_slkrefr.o ../objects/lib_slkset.o ../objects/lib_slktouch.o ../objects/lib_touch.o ../objects/lib_tstp.o ../objects/lib_ungetch.o ../objects/lib_vidattr.o ../objects/lib_vline.o ../objects/lib_wattroff.o ../objects/lib_wattron.o ../objects/lib_winch.o ../objects/lib_window.o ../objects/nc_panel.o ../objects/safe_sprintf.o ../objects/tty_update.o ../objects/varargs.o ../objects/memmove.o ../objects/vsscanf.o ../objects/lib_freeall.o ../objects/expanded.o ../objects/legacy_coding.o ../objects/lib_dft_fgbg.o ../objects/lib_print.o ../objects/resizeterm.o ../objects/use_screen.o ../objects/use_window.o ../objects/wresize.o ../objects/access.o ../objects/add_tries.o ../objects/alloc_ttype.o ../objects/codes.o ../objects/comp_error.o ../objects/db_iterator.o ../objects/doalloc.o ../objects/entries.o ../objects/fallback.o ../objects/free_ttype.o ../objects/getenv_num.o ../objects/home_terminfo.o ../objects/init_keytry.o ../objects/lib_acs.o ../objects/lib_baudrate.o ../objects/lib_cur_term.o ../objects/lib_data.o ../objects/lib_has_cap.o ../objects/lib_kernel.o ../objects/lib_keyname.o ../objects/lib_longname.o ../objects/lib_napms.o ../objects/lib_options.o ../objects/lib_raw.o ../objects/lib_setup.o ../objects/lib_termcap.o ../objects/lib_termname.o ../objects/lib_tgoto.o ../objects/lib_ti.o ../objects/lib_tparm.o ../objects/lib_tputs.o ../objects/lib_trace.o ../objects/lib_ttyflags.o ../objects/lib_twait.o ../objects/name_match.o ../objects/names.o ../objects/read_entry.o ../objects/read_termcap.o ../objects/setbuf.o ../objects/strings.o ../objects/tries.o ../objects/trim_sgr0.o ../objects/unctrl.o ../objects/visbuf.o ../objects/define_key.o ../objects/hashed_db.o ../objects/key_defined.o ../objects/keybound.o ../objects/keyok.o ../objects/version.o
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-ar: illegal option -- .
        Usage: /home/qvr/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-ar [emulation options] [-]{dmpqrstx}[abcfilNoPsSuvV] [member-name] [count] archive-file file...
               /home/qvr/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-ar -M [<mri-script]
         commands:
          d            - delete file(s) from the archive
          m[ab]        - move file(s) in the archive
          p            - print file(s) found in the archive
          q[f]         - quick append file(s) to the archive
          r[ab][f][u]  - replace existing or insert new file(s) into the archive
          t            - display contents of archive
          x[o]         - extract file(s) from the archive
         command specific modifiers:
          [a]          - put file(s) after [member-name]
          [b]          - put file(s) before [member-name] (same as [i])
          [D]          - use zero for timestamps and uids/gids
          [N]          - use instance [count] of name
          [f]          - truncate inserted file names
          [P]          - use full path names when matching
          [o]          - preserve original dates
          [u]          - only replace files that are newer than current archive contents
         generic modifiers:
          [c]          - do not warn if the library had to be created
          [s]          - create an archive index (cf. ranlib)
          [S]          - do not build a symbol table
          [T]          - make a thin archive
          [v]          - be verbose
          [V]          - display the version number
          @<file>      - read options from <file>
         emulation options: 
          No emulation specific options
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-ar: supported targets: elf32-littlearm elf32-bigarm elf32-little elf32-big srec symbolsrec verilog tekhex binary ihex
        make[2]: *** [../lib/libncurses.a] Error 1
        make[2]: Leaving directory `/home/qvr/obair/buildroot.org/output/build/ncurses-5.7/ncurses'
        make[1]: *** [all] Error 2
        make[1]: Leaving directory `/home/qvr/obair/buildroot.org/output/build/ncurses-5.7'
        make: *** [/home/qvr/obair/buildroot.org/output/build/ncurses-5.7/.stamp_built] Error 2
