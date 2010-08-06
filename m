From: anthony henderson <development@fair-games.com>
Date: Fri, 6 Aug 2010 17:09:21 +0100
Subject: [Buildroot] External toolchain doesn't support --sysroot.
Message-ID: <AANLkTim-th7FF0dh0ZecLeRMZ+0iMFYpMZrM5QsWLYRL@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I'm trying to use an external ARM tool chain to build some packages.
However build root does not see the compiler "Incorrect selection of the C
library". Some exploration shows that the compiler does not have a sysroot
set

arm-linux-gcc -v
Using built-in specs.
Target: arm-linux-uclibc
Configured with:
/opt/buildroot.920t-cc/toolchain_build_arm_nofpu/gcc-4.1.1/configure
--prefix=/usr/local/arm/4.1.1-920t --build=i386-pc-linux-gnu
--host=i386-pc-linux-gnu --target=arm-linux-uclibc --enable-languages=c,c++
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld
--with-gmp=/opt/buildroot.920t-cc/toolchain_build_arm_nofpu/gmp
--with-mpfr=/opt/buildroot.920t-cc/toolchain_build_arm_nofpu/mpfr
--enable-shared --disable-nls --enable-threads --disable-multilib
--with-float=soft
Thread model: posix
gcc version 4.1.1


Can anyone tell me if there is a way round this?  I'm running the copiler
from within /root/ArmDevelopment/.......   do I need to move it or can I set
a flag when I make buildroot.  Thanks all

-- 
Regards Tony
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100806/576347fe/attachment.html>
