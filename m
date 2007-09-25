From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 25 Sep 2007 18:14:40 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
In-Reply-To: <46F93BB9.6020304@promwad.com>
References: <20070925133721.8555F30055@busybox.net>
	<46F93214.7030702@promwad.com>
	<1190730622.19731.64.camel@elrond.atmel.sweden>
	<46F93BB9.6020304@promwad.com>
Message-ID: <1190736880.19731.76.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-09-25 klockan 15:47 -0100 skrev vano:
> Ulf Samuelsson wrote:
> > 
> > It worked for me since I manually copied libgcc.a to another location.
> > I reran the build again after submitting, and discovered this
> > so I have already removed the part causing the problem from the patch
> > svn update to fix.
> > 
> > I still have a problem which pop up from time to time with libstdc++v3.
> > which fails, but at least the build goes a lot further.
> > 
> 
> I have non CPP config , yeah build is going further and stopping in
> configure step of arm-linux-uclibc/libmudflap:
> 
> 
> make[3]: Leaving directory
> `/home/buildroot/toolchain_build_arm_nofpu/gcc-4.2.1-final/gcc'
> Checking multilib configuration for libmudflap...
> mkdir -p -- arm-linux-uclibc/libmudflap
> Configuring in arm-linux-uclibc/libmudflap
> configure: creating cache ./config.cache
> checking build system type... i386-pc-linux-gnu
> checking host system type... arm-unknown-linux-uclibc
> checking target system type... arm-unknown-linux-uclibc
> checking for a BSD-compatible install... /usr/bin/install -c
> checking whether build environment is sane... yes
> checking for gawk... gawk
> checking whether /usr/bin/make sets $(MAKE)... yes
> checking for arm-linux-uclibc-strip...
> /home/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin/strip
> checking for --enable-version-specific-runtime-libs... no
> checking whether to enable maintainer-specific portions of Makefiles... no
> checking for arm-linux-uclibc-gcc...
> /home/buildroot/toolchain_build_arm_nofpu/gcc-4.2.1-final/./gcc/xgcc
> -B/home/buildroot/toolchain_build_arm_nofpu/gcc-4.2.1-final/./gcc/
> -B/usr/arm-linux-uclibc/bin/ -B/usr/arm-linux-uclibc/lib/ -isystem
> /usr/arm-linux-uclibc/include -isystem /usr/arm-linux-uclibc/sys-include
> checking for C compiler default output file name... configure: error: C
> compiler cannot create executables
> See `config.log' for more details.
> make[2]: *** [configure-target-libmudflap] Error 1
> make[2]: Leaving directory
> `/home/buildroot/toolchain_build_arm_nofpu/gcc-4.2.1-final'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/home/buildroot/toolchain_build_arm_nofpu/gcc-4.2.1-final'
> make: ***
> [/home/buildroot/toolchain_build_arm_nofpu/gcc-4.2.1-final/.compiled]
> Error 2
> 
I think it is two sides of the same problem.
"configure" expects the arm-linux-uclibc-ld to create a good target,
but it doesn't.
It tries to link with crt1.o, which does not exist, and therefore the
build fails.




> 
> BR,
> Ivan
> 
