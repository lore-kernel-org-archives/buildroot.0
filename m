From: Dmitry Malkin <myh016@gmail.com>
Date: Tue, 29 Mar 2011 17:46:03 +0400
Subject: [Buildroot] TinyX compilation error
Message-ID: <AANLkTi=FN8uQaZng3pnLv_8KkoLyHpdALGEGK93ZhcNi@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I'm trying to compile TinyX and got this error:

=========================================
libtool: compile:
/usr/local/src/buildroot/output/external-toolchain/bin/arm-none-linux-gnueabi-gcc
--sysroot=/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot
-std=gnu99 -DHAVE_CONFIG_H -I. -I../include/X11 -I../include
-I../include/X11 -I../include -I../include/X11 -I../src/xcms
-I../src/xkb -I../src/xlibi18n -D_BSD_SOURCE -DX11_t -DTRANS_CLIENT
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing
-Wbad-function-cast -Wold-style-definition
-Wdeclaration-after-statement -Wall -Wpointer-arith
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE -DHAS_FCHOWN
-DHAS_STICKY_DIR_BIT -pipe -Os -mtune=cortex-a8 -march=armv7-a
-mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -MT x11_xcb.lo -MD -MP
-MF .deps/x11_xcb.Tpo -c x11_xcb.c  -fPIC -DPIC -o .libs/x11_xcb.o
  CCLD   libX11.la
libtool: link: warning: library
`/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/libxcb.la'
was moved.
/usr/bin/grep: /usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/libXau.la:
No such file or directory
/usr/bin/sed: can't read
/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/libXau.la:
No such file or directory
libtool: link: `/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/src/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/libXau.la'
is not a valid libtool archive
make[4]: *** [libX11.la] Error 1
make[4]: Leaving directory
`/usr/local/src/buildroot/output/build/xlib_libX11-1.3.2/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/usr/local/src/buildroot/output/build/xlib_libX11-1.3.2/src'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/usr/local/src/buildroot/output/build/xlib_libX11-1.3.2/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/usr/local/src/buildroot/output/build/xlib_libX11-1.3.2'
make: *** [/usr/local/src/buildroot/output/build/xlib_libX11-1.3.2/.stamp_built]
Error 2
==================================

Tested stable 2011.2 and latest snapshot. The error is the same.
Tested cross compilers 4.5.2 and codesourcery 4.5.1. The error is the same.
