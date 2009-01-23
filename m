From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
Date: Fri, 23 Jan 2009 13:10:54 +0200
Subject: [Buildroot] DirectFB + linux-headers-2.6.28.1 compilation problem
Message-ID: <fce2a370901230310y63c0ebe3x10e523e10154a96a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys!
I have the following problem compiling DirectFB with linux-header-2.6.28.1:

/home/booxter/winbox/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-ld
-o libdirectfb_keyboard.o -r .libs/libdirectfb_keyboard.a.tmp/*.o
rm -f .libs/libdirectfb_keyboard.a.tmp/*.o && rmdir
.libs/libdirectfb_keyboard.a.tmp
make[4]: Leaving directory
`/home/booxter/winbox/buildroot/build_mipsel/DirectFB-1.2.6/inputdrivers/keyboard'
Making all in serialmouse
make[4]: Entering directory
`/home/booxter/winbox/buildroot/build_mipsel/DirectFB-1.2.6/inputdrivers/serialmouse'
/bin/bash ../../libtool --tag=CC   --mode=compile
/home/booxter/winbox/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os  -I/home/booxter/winbox/buildroot/build_mipsel/staging_dir/usr/include
-I/home/booxter/winbox/buildroot/build_mipsel/staging_dir/include
--sysroot=/home/booxter/winbox/buildroot/build_mipsel/staging_dir/
-isysroot /home/booxter/winbox/buildroot/build_mipsel/staging_dir
-mtune=mips32r2 -mabi=32 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I../.. -I../../include
-I../../lib -I../../lib -I../../src  -D_REENTRANT   -O3 -ffast-math
-pipe -Os  -I/home/booxter/winbox/buildroot/build_mipsel/staging_dir/usr/include
-I/home/booxter/winbox/buildroot/build_mipsel/staging_dir/include
--sysroot=/home/booxter/winbox/buildroot/build_mipsel/staging_dir/
-isysroot /home/booxter/winbox/buildroot/build_mipsel/staging_dir
-mtune=mips32r2 -mabi=32 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE
-Werror-implicit-function-declaration -MT serialmouse.lo -MD -MP -MF
.deps/serialmouse.Tpo -c -o serialmouse.lo serialmouse.c
 /home/booxter/winbox/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -I/home/booxter/winbox/buildroot/build_mipsel/staging_dir/usr/include
-I/home/booxter/winbox/buildroot/build_mipsel/staging_dir/include
--sysroot=/home/booxter/winbox/buildroot/build_mipsel/staging_dir/
-isysroot /home/booxter/winbox/buildroot/build_mipsel/staging_dir
-mtune=mips32r2 -mabi=32 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I../.. -I../../include
-I../../lib -I../../lib -I../../src -D_REENTRANT -O3 -ffast-math -pipe
-Os -I/home/booxter/winbox/buildroot/build_mipsel/staging_dir/usr/include
-I/home/booxter/winbox/buildroot/build_mipsel/staging_dir/include
--sysroot=/home/booxter/winbox/buildroot/build_mipsel/staging_dir/
-isysroot /home/booxter/winbox/buildroot/build_mipsel/staging_dir
-mtune=mips32r2 -mabi=32 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE
-Werror-implicit-function-declaration -MT serialmouse.lo -MD -MP -MF
.deps/serialmouse.Tpo -c serialmouse.c  -fPIC -DPIC -o
.libs/serialmouse.o
In file included from serialmouse.c:43:
/home/booxter/winbox/buildroot/build_mipsel/staging_dir/usr/include/linux/serial.h:164:
error: expected specifier-qualifier-list before '__u32'
make[4]: *** [serialmouse.lo] Error 1
make[4]: Leaving directory
`/home/booxter/winbox/buildroot/build_mipsel/DirectFB-1.2.6/inputdrivers/serialmouse'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/booxter/winbox/buildroot/build_mipsel/DirectFB-1.2.6/inputdrivers'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/booxter/winbox/buildroot/build_mipsel/DirectFB-1.2.6'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/booxter/winbox/buildroot/build_mipsel/DirectFB-1.2.6'
make: *** [/home/booxter/winbox/buildroot/build_mipsel/DirectFB-1.2.6/.compiled]
Error 2

The problem can be fixed with the following upstream patch applied:
http://lkml.org/lkml/2008/11/3/240

Please add it to buildroot. Thanks.
