From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 21:40:00 +0100
Subject: [Buildroot] [PATCH] boost: fix sparc compile
In-Reply-To: <20151115122455.GA29481@waldemar-brodkorb.de>
References: <20151115122455.GA29481@waldemar-brodkorb.de>
Message-ID: <20151116214000.3f33b341@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 15 Nov 2015 13:24:55 +0100, Waldemar Brodkorb wrote:
> Like for sparc64, set correct instruction set.
> Patch is obsoleted by this changeset.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---

Is this fixing an actual issue / build failure, or just making the
Sparc fix nicer ?

Also, Boost on Sparc still doesn't build properly for me in certain
configurations. For example:

BR2_sparc=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-glibc-2015.08-647-gc356fb2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_2=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_ATOMIC=y
BR2_PACKAGE_BOOST_CHRONO=y
BR2_PACKAGE_BOOST_CONTAINER=y
BR2_PACKAGE_BOOST_CONTEXT=y
BR2_PACKAGE_BOOST_COROUTINE=y
BR2_PACKAGE_BOOST_DATE_TIME=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_FILESYSTEM=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_MATH=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
BR2_PACKAGE_BOOST_RANDOM=y
BR2_PACKAGE_BOOST_REGEX=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_BOOST_SIGNALS=y
BR2_PACKAGE_BOOST_SYSTEM=y
BR2_PACKAGE_BOOST_TEST=y
BR2_PACKAGE_BOOST_TIMER=y
BR2_PACKAGE_BOOST_WAVE=y
# BR2_TARGET_ROOTFS_TAR is not set

Fails with:

...failed gcc.compile.asm bin.v2/libs/context/build/gcc-4.9.3/release/threading-multi/asm/jump_sparc_sysv_elf_gas.o...
gcc.compile.c++ bin.v2/libs/context/build/gcc-4.9.3/release/threading-multi/unsupported.o
libs/context/src/unsupported.cpp:7:2: error: #error "platform not supported"
 #error "platform not supported"

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
