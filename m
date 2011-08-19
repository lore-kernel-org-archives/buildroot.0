From: Victor Fang <victor.fang@163.com>
Date: Fri, 19 Aug 2011 16:00:33 +0800
Subject: [Buildroot] Failed to build MIPS/Linux n64
Message-ID: <002501cc5e46$28de4a00$7a9ade00$@fang@163.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I failed to build Gcc and MIPS/Linux n64 with buildroot-2011.05. 

After search in the Bug Tracking, I find and apply this patch:

https://bugs.uclibc.org/show_bug.cgi?id=3751

 

The config file of buildroot like this:

 

#

# Automatically generated make config: don't edit

# Buildroot 2011.05 Configuration

# Fri Aug 19 14:19:36 2011

#

BR2_HAVE_DOT_CONFIG=y

BR2_mips=y

BR2_mips_4=y

BR2_MIPS_ABI64=y

BR2_ARCH="mips"

BR2_ENDIAN="BIG"

BR2_GCC_TARGET_TUNE="mips4"

BR2_GCC_TARGET_ABI="64"

 

#

# Toolchain

#

BR2_TOOLCHAIN_BUILDROOT=y

# BR2_TOOLCHAIN_EXTERNAL is not set

# BR2_TOOLCHAIN_CTNG is not set

 

#

# Kernel Header Options

#

BR2_KERNEL_HEADERS_VERSION=y

# BR2_KERNEL_HEADERS_SNAP is not set

BR2_DEFAULT_KERNEL_VERSION="2.6.37.2"

BR2_DEFAULT_KERNEL_HEADERS="2.6.37.2"

 

#

# uClibc Options

#

# BR2_UCLIBC_VERSION_0_9_30 is not set

BR2_UCLIBC_VERSION_0_9_31=y

# BR2_UCLIBC_VERSION_0_9_32 is not set

# BR2_UCLIBC_VERSION_SNAPSHOT is not set

BR2_UCLIBC_VERSION_STRING="0.9.31"

BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"

BR2_PTHREAD_DEBUG=y

# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

 

#

# Binutils Options

#

# BR2_BINUTILS_VERSION_2_20 is not set

# BR2_BINUTILS_VERSION_2_20_1 is not set

BR2_BINUTILS_VERSION_2_21=y

BR2_BINUTILS_VERSION="2.21"

BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""

 

#

# GCC Options

#

# BR2_GCC_VERSION_4_2_4 is not set

# BR2_GCC_VERSION_4_3_X is not set

# BR2_GCC_VERSION_4_4_X is not set

BR2_GCC_VERSION_4_5_X=y

# BR2_GCC_VERSION_4_6_X is not set

# BR2_GCC_VERSION_SNAP is not set

BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y

BR2_GCC_VERSION="4.5.3"

BR2_EXTRA_GCC_CONFIG_OPTIONS=""

# BR2_INSTALL_OBJC is not set

# BR2_INSTALL_FORTRAN is not set

BR2_GCC_SHARED_LIBGCC=y

# BR2_GCC_ENABLE_OPENMP is not set

 

#

# Gdb Options

#

# BR2_PACKAGE_GDB is not set

BR2_PACKAGE_GDB_SERVER=y

BR2_PACKAGE_GDB_HOST=y

# BR2_GDB_VERSION_6_7_1 is not set

BR2_GDB_VERSION_6_8=y

# BR2_GDB_VERSION_7_0_1 is not set

# BR2_GDB_VERSION_7_1 is not set

BR2_GDB_VERSION="6.8"

BR2_LARGEFILE=y

BR2_INET_IPV6=y

BR2_INET_RPC=y

BR2_USE_WCHAR=y

BR2_ENABLE_LOCALE=y

BR2_PROGRAM_INVOCATION=y

BR2_INSTALL_LIBSTDCPP=y

BR2_TOOLCHAIN_HAS_THREADS=y

# BR2_ENABLE_LOCALE_PURGE is not set

BR2_NEEDS_GETTEXT=y

BR2_NEEDS_GETTEXT_IF_LOCALE=y

BR2_USE_MMU=y

BR2_PREFER_SOFT_FLOAT=y

# BR2_SOFT_FLOAT is not set

BR2_TARGET_OPTIMIZATION="-pipe -Os -mno-branch-likely -march=rm9000"

 

#

# Toolchain Options

#

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y

BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y

BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y

BR2_TOOLCHAIN_BUILDROOT_LOCALE=y

BR2_TOOLCHAIN_BUILDROOT_PROGRAM_INVOCATION=y

BR2_TOOLCHAIN_BUILDROOT_CXX=y

BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y

# BR2_PTHREADS_NONE is not set

BR2_PTHREADS=y

# BR2_PTHREADS_OLD is not set

 

 

Error output:

 

/usr/bin/make -j1 -C
/home/victorf/buildroot-2011.05/output/toolchain/uClibc-0.9.31 \

                   ARCH="mips" \

 
PREFIX=/home/victorf/buildroot-2011.05/output/toolchain/uClibc_dev/ \

                   DEVEL_PREFIX=/usr/ \

 
RUNTIME_PREFIX=/home/victorf/buildroot-2011.05/output/toolchain/uClibc_dev/
\

                   HOSTCC="/usr/bin/gcc" headers \

                   lib/crt1.o lib/crti.o lib/crtn.o \

                   install_headers

make[1]: Entering directory
`/home/victorf/buildroot-2011.05/output/toolchain/uClibc-0.9.31'

make[1]: Nothing to be done for `headers'.

make[1]: `lib/crt1.o' is up to date.

make[1]: `lib/crti.o' is up to date.

make[1]: `lib/crtn.o' is up to date.

top_builddir=./ \

         ./extra/scripts/install_headers.sh include
/home/victorf/buildroot-2011.05/output/toolchain/uClibc_dev//usr/include

cd /home/victorf/buildroot-2011.05/output/toolchain/uClibc_dev//usr/include
&& rm -f -r dl-osinfo.h _lfs_64.h bits/uClibc_arch_features.h
bits/kernel_sigaction.h bits/kernel_stat.h bits/kernel_types.h
bits/syscalls.h bits/syscalls-common.h bits/utmpx.h bits/uClibc_errno.h
bits/uClibc_uintmaxtostr.h atomic.h bits/atomic.h bits/sigcontextinfo.h
bits/stackinfo.h tls.h rpc/des_crypt.h rpc/key_prot.h rpc/rpc_des.h sgtty.h
fenv.h bits/fenv.h bits/fenvinline.h libintl.h wordexp.h ifaddrs.h

cd /home/victorf/buildroot-2011.05/output/toolchain/uClibc_dev//usr/include
&& rm -f -f wchar-stub.h

make[1]: Leaving directory
`/home/victorf/buildroot-2011.05/output/toolchain/uClibc-0.9.31'

# Install the kernel headers to the first stage gcc include dir

# if necessary

if [ ! -f
/home/victorf/buildroot-2011.05/output/toolchain/uClibc_dev/usr/include/linu
x/version.h ]; then \

                   cp -pLR
/home/victorf/buildroot-2011.05/output/toolchain/linux/include/* \

 
/home/victorf/buildroot-2011.05/output/toolchain/uClibc_dev/usr/include/; \

         fi

/home/victorf/buildroot-2011.05/output/host/usr/bin/mips-unknown-linux-uclib
c-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o
/home/victorf/buildroot-2011.05/output/toolchain/uClibc_dev/usr/lib/libc.so

/home/victorf/buildroot-2011.05/output/host/usr/lib/gcc/mips-unknown-linux-u
clibc/4.5.3/../../../../mips-unknown-linux-uclibc/bin/ld: /tmp/cco65iFG.o:
ABI is incompatible with that of the selected emulation

/home/victorf/buildroot-2011.05/output/host/usr/lib/gcc/mips-unknown-linux-u
clibc/4.5.3/../../../../mips-unknown-linux-uclibc/bin/ld: failed to merge
target specific data of file /tmp/cco65iFG.o

collect2: ld returned 1 exit status

make: ***
[/home/victorf/buildroot-2011.05/output/toolchain/uClibc-0.9.31/.configured]
Error 1 

 

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110819/b60069d7/attachment-0001.html>
