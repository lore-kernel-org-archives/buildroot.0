From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 11:35:31 +0200
Subject: [Buildroot] [PATCH] zedboard: Use default U-Boot after bump to
 2015.07
In-Reply-To: <20150722113054.1c0508f0@pcviktorin.fit.vutbr.cz>
References: <20150722113054.1c0508f0@pcviktorin.fit.vutbr.cz>
Message-ID: <20150722113531.0e3345ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan,

On Wed, 22 Jul 2015 11:30:54 +0200, Jan Viktorin wrote:

> diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
> index 99720db..5c3143a 100644
> --- a/configs/zedboard_defconfig
> +++ b/configs/zedboard_defconfig
> @@ -18,9 +18,6 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
>  BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
> -BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2015.07-rc2"
>  BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/avnet/zedboard/uboot"
>  BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
>  BR2_TARGET_UBOOT_SPL=y

This is not good: we want defconfig to explicitly state which U-Boot
and kernel versions they use. Imagine that in 3 months time, the U-Boot
package gets updated to use 2015.11 by default, and that it doesn't
work on Zedboard: your defconfig is broken. Also your patch may no
longer apply.

While there is certainly some variation that will occur on the
compiler/C library version, we really would like to keep the U-Boot and
kernel versions explicit.

So instead of this change, can you change to point to the 2015.07
U-Boot tarball?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
