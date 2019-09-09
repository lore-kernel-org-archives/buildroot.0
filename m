From: Yann Droneaud <ydroneaud@opteya.com>
Date: Mon, 09 Sep 2019 21:56:35 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/external: copy libssp.so if
 SSP is enabled
In-Reply-To: <20190907212313.00ddaff2@windsurf>
References: <20190902063728.31203-1-ydroneaud@opteya.com>
 <7a178308-1946-de53-0f68-b1191b91fcf8@smile.fr>
 <20190907212313.00ddaff2@windsurf>
Message-ID: <409497171f1c1b785e872f33e34024ae085651ce.camel@opteya.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 07 septembre 2019 ? 21:23 +0200, Thomas Petazzoni a ?crit :
> Hello Romain,
> 
> On Sat, 7 Sep 2019 15:18:06 +0200
> Romain Naour <romain.naour@smile.fr> wrote:
> 
> > I'm unable to reproduce the issue with the following defconfig:
> > 
> > BR2_aarch64=y
> > BR2_SSP_ALL=y
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> > BR2_SYSTEM_DHCP="eth0"
> > BR2_LINUX_KERNEL=y
> > BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
> > BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-
> > virt/linux.config"
> > BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> > BR2_PACKAGE_SOX=y
> > BR2_TARGET_ROOTFS_EXT2=y
> > BR2_TARGET_ROOTFS_EXT2_4=y
> > # BR2_TARGET_ROOTFS_TAR is not set
> > 
> > This defconfig use the external toolchain from ARM that provide SSP
> > support.
> > But there is no libssp.so in this toolchain.
> > 
> > Also, libssp from gcc is disabled in Buildroot for internal
> > toolchain since a while:
> > https://git.buildroot.net/buildroot/commit/?id=3b712a3d891bf23055a587fc518f7cd2139a6a09
> > 
> > In Buildroot, we are using libssp provided by the C library (glibc,
> > musl, uClibc-ng) when available. We are not using libssp from gcc.
> > 
> > Can you describe your issue ? Are you using a custom external
> > toolchain ?
> 
> Yes, I suspect Yann is using a custom external toolchain where the
> SSP
> runtime support is provided by gcc and not by the C library.
> 

I'm using linaro aarch64 ... but I remembered, incorrectly, having
check for other aarch64 toolchain: the other external toolchain don't
have libssp.

Regards.

-- 
Yann Droneaud
OPTEYA
