From: friedrich Euler <friedrich.euler@googlemail.com>
Date: Thu, 10 Jan 2008 09:46:47 +0100
Subject: [Buildroot] build for mipsel failed - incompatible ABI
Message-ID: <bd9bbe900801100046m4be2629au43ab3d094b382dc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a problen with buildroot. I would like to compile it for mipsel
target architecture. I called make menuconfig and than make. The build ends
up with the following error message:

--- begin cut ---
...
make[1]: Entering directory
`/home/friedrich/buildroot-090108/buildroot/toolchain_build_mipsel/uClibc-
0.9.29'
make[2]: `conf' is up to date.
ln -fs sgidefs.h ./include/
:0: error: -march=mips1 is not compatible with the selected ABI
:0: error: -march=mips1 is not compatible with the selected ABI
  CC ldso/ldso/ldso.oS
ldso/ldso/ldso.c:1: error: -march=mips1 is not compatible with the selected
ABI
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory
`/home/friedrich/buildroot-090108/buildroot/toolchain_build_mipsel/uClibc-
0.9.29'
make: ***
[/home/friedrich/buildroot-090108/buildroot/toolchain_build_mipsel/uClibc-
0.9.29/lib/libc.a] Error 2
--- end cut ---

The problem is that it show this error for all 3 possible ABI options.
Another thing is that i selected mips32 and not mips1 as the target
architecture. I found some other problem descriptions like this one but no
solution. I am using Ubuntu 7.1 as build system.

Any suggestions?


Thanks

friedrich
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080110/7d26b956/attachment.htm 
