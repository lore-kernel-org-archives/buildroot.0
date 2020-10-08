From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 21:33:44 +0200
Subject: [Buildroot] [PATCH v2 1/6] toolchain/buildroot: allow uclibc-ng
 for riscv
In-Reply-To: <20201006234012.6b3c2697@windsurf.home>
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-2-damien.lemoal@wdc.com>
 <20201006234012.6b3c2697@windsurf.home>
Message-ID: <20201008213344.3eb95689@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Damien,

On Tue, 6 Oct 2020 23:40:12 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> And applied with some small improvements to the commit log as well.

So it turns out that the riscv32 uClibc-ng toolchain doesn't build. It
fails in the uClibc-ng build with:

In file included from ./include/sys/procfs.h:34,
                 from ./libpthread/nptl/../nptl_db/thread_db.h:28,
                 from ./libpthread/nptl/descr.h:30,
                 from ./libpthread/nptl/pthreadP.h:25,
                 from <stdin>:2:
./include/sys/user.h:32:3: error: unknown type name '__uint128_t'
   32 |   __uint128_t  vregs[32];
      |   ^~~~~~~~~~~

You can see a more complete build log at:

https://gitlab.com/bootlin/toolchains-builder/-/jobs/776340188

The defconfig being built is just:

BR2_riscv=y
BR2_RISCV_32=y
BR2_KERNEL_HEADERS_5_4=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PTHREAD_DEBUG=y
BR2_BINUTILS_VERSION_2_34_X=y
BR2_GCC_VERSION_10_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GDB=y
# BR2_TARGET_ROOTFS_TAR is not set

Do you have some idea of what could be wrong here ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
