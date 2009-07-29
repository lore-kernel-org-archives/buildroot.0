From: David H. Lynch J.r <ml@dlasys.net>
Date: Wed, 29 Jul 2009 11:58:16 -0400
Subject: [Buildroot] ppc 405 buildroot failure
Message-ID: <4A707198.9090704@dlasys.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    Attempting to run the latest buildroot from git

I eventually get the following errors:

../utils/ldconfig.c:117: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'err'
../utils/ldconfig.c: In function 'xmalloc':
../utils/ldconfig.c:153: warning: implicit declaration of function 'err'
../utils/ldconfig.c: In function 'get_extpath':
../utils/ldconfig.c:570: warning: ignoring return value of 'fread',
declared with attribute warn_unused_result
../utils/ldconfig.c: At top level:
../utils/ldconfig.c:786: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'usage'
../utils/ldconfig.c: In function 'main':
../utils/ldconfig.c:882: warning: implicit declaration of function 'usage'
make[1]: *** [../utils/ldconfig.host] Error 1
make[1]: Leaving directory
`/usr/src/pico/bk/linux/git/buildroot/toolchain_build_powerpc/uClibc/utils'
make: *** [/opt/crosstool/gcc-4.4.1-uclibc/usr/lib/libc.a] Error 2

I am able to work past this by zapping the attribute_noreturn macro in
toolchain_build_powerpc/uClibc/include/libc-symbols.h

This is apparently not the kosher way of fixing this as anytime I run
menuconf the problem reappears.

If someone could give me a clue how to do this properly I would be happy
to put together a patch.
There does appear to be a configure test for autoreturn but it is ending
up enabled apparently when it should not be.
