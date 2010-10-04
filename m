From: Mike Davies <busybox_mail@rovoreed.com>
Date: Mon, 04 Oct 2010 18:41:47 +0000
Subject: [Buildroot] Problems building toolchain for Cyrix III
Message-ID: <1286217707.7586.8.camel@ceri.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm having problems building the toolchain for the Cyrix III processor.
i.e.

Target Architecture (i386) --->
Target Architecture Variant (cyrix 3 (MMX + 3dNOW!))  --->         

What is happening is the following...

/home/mike/buildroot-2010.08/output/toolchain/gcc-4.3.5/configure  \
--prefix=/home/mike/buildroot-2010.08/output/staging/usr \
--build=x86_64-unknown-linux-gnu \
--host=x86_64-unknown-linux-gnu \
--target=-unknown-linux-uclibc \
--enable-languages=c \
--with-sysroot=/home/mike/buildroot-2010.08/output/toolchain/uClibc_dev/
\
--disable-__cxa_atexit \
--enable-target-optspace \
--with-gnu-ld \
--disable-shared \
--disable-libssp \
--without-headers \
--with-newlib \
--disable-multilib \
--disable-tls \
--with-gmp=/home/mike/buildroot-2010.08/output/toolchain/gmp \
--with-mpfr=/home/mike/buildroot-2010.08/output/toolchain/mpfr \
--disable-nls \
--enable-threads \
--disable-decimal-float \
\
--with-arch="c3" --with-tune="c3" \
--with-pkgversion="Buildroot 2010.08"
--with-bugurl="http://bugs.buildroot.net/" \
\
\
)
checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu
checking target system type... configure:
error: /bin/sh /home/mike/buildroot-2010.08/output/toolchain/gcc-4.3.5/config.sub -unknown-linux-uclibc failed
make: ***
[/home/mike/buildroot-2010.08/output/toolchain/gcc-4.3.5-initial/.configured] Error 1
[mike at ceri buildroot-2010.08]$ 

I think what should be happening is the script should have the parameter

--target=viac3-unknown-linux-uclibc \

instead of

--target=-unknown-linux-uclibc \

I can't work out which script needs to be changed or where. Is this a
buildroot problem or something else ?
