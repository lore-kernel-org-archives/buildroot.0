From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 22:47:40 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-09
In-Reply-To: <20140610063009.EDF82100CE6@stock.ovh.net>
References: <20140610063009.EDF82100CE6@stock.ovh.net>
Message-ID: <20140610224740.325449ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

If you're in To:, read on, there is some work for you below!

On Tue, 10 Jun 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:

> Detail of failures
> ===================
> 
>       i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5f7e8019428b883a8450fd9d5fad73f66557252e/
>     x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/49002702dbd64f9d0a8412d7909b2ddc42c0f696/

The same static linking issue with uClibc.

>    aarch64 |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/127852d15c4f963feb122abef9579a9fc3280de5/
>     x86_64 |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/5e7e39917eb9a92c8803e81bc29aca65b4377985/

This has been reported upstream by Fran?ois.

>       bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/34fbefa2d1b199f93cd8d26ec90df9ced2d44b33/

Hard to understand issue with C++ stuff:

/home/test/test/2/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libdirectfb.a(DataBuffer.o):(.rodata._ZTIN8DirectFB21IDataBuffer_RequestorE[_ZTIN8DirectFB21IDataBuffer_RequestorE]+0x0): undefined reference to `vtable for __cxxabiv1::__si_class_type_info'

>       bfin | faifa-aa0b5f90b89a9fd153313... | NOK | http://autobuild.buildroot.net/results/9614d13769bfdc908e12e3242e7e07630dd08869/

Issue with -Wno-unused-result. To be handled by Maxime Hadjinlian.

>      nios2 | flann-d0c04f4d290ebc3aa9411... | NOK | http://autobuild.buildroot.net/results/0620bf8d60aa57949cede0c5b3920ef5446fe98b/

Crazy assertion failure:

ld: BFD (Sourcery CodeBench Lite 2013.05-43) 2.23.52.20130219 assertion fail /scratch/sandra/nios2-linux-bugfix/obj/binutils-src-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu/bfd/elf32-nios2.c:2961

Seems like we have quite a few problems with this toolchain on NIOS II.
I'll send a patch to disable this package with this toolchain.

>       bfin |                libcuefile-r475 | NOK | http://autobuild.buildroot.net/results/09d6eef85e8a435d1969c2a9a7df0711959c7010/

Samuel, can you convince this CMake based package to not build a shared
library when it's told not to build one?

>       bfin |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/f346bc5d46b3e161e812bbbb7105b1d73a5daf50/

libiconv issue.

>        arm |                  libksba-1.3.0 | NOK | http://autobuild.buildroot.net/results/fe1ecc10b2ef4ae046f28e219c335cd15d142607/

Temporary download problem, ignore.

>    powerpc |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/8cbf46352bce6d640e0fd9eaa1f7fa231921756d/
>        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/1d17d4fcf286fa7ed3a421251d74111a2cf9dfd8/
>        sh4 |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/9ccfd3dd495ab6cb3a55d5343d9747eb828a4fe2/
>        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/40967c7b051be8c9f8baf4a60138869eac5510d0/
>     x86_64 |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/22f78b72bcfe636fba772bcfd9bb02d5a4bf415b/
>        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/081c67f84ae1af83af1503d9a0fd3534b9d1f83e/
>        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/2d8f5ec90fbd3203b018f0d5d8a9bf198230d716/
>    powerpc |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/8797db138307033f44a4554f15d2d55378cfaff0/

Bernd, can you fix these issues quickly? Otherwise we'll have to revert
your patches.

>       mips |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/b12f1dcd44286f86c1e8d91d8427d8a30ceaaa63/
> microblazeel |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/45281530167e2dc8f325ff83dd08a3c75e2b43e7/
>        arm |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/8bbeb81b4afc49a6473aa649e93e5ee8ad3d40c2/
>       i686 |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/a4444f2d4e9bbcbb55806f16eb74b3aa3637da15/
>    powerpc |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/b223590df04dd3a72017d9edab894a4c5e2d631f/
>     x86_64 |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/84faa4251a6e2dbffad7c97ed25538d3e8b50932/
>    powerpc |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/90c6236bace2538b1a6a5044fe99a9bd3123b87c/

Fran?ois has pointed to a patch fixing this. Peter, can you apply?

>       bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/90a6dcf6deec32fcef86036f063302c66af884ef/

./.libs/libpopt.so: undefined reference to `_glob_pattern_p'

GNU Glob support missing from Blackfin toolchain.

>        arm |                  qt5base-5.3.0 | NOK | http://autobuild.buildroot.net/results/3cd168b929bd65a6b9e5d3abbabb6c97ac1d0f08/

Qt5/RaspberryPi problem:

.obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::platformDisplay() const':
qeglfshooks_pi.cpp:(.text+0x38): undefined reference to `vc_dispmanx_display_open'
.obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::platformDestroy()':
qeglfshooks_pi.cpp:(.text+0x5c): undefined reference to `vc_dispmanx_display_close'

Yann, Maxime, you are our RPi experts.

>       bfin |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/f220d70c22f5464ce20b3dd40c5388a094ebf2b4/

Not sure:

/home/test/test/1/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/../lib/gcc/bfin-linux-uclibc/4.5.3/../../../../bfin-linux-uclibc/bin/ld: snmpGet: hidden symbol `___umulsi3_highpart' in /home/test/test/1/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/../lib/gcc/bfin-linux-uclibc/4.5.3/libgcc.a(_umulsi3_highpart.o) is referenced by DSO
/home/test/test/1/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/../lib/gcc/bfin-linux-uclibc/4.5.3/../../../../bfin-linux-uclibc/bin/ld: final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status

>       mips |                    systemd-213 | NOK | http://autobuild.buildroot.net/results/10bcd92437eaa27eb61f8281c93efcb53d555e35/

Eric, this is for you:

configure.ac:616: warning: macro 'AM_PATH_LIBGCRYPT' not found in library
configure.ac:48: error: possibly undefined macro: AC_MSG_ERROR
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:616: error: possibly undefined macro: AM_PATH_LIBGCRYPT
autoreconf: /home/test/test/1/output/host/usr/bin/autoconf failed with exit status: 1
make: *** [/home/test/test/1/output/build/systemd-213/.stamp_configured] Error 1

>   mips64el |     xserver_xorg-server-1.15.1 | NOK | http://autobuild.buildroot.net/results/07910a54ab9e154d6b1fd69e7028e056efb4663c/

Vincente, this is for you.

>        arm | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/86e5e76a6ccc1396cd84107af63cdaa0ce1dfbee/

I already have some patches for this one, will send.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
