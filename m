Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56797C433EF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 22:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C28DF408FC;
	Thu, 20 Jan 2022 22:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id po00zxwPxecV; Thu, 20 Jan 2022 22:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF90C4090E;
	Thu, 20 Jan 2022 22:13:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BEED1BF28F
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 22:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948BE4090E
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 22:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zz4gCHyEAOC for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 22:13:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTP id D556B408FC
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 22:13:35 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AfgTn73OlXfntAfgTnfmwe; Thu, 20 Jan 2022 23:13:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642716814; bh=6tPGeXMkesrOWYDz7k/k91LvnN53NMq1/UgeoAbGt74=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Got+gj/oCGLEdhHTlHaJ734OF3Gkg57dexMWxOXl5vd//1mSgzoG2lGSHInIEpWIC
 CJjgjOIXPQ5odzjrBo9/ESb+FtTGJng0Rj7QSMah7EjH+BK9OVFDRFqEF3g9G1R7o7
 nsmsko5b8708y239Tfp84jGGW2epUxz7lubrVHgcwMzF+5Jf7hjD1kCC1/xKr2JtQ+
 dLz/I443qEsjVxQrQnbjNiX115n+ZNmb6ZaIsDWqyztBjLhQoHoiIviCTVfmPGoqlF
 AoW6FkLEJa2JMg50j1P0O1Ts0ISY06eWY0RIMZVAudM0is5XM4FjMVwjdanVZTON3p
 Ab9eXivEGUS5Q==
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <20220120185043.7745-1-kuzminov.sergey81@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <d12af38f-509f-00a2-e1d7-7cf870aeea52@benettiengineering.com>
Date: Thu, 20 Jan 2022 23:13:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220120185043.7745-1-kuzminov.sergey81@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfGeMWddIRvwq7ptXDISApfopif9bq12L24zAH/5VoWE1E+pBYxnH6OQWVjhqa4yb/Qabuza5mhLG7OIxCDj+U1z44IHnqYTo5LYkm4oUgGvgUDzVcBBp
 8vpCWwF8MvFI0vaEeMZ2vu2nt65gIOoL9+Htu3/y6lAkKUDLX4qVyyJPU+ks+jw/h8LDlbGPZbAmuLoychB6ExKMQdVjkfd8Vf3GL9oakfCGR7rpwt3/djmr
 MX54lu9l2uiXS5nfNc4CViDvs9OCJkBkNDrLKZj5B/I=
Subject: Re: [Buildroot] [PATCH v3] board/orangepi/orangepi-zero: bump Linux
 and U-Boot versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

On 20/01/22 19:50, Sergey Kuzminov wrote:
> v1:
> - Linux: bump to version 5.12.19 (from 5.12.2).
> - U-Boot: bump to version 2022.01 (from 2021.04).
> - Added fast_commit for ext4. When creating a file system with this option, writing speeds up twice in some cases: https://lwn.net/Articles/834483/
> - Refactoring configs/orangepi_zero_defconfig.
> - Switched to extlinux.
> - Createed common scenarios for multiple boards to create an SD image: board/orangepi/common.
> 
> v2:
> - Linux: bump to version 5.16.1 (from 5.12.19) thanks to a patch from Giulio for xr819-xradio (link below).

On (link below) use [1] instead and then...

> - Added in genimage.cfg: partition rootfs {offset = 1M} to prevent possible alignment error.
> - Added BR2_ARM_EABIHF=y to make it visible in the config file, previously added implicitly.
> - Replaced BR2_ARM_FPU_VFPV4 with BR2_ARM_FPU_NEON_VFPV4 because processor supports it.
> - Deleted BR2_GCC_ENABLE_LTO=y, added by mistake.
> 
> v3:
> - Changed the name of the patch (from board/orangepi/orangepi-zero:extlinux, refactoring).
> - Linux: bump to version 5.16.2 (from 5.16.1).
> - Returned (# BR2_TARGET_ROOTFS_TAR is not set) instead of (BR2_TARGET_ROOTFS_TAR=n), added in v1.
> - Renamed file uboot-extras.config -> uboot-extras.fragment.
> - Renamed file linux-extras.config -> linux-extras.fragment.
> - Deleted (#BR2_ARM_INSTRUCTIONS_THUMB2=y), added in v2.
> 
> Patch required to work:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220118063531.2039729-1-giulio.benetti@benettiengineering.com/

...put here:
[1]: 
https://patchwork.ozlabs.org/project/buildroot/patch/20220118063531.2039729-1-giulio.benetti@benettiengineering.com/

> 
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>

---
all V1->V2, V2->V3 changes go here with the 3 dashes above
And you need to keep V1 as commit log, not listing it here, so it has to 
summarize what this patch does. I'm wondering if maybe it makes sense to 
split it up to more than one patch. You're doing lot of stuff in this 
patch that can be bisectable even with different patches. So please try 
to move some changes into other patches and keep this one doing what the 
subject tells:
bump Linux and U-Boot versions

> ---
>   board/orangepi/common/extlinux.conf           |  5 ++
>   board/orangepi/common/genimage.cfg            | 20 ++++++
>   board/orangepi/common/post-build.sh           | 34 ++++++++++
>   board/orangepi/common/uboot-extras.fragment   |  3 +
>   board/orangepi/orangepi-zero/boot.cmd         |  9 ---
>   board/orangepi/orangepi-zero/genimage.cfg     | 36 ----------
>   ...ux-extras.config => linux-extras.fragment} |  0
>   configs/orangepi_zero_defconfig               | 68 +++++++++++--------
>   8 files changed, 103 insertions(+), 72 deletions(-)
>   create mode 100644 board/orangepi/common/extlinux.conf
>   create mode 100644 board/orangepi/common/genimage.cfg
>   create mode 100755 board/orangepi/common/post-build.sh
>   create mode 100644 board/orangepi/common/uboot-extras.fragment
>   delete mode 100644 board/orangepi/orangepi-zero/boot.cmd
>   delete mode 100644 board/orangepi/orangepi-zero/genimage.cfg
>   rename board/orangepi/orangepi-zero/{linux-extras.config => linux-extras.fragment} (100%)
> 
> diff --git a/board/orangepi/common/extlinux.conf b/board/orangepi/common/extlinux.conf
> new file mode 100644
> index 0000000000..015f29270e
> --- /dev/null
> +++ b/board/orangepi/common/extlinux.conf
> @@ -0,0 +1,5 @@
> +LABEL default
> +  kernel /boot/%LINUXIMAGE%
> +  devicetreedir /boot
> +  append root=PARTUUID=%PARTUUID% rootwait console=${console}
> +# append root=PARTUUID=%PARTUUID% rootwait console=${console} rootfstype=ext4 quiet panic=10
> diff --git a/board/orangepi/common/genimage.cfg b/board/orangepi/common/genimage.cfg
> new file mode 100644
> index 0000000000..8b80ffb138
> --- /dev/null
> +++ b/board/orangepi/common/genimage.cfg
> @@ -0,0 +1,20 @@
> +image sdcard.img {
> +	hdimage {
> +		partition-table-type = gpt
> +		gpt-no-backup = true
> +		gpt-location = 1008K # 1MB - 16KB
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = false
> +		image = "u-boot-sunxi-with-spl.bin"
> +		offset = 8K
> +		size = 1000K # 1MB - 8KB - 16KB
> +	}
> +
> +	partition rootfs {
> +		offset = 1M
> +		image = "rootfs.ext4"
> +		partition-uuid = %PARTUUID%
> +	}
> +}

Here you add a common genimage.cfg, so another patch(including the 
removal of the one specific genimage.cfg below)

> diff --git a/board/orangepi/common/post-build.sh b/board/orangepi/common/post-build.sh
> new file mode 100755
> index 0000000000..296f94b174
> --- /dev/null
> +++ b/board/orangepi/common/post-build.sh
> @@ -0,0 +1,34 @@
> +#!/bin/sh
> +
> +linux_image()
> +{
> +	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
> +		echo "uImage"
> +	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
> +		echo "Image"
> +	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGEGZ=y$" ${BR2_CONFIG}; then
> +		echo "Image.gz"
> +	else
> +		echo "zImage"
> +	fi
> +}
> +
> +generic_getty()
> +{
> +	if grep -Eq "^BR2_TARGET_GENERIC_GETTY=y$" ${BR2_CONFIG}; then
> +		echo ""
> +	else
> +		echo "s/\s*console=\S*//"
> +	fi
> +}
> +
> +PARTUUID="$($HOST_DIR/bin/uuidgen)"
> +
> +install -d "$TARGET_DIR/boot/extlinux/"
> +
> +sed -e "$(generic_getty)" \
> +	-e "s/%LINUXIMAGE%/$(linux_image)/g" \
> +	-e "s/%PARTUUID%/$PARTUUID/g" \
> +	"board/orangepi/common/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
> +
> +sed "s/%PARTUUID%/$PARTUUID/g" "board/orangepi/common/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"

here ^^^ you add the post-build.sh and including its defconfig option 
should be another patch. And this should go with the adding of 
extlinux.conf above because it's related.

> diff --git a/board/orangepi/common/uboot-extras.fragment b/board/orangepi/common/uboot-extras.fragment
> new file mode 100644
> index 0000000000..5aa97523d9
> --- /dev/null
> +++ b/board/orangepi/common/uboot-extras.fragment
> @@ -0,0 +1,3 @@
> +CONFIG_BOOTDELAY=0
> +CONFIG_USE_PREBOOT=y
> +CONFIG_PREBOOT="setenv preboot;"
> diff --git a/board/orangepi/orangepi-zero/boot.cmd b/board/orangepi/orangepi-zero/boot.cmd
> deleted file mode 100644
> index d094a64fe5..0000000000
> --- a/board/orangepi/orangepi-zero/boot.cmd
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -setenv fdt_high ffffffff
> -
> -part uuid mmc 0:2 uuid
> -setenv bootargs console=ttyS0,115200 root=PARTUUID=${uuid} rootwait
> -
> -fatload mmc 0 $kernel_addr_r zImage
> -fatload mmc 0 $fdt_addr_r sun8i-h2-plus-orangepi-zero.dtb
> -
> -bootz $kernel_addr_r - $fdt_addr_r

This ^^^ must be added to extlinux.conf replacing patch.

> diff --git a/board/orangepi/orangepi-zero/genimage.cfg b/board/orangepi/orangepi-zero/genimage.cfg
> deleted file mode 100644
> index 32f5454ae6..0000000000
> --- a/board/orangepi/orangepi-zero/genimage.cfg
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -# Minimal SD card image for the OrangePi Zero
> -#
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"zImage",
> -			"sun8i-h2-plus-orangepi-zero.dtb",
> -			"boot.scr"
> -		}
> -	}
> -	size = 10M
> -}
> -
> -image sdcard.img {
> -	hdimage {
> -	}
> -
> -	partition u-boot {
> -		in-partition-table = "no"
> -		image = "u-boot-sunxi-with-spl.bin"
> -		offset = 8K
> -		size = 1016K # 1MB - 8KB
> -	}
> -
> -	partition boot {
> -		partition-type = 0xC
> -		bootable = "true"
> -		image = "boot.vfat"
> -	}
> -
> -	partition rootfs {
> -		partition-type = 0x83
> -		image = "rootfs.ext4"
> -		size = 512M
> -	}
> -}
> diff --git a/board/orangepi/orangepi-zero/linux-extras.config b/board/orangepi/orangepi-zero/linux-extras.fragment
> similarity index 100%
> rename from board/orangepi/orangepi-zero/linux-extras.config
> rename to board/orangepi/orangepi-zero/linux-extras.fragment
> diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
> index 1c107b10e6..430d38af3e 100644
> --- a/configs/orangepi_zero_defconfig
> +++ b/configs/orangepi_zero_defconfig
> @@ -1,49 +1,63 @@
> +# Architecture
>   BR2_arm=y
>   BR2_cortex_a7=y
> -BR2_ARM_FPU_VFPV4=y
> +BR2_ARM_EABIHF=y
> +BR2_ARM_FPU_NEON_VFPV4=y

This FPU stuff ^^^ is another patch

> +
> +# System
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
> +BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
>   BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
> -BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
> -BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
>   BR2_SYSTEM_DHCP="eth0"
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
> -BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.config"
> -BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> -BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_4=y
> -# BR2_TARGET_ROOTFS_TAR is not set



> +
> +# Bootloader
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
> -BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Here ^^^ you move lines down, and there can be a patch for only 
reordering stuff, 1 for uboot and 1 for linux.

> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/orangepi/common/uboot-extras.fragment"

This ^^^ goes with uboot-extras.fragment common patch

> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.2"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y

This ^^^ is ok, but you also moved the lines

> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="63M"
> +BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^64bit,fast_commit"
> +BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
> +# BR2_TARGET_ROOTFS_TAR is not set

This ^^^ ? If there is a reason is another patch, and ofc the removal of 
# not set goes together

> +
> +# Image
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cf > +
> +# Required tools to create the SD image
> +BR2_PACKAGE_HOST_GENIMAGE=y

This ^^^ goes with common genimage.cfg patch

>   
> -# wireless driver and firmware
> +# Wireless driver and firmware
>   BR2_PACKAGE_XR819_XRADIO=y
>   BR2_PACKAGE_ARMBIAN_FIRMWARE=y
>   BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819=y
>   
> -# wireless support
> +# Wireless support
>   BR2_PACKAGE_IW=y
>   BR2_PACKAGE_WIRELESS_TOOLS=y
>   BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
> @@ -51,5 +65,5 @@ BR2_PACKAGE_WPA_SUPPLICANT=y
>   BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
>   BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
>   
> -# spi flash support
> +# Spi flash support
>   BR2_PACKAGE_MTD=y
> 

Various comment capitalizing is another patch.

So I would expect a patchset with like 6/7 patches.

Otherwise you move a lot of stuff all in once.
But keep in mind that it must be bisectable, so this defconfig has to 
produce something working after applying every single patch.

Kind regards!
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
