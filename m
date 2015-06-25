From: g4 at novadsp.com <g4@novadsp.com>
Date: Thu, 25 Jun 2015 12:08:56 +0100
Subject: [Buildroot] B3+external kernel: not quite sure how to make
	these pieces fit ...
In-Reply-To: <558B1B96.8070701@mind.be>
References: <066601d0aeb0$e445c840$acd158c0$@novadsp.com>
 <558B1B96.8070701@mind.be>
Message-ID: <07f701d0af37$5492bff0$fdb83fd0$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, apologies. Outlook simply replied to you and not the list.

>  Looks like your external toolchain is not installed correctly. Can 
> you run
> ~/rcn/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-
> gnueabihf-gcc  -v

I will bow to superior knowledge here but it does produce a booting,
running, kernel.

-------------------snip-----------------------
~/rcn $
~/rcn/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-gnueabi
hf-gcc -v Using built-in specs.
COLLECT_GCC=/home/jevans/rcn/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linu
x/bin/arm-linux-gnueabihf-gcc
COLLECT_LTO_WRAPPER=/home/jevans/rcn/gcc-linaro-arm-linux-gnueabihf-4.9-2014
.09_linux/bin/../libexec/gcc/arm-
linux-gnueabihf/4.9.2/lto-wrapper
Target: arm-linux-gnueabihf
Configured with:
/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/sr
c/gcc-linaro-4.9
-2014.09/configure --build=i686-build_pc-linux-gnu
--host=i686-build_pc-linux-gnu --target=arm-linux-gnueabih f
--prefix=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/
install --with-sysroot=/cbuild/
slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/install/arm-linux
-gnueabihf/libc --enable-language s=c,c++,fortran --disable-multilib
--enable-multiarch --with-arch=armv7-a --with-tune=cortex-a9 --with-fpu=vf
pv3-d16 --with-float=hard --with-pkgversion='crosstool-NG
linaro-1.13.1-4.9-2014.09 - Linaro GCC 4.9-2014.09'
 --with-bugurl=https://bugs.launchpad.net/gcc-linaro --enable-__cxa_atexit
--enable-libmudflap --enable-libgo mp --enable-libssp
--with-gmp=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linu
x/.build/arm-l
inux-gnueabihf/build/static
--with-mpfr=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-lin
ux/.b
uild/arm-linux-gnueabihf/build/static
--with-mpc=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf
-linux/.build/arm-linux-gnueabihf/build/static
--with-isl=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-
gnueabihf-linux/.build/arm-linux-gnueabihf/build/static
--with-cloog=/cbuild/slaves/oorts/crosstool-ng/builds
/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/static
--with-libelf=/cbuild/slaves/oorts/crossto
ol-ng/builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/stat
ic --enable-threads=posix --disab le-libstdcxx-pch --enable-linker-build-id
--enable-plugin --enable-gold --with-local-prefix=/cbuild/slaves/oo
rts/crosstool-ng/builds/arm-linux-gnueabihf-linux/install/arm-linux-gnueabih
f/libc --enable-c99 --enable-long -long --with-mode=thumb --disable-multilib
--with-float=hard Thread model: posix gcc version 4.9.2 20140904
(prerelease) (crosstool-NG linaro-1.13.1-4.9-2014.09 - Linaro GCC
4.9-2014.09)


> 
>  Or to be safe, just select the Linaro 2014.09 toolchain as to be 
> downloaded and installed.

Yes but working kernel trumps all ...

>  You'll have to run 'make -C <linux_dir> INSTALL_MOD_PATH=$1 
> modules_install'
> from a post-build script. Or else, install the modules in some staging 
> directory and copy them to the target directory in the post-build script.
> 
>  Or alternatively, just build it in buildroot with 
> BR2_LINUX_KERNEL_CUSTOM_LOCAL=y.

This last is promising. So you suggest cloning kernel repo in the buildroot
tree? 

Someone else must have had this problem? 

Thank you.
