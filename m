From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Sep 2020 09:03:23 -0700
Subject: [Buildroot] Toolchain issues on multiple architectures
In-Reply-To: <20200911093009.68a115f9@windsurf.hq.k.grp>
References: <20200910120536.2431494d@windsurf.hq.k.grp>
 <CAKmqyKOSLH-VJc-72eyn=O_-nNwneb3Wqcm-Yb1qt6TzXdDS0g@mail.gmail.com>
 <20200911093009.68a115f9@windsurf.hq.k.grp>
Message-ID: <CAKmqyKN4Ge5YWUtbU-XwBD2JbrJ-jMhSVMZVbE6wOsz+CUM1jA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 11, 2020 at 12:30 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Alistair,
>
> On Thu, 10 Sep 2020 16:17:46 -0700
> Alistair Francis <alistair23@gmail.com> wrote:
>
> > Do you have any steps to reproduce this?
>
> You need to build this defconfig:
>
> BR2_riscv=y
> BR2_RISCV_32=y
> BR2_KERNEL_HEADERS_5_4=y
> BR2_BINUTILS_VERSION_2_34_X=y
> BR2_GCC_VERSION_10_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_GDB=y
> # BR2_TARGET_ROOTFS_TAR is not set

I don't see any errors using this config with buildroot. Do I need to
do anything else?

>
> > I tried `./build.sh riscv32-ilp32d--glibc--bleeding-edge testing
> > buildroot-toolchains/toolchains.bootlin.com-2020.08 2020.08-1` in the
> > toolchains-builder, but I'm missing
> > frags/riscv32-ilp32d--glibc--bleeding-edge.config.
> >
> > I then tried `frags/riscv32-ilp32d--glibc--bleeding-edge.config` but
> > it doesn't generate a RV32 frag.
>
> I don't recommend trying to use the toolchains-builder stuff. For now
> it's not really designed to be executed locally. This is something I
> want to fix, but I'm not there yet.

No worries.

Alistair

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
