From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 6 Mar 2015 17:35:50 +0100
Subject: [Buildroot] asm/errno.h: No such file or directory compiling luajit
Message-ID: <CA+TH9Vn=OjM74WB46dgXXm3Xcjy5X6z8i++p8o6EK1vBs9xrxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I'm facing a problem compiling luajit and it's puzzling me a lilttle bit.

Luajit is failing with this error:

/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such
file or directory
 #include <asm/errno.h>

This is the command buildroot produces:

/usr/bin/make -j9 PREFIX="/usr"
STATIC_CC="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-gcc"
DYNAMIC_CC="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-gcc
-fPIC" TARGET_LD="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-gcc"
TARGET_AR="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-ar
rcus" TARGET_STRIP=true TARGET_CFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os " TARGET_LDFLAGS=""
HOST_CC="/usr/bin/gcc -m32" HOST_CFLAGS="-O2
-I/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/include"
HOST_LDFLAGS="-L/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/lib
-L/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/lib
-Wl,-rpath,/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/lib"
BUILDMODE=dynamic -C
/home/angelo/DEV/BUILDROOT/br_acqua_dev/build/luajit-2.0.3 amalg

Obviously it's failing because asm/errno.h is in

/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/asm/errno.h

not in

/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/include

From my understaning, HOST_CFLAGS is wrong, but it's generated
automatically by buildroot and not mangled by the package.

Have you any idea on this?

Thank you!

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
