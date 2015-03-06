From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 6 Mar 2015 22:52:24 +0100
Subject: [Buildroot] asm/errno.h: No such file or directory compiling
	luajit
In-Reply-To: <20150306195416.62f7424b@free-electrons.com>
References: <CA+TH9Vn=OjM74WB46dgXXm3Xcjy5X6z8i++p8o6EK1vBs9xrxQ@mail.gmail.com>
 <20150306195416.62f7424b@free-electrons.com>
Message-ID: <CA+TH9Vm09qBNY2qrykL1zTe5JmPmiRObfg_-K1juURVSjWwvZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-03-06 19:54 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Fri, 6 Mar 2015 17:35:50 +0100, Angelo Compagnucci wrote:
>
>> I'm facing a problem compiling luajit and it's puzzling me a lilttle bit.
>
> Can you give the Buildroot configuration and version that produces this
> issue?

It's a fairly basic configuration with only luajit package. You can
find my .config attached.

>
> Can you also give more build output?

After busybox has completed the target installed phase, this is the output:

>>> luajit 2.0.3 Configuring
>>> luajit 2.0.3 Building
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
Building LuaJIT 2.0.3
/usr/bin/make -C src amalg
+--------------------------------------------------------------------------+
| WARNING: Compiling the amalgamation needs a lot of virtual memory        |
| (around 300 MB with GCC 4.x)! If you don't have enough physical memory   |
| your machine will start swapping to disk and the compile will not finish |
| within a reasonable amount of time.                                      |
| So either compile on a bigger machine or use the non-amalgamated build.  |
+--------------------------------------------------------------------------+
/usr/bin/make all "LJCORE_O=ljamalg.o"
HOSTCC    host/minilua.o
HOSTCC    host/buildvm_asm.o
HOSTCC    host/buildvm_peobj.o
HOSTCC    host/buildvm_lib.o
HOSTCC    host/buildvm_fold.o
CC        luajit.o
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from host/buildvm.h:13,
                 from host/buildvm_asm.c:6:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such
file or directory
 #include <asm/errno.h>


> My guess is that you're building something for the target (with the
> cross-compiler), but it's using host headers.

I'm using latest version pulled from git
(6884e5b912eb6ba427cfb13a0996592738107ec5) at the time of writing.

Thanks for helping!

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 45978 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150306/e390a92d/attachment-0001.obj>
