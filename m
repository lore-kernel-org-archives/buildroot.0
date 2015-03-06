From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 19:54:16 +0100
Subject: [Buildroot] asm/errno.h: No such file or directory compiling
 luajit
In-Reply-To: <CA+TH9Vn=OjM74WB46dgXXm3Xcjy5X6z8i++p8o6EK1vBs9xrxQ@mail.gmail.com>
References: <CA+TH9Vn=OjM74WB46dgXXm3Xcjy5X6z8i++p8o6EK1vBs9xrxQ@mail.gmail.com>
Message-ID: <20150306195416.62f7424b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 6 Mar 2015 17:35:50 +0100, Angelo Compagnucci wrote:

> I'm facing a problem compiling luajit and it's puzzling me a lilttle bit.

Can you give the Buildroot configuration and version that produces this
issue?

> /usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such
> file or directory
>  #include <asm/errno.h>
> 
> This is the command buildroot produces:
> 
> /usr/bin/make -j9 PREFIX="/usr"
> STATIC_CC="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-gcc"
> DYNAMIC_CC="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-gcc
> -fPIC" TARGET_LD="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-gcc"
> TARGET_AR="/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/bin/arm-linux-gnueabihf-ar
> rcus" TARGET_STRIP=true TARGET_CFLAGS="-D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os " TARGET_LDFLAGS=""
> HOST_CC="/usr/bin/gcc -m32" HOST_CFLAGS="-O2
> -I/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/include"
> HOST_LDFLAGS="-L/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/lib
> -L/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/lib
> -Wl,-rpath,/home/angelo/DEV/BUILDROOT/br_acqua_dev/host/usr/lib"
> BUILDMODE=dynamic -C
> /home/angelo/DEV/BUILDROOT/br_acqua_dev/build/luajit-2.0.3 amalg

Can you also give more build output?

My guess is that you're building something for the target (with the
cross-compiler), but it's using host headers.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
