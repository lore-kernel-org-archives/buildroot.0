From: Laurent Debacker <debackerl@gmail.com>
Date: Fri, 13 Jul 2007 12:35:38 +0200
Subject: [Buildroot] CC environment variable trouble (binutils built before
	gcc?)
Message-ID: <75751ca80707130335w72e034d0u412debad85881dc2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have download the buildroot snapshot as of July 13th, 2007.
Using "make menuconfig", I configured it to target the mipsel architecture.
Afterwards, the "make" process fails giving:
<buildroot@uclibc.org>
mkdir -p /home/gizmo/wgt634u/archives/buildroot/build_mipsel/binutils-
2.17-target
(cd /home/gizmo/wgt634u/archives/buildroot/build_mipsel/binutils-2.17-target;
rm -rf config.cache ; \

PATH="/home/gizmo/wgt634u/archives/buildroot/toolchain_build_mipsel/bin:/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/bin:/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/X11R6/bin:/opt/bin:/opt/eclipse:/opt/gnome/bin:/opt/java/bin:/opt/java/jre/bin:/opt/mozilla/bin"
AR=/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-ar
AS=/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-as
LD="/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-ld
-L/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/lib
-L/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/lib"
NM=/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-nm
CC="/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe
-I/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/include"
GCC="/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe
-I/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/include"
CXX="/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-g++
-Os -pipe
-I/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/include"
CPP="/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-cpp
-Os -pipe
-I/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/include"
RANLIB=/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-ranlib
STRIP=/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-strip
OBJCOPY=/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-objcopy
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="gcc"
CXX_FOR_BUILD="g++" LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD=""
LDFLAGS_FOR_BUILD=""
PKG_CONFIG_SYSROOT="/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir"
PKG_CONFIG="/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/pkg-config"
CXX="" \

/home/gizmo/wgt634u/archives/buildroot/toolchain_build_mipsel/binutils-2.17/configure
\
                --prefix=/usr \
                --exec-prefix=/usr \
                --build=i386-pc-linux-gnu \
                --host=mipsel-linux-uclibc \
                --target=mipsel-linux-uclibc \
                --disable-nls \
                --disable-multilib \
                 \
                --disable-werror \
                 );
creating cache ./config.cache
checking host system type... mipsel-unknown-linux-uclibc
checking target system type... mipsel-unknown-linux-uclibc
checking build system type... i386-pc-linux-gnu
checking for a BSD compatible install... /bin/install -c
checking whether ln works... yes
checking whether ln -s works... yes
checking for mipsel-linux-uclibc-gnatbind... no
checking for gnatbind... no
checking whether compiler driver understands Ada... no
checking how to compare bootstrapped objects... cmp --ignore-initial=16 $$f1
$$f2
checking for correct version of gmp.h... no
/home/gizmo/wgt634u/archives/buildroot/toolchain_build_mipsel/binutils-2.17/configure:
line 2940:
/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc:
No such file or directory
*** The command
'/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe
-I/home/gizmo/wgt634u/archives/buildroot/build_mipsel/staging_dir/usr/include
-o conftest -g -O2    conftest.c' failed.
*** You must set the environment variable CC to a working compiler.
make: *** [/home/gizmo/wgt634u/archives/buildroot/build_mipsel/binutils-
2.17-target/.configured] Error 1

If I understand correctly, it wants to compile binutils using the mipsel
gcc, however buildroot has not built it yet.

I am using Arch Linux.

Any help would be greatly appreciated :)

Laurent Debacker.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070713/fc99f448/attachment.htm 
