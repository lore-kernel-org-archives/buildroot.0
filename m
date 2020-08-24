From: Aaron Dewes <aaron.dewes@web.de>
Date: Mon, 24 Aug 2020 19:40:31 +0200
Subject: [Buildroot] Building for Raspberry Pi on Pi (in Ubuntu WSL same
 is working)
In-Reply-To: <VI1PR03MB4528407221D0FA62FAF6E2AC98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
References: <VI1PR03MB4528407221D0FA62FAF6E2AC98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
Message-ID: <85d5e170-0701-a6a6-18e8-1bbee00cbf96@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marie,


I was experiencing the same issue. building on the 64bit beta os worked
for me. If you don't want to use that, I have a fix that might work:


Delete the file: buildroot/package/gmp/gmp.hash


Change "GMP_VERSION = 6.1.2" to "GMP_VERSION = 6.2.0" in
buildroot/package/gmp/gmp.mk.


This change should have been done for buildroot (instead of deleting the
hash file updating it), but it was probably not noticed.

I haven't tested this, but it might work. If not, you can contact me again.


Aaron


Am 24.08.20 um 16:09 schrieb Marie Maurer:
>
> Hello,
>
> I am trying to build an image for the Pi on the Pi. Below problem
> occurs, same on 2020.05 and 2020.08-rc1.
>
> make raspberrypi3_defconfig
>
> make
>
> Executing
>
> sudo apt update
>
> sudo apt upgrade
>
> was not helpful.
>
> >>> host-gmp 6.1.2 Building
>
> PATH="/home/pi/buildroot/buildroot-2020.08-rc1/output/host/bin:/home/pi/buildroot/buildroot-2020.08-rc1/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games"
> PKG_CONFIG="/home/pi/buildroot/buildroot-2020.08-rc1/output/host/bin/pkg-config"
> PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
> PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
> PKG_CONFIG_LIBDIR="/home/pi/buildroot/buildroot-2020.08-rc1/output/host/lib/pkgconfig:/home/pi/buildroot/buildroot-2020.08-rc1/output/host/share/pkgconfig"
> /usr/bin/make -j5? -C
> /home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/
>
> make[1]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2'
>
> /usr/bin/make all-recursive
>
> make[2]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2'
>
> Making all in tests
>
> make[3]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests'
>
> Making all in .
>
> make[4]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests'
>
> make[4]: Nothing to be done for 'all-am'.
>
> make[4]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests'
>
> Making all in devel
>
> make[4]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/devel'
>
> make[4]: Nothing to be done for 'all'.
>
> make[4]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/devel'
>
> Making all in mpn
>
> make[4]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/mpn'
>
> make[4]: Nothing to be done for 'all'.
>
> make[4]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/mpn'
>
> Making all in mpz
>
> make[4]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/mpz'
>
> make[4]: Nothing to be done for 'all'.
>
> make[4]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/mpz'
>
> Making all in mpq
>
> make[4]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/mpq'
>
> make[4]: Nothing to be done for 'all'.
>
> make[4]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/mpq'
>
> Making all in mpf
>
> make[4]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/mpf'
>
> make[4]: Nothing to be done for 'all'.
>
> make[4]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/mpf'
>
> Making all in rand
>
> make[4]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/rand'
>
> make[4]: Nothing to be done for 'all'.
>
> make[4]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/rand'
>
> Making all in misc
>
> make[4]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/misc'
>
> make[4]: Nothing to be done for 'all'.
>
> make[4]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/misc'
>
> Making all in cxx
>
> make[4]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/cxx'
>
> make[4]: Nothing to be done for 'all'.
>
> make[4]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests/cxx'
>
> make[3]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/tests'
>
> Making all in mpn
>
> make[3]: Entering directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/mpn'
>
> /bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4"
> /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..? -D__GMP_WITHIN_GMP -I..
> -DOPERATION_`echo divrem_1 | sed 's/_$//'`
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include
> -Wa,--noexecstack `test -f 'divrem_1.asm' || echo './'`divrem_1.asm
>
> /bin/bash ../libtool --tag=CC?? --mode=compile /usr/bin/gcc
> -DHAVE_CONFIG_H -I. -I..? -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo
> mulmid | sed 's/_$//'`
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -c -o
> mulmid.lo mulmid.c
>
> /bin/bash ../libtool --tag=CC?? --mode=compile /usr/bin/gcc
> -DHAVE_CONFIG_H -I. -I..? -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo
> random | sed 's/_$//'`
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -c -o
> random.lo random.c
>
> /bin/bash ../libtool --tag=CC?? --mode=compile /usr/bin/gcc
> -DHAVE_CONFIG_H -I. -I..? -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo
> random2 | sed 's/_$//'`
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -c -o
> random2.lo random2.c
>
> /bin/bash ../libtool --tag=CC?? --mode=compile /usr/bin/gcc
> -DHAVE_CONFIG_H -I. -I..? -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo
> pow_1 | sed 's/_$//'`
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -c -o
> pow_1.lo pow_1.c
>
> libtool: compile: ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c
> -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_divrem_1
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include
> -Wa,--noexecstack divrem_1.asm? -fPIC -DPIC -o .libs/divrem_1.o
>
> libtool: compile: /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
> -D__GMP_WITHIN_GMP -I.. -DOPERATION_random2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -c
> random2.c? -fPIC -DPIC -o .libs/random2.o
>
> libtool: compile: /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
> -D__GMP_WITHIN_GMP -I.. -DOPERATION_mulmid
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -c
> mulmid.c? -fPIC -DPIC -o .libs/mulmid.o
>
> m4? -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_divrem_1 -DPIC
> divrem_1.asm >tmp-divrem_1.s
>
> libtool: compile: /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
> -D__GMP_WITHIN_GMP -I.. -DOPERATION_pow_1
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -c
> pow_1.c? -fPIC -DPIC -o .libs/pow_1.o
>
> libtool: compile: /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
> -D__GMP_WITHIN_GMP -I.. -DOPERATION_random
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -c
> random.c? -fPIC -DPIC -o .libs/random.o
>
> /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I..
> -DOPERATION_divrem_1
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include
> -Wa,--noexecstack tmp-divrem_1.s -fPIC -DPIC -o .libs/divrem_1.o
>
> tmp-divrem_1.s: Assembler messages:
>
> tmp-divrem_1.s:129: Error: selected processor does not support `mls
> r1,r4,r8,r11' in ARM mode
>
> tmp-divrem_1.s:145: Error: selected processor does not support `mls
> r1,r4,r8,r11' in ARM mode
>
> tmp-divrem_1.s:158: Error: selected processor does not support `mls
> r1,r4,r8,r11' in ARM mode
>
> tmp-divrem_1.s:175: Error: selected processor does not support `mls
> r1,r4,r3,r8' in ARM mode
>
> tmp-divrem_1.s:209: Error: selected processor does not support `mls
> r11,r4,r12,r3' in ARM mode
>
> make[3]: *** [Makefile:768: divrem_1.lo] Error 1
>
> make[3]: *** Waiting for unfinished jobs....
>
> make[3]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/mpn'
>
> make[2]: *** [Makefile:956: all-recursive] Error 1
>
> make[2]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2'
>
> make[1]: *** [Makefile:775: all] Error 2
>
> make[1]: Leaving directory
> '/home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2'
>
> make: *** [package/pkg-generic.mk:250:
> /home/pi/buildroot/buildroot-2020.08-rc1/output/build/host-gmp-6.1.2/.stamp_built]
> Error 2
>
> pi at raspberrypi:~/buildroot/buildroot-2020.08-rc1 $
>
> Many thanks!
>
> Best regards,
>
> Marie
>
> Pixida GmbH
> Ungererstr.?129
> 80805 M?nchen
>
>
> Amtsgericht M?nchen - HRB 173520
> Gesch?ftsf?hrer Johann Neubauer, Panagiota Dimou
>
> www.pixida.de <http://www.pixida.de/>
>
> PIXIDA
>
> UnsereDatenschutzgrunds?tze <http://www.pixida.com/grundsaetze.html>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200824/1447d638/attachment.html>
