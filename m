From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 16 Mar 2020 22:06:06 +0100
Subject: [Buildroot] Build issue: ncurses 6.1 on Buildroot 2020.02
In-Reply-To: <CAN34foxALY06a4n75WhjeKQ=ZATngRt4YEm=YKGzsTH6t+M6kA@mail.gmail.com>
References: <CAN34foxALY06a4n75WhjeKQ=ZATngRt4YEm=YKGzsTH6t+M6kA@mail.gmail.com>
Message-ID: <20200316220606.78381e17@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephen,

On Mon, 16 Mar 2020 15:54:43 -0400, Stephen Beckwith <embeddedsteve@gmail.com> wrote:

> Greetings,
>   I'm having an issue building this package (required) using the 2020.02
> Buildroot setup.  The target is an ARM (cortex-A9) system.  The host system
> is Ubuntu 10.04.1 running in a VM.
> Any suggestions/pointers would be greatly appreciated.
>
> Regards,
> Stephen Beckwith
>
> linking
> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libform.so.6.1
> /home/sbeckwit/sp_dev/bowie_dev/output/host/bin/arm-buildroot-linux-gnueabi-gcc
>  -Os --param max-inline-insns-single=1200 -shared -Wl,-soname,`basename
> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libform.so.6.1
> .6.1`.6,-stats,-lc -o
> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libform.so.6.1
> ../obj_s/fld_arg.o ../obj_s/fld_attr.o ../obj_s/fld_current.o
> ../obj_s/fld_def.o ../obj_s/fld_dup.o ../obj_s/fld_ftchoice.o
> ../obj_s/fld_ftlink.o ../obj_s/fld_info.o ../obj_s/fld_just.o
> ../obj_s/fld_link.o ../obj_s/fld_max.o ../obj_s/fld_move.o
> ../obj_s/fld_newftyp.o ../obj_s/fld_opts.o ../obj_s/fld_pad.o
> ../obj_s/fld_page.o ../obj_s/fld_stat.o ../obj_s/fld_type.o
> ../obj_s/fld_user.o ../obj_s/frm_cursor.o ../obj_s/frm_data.o
> ../obj_s/frm_def.o ../obj_s/frm_driver.o ../obj_s/frm_hook.o
> ../obj_s/frm_opts.o ../obj_s/frm_page.o ../obj_s/frm_post.o
> ../obj_s/frm_req_name.o ../obj_s/frm_scale.o ../obj_s/frm_sub.o
> ../obj_s/frm_user.o ../obj_s/frm_win.o ../obj_s/fty_alnum.o
> ../obj_s/fty_alpha.o ../obj_s/fty_enum.o ../obj_s/fty_generic.o
> ../obj_s/fty_int.o ../obj_s/fty_ipv4.o ../obj_s/fty_num.o
> ../obj_s/fty_regex.o -L../lib -lncurses
> /home/sbeckwit/sp_dev/sp_archives/toolchains/arm9.2-toolchain/lib/gcc/arm-buildroot-linux-gnueabi/9.2.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> total time in link: 0.020083
> cd
> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib
> && (ln -s -f libform.so.6.1 libform.so.6; ln -s -f libform.so.6 libform.so;
> )
> installing ./form.h in
> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include
> cd misc && /usr/bin/make - -j --jobserver-fds=3,4 --no-print-directory --
> DESTDIR=/home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot
> DESTDIR="/home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot"
> RPATH_LIST="/usr/lib" install
> DESTDIR=/home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot
> \
> prefix=/usr \
> exec_prefix=/usr \
> bindir=/usr/bin \
> top_srcdir=.. \
> srcdir=. \
> datadir=/usr/share \
> ticdir=/usr/share/terminfo \
> source=terminfo.tmp \
> cross_compiling=yes \
> /bin/bash ./run_tic.sh
> ** Building terminfo database, please wait...
> Running tic to install
> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/share/terminfo
> ...
>
> You may see messages regarding extended capabilities, e.g., AX.
> These are extended terminal capabilities which are compiled
> using
> tic -x
> If you have ncurses 4.2 applications, you should read the INSTALL
> document, and install the terminfo without the -x option.
>
> t*ic: symbol lookup error: tic: undefined symbol: _nc_find_user_entry*
> ? tic could not build
> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/share/terminfo
> Makefile:92: recipe for target 'install.data' failed
> make[4]: *** [install.data] Error 1
> Makefile:117: recipe for target 'install' failed
> make[3]: *** [install] Error 2
> package/pkg-generic.mk:306: recipe for target
> '/home/sbeckwit/sp_dev/bowie_dev/output/build/ncurses-6.1/.stamp_staging_installed'
> failed
> make[2]: ***
> [/home/sbeckwit/sp_dev/bowie_dev/output/build/ncurses-6.1/.stamp_staging_installed]
> Error 2
> Makefile:23: recipe for target '_all' failed
> make[1]: *** [_all] Error 2
> make[1]: Leaving directory '/home/sbeckwit/sp_dev/bowie_dev/output'
> Makefile:50: recipe for target 'all' failed
> make: *** [all] Error 2
> sbeckwit at ubuntu:~/sp_dev/bowie_dev$

Please try to provide a (at best minimal as possible) .config or defconfig
file which reproduces the failure for you for a complete build (make clean && make)...

Regards,
Peter
