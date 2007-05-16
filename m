From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 16 May 2007 17:24:25 +0200
Subject: [Buildroot] download problem
In-Reply-To: <Pine.LNX.4.44.0705161650060.21165-100000@slslc02.psi.ch>
References: <20070516135937.GA12536@aon.at>
	<Pine.LNX.4.44.0705161650060.21165-100000@slslc02.psi.ch>
Message-ID: <20070516152425.GA15379@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 16, 2007 at 05:12:15PM +0200, Miroslaw Dach wrote:
>I have set BR2_TARGET_OPTIMIZATION
>
>BR2_TARGET_OPTIMIZATION="-Os -pipe -O -mcpu=405 --with-cpu=405 
>--enable-cxx-flags=-mcpu=405"

that's wrong. At least my gcc does not accept that last flag.
>
>
>
>but I do not see that the toolchain was build with 
>those options for the ppc_405 architecture:
>
>/root/buildroot/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-gcc -v
>
>Using built-in specs.
>Target: powerpc-linux-uclibc
>Configured with: 
>/root/buildroot/toolchain_build_powerpc/gcc-4.1.2/configure 
>--prefix=/root/buildroot/build_powerpc/staging_dir 
>--build=i386-pc-linux-gnu --host=i386-pc-linux-gnu 
>--target=powerpc-linux-uclibc --enable-languages=c --disable-__cxa_atexit 
>--enable-target-optspace --with-gnu-ld 
>--with-gmp=/root/buildroot/toolchain_build_powerpc/gmp 
>--with-mpfr=/root/buildroot/toolchain_build_powerpc/mpfr --enable-shared 
>--disable-nls --enable-threads --disable-multilib
>Thread model: posix
>gcc version 4.1.2

Looks ok.
>
>
>My previously build crosstool gave the output as following:
>
>bash SLSBASE=]# ./powerpc-405-linux-gnu-gcc -v
>Using built-in specs.
>Target: powerpc-405-linux-gnu
>Configured with: 
>/home/ioc/crosstool-0.43/build/powerpc-405-linux-gnu/gcc-4.0.2-glibc-2.3.2/gcc-4.0.2/configure 
>--target=powerpc-405-linux-gnu --host=i686-host_pc-linux-gnu 
>--prefix=/opt/crosstool/gcc-4.0.2-glibc-2.3.2/powerpc-405-linux-gnu 
>--with-cpu=405 --enable-cxx-flags=-mcpu=405 
>--with-headers=/opt/crosstool/gcc-4.0.2-glibc-2.3.2/powerpc-405-linux-gnu/powerpc-405-linux-gnu/include 
>--with-local-prefix=/opt/crosstool/gcc-4.0.2-glibc-2.3.2/powerpc-405-linux-gnu/powerpc-405-linux-gnu 
>--disable-nls --enable-threads=posix --enable-symvers=gnu 
>--enable-__cxa_atexit --enable-languages=c,c++ --enable-shared 
>--enable-c99 --enable-long-long
>Thread model: posix
>gcc version 4.0.2
>
>
>In the toolchain which was created by buildroot I do not see the options 
>like:
>
>--with-cpu=405 
>--enable-cxx-flags=-mcpu=405

which is perfectly fine. Please see the help-text for these options for
further details.

PS:
You can pass additional configure flags to binutils and gcc if you think
you need this.

HTH,
