From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Aug 2017 17:57:52 +0300
Subject: [Buildroot] [PATCH 1/1] configs: add defconfig for TS-7680
In-Reply-To: <20170810144951.20841-1-julien.grossholtz@savoirfairelinux.com>
References: <20170810144951.20841-1-julien.grossholtz@savoirfairelinux.com>
Message-ID: <20170810145752.2i45xfkeuu3spryw@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Thu, Aug 10, 2017 at 10:49:51AM -0400, Julien Grossholtz wrote:
> The TS-7680 is an i.MX286 ARM ARM926EJ-S board with 10/100 Ethernet,
> USB port, eMMC and CAN ports.
> 
> The TS-7680 uses a 3.14.28 Linux kernel provided by Technologic Systems:
> https://github.com/embeddedarm/linux-3.14.28-imx28
> 
> U-Boot is not provided as the manufacturer recommends not to update the
> built-in bootloader.
> 
> For more informations please see:
> https://wiki.embeddedarm.com/wiki/TS-7680
> 
> Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>

[snip]

> diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
> new file mode 100644
> index 0000000..0153685
> --- /dev/null
> +++ b/configs/ts7680_defconfig
> @@ -0,0 +1,20 @@
> +BR2_arm=y
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="3.14.28"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
> +BR2_GCC_VERSION_4_9_X=y

gcc version 4.9 will be removed in the near future. You would better make sure 
that your kernel/bootloader build with more recent gcc versions.

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts7680/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/embeddedarm/linux-3.14.28-imx28.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="93872644d70b5c6420cb16f8b05b156faef94a5b"
> +BR2_LINUX_KERNEL_DEFCONFIG="ts76xx"
> +BR2_LINUX_KERNEL_UIMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-ts7680"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_PACKAGE_HOST_GENIMAGE=y

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
