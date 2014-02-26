From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Feb 2014 22:47:43 +0100
Subject: [Buildroot] Few questions external toolchain
In-Reply-To: <530E1C12.9090400@gmail.com>
References: <530B8CEA.90306@gmail.com> <530C6DD2.4070605@gmail.com>
 <CAAXf6LUbFzxUgz+kkes-f7TO0as40kDuaF+v6BG2neWEBeR-hw@mail.gmail.com>
 <530E1C12.9090400@gmail.com>
Message-ID: <530E60FF.6090300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/02/14 17:53, Marco Trapanese wrote:
> 
> Hi Thomas,
> thank you for your clarification. Perhaps this is described in the guide
> but I didn't find it.
> About the toolchain git repo I tried to set the URL as
> 'git://URL_of_repo/' but it asks for a tarball.
> 
> Anyway I can live with it at the moment... I manually cloned the
> repository outside buildroot and I passed the path of the toolchain's
> root directory.
> 
> Below the relevant part of the config.log. It seems the linker cannot
> find the libraries. Should I set any environment variables? I can't see
> any other options in the nconfig menu.
> 
> configure:3133: checking for arm-buildroot-linux-gnueabi-gcc
> configure:3160: result:
> /home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
> configure:3429: checking for C compiler version
> configure:3438:
> /home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
> --version >&5
> arm-fsl-linux-gnueabi-gcc (Freescale MAD -- Linaro 2011.07 -- Built at
> 2011/08/10 09:20) 4.6.2 20110630 (prerelease)
> Copyright (C) 2011 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> configure:3449: $? = 0
> configure:3438:
> /home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
> -v >&5
> Using built-in specs.
> COLLECT_GCC=/home/marco/dev/fsl-linaro-toolchain/bin/arm-fsl-linux-gnueabi-gcc
> 
> COLLECT_LTO_WRAPPER=/home/marco/dev/fsl-linaro-toolchain/bin/../libexec/gcc/arm-fsl-linux-gnueabi/4.6.2/lto-wrapper
> 
> Target: arm-fsl-linux-gnueabi
> Configured with:
> /work/build/.build/src/gcc-linaro-4.6-2011.06-0/configure
> --build=i686-build_pc-linux-gnu --host=i686-build_pc-linux-gnu
> --target=arm-fsl-linux-gnueabi --prefix=/work/fsl-linaro-toolchain-2.13
> --with-sysroot=/work/fsl-linaro-toolchain-2.13/arm-fsl-linux-gnueabi/multi-libs
> --enable-languages=c,c++ --with-pkgversion='Freescale MAD -- Linaro
> 2011.07 -- Built at 2011/08/10 09:20' --enable-__cxa_atexit
> --disable-libmudflap --disable-libgomp --disable-libssp
> --with-gmp=/work/build/.build/arm-fsl-linux-gnueabi/build/static
> --with-mpfr=/work/build/.build/arm-fsl-linux-gnueabi/build/static
> --with-mpc=/work/build/.build/arm-fsl-linux-gnueabi/build/static
> --with-ppl=/work/build/.build/arm-fsl-linux-gnueabi/build/static
> --with-cloog=/work/build/.build/arm-fsl-linux-gnueabi/build/static
> --with-libelf=/work/build/.build/arm-fsl-linux-gnueabi/build/static
> --with-host-libstdcxx='-static-libgcc -Wl,-Bstatic,-lstdc++,-Bdynamic -lm
> -L/work/build/.build/arm-fsl-linux-gnueabi/build/static/lib -lpwl'
> --enable-threads=posix --enable-target-optspace --enable-plugin
> --enable-multilib
> --with-local-prefix=/work/fsl-linaro-toolchain-2.13/arm-fsl-linux-gnueabi/multi-libs
> --disable-nls --enable-c99 --enable-long-long --with-system-zlib
> Thread model: posix
> gcc version 4.6.2 20110630 (prerelease) (Freescale MAD -- Linaro 2011.07
> -- Built at 2011/08/10 09:20)
> configure:3449: $? = 0
> configure:3438:
> /home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
> -V >&5
> arm-fsl-linux-gnueabi-gcc: error: unrecognized option '-V'
> arm-fsl-linux-gnueabi-gcc: fatal error: no input files
> compilation terminated.
> configure:3449: $? = 1
> configure:3438:
> /home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
> -qversion >&5
> arm-fsl-linux-gnueabi-gcc: error: unrecognized option '-qversion'
> arm-fsl-linux-gnueabi-gcc: fatal error: no input files
> compilation terminated.
> configure:3449: $? = 1
> configure:3469: checking whether the C compiler works
> configure:3491:
> /home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe
> -Os  -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -lm conftest.c  >&5
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find crt1.o: No such file or directory
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find crti.o: No such file or directory
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find -lm
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find -lgcc_s
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find -lc
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find -lgcc_s
> /home/marco/dev/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
> cannot find crtn.o: No such file or directory

 This smells like our external toolchain logic doesn't properly locate
and copy the sysroot. Can you verify if output/staging/usr/lib/crt1.o exists?

 Perhaps if you can give the URL of this external toolchain, we can have
a look?


 Regards,
 Arnout

> collect2: ld returned 1 exit status
> configure:3495: $? = 1
> configure:3533: result: no
> 
> 
> 
> Thanks!
> Marco
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
