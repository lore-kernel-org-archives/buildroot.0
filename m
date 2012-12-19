From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Dec 2012 07:15:54 +0000 (UTC)
Subject: [Buildroot] [Bug 5798] New: ncurses-5.9 fails to compile statically
Message-ID: <bug-5798-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5798

           Summary: ncurses-5.9 fails to compile statically
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: keguang.zhang at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4700
  --> https://bugs.busybox.net/attachment.cgi?id=4700
My config

While building ncurses statically with buildroot toolchain (binutils 2.21.1 gcc
4.6.3 and uClibc 0.9.33.2), build fails with error:

>>> ncurses 5.9 Building
/usr/bin/make -j1 -C /media/work/buildroot/output_sp6820a/build/ncurses-5.9
DESTDIR=/media/work/buildroot/output_sp6820a/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
cd man && /usr/bin/make - --no-print-directory --
DESTDIR=/media/work/buildroot/output_sp6820a/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
DESTDIR="/media/work/buildroot/output_sp6820a/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot"
all
...
/media/work/buildroot/output_sp6820a/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H -I../ncurses -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DNDEBUG -I. -I../include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -static
-Os   --param max-inline-insns-single=1200 -fPIC -c ../ncurses/./base/version.c
-o ../obj_s/version.o
linking ../lib/libncurses.so.5.9
/media/work/buildroot/output_sp6820a/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -static
-Os   --param max-inline-insns-single=1200 -shared -Wl,-soname,`basename
../lib/libncurses.so.5.9 .5.9`.5,-stats,-lc -o ../lib/libncurses.so.5.9
../obj_s/hardscroll.o ../obj_s/hashmap.o ../obj_s/lib_addch.o
../obj_s/lib_addstr.o ../obj_s/lib_beep.o ../obj_s/lib_bkgd.o
../obj_s/lib_box.o ../obj_s/lib_chgat.o ../obj_s/lib_clear.o
../obj_s/lib_clearok.o ../obj_s/lib_clrbot.o ../obj_s/lib_clreol.o
../obj_s/lib_color.o ../obj_s/lib_colorset.o ../obj_s/lib_delch.o
../obj_s/lib_delwin.o ../obj_s/lib_echo.o ../obj_s/lib_endwin.o
../obj_s/lib_erase.o ../obj_s/lib_flash.o ../obj_s/lib_gen.o
../obj_s/lib_getch.o ../obj_s/lib_getstr.o ../obj_s/lib_hline.o
../obj_s/lib_immedok.o ../obj_s/lib_inchstr.o ../obj_s/lib_initscr.o
../obj_s/lib_insch.o ../obj_s/lib_insdel.o ../obj_s/lib_insnstr.o
../obj_s/lib_instr.o ../obj_s/lib_isendwin.o ../obj_s/lib_leaveok.o
../obj_s/lib_mouse.o ../obj_s/lib_move.o ../obj_s/lib_mvcur.o
../obj_s/lib_mvwin.o ../obj_s/lib_newterm.o ../obj_s/lib_newwin.o
../obj_s/lib_nl.o ../obj_s/lib_overlay.o ../obj_s/lib_pad.o
../obj_s/lib_printw.o ../obj_s/lib_redrawln.o ../obj_s/lib_refresh.o
../obj_s/lib_restart.o ../obj_s/lib_scanw.o ../obj_s/lib_screen.o
../obj_s/lib_scroll.o ../obj_s/lib_scrollok.o ../obj_s/lib_scrreg.o
../obj_s/lib_set_term.o ../obj_s/lib_slk.o ../obj_s/lib_slkatr_set.o
../obj_s/lib_slkatrof.o ../obj_s/lib_slkatron.o ../obj_s/lib_slkatrset.o
../obj_s/lib_slkattr.o ../obj_s/lib_slkclear.o ../obj_s/lib_slkcolor.o
../obj_s/lib_slkinit.o ../obj_s/lib_slklab.o ../obj_s/lib_slkrefr.o
../obj_s/lib_slkset.o ../obj_s/lib_slktouch.o ../obj_s/lib_touch.o
../obj_s/lib_tstp.o ../obj_s/lib_ungetch.o ../obj_s/lib_vidattr.o
../obj_s/lib_vline.o ../obj_s/lib_wattroff.o ../obj_s/lib_wattron.o
../obj_s/lib_winch.o ../obj_s/lib_window.o ../obj_s/nc_panel.o
../obj_s/safe_sprintf.o ../obj_s/tty_update.o ../obj_s/varargs.o
../obj_s/memmove.o ../obj_s/vsscanf.o ../obj_s/lib_freeall.o
../obj_s/expanded.o ../obj_s/legacy_coding.o ../obj_s/lib_dft_fgbg.o
../obj_s/lib_print.o ../obj_s/resizeterm.o ../obj_s/use_screen.o
../obj_s/use_window.o ../obj_s/wresize.o ../obj_s/access.o ../obj_s/add_tries.o
../obj_s/alloc_ttype.o ../obj_s/codes.o ../obj_s/comp_captab.o
../obj_s/comp_error.o ../obj_s/comp_hash.o ../obj_s/db_iterator.o
../obj_s/doalloc.o ../obj_s/entries.o ../obj_s/fallback.o ../obj_s/free_ttype.o
../obj_s/getenv_num.o ../obj_s/home_terminfo.o ../obj_s/init_keytry.o
../obj_s/lib_acs.o ../obj_s/lib_baudrate.o ../obj_s/lib_cur_term.o
../obj_s/lib_data.o ../obj_s/lib_has_cap.o ../obj_s/lib_kernel.o
../obj_s/lib_keyname.o ../obj_s/lib_longname.o ../obj_s/lib_napms.o
../obj_s/lib_options.o ../obj_s/lib_raw.o ../obj_s/lib_setup.o
../obj_s/lib_termcap.o ../obj_s/lib_termname.o ../obj_s/lib_tgoto.o
../obj_s/lib_ti.o ../obj_s/lib_tparm.o ../obj_s/lib_tputs.o
../obj_s/lib_trace.o ../obj_s/lib_ttyflags.o ../obj_s/lib_twait.o
../obj_s/name_match.o ../obj_s/names.o ../obj_s/read_entry.o
../obj_s/read_termcap.o ../obj_s/setbuf.o ../obj_s/strings.o ../obj_s/tries.o
../obj_s/trim_sgr0.o ../obj_s/unctrl.o ../obj_s/visbuf.o ../obj_s/define_key.o
../obj_s/hashed_db.o ../obj_s/key_defined.o ../obj_s/keybound.o
../obj_s/keyok.o ../obj_s/version.o -L../lib  
/media/work/buildroot/output_sp6820a/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os):
In function `__uClibc_fini':
__uClibc_main.c:(.text+0x130): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x134): undefined reference to `__fini_array_end'
__uClibc_main.c:(.text+0x138): undefined reference to `__fini_array_start'
/media/work/buildroot/output_sp6820a/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os):
In function `__uClibc_main':
__uClibc_main.c:(.text+0x4c8): undefined reference to `__preinit_array_start'
__uClibc_main.c:(.text+0x4cc): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x4d4): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x4d8): undefined reference to `__init_array_end'
/media/work/buildroot/output_sp6820a/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
../lib/libncurses.so.5.9: hidden symbol `__fini_array_end' isn't defined
/media/work/buildroot/output_sp6820a/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
final link failed: Bad value
collect2: ld returned 1 exit status
make[3]: *** [../lib/libncurses.so.5.9] Error 1
make[2]: *** [all] Error 2
make[1]: ***
[/media/work/buildroot/output_sp6820a/build/ncurses-5.9/.stamp_built] Error 2
make: *** [all] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
