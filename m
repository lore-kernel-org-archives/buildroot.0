Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EECC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 17:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5436D60B66;
	Sat,  5 Feb 2022 17:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BppnIpSi53T; Sat,  5 Feb 2022 17:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57AA860A90;
	Sat,  5 Feb 2022 17:26:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B04891BF30E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E47682451
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ecQKodmoRmX for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 17:26:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id C77128145D
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 17:26:23 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GOpJnHfyJNVvLGOpKnOebh; Sat, 05 Feb 2022 18:26:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644081982; bh=ALsMjB80rhLdnr3BKqazAn6D0oDfEuZriC7Ck71VTOo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=bdH799K8gdnp4t/Uy6fJC/D/dLwW0FNlhYqLPfu2EC8vwhYq2g5CZtIc/pH3uuS/Q
 ZGejSSxaiAbCdnR4YNtzlOkxsgrfegQd6lOsZIrCgX//hucKWfAm4M1gGtnlU0HyO/
 dnTLiYoXt0UphIyC3H+OIa9hh8DnRYcb0ZMPe57FnJ9eSQWgy3aKtfTTL7SFyrlTrA
 cSyALvCEfdx/ioHa5PkSLuGgZnmiAtsxYqy8+yhRftdg1HIgRmgy+KXZnc/qk1t/vH
 cb0nMnGXprX0Yfds4jaoLMDvRlojLba7/lLtpvZxI/0QOIySHAtbFeeF+9VoqKUhn0
 oIPgY1gGCWZsA==
Message-ID: <6e5f8adf-30a2-797e-f01b-4536ebc916ab@benettiengineering.com>
Date: Sat, 5 Feb 2022 18:26:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <20220205072801.13567-1-kuzminov.sergey81@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220205072801.13567-1-kuzminov.sergey81@gmail.com>
X-CMAE-Envelope: MS4wfDPdcovVcVd03aq0vZrC6LVRi7sNFPwymOuWWVyzFbbzQ6OfQW/qzNlw4k+11kKF71CjYz91sgBrJLLTbuY6qBKcbhXQWByqDK36x9JgLfLTP7nN424g
 oxSrGK5IY75KI14YenIxiiBln+oRqqU1b00RDPRWhWi6nfVL72oqfmYQH18u0ymcqmdpq8y2Ua8by6JhKlw8g13TF5TfOOz4t0aXFiZA2pfbtfXg4sSebPDW
 SSFZUaO9mSEkkoCwm26Qew==
Subject: Re: [Buildroot] [PATCH] configs/orangepi_zero_defconfig: switch to
 extlinux
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

On 05/02/22 08:28, Sergey Kuzminov wrote:
> Changes:
> - Exclude FAT partition, he is no longer needed for U-Boot.

typo s/he/it

> - Switch the rootfs partition from MBR to GPT for partition-uuid to work.
> - Switch to extlinux, this is convenient for debugging.
> - Create common scenarios for multiple boards to create an SD image: board/orangepi/common.
> 
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
> ---
>   board/orangepi/common/extlinux.conf       |  5 ++++
>   board/orangepi/common/genimage.cfg        | 23 +++++++++++++++
>   board/orangepi/common/post-build.sh       | 34 +++++++++++++++++++++
>   board/orangepi/orangepi-zero/boot.cmd     |  9 ------
>   board/orangepi/orangepi-zero/genimage.cfg | 36 -----------------------
>   configs/orangepi_zero_defconfig           | 11 ++++---
>   6 files changed, 67 insertions(+), 51 deletions(-)
>   create mode 100644 board/orangepi/common/extlinux.conf
>   create mode 100644 board/orangepi/common/genimage.cfg
>   create mode 100755 board/orangepi/common/post-build.sh
>   delete mode 100644 board/orangepi/orangepi-zero/boot.cmd
>   delete mode 100644 board/orangepi/orangepi-zero/genimage.cfg
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

Here ^^^ you've left a commented line, I guess the correct one is the 
second one, right? Or anyway you can only keep one.

> diff --git a/board/orangepi/common/genimage.cfg b/board/orangepi/common/genimage.cfg
> new file mode 100644
> index 0000000000..fa0d988991
> --- /dev/null
> +++ b/board/orangepi/common/genimage.cfg
> @@ -0,0 +1,23 @@
> +image sdcard.img {
> +	partition u-boot {
> +		in-partition-table = false
> +		image = "u-boot-sunxi-with-spl.bin"
> +		offset = 8K
> +		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
> +	}
> +
> +	hdimage {
> +		partition-table-type = gpt
> +		gpt-location = 1008K # 1MB - 16KB(GPT)
> +		gpt-no-backup = true
> +		# After writing the image to the SD card,
> +		# backup GPT data structures at the end of the disk:
> +		# gdisk /dev/mmcblk0 then press the buttons: x, e, w, y
> +	}
> +
> +	partition rootfs {
> +		offset = 1M
> +		image = "rootfs.ext4"
> +		partition-uuid = %PARTUUID%
> +	}
> +}
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
> diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
> index 5aaa1566c5..96f0c3f600 100644
> --- a/configs/orangepi_zero_defconfig
> +++ b/configs/orangepi_zero_defconfig
> @@ -20,10 +20,13 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   
>   # Filesystem
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="63M"
> +BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y

It's worth mentioning this change ^^^ in commit log

>   # BR2_TARGET_ROOTFS_TAR is not set
>   
>   # Bootloader
> @@ -39,16 +42,12 @@ BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>   
>   # Required tools to create the SD image
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
>   
>   # Image
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>   
>   # Wireless driver and firmware
>   BR2_PACKAGE_XR819_XRADIO=y

I've built it successfully locally so:
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
and with the corrected commit log you can send V2 with ^^^ and also:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
