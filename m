From: lists at primefarm.co.uk <lists@primefarm.co.uk>
Date: Wed, 22 Nov 2006 18:06:31 -0000 (UTC)
Subject: [Buildroot] problem generating c++ compiler for target arch
Message-ID: <32792.80.176.236.13.1164218791.squirrel@mail.primefarm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm using buildroot to generate cross compilers for the arm 920t running
linux. Currently I have a working C compiler, but I really want c++
working too.

I get the following error when building (with latest svn release) with
fairly minimal options (I have tried to configure it so that it only
builds the compilers and related libs etc where possible).

In file included from
/home/david/buildroot/toolchain_build_arm/gcc-3.4.2/libstdc++-v3/src/ext-inst.cc:34:
/home/david/buildroot/toolchain_build_arm/gcc-3.4.2-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:934:
error: expected `;' before "const"
/home/david/buildroot/toolchain_build_arm/gcc-3.4.2-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:935:
error: expected `;' before "_Rope_iterator_base"
/home/david/buildroot/toolchain_build_arm/gcc-3.4.2-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2011:36:
macro "index" requires 2 arguments, but only 1 given
...
[last message repeated lots for differnt lines]
...
/home/david/buildroot/toolchain_build_arm/gcc-3.4.2-final/arm-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1503:66:
macro "index" requires 2 arguments, but only 1 given
make[4]: *** [ext-inst.lo] Error 1
make[4]: Leaving directory
`/home/david/buildroot/toolchain_build_arm/gcc-3.4.2-final/arm-linux-uclibc/libstdc++-v3/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/david/buildroot/toolchain_build_arm/gcc-3.4.2-final/arm-linux-uclibc/libstdc++-v3'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/david/buildroot/toolchain_build_arm/gcc-3.4.2-final/arm-linux-uclibc/libstdc++-v3'
make[1]: *** [all-target-libstdc++-v3] Error 2
make[1]: Leaving directory
`/home/david/buildroot/toolchain_build_arm/gcc-3.4.2-final'
make: ***
[/home/david/buildroot/toolchain_build_arm/gcc-3.4.2-final/.compiled]
Error 2


If needed I can supply a copy of my .config. I'm aware that buildroot is
massively complex and that is possibly why I'm having such troubles. If
anyone knows a better way to get a working c/c++ compiler for my CPU, and
working with uclibc and uclibc++ I'd be interested.


Cheers,

David
