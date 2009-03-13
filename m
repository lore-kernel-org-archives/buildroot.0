From: Pieter Rijken <pieter.rijken@gmail.com>
Date: Fri, 13 Mar 2009 22:35:42 +0100
Subject: [Buildroot] trouble getting the kernel compiled
Message-ID: <fd0e0ecb0903131435q738c273et10f16309e25fd6d6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am new to buildroot...so please forgive me if the problem is a silly one.

I am trying to get buildroot compiled for uclibc and linux 2.6 krenel for
powerpc (a concepttronic CH3WNAS).

All goes well until the build stops with the following output:

find /host/buildroot-2009.02/project_build_powerpc/ch3wnas/root/usr/lib
-name '*.la' -delete
find /host/buildroot-2009.02/project_build_powerpc/ch3wnas/root/lib -name
'*.la' -delete
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=powerpc
CFLAGS_KERNEL="-Os -pipe -Os
-I/host/buildroot-2009.02/build_powerpc/staging_dir/usr/include
-I/host/buildroot-2009.02/build_powerpc/staging_dir/include
--sysroot=/host/buildroot-2009.02/build_powerpc/staging_dir/ -isysroot
/host/buildroot-2009.02/build_powerpc/staging_dir"
INSTALL_MOD_PATH=/host/buildroot-2009.02/project_build_powerpc/ch3wnas/root
CROSS_COMPILE=/host/buildroot-2009.02/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-
LDFLAGS="-L/host/buildroot-2009.02/build_powerpc/staging_dir/lib
-L/host/buildroot-2009.02/build_powerpc/staging_dir/usr/lib
--sysroot=/host/buildroot-2009.02/build_powerpc/staging_dir/"
LZMA="/host/buildroot-2009.02/toolchain_build_powerpc/bin/lzma"
PATH=/host/buildroot-2009.02/project_build_powerpc/ch3wnas/u-boot-tools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
\
        -C
/host/buildroot-2009.02/project_build_powerpc/ch3wnas/linux-2.6.28.2 uImage
make[1]: Entering directory
`/host/buildroot-2009.02/project_build_powerpc/ch3wnas/linux-2.6.28.2'
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  SYMLINK include/asm -> include/asm-powerpc
  CALL    scripts/checksyscalls.sh
  CHK     include/linux/compile.h
  CALL    arch/powerpc/kernel/systbl_chk.sh
  CALL    arch/powerpc/kernel/prom_init_check.sh
  HOSTCC  arch/powerpc/boot/dtc-src/checks.o
In file included from arch/powerpc/boot/dtc-src/checks.c:21:
arch/powerpc/boot/dtc-src/dtc.h:34:24: error: libfdt_env.h: No such file or
directory
arch/powerpc/boot/dtc-src/dtc.h:35:17: error: fdt.h: No such file or
directory
In file included from arch/powerpc/boot/dtc-src/checks.c:21:
arch/powerpc/boot/dtc-src/dtc.h:127: warning: ?struct fdt_reserve_entry?
declared inside parameter list
arch/powerpc/boot/dtc-src/dtc.h:127: warning: its scope is only this
definition or declaration, which is probably not what you want
arch/powerpc/boot/dtc-src/dtc.h:199: error: field ?re? has incomplete type
make[2]: *** [arch/powerpc/boot/dtc-src/checks.o] Error 1
make[1]: *** [uImage] Error 2
make[1]: Leaving directory
`/host/buildroot-2009.02/project_build_powerpc/ch3wnas/linux-2.6.28.2'
make: ***
[/host/buildroot-2009.02/project_build_powerpc/ch3wnas/linux-2.6.28.2/arch/powerpc/boot/uImage]
Error 2


I searched the mailing lists and googled for many hours already but until
now I have not been able to find anyone else having a similar problem.
I think it has something to do with include paths missing because e.g. fdt.h
is located at:

pieter at ubuntu:/host/buildroot-2009.02/project_build_powerpc/ch3wnas/linux-2.6.28.2$
find . -name fdt.h
./arch/powerpc/boot/libfdt/fdt.h

Any help is greatly appreciated.

thanks, pieter
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090313/66f10bd4/attachment-0001.htm>
