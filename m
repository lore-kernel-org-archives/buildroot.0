From: Bobby Ramsook <bobby.83x2@gmail.com>
Date: Sun, 11 Feb 2007 16:41:35 -0500
Subject: [Buildroot] Problem building build root in a squashhfs image
Message-ID: <12d878080702111341q1b2b9468w53aff97f6c6ccb0c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I Have been trying to compile buildroot, but i keep getting stuck on the
following error:

make: *** No rule to make target
`/usr/src/buildroot/build_i586/linux-2.6.12/.patched',
needed by `/usr/src/buildroot/build_i586/linux- 2.6.12/.configured'.  Stop.


I looked through the build_i586 directory butr ther  was no
linux-2.6.12dir, I tried to link the
linux-headers-2.6.12 to the dir linux-2.6.12
and I get this error:


make -j1
PATH="/usr/src/buildroot/build_i586/staging_dir/bin:/usr/src/buildroot/toolchain_build_i586/bin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin:/usr/bin/X11:/usr/games"
AR=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-ar
AS=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-as
LD=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-ld
NM=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-nm
CC=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
GCC=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
CXX=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-g++
CPP=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-cpp
RANLIB=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-ranlib
STRIP=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-strip
OBJCOPY=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-objcopy
CC_FOR_BUILD="gcc"
PKG_CONFIG_SYSROOT=/usr/src/buildroot/build_i586/staging_dir
PKG_CONFIG=/usr/src/buildroot/build_i586/staging_dir/usr/bin/pkg-config
CXX="" ARCH=i386
PATH="/usr/src/buildroot/build_i586/staging_dir/bin:/usr/src/buildroot/toolchain_build_i586/bin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin:/usr/bin/X11:/usr/games"
INSTALL_MOD_PATH=/usr/src/buildroot/build_i586/root
CROSS_COMPILE=/usr/src/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-
-C /usr/src/buildroot/build_i586/linux-2.6.12 prepare
make[1]: Entering directory `/usr/src/buildroot/toolchain_build_i586/linux-
libc-headers-2.6.12.0'
make[1]: *** No rule to make target `prepare'.  Stop.
make[1]: Leaving directory `/usr/src/buildroot/toolchain_build_i586/linux-
libc-headers-2.6.12.0'
make: *** [/usr/src/buildroot/build_i586/linux-2.6.12/.depend_done] Error 2


I searched for anything in the makefiles and the config files that would
tell me what make file was trign to read this directory but i cant find any
reference tot he linux-2.6.12  inthe files.

find . -name "Config" |grep 2.6.12


I would appreciate anyhelp that any one can give, or advice on how to
complete the build.

BTW this error happens after the build for the  module-init-tools-3.2.2 that
completes sucessfully.

Thank you

-- 
Bobby Ramsook
CCNY Computer Tech
Grad Date (EXP):  07'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070211/9b798635/attachment.htm 
