From: Spenser Gilliland <spenser309@gmail.com>
Date: Thu, 10 Nov 2011 16:55:18 -0600
Subject: [Buildroot] Adding Microblaze support to Buildroot
In-Reply-To: <4EBC554E.7050605@gmail.com>
References: <4EBC554E.7050605@gmail.com>
Message-ID: <4EBC5656.2010103@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I'm trying to add the Microblaze arch to buildroot.  However, I'm
having some issues.  The following error comes up when building the
intermediate compiler.

zh_HK.utf8
zh_SG.utf8
zh_TW.utf8
zu_ZA.utf8
/usr/bin/make -j1 -C
/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc \
         ARCH="microblaze" \

PREFIX=/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc_dev/
\
         DEVEL_PREFIX=/usr/ \

RUNTIME_PREFIX=/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc_dev/
\
         HOSTCC="/usr/bin/gcc" headers \
         lib/crt1.o lib/crti.o lib/crtn.o \
         install_headers
make[1]: Entering directory
`/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc'
make[1]: Nothing to be done for `headers'.
make[1]: `lib/crt1.o' is up to date.
make[1]: `lib/crti.o' is up to date.
make[1]: `lib/crtn.o' is up to date.
   INSTALL include ->
/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc_dev//usr/include
unifdef: can't open include/bits/semaphore.h: No such file or directory
unifdef: can't open include/bits/pthreadtypes.h: No such file or directory
make[1]: Leaving directory
`/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc'
# Install the kernel headers to the first stage gcc include dir
# if necessary
if [ ! -f
/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc_dev/usr/include/linux/version.h
]; then \
         cp -pLR
/home/spenser/Research/buildroot/buildroot/output/toolchain/linux/include/*
\

/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc_dev/usr/include/;
\
     fi
/home/spenser/Research/buildroot/buildroot/output/host/usr/bin/microblaze-unknown-linux-uclibc-gcc
-nostdlib -nostartfiles -shared -x c /dev/null -o
/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc_dev/usr/lib/libc.so
/tmp/ccU2bXNp.o: could not read symbols: No error
collect2: ld returned 1 exit status
make: ***
[/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc/.configured]
Error 1

The part which states "could not read symbols: No error" leaves me with
very little idea on how to proceed.

Additionally, the missing semaphore.h and pthreadtypes.h could be
related.  Which component provides these files and how do I ensure they
are installed correctly.

My changes are available at  git://github.com/Spenser309/buildroot.git

Thanks,
Spenser

-- 
Spenser Gilliland
Illinois Institute of Technology
Computer Engineering
