From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 22 Nov 2012 09:46:24 +0100
Subject: [Buildroot] crosstools build fails when hard fpu is selected
In-Reply-To: <20121121132549.7c180f2f@skate>
References: <50ACAB98.90607@wanadoo.fr> <20121121132549.7c180f2f@skate>
Message-ID: <50ADE660.6000802@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas,

thanks to Yann's advice,
I have been able to generate an ARM gcc with Neon support,
and performed some performance testing on my target.
( the root filesystem is for now the one with soft float).

But this is an external crosstool-ng (1.17.0) build.

Thus I have attempted to configure Buildroot to use this
external toolchain.

The build fails at ncurses (see below)

I thought that is was due to the fact that the "Use soft float by 
default" option was not available when using an external toolchain (why 
?) but I have the same issue when crosstol-ng is built within buildroot 
(and the option deselected of course)

I am still investigating, but if you have a clue I would appreciate

Thanks
Thierry

 >>> ncurses 5.9 Building
/usr/bin/make -j1 -C 
/shared/Buildroot/output.imx6hardfpu/build/ncurses-5.9 
DESTDIR=/shared/Buildroot/output.imx6hardfpu/host/usr/arm-unknown-linux-gnueabi/sysroot
make[1]: entrant dans le r?pertoire ? 
/bigdisk/shared/Buildroot/output.imx6hardfpu/build/ncurses-5.9 ?
cd man && /usr/bin/make -w -- 
DESTDIR=/shared/Buildroot/output.imx6hardfpu/host/usr/arm-unknown-linux-gnueabi/sysroot 
DESTDIR="/shared/Buildroot/output.imx6hardfpu/host/usr/arm-unknown-linux-gnueabi/sysroot" 
all
make[2]: entrant dans le r?pertoire ? 
/bigdisk/shared/Buildroot/output.imx6hardfpu/build/ncurses-5.9/man ?
make[2]: Rien ? faire pour ? all ?.
make[2]: quittant le r?pertoire ? 
/bigdisk/shared/Buildroot/output.imx6hardfpu/build/ncurses-5.9/man ?
cd include && /usr/bin/make -w -- 
DESTDIR=/shared/Buildroot/output.imx6hardfpu/host/usr/arm-unknown-linux-gnueabi/sysroot 
DESTDIR="/shared/Buildroot/output.imx6hardfpu/host/usr/arm-unknown-linux-gnueabi/sysroot" 
all
make[2]: entrant dans le r?pertoire ? 
/bigdisk/shared/Buildroot/output.imx6hardfpu/build/ncurses-5.9/include ?
make[2]: Rien ? faire pour ? all ?.
make[2]: quittant le r?pertoire ? 
/bigdisk/shared/Buildroot/output.imx6hardfpu/build/ncurses-5.9/include ?
cd ncurses && /usr/bin/make -w -- 
DESTDIR=/shared/Buildroot/output.imx6hardfpu/host/usr/arm-unknown-linux-gnueabi/sysroot 
DESTDIR="/shared/Buildroot/output.imx6hardfpu/host/usr/arm-unknown-linux-gnueabi/sysroot" 
all
make[2]: entrant dans le r?pertoire ? 
/bigdisk/shared/Buildroot/output.imx6hardfpu/build/ncurses-5.9/ncurses ?
linking ../lib/libncurses.so.5.9
/shared/Buildroot/output.imx6hardfpu/host/usr/bin/ccache 
/shared/Buildroot/output.imx6hardfpu/host/usr/bin/arm-unknown-linux-gnueabi-gcc 
-pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64  --param max-inline-insns-single=1200 -shared 
-Wl,-soname,`basename ../lib/libncurses.so.5.9 .5.9`.5,-stats,-lc -o 
../lib/libncurses.so.5.9 ../obj_s/hardscroll.o ../obj_s/hashmap.o 
../obj_s/lib_addch.o ../obj_s/lib_addstr.o ../obj_s/lib_beep.o 
../obj_s/lib_bkgd.o ../obj_s/lib_box.o ../obj_s/lib_chgat.o 
../obj_s/lib_clear.o ../obj_s/lib_clearok.o ../obj_s/lib_clrbot.o 
../obj_s/lib_clreol.o ../obj_s/lib_color.o ../obj_s/lib_colorset.o 
../obj_s/lib_delch.o ../obj_s/lib_delwin.o ../obj_s/lib_echo.o 
../obj_s/lib_endwin.o ../obj_s/lib_erase.o ../obj_s/lib_flash.o 
../obj_s/lib_gen.o ../obj_s/lib_getch.o ../obj_s/lib_getstr.o 
../obj_s/lib_hline.o ../obj_s/lib_immedok.o ../obj_s/lib_inchstr.o 
../obj_s/lib_initscr.o ../obj_s/lib_insch.o ../obj_s/lib_insdel.o 
../obj_s/lib_insnstr.o ../obj_s/lib_instr.o ../obj_s/lib_isendwin.o 
../obj_s/lib_leaveok.o ../obj_s/lib_mouse.o ../obj_s/lib_move.o 
../obj_s/lib_mvcur.o ../obj_s/lib_mvwin.o ../obj_s/lib_newterm.o 
../obj_s/lib_newwin.o ../obj_s/lib_nl.o ../obj_s/lib_overlay.o 
../obj_s/lib_pad.o ../obj_s/lib_printw.o ../obj_s/lib_redrawln.o 
../obj_s/lib_refresh.o ../obj_s/lib_restart.o ../obj_s/lib_scanw.o 
../obj_s/lib_screen.o ../obj_s/lib_scroll.o ../obj_s/lib_scrollok.o 
../obj_s/lib_scrreg.o ../obj_s/lib_set_term.o ../obj_s/lib_slk.o 
../obj_s/lib_slkatr_set.o ../obj_s/lib_slkatrof.o 
../obj_s/lib_slkatron.o ../obj_s/lib_slkatrset.o ../obj_s/lib_slkattr.o 
../obj_s/lib_slkclear.o ../obj_s/lib_slkcolor.o ../obj_s/lib_slkinit.o 
../obj_s/lib_slklab.o ../obj_s/lib_slkrefr.o ../obj_s/lib_slkset.o 
../obj_s/lib_slktouch.o ../obj_s/lib_touch.o ../obj_s/lib_tstp.o 
../obj_s/lib_ungetch.o ../obj_s/lib_vidattr.o ../obj_s/lib_vline.o 
../obj_s/lib_wattroff.o ../obj_s/lib_wattron.o ../obj_s/lib_winch.o 
../obj_s/lib_window.o ../obj_s/nc_panel.o ../obj_s/safe_sprintf.o 
../obj_s/tty_update.o ../obj_s/varargs.o ../obj_s/memmove.o 
../obj_s/vsscanf.o ../obj_s/lib_freeall.o ../obj_s/expanded.o 
../obj_s/legacy_coding.o ../obj_s/lib_dft_fgbg.o ../obj_s/lib_print.o 
../obj_s/resizeterm.o ../obj_s/use_screen.o ../obj_s/use_window.o 
../obj_s/wresize.o ../obj_s/access.o ../obj_s/add_tries.o 
../obj_s/alloc_ttype.o ../obj_s/codes.o ../obj_s/comp_captab.o 
../obj_s/comp_error.o ../obj_s/comp_hash.o ../obj_s/db_iterator.o 
../obj_s/doalloc.o ../obj_s/entries.o ../obj_s/fallback.o 
../obj_s/free_ttype.o ../obj_s/getenv_num.o ../obj_s/home_terminfo.o 
../obj_s/init_keytry.o ../obj_s/lib_acs.o ../obj_s/lib_baudrate.o 
../obj_s/lib_cur_term.o ../obj_s/lib_data.o ../obj_s/lib_has_cap.o 
../obj_s/lib_kernel.o ../obj_s/lib_keyname.o ../obj_s/lib_longname.o 
../obj_s/lib_napms.o ../obj_s/lib_options.o ../obj_s/lib_raw.o 
../obj_s/lib_setup.o ../obj_s/lib_termcap.o ../obj_s/lib_termname.o 
../obj_s/lib_tgoto.o ../obj_s/lib_ti.o ../obj_s/lib_tparm.o 
../obj_s/lib_tputs.o ../obj_s/lib_trace.o ../obj_s/lib_ttyflags.o 
../obj_s/lib_twait.o ../obj_s/name_match.o ../obj_s/names.o 
../obj_s/read_entry.o ../obj_s/read_termcap.o ../obj_s/setbuf.o 
../obj_s/strings.o ../obj_s/tries.o ../obj_s/trim_sgr0.o 
../obj_s/unctrl.o ../obj_s/visbuf.o ../obj_s/define_key.o 
../obj_s/hashed_db.o ../obj_s/key_defined.o ../obj_s/keybound.o 
../obj_s/keyok.o ../obj_s/version.o -L../lib
/home/tbultel/x-tools/arm-unknown-linux-gnueabi/lib/gcc/arm-unknown-linux-gnueabi/4.6.3/../../../../arm-unknown-linux-gnueabi/bin/ld: 
error: ../lib/libncurses.so.5.9 uses VFP register arguments, 
../obj_s/hardscroll.o does not


Le 21/11/2012 13:25, Thomas Petazzoni a ?crit :
> Dear Thierry Bultel,
>
> On Wed, 21 Nov 2012 11:23:20 +0100, Thierry Bultel wrote:
>
>> GCC has not been generated with the harware FPU support.
>>
>> I have attempted several hacks into
>> toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
>>
>> ... with no better success
>>
>> Any ideas ?
>
> Yes, raise this problem on the crosstool-ng mailing list. I know Yann
> is aware of this, and he will most likely have recommendations on how
> to fix this problem.
>
> Thanks,
>
> Thomas
>
