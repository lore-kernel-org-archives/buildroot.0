From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Apr 2008 11:37:21 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
In-Reply-To: <0efa01c89632$9b7d9910$f52f9e86@LPSC0173W> (Guillaume Dargaud's
	message of "Fri\, 4 Apr 2008 11\:02\:23 +0200")
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W>
	<8763v071sq.fsf@macbook.be.48ers.dk> <20080402164154.GE9436@mx.loc>
	<0ddc01c89583$84ecb960$f52f9e86@LPSC0173W>
	<87ej9n2kj4.fsf@macbook.be.48ers.dk>
	<0e8d01c89595$e3482140$f52f9e86@LPSC0173W>
	<87bq4r0ybx.fsf@macbook.be.48ers.dk>
	<0e9b01c895a0$47d11590$f52f9e86@LPSC0173W>
	<87ej9mvygr.fsf@macbook.be.48ers.dk>
	<0efa01c89632$9b7d9910$f52f9e86@LPSC0173W>
Message-ID: <8763uyufji.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

 Guillaume> Hello Peter and thanks for the support.
 >> Just do make menuconfig and select powerpc/405/softfloat and off you
 >> go.

 Guillaume> Did exactly that from a clean svn. Incidentaly I notice
 Guillaume> that there are now far fewer activated defaults (no IPV6,
 Guillaume> CXX, locale, kernel compilation,

Exactly - The .defconfig was quite screwed up :/

 Guillaume> checking how to run the C preprocessor... /usr/bin/cpp
 Guillaume> configure: error: C preprocessor "/usr/bin/cpp " fails sanity check
 Guillaume> See `config.log' for more details.
 Guillaume> make: *** 
 Guillaume> [/home/guinevere/buildroot/toolchain_build_powerpc/gmp-4.2.2-host/.configured] 
 Guillaume> Error 1

What Linux distribution and what version of gcc/cpp are you using?

I'm using:
% gcc -v                                                     ~
Using built-in specs.
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --enable-languages=c,c++,fortran,objc,obj-c++,treelang --prefix=/usr --enable-shared --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --enable-nls --with-gxx-include-dir=/usr/include/c++/4.1.3 --program-suffix=-4.1 --enable-__cxa_atexit --enable-clocale=gnu --enable-libstdcxx-debug --enable-mpfr --enable-checking=release x86_64-linux-gnu
Thread model: posix
gcc version 4.1.3 20070831 (prerelease) (Debian 4.1.2-16)

 Guillaume> It also tries to compile gmp without the BR2_SOFT_FLOAT
 Guillaume> option. And same error with your .config.

 Guillaume> Now gmp is a dependency of uclibc, right ? So I disable
 Guillaume> the FPU in there...  same thing.

It's afaik a dependency of gcc.

 Guillaume> There's something wrong with the cross compiler, right ?!?

 Guillaume> 2 $ egrep -v "^#|^$" .config
 Guillaume> BR2_HAVE_DOT_CONFIG=y
 Guillaume> BR2_VERSION="0.10.0-svn"
 Guillaume> BR2_powerpc=y
 Guillaume> BR2_powerpc_405=y
 Guillaume> BR2_ARCH="powerpc"
 Guillaume> BR2_ENDIAN="BIG"
 Guillaume> BR2_GCC_TARGET_TUNE="405"
 Guillaume> BR2_PROJECT="uclibc"
 Guillaume> BR2_HOSTNAME="uclibc"
 Guillaume> BR2_BANNER="Welcome to the Erik's uClibc development environment."
 Guillaume> BR2_BOARD_NAME="arm"
 Guillaume> BR2_BOARD_PATH="target/device/ARM"
 Guillaume> ### What is this doing here ?!?

Don't worry, this is OK. (Ulf did this, and indeed - you could argue
about it's validity).

-- 
Bye, Peter Korsgaard
