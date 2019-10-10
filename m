From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 10 Oct 2019 09:16:28 -0700
Subject: [Buildroot] Build failure on upgrade to 2019.08.1
In-Reply-To: <CAJJ6jxvGXS4L0fjp16WHGtdd6fKMhTPcCsS2aeaZPrkW0MBNYw@mail.gmail.com>
References: <CAJJ6jxvGsZ0SYgivex5jGCHg21_acu=kp5CdRO2FF2K_xhUZwQ@mail.gmail.com>
 <fced002e-90cf-30e7-d515-f546daaf77bf@mind.be>
 <CAJJ6jxuRAd76-cOzKgGhtq0nvx+w0MeoMTCKdHzNmsGP+Rudzg@mail.gmail.com>
 <90524ee3-a438-fb38-da43-8632066743af@mind.be>
 <CAJJ6jxvGXS4L0fjp16WHGtdd6fKMhTPcCsS2aeaZPrkW0MBNYw@mail.gmail.com>
Message-ID: <CAJJ6jxtWqNgaDc-4crxELmMXDQVrEHK3NwuopgOo5HWG9b2ztA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

More environment info:

 echo $BR2_DEBUG_WRAPPER
1
calfee at dock-container:~/edi-workspace/buildroot/output/build/dbus-1.12.16/tools$
ls -l /home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/
total 11488
-rw-r--r-- 1 calfee calfee     776 Oct  9 17:02 Mcrt1.o
-rw-r--r-- 1 calfee calfee    1976 Oct  9 17:02 Scrt1.o
drwxr-xr-x 2 calfee calfee    4096 Oct  9 17:02 audit
-rw-r--r-- 1 calfee calfee    1984 Oct  9 17:02 crt1.o
-rw-r--r-- 1 calfee calfee    1124 Oct  9 17:02 crti.o
-rw-r--r-- 1 calfee calfee     784 Oct  9 17:02 crtn.o
drwxr-xr-x 2 calfee calfee   12288 Oct  9 17:02 gconv
-rw-r--r-- 1 calfee calfee    2584 Oct  9 17:02 gcrt1.o
-rw-r--r-- 1 calfee calfee    1366 Oct  9 17:02 libBrokenLocale.a
lrwxrwxrwx 1 calfee calfee      30 Oct  9 17:02 libBrokenLocale.so ->
../../lib/libBrokenLocale.so.1
-rw-r--r-- 1 calfee calfee   14208 Oct  9 17:02 libanl.a
lrwxrwxrwx 1 calfee calfee      21 Oct  9 17:02 libanl.so ->
../../lib/libanl.so.1
-rw-r--r-- 1 calfee calfee 3516712 Oct  9 17:02 libc.a
-rw-r--r-- 1 calfee calfee     243 Oct  9 17:02 libc.so
-rw-r--r-- 1 calfee calfee   22862 Oct  9 17:02 libc_nonshared.a
-rw-r--r-- 1 calfee calfee   41504 Oct  9 17:02 libcrypt.a
lrwxrwxrwx 1 calfee calfee      23 Oct  9 17:02 libcrypt.so ->
../../lib/libcrypt.so.1
-rw-r--r-- 1 calfee calfee   10422 Oct  9 17:02 libdl.a
lrwxrwxrwx 1 calfee calfee      20 Oct  9 17:02 libdl.so -> ../../lib/libdl.so.2
-rwxr-xr-x 1 calfee calfee     993 Oct  9 22:18 libexpat.la
lrwxrwxrwx 1 calfee calfee      18 Oct  9 22:18 libexpat.so ->
libexpat.so.1.6.10
lrwxrwxrwx 1 calfee calfee      18 Oct  9 22:18 libexpat.so.1 ->
libexpat.so.1.6.10
-rwxr-xr-x 1 calfee calfee  131644 Oct  9 22:18 libexpat.so.1.6.10
-rw-r--r-- 1 calfee calfee     970 Oct  9 17:02 libg.a
-rw-r--r-- 1 calfee calfee 1099826 Oct  9 17:02 libm.a
lrwxrwxrwx 1 calfee calfee      19 Oct  9 17:02 libm.so -> ../../lib/libm.so.6
-rw-r--r-- 1 calfee calfee    1148 Oct  9 17:02 libmcheck.a
lrwxrwxrwx 1 calfee calfee      28 Oct  9 17:02 libnss_compat.so ->
../../lib/libnss_compat.so.2
lrwxrwxrwx 1 calfee calfee      24 Oct  9 17:02 libnss_db.so ->
../../lib/libnss_db.so.2
lrwxrwxrwx 1 calfee calfee      25 Oct  9 17:02 libnss_dns.so ->
../../lib/libnss_dns.so.2
lrwxrwxrwx 1 calfee calfee      27 Oct  9 17:02 libnss_files.so ->
../../lib/libnss_files.so.2
lrwxrwxrwx 1 calfee calfee      28 Oct  9 17:02 libnss_hesiod.so ->
../../lib/libnss_hesiod.so.2
-rw-r--r-- 1 calfee calfee  347762 Oct  9 17:02 libpthread.a
lrwxrwxrwx 1 calfee calfee      25 Oct  9 17:02 libpthread.so ->
../../lib/libpthread.so.0
-rw-r--r-- 1 calfee calfee   88086 Oct  9 17:02 libresolv.a
lrwxrwxrwx 1 calfee calfee      24 Oct  9 17:02 libresolv.so ->
../../lib/libresolv.so.2
-rw-r--r-- 1 calfee calfee   37406 Oct  9 17:02 librpcsvc.a
-rw-r--r-- 1 calfee calfee   61678 Oct  9 17:02 librt.a
lrwxrwxrwx 1 calfee calfee      20 Oct  9 17:02 librt.so -> ../../lib/librt.so.1
-rw-r--r-- 1 calfee calfee 4583716 Oct  9 17:13 libstdc++.a
lrwxrwxrwx 1 calfee calfee      19 Oct  9 17:13 libstdc++.so ->
libstdc++.so.6.0.25
lrwxrwxrwx 1 calfee calfee      19 Oct  9 17:13 libstdc++.so.6 ->
libstdc++.so.6.0.25
-rwxr-xr-x 1 calfee calfee 1693816 Oct  9 17:13 libstdc++.so.6.0.25
-rw-r--r-- 1 calfee calfee    2492 Oct  9 17:13 libstdc++.so.6.0.25-gdb.py
lrwxrwxrwx 1 calfee calfee      27 Oct  9 17:02 libthread_db.so ->
../../lib/libthread_db.so.1
-rw-r--r-- 1 calfee calfee   10176 Oct  9 17:02 libutil.a
lrwxrwxrwx 1 calfee calfee      22 Oct  9 17:02 libutil.so ->
../../lib/libutil.so.1
drwxr-xr-x 2 calfee calfee    4096 Oct  9 22:18 pkgconfig

And the linker found crt1.o and crti.o

On Thu, Oct 10, 2019 at 9:09 AM Steve Calfee <stevecalfee@gmail.com> wrote:
>
> On Thu, Oct 10, 2019 at 8:41 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 10/10/2019 17:01, Steve Calfee wrote:
> > > On Wed, Oct 9, 2019 at 4:22 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> > >>
> > >> On 09/10/2019 23:55, Steve Calfee wrote:
> > >>> I built the buildroot toolchain in one BR tree, to use as an external
> > >>> toolchain in another.
> > >>
> > >>  I assume you use it as a preinstalled external toolchain?
> > >
> > > Yes, as I have done for several years on many buildroot versions.
> >
> >  I'm asking because the pre-installed external toolchain doesn't get that much
> > testing. So it is not impossible for it to break.
> >
> >  However, I just tried a build of dbus with a preinstalled external toolchain
> > and it completed without a hitch.
> >
> > [snip]
> > >>> And then in another tree I checked out 2019.08.1, loaded in my old
> > >>> defconfig and then started a build.
> >
> >  BTW, myself, I never start from a defconfig when I update Buildroot; I start
> > from a full config. That avoids problems when defaults for some options have
> > changed. Note however that this can't explain your build failure (and even so it
> > wouldn't be an excuse :-).
> >
> The legacy options in menuconfig flags the errors. However if you
> cannot find my errors I will start again trying your way.
>
> > >>> Fairly quickly in the build I get
> > >>> this link failure.
> > >>>
> > >>> libtool: link: /home/calfee/edi-workspace/buildroot/output/host/bin/arm-buildroot-linux-gnueabi-gcc
> > >>> -fno-strict-aliasing -fno-common -Wall -Wextra -Wundef -Wwrite-strings
> > >>> -Wpointer-arith -Wmissing-declarations -Wredundant-decls
> > >>> -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2
> > >>> -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare
> > >>> -Wstrict-aliasing -Wshadow -Winline -Wpacked
> > >>> -Wmissing-format-attribute -Wmissing-noreturn -Winit-self
> > >>> -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds
> > >>> -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond
> > >>> -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference
> > >>> -Wdouble-promotion -Wchar-subscripts -Wfloat-equal -Wpointer-sign
> > >>> -Wno-deprecated-declarations -Wno-cast-function-type -Wno-unused-label
> > >>> -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes
> > >>> -Wdeclaration-after-statement -Wimplicit-function-declaration
> > >>> -Wold-style-definition -Wjump-misses-init -Wno-error=unused-parameter
> > >>> -Wno-error=missing-field-initializers
> > >>> -Wno-error=deprecated-declarations -Wno-error=cast-function-type
> > >>> -Wno-error=unused-label -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > >>> -D_FILE_OFFSET_BITS=64 -Os -Wl,--no-as-needed -o
> > >>> dbus-update-activation-environment
> > >>> dbus-update-activation-environment.o tool-common.o
> > >>> ../dbus/.libs/libdbus-1.so -Wl,-rpath
> > >>> -Wl,/home/calfee/edi-workspace/buildroot/output/build/dbus-1.12.16/dbus/.libs
> > >>> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> > >>> warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
> > >>> found (try using -rpath or -rpath-link)
> > >>
> > >>  There's no error here, just a warning... But I guess it is followed by some
> > >> undefined pthread symbols.
> > >>
> > > Yes, about 4 undefined symbols.
> > >
> > >
> > >>  It's weird though, since the sysroot/lib directory should be in the toolchain's
> > >> standard search path.
> > >>
> > >>  Could you run the link command with an additional -v option so we see the
> > >> library search path?
> > >>
> > >>  Regards,
> > >>  Arnout
> > >>
> > >
> > > I really appreciate you trying to help. I cannot see how to add a link
> > > option. I tried "make V=2" but with no effect.
> > >
> > > The makefile stuff is pretty complicated. The one in the buildroot
> > > base directory does not have a link command that I can see. I tried
> > > just re-entering the command that was sent to the console with make
> >
> >  Yes, that's what I meant: enter the `.../arm-buildroot-linux-gnueabi-gcc
> > -fno-strict-aliasing ...` command with an additional -v...
> >
> > > V=1, but I don't seem to be in the correct directory to issue that
> > > command.
> >
> >  ... from the directory that contains dbus-update-activation-environment.c, i.e.
> > output/build/dbus-1.12.16/tools/
> >
> >  You can also also set BR2_DEBUG_WRAPPER=1 in the environment to see the options
> > that really get passed to gcc.
> >
> >  Regards,
> >  Arnout
> >
>
> Your path suggestion helped. I did not realize it was failing in the
> .../tools/ directory. My complete console session with this link is in
> the output below.
>
> I don't see anything obviously wrong in the output. I hope it is not
> one of those "order matters" in the link command.
>
>
> calfee at dock-container:~/edi-workspace/buildroot/output/build/dbus-1.12.16/tools$
> /home/calfee/edi-workspace/buildroot/output/host/bin/arm-buildroot-linux-gnueabi-gcc
> -fno-strict-aliasing -fno-common -Wall -Wextra -Wundef -Wwrite-strings
> -Wpointer-arith -Wmissing-declarations -Wredundant-decls
> -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2
> -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare
> -Wstrict-aliasing -Wshadow -Winline -Wpacked
> -Wmissing-format-attribute -Wmissing-noreturn -Winit-self
> -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds
> -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond
> -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference
> -Wdouble-promotion -Wchar-subscripts -Wfloat-equal -Wpointer-sign
> -Wno-deprecated-declarations -Wno-cast-function-type -Wno-unused-label
> -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes
> -Wdeclaration-after-statement -Wimplicit-function-declaration
> -Wold-style-definition -Wjump-misses-init -Wno-error=unused-parameter
> -Wno-error=missing-field-initializers
> -Wno-error=deprecated-declarations -Wno-error=cast-function-type
> -Wno-error=unused-label -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -Os -Wl,--no-as-needed -o dbus-monitor
> dbus-monitor.o dbus-print-message.o tool-common.o
> ../dbus/.libs/libdbus-1.so -Wl,-rpath
> -Wl,/home/calfee/edi-workspace/buildroot/output/build/dbus-1.12.16/dbus/.libs
> -v -v
> Toolchain wrapper executing:
> '/home/calfee/edi-workspace/buildroot/../toolchain/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc.br_real'
> '--sysroot' '/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot'
> '-mabi=aapcs-linux' '-msoft-float' '-marm' '-mfloat-abi=soft'
> '-mcpu=arm926ej-s' '-fno-strict-aliasing' '-fno-common' '-Wall'
> '-Wextra' '-Wundef' '-Wwrite-strings' '-Wpointer-arith'
> '-Wmissing-declarations' '-Wredundant-decls' '-Wno-unused-parameter'
> '-Wno-missing-field-initializers' '-Wformat=2' '-Wcast-align'
> '-Wformat-nonliteral' '-Wformat-security' '-Wsign-compare'
> '-Wstrict-aliasing' '-Wshadow' '-Winline' '-Wpacked'
> '-Wmissing-format-attribute' '-Wmissing-noreturn' '-Winit-self'
> '-Wmissing-include-dirs' '-Wunused-but-set-variable' '-Warray-bounds'
> '-Wreturn-type' '-Wswitch-enum' '-Wswitch-default' '-Wduplicated-cond'
> '-Wduplicated-branches' '-Wlogical-op' '-Wrestrict'
> '-Wnull-dereference' '-Wdouble-promotion' '-Wchar-subscripts'
> '-Wfloat-equal' '-Wpointer-sign' '-Wno-deprecated-declarations'
> '-Wno-cast-function-type' '-Wno-unused-label' '-Wnested-externs'
> '-Wmissing-prototypes' '-Wstrict-prototypes'
> '-Wdeclaration-after-statement' '-Wimplicit-function-declaration'
> '-Wold-style-definition' '-Wjump-misses-init'
> '-Wno-error=unused-parameter' '-Wno-error=missing-field-initializers'
> '-Wno-error=deprecated-declarations' '-Wno-error=cast-function-type'
> '-Wno-error=unused-label' '-D_LARGEFILE_SOURCE'
> '-D_LARGEFILE64_SOURCE' '-D_FILE_OFFSET_BITS=64' '-Os'
> '-Wl,--no-as-needed' '-o' 'dbus-monitor' 'dbus-monitor.o'
> 'dbus-print-message.o' 'tool-common.o' '../dbus/.libs/libdbus-1.so'
> '-Wl,-rpath' '-Wl,/home/calfee/edi-workspace/buildroot/output/build/dbus-1.12.16/dbus/.libs'
> '-v' '-v'
> Using built-in specs.
> COLLECT_GCC=/home/calfee/edi-workspace/buildroot/../toolchain/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc.br_real
> COLLECT_LTO_WRAPPER=/home/calfee/edi-workspace/toolchain/output/host/libexec/gcc/arm-buildroot-linux-gnueabi/8.3.0/lto-wrapper
> Target: arm-buildroot-linux-gnueabi
> Configured with: ./configure
> --prefix=/home/calfee/edi-workspace/toolchain/output/host
> --sysconfdir=/home/calfee/edi-workspace/toolchain/output/host/etc
> --enable-static --target=arm-buildroot-linux-gnueabi
> --with-sysroot=/home/calfee/edi-workspace/toolchain/output/host/arm-buildroot-linux-gnueabi/sysroot
> --enable-__cxa_atexit --with-gnu-ld --disable-libssp
> --disable-multilib --disable-decimal-float
> --with-gmp=/home/calfee/edi-workspace/toolchain/output/host
> --with-mpc=/home/calfee/edi-workspace/toolchain/output/host
> --with-mpfr=/home/calfee/edi-workspace/toolchain/output/host
> --with-pkgversion='Buildroot 2019.11-git-00838-g196e3d2'
> --with-bugurl=http://bugs.buildroot.net/ --disable-libquadmath
> --enable-tls --enable-threads --without-isl --without-cloog
> --with-float=soft --with-abi=aapcs-linux --with-cpu=arm926ej-s
> --with-float=soft --with-mode=arm --enable-languages=c,c++
> --with-build-time-tools=/home/calfee/edi-workspace/toolchain/output/host/arm-buildroot-linux-gnueabi/bin
> --enable-shared --disable-libgomp
> Thread model: posix
> gcc version 8.3.0 (Buildroot 2019.11-git-00838-g196e3d2)
> COMPILER_PATH=/home/calfee/edi-workspace/toolchain/output/host/libexec/gcc/arm-buildroot-linux-gnueabi/8.3.0/:/home/calfee/edi-workspace/toolchain/output/host/libexec/gcc/arm-buildroot-linux-gnueabi/8.3.0/:/home/calfee/edi-workspace/toolchain/output/host/libexec/gcc/arm-buildroot-linux-gnueabi/:/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/:/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/:/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/
> LIBRARY_PATH=/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/:/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/lib/:/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/lib/:/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/
> COLLECT_GCC_OPTIONS='-mabi=aapcs-linux' '-mfloat-abi=soft' '-marm'
> '-mfloat-abi=soft' '-mcpu=arm926ej-s' '-fno-strict-aliasing'
> '-fno-common' '-Wall' '-Wextra' '-Wundef' '-Wwrite-strings'
> '-Wpointer-arith' '-Wmissing-declarations' '-Wredundant-decls'
> '-Wno-unused-parameter' '-Wno-missing-field-initializers' '-Wformat=2'
> '-Wcast-align' '-Wformat-nonliteral' '-Wformat-security'
> '-Wsign-compare' '-Wstrict-aliasing' '-Wshadow' '-Winline' '-Wpacked'
> '-Wsuggest-attribute=format' '-Wsuggest-attribute=noreturn'
> '-Winit-self' '-Wmissing-include-dirs' '-Wunused-but-set-variable'
> '-Warray-bounds' '-Wreturn-type' '-Wswitch-enum' '-Wswitch-default'
> '-Wduplicated-cond' '-Wduplicated-branches' '-Wlogical-op'
> '-Wrestrict' '-Wnull-dereference' '-Wdouble-promotion'
> '-Wchar-subscripts' '-Wfloat-equal' '-Wpointer-sign'
> '-Wno-deprecated-declarations' '-Wno-cast-function-type'
> '-Wno-unused-label' '-Wnested-externs' '-Wmissing-prototypes'
> '-Wstrict-prototypes' '-Wdeclaration-after-statement'
> '-Wimplicit-function-declaration' '-Wold-style-definition'
> '-Wjump-misses-init' '-Wno-error=unused-parameter'
> '-Wno-error=missing-field-initializers'
> '-Wno-error=deprecated-declarations' '-Wno-error=cast-function-type'
> '-Wno-error=unused-label' '-D' '_LARGEFILE_SOURCE' '-D'
> '_LARGEFILE64_SOURCE' '-D' '_FILE_OFFSET_BITS=64' '-Os' '-o'
> 'dbus-monitor' '-v' '-v' '-mtls-dialect=gnu' '-march=armv5tej'
>  /home/calfee/edi-workspace/toolchain/output/host/libexec/gcc/arm-buildroot-linux-gnueabi/8.3.0/collect2
> -plugin /home/calfee/edi-workspace/toolchain/output/host/libexec/gcc/arm-buildroot-linux-gnueabi/8.3.0/liblto_plugin.so
> -plugin-opt=/home/calfee/edi-workspace/toolchain/output/host/libexec/gcc/arm-buildroot-linux-gnueabi/8.3.0/lto-wrapper
> -plugin-opt=-fresolution=/tmp/cctkHjeE.res
> -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s
> -plugin-opt=-pass-through=-lc -plugin-opt=-pass-through=-lgcc
> -plugin-opt=-pass-through=-lgcc_s
> --sysroot=/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot
> --eh-frame-hdr -dynamic-linker /lib/ld-linux.so.3 -X -m
> armelf_linux_eabi -o dbus-monitor
> /home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crt1.o
> /home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crti.o
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/crtbegin.o
> -L/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0
> -L/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/lib
> -L/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/lib
> -L/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib
> --no-as-needed dbus-monitor.o dbus-print-message.o tool-common.o
> ../dbus/.libs/libdbus-1.so -rpath
> /home/calfee/edi-workspace/buildroot/output/build/dbus-1.12.16/dbus/.libs
> -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s
> --no-as-needed /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/crtend.o
> /home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crtn.o
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
> found (try using -rpath or -rpath-link)
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> ../dbus/.libs/libdbus-1.so: undefined reference to
> `pthread_mutexattr_init at GLIBC_2.4'
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> ../dbus/.libs/libdbus-1.so: undefined reference to
> `pthread_mutexattr_destroy at GLIBC_2.4'
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> ../dbus/.libs/libdbus-1.so: undefined reference to
> `pthread_condattr_setclock at GLIBC_2.4'
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> ../dbus/.libs/libdbus-1.so: undefined reference to
> `pthread_mutexattr_settype at GLIBC_2.4'
> collect2: error: ld returned 1 exit status
> calfee at dock-container:~/edi-workspace/buildroot/output/build/dbus-1.12.16/tools$
