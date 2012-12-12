From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Dec 2012 11:16:28 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <50C7D14F.4060304@mind.be>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
 <20121211171008.3b869509@skate> <50C7D14F.4060304@mind.be>
Message-ID: <20121212111628.5d1e9dba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 12 Dec 2012 01:35:27 +0100, Arnout Vandecappelle wrote:

>   Except for the environment, I don't expect we'll see much interesting
> in these...
> 
>   Probably more useful are all the config.log under output/toolchain/gcc*
> (especially output/toolchain/gcc-*-final/*/libgcc/config.log and config.h)

I have now reproduced the problem on a fresh installation of Ubuntu
12.04 32 bits. Nothing fancy in my system: it is an Ubuntu server, with
just the base packages + the minimal dependencies for Buildroot to run.

I have posted at
http://free-electrons.com/~thomas/pub/largefile-build-problem.tar.gz a
tarball that contains:

logfile <-- this is the full build log
output/build/host-autoconf-2.68/config.log
output/build/host-gmp-5.0.5/config.log
output/build/host-mpc-1.0.1/config.log
output/build/host-m4-1.4.16/config.log
output/build/host-mpfr-3.1.1/config.log
output/build/host-libtool-2.2.10/config.log
output/build/host-binutils-2.21.1/libiberty/config.log
output/build/host-binutils-2.21.1/binutils/config.log
output/build/host-binutils-2.21.1/bfd/config.log
output/build/host-binutils-2.21.1/config.log
output/build/host-binutils-2.21.1/gprof/config.log
output/build/host-binutils-2.21.1/intl/config.log
output/build/host-binutils-2.21.1/gas/config.log
output/build/host-binutils-2.21.1/etc/config.log
output/build/host-binutils-2.21.1/ld/config.log
output/build/host-binutils-2.21.1/opcodes/config.log
output/build/host-automake-1.11.6/config.log
output/toolchain/gcc-4.6.3-initial/libiberty/config.log
output/toolchain/gcc-4.6.3-initial/libdecnumber/config.log
output/toolchain/gcc-4.6.3-initial/lto-plugin/config.log
output/toolchain/gcc-4.6.3-initial/libcpp/config.log
output/toolchain/gcc-4.6.3-initial/zlib/config.log
output/toolchain/gcc-4.6.3-initial/config.log
output/toolchain/gcc-4.6.3-initial/build-i686-pc-linux-gnu/libiberty/config.log
output/toolchain/gcc-4.6.3-initial/build-i686-pc-linux-gnu/fixincludes/config.log
output/toolchain/gcc-4.6.3-initial/fixincludes/config.log
output/toolchain/gcc-4.6.3-initial/intl/config.log
output/toolchain/gcc-4.6.3-initial/gcc/config.log
output/toolchain/gcc-4.6.3-intermediate/libiberty/config.log
output/toolchain/gcc-4.6.3-intermediate/libdecnumber/config.log
output/toolchain/gcc-4.6.3-intermediate/lto-plugin/config.log
output/toolchain/gcc-4.6.3-intermediate/libcpp/config.log
output/toolchain/gcc-4.6.3-intermediate/zlib/config.log
output/toolchain/gcc-4.6.3-intermediate/config.log
output/toolchain/gcc-4.6.3-intermediate/build-i686-pc-linux-gnu/libiberty/config.log
output/toolchain/gcc-4.6.3-intermediate/build-i686-pc-linux-gnu/fixincludes/config.log
output/toolchain/gcc-4.6.3-intermediate/fixincludes/config.log
output/toolchain/gcc-4.6.3-intermediate/i586-buildroot-linux-uclibc/libgcc/config.log
output/toolchain/gcc-4.6.3-intermediate/intl/config.log
output/toolchain/gcc-4.6.3-intermediate/gcc/config.log
output/toolchain/uClibc-0.9.33.2/.config

I haven't looked into them for now.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
