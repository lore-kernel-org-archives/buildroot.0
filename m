From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 24 Jan 2020 16:00:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/toolchain-external: ensure
 ARCH_LIB_DIR exist
In-Reply-To: <20200117023547.GA12999@vmh-VirtualBox>
References: <1577937441-18703-1-git-send-email-han_mao@c-sky.com>
 <CAAXf6LUVA4QkSmz8OaSOyqzKaw--eD5r0zAD+zONfyGROv1MZw@mail.gmail.com>
 <20200113033451.GA15150@vmh-VirtualBox>
 <CAAXf6LWZZKCW=g=ReXz00hLJSiBw6sJfsmSxu0=Q_J4FVda32g@mail.gmail.com>
 <20200117023547.GA12999@vmh-VirtualBox>
Message-ID: <CAAXf6LV-f9o_9oY4+Me4qHRJeQhCWA75H1GOEYMoRPu5j4m-Jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mao Han,

El vie., 17 ene. 2020 a las 3:35, Mao Han (<han_mao@c-sky.com>) escribi?:
[..]
> >
> > I compiled the riscv toolchain as instructed, and applied your config
> > (note: it was a full config, not a defconfig). The defconfig is:
> >
> > BR2_riscv=y
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/riscv"
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-unknown-linux-gnu"
> > BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_0=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> > BR2_TOOLCHAIN_EXTERNAL_CXX=y
> > BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> > BR2_SYSTEM_DHCP="eth0"
> > BR2_LINUX_KERNEL=y
> > BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.12"
> > BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> > BR2_TARGET_ROOTFS_EXT2=y
> > BR2_TARGET_OPENSBI=y
> > BR2_TARGET_OPENSBI_PLAT="qemu/virt"
> > BR2_PACKAGE_HOST_QEMU=y
> > BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> >
> > Using this config, I do not see the same error as you. The toolchain
> > seems to install correctly (note: later we will notice it does not;
> > see below), but I do get an error later when busybox is compiled:
> >
>
> The problem is originally occurs on a non-public released toolchain
> with a sysroot folder structure like:
> sysroot/lib64xthead/lp64d
> and I tried to reproduce with a public RISC-V toolchain, and got
> similar error weeks ago.
> I retried with the toolchains yesterday, the error is only reproduced
> with the internal one. There might be something wrong with my
> previous operation.
>
[..]
> > I'm not yet sure how this should be solved...
>
> There is another patch in the same thread:
> [PATCH 2/2] toolchain: Get ld.so name if available
> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-package-toolchain-external-ensure-ARCH-LIB-DIR-exist-td243604.html#a244193
> Tried to get the corresponding ld.so name with certain configuration.
>

Thanks. Using this patch '[PATCH 2/2] toolchain: Get ld.so name if
available' I actually can compile correctly.
So, PATCH 1/2 is not actually needed.

Do you agree that only PATCH 2/2 is required?
If so I will perform a more thorough review of that patch.

Thanks,
Thomas
