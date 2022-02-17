Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D2AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 19:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC0D4404CF;
	Thu, 17 Feb 2022 19:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cK_1j-P4O3t0; Thu, 17 Feb 2022 19:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 783D6403C8;
	Thu, 17 Feb 2022 19:41:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D0851BF3D4
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 19:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 982CF403C8
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 19:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Ro_ZaiXEV5E for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 19:41:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id C10B440391
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 19:41:54 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Kmf2nxQaJvHpTKmf2n2ke6; Thu, 17 Feb 2022 20:41:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645126912; bh=k21OhwlbcRihz9sdGt7UnRx53dmMYZK9myUOlsjILbk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ml8cANRqSf3x9ydyHMFIYBMtT70MWQR85D1YkVV2g1430C8GjC5yrz5fD7Lrp6SKG
 OiCzucQ9qeJYlK+qfxZ0SknldqzdwVlfk6b01ZB3Tj3OYZj6I6GyxpsxVZFZ4jUWH6
 bx8n8NKaNLvnuIASvZn/nJtp/twoQQZ4Zbq3YJ8wNF2mCfcsKdZcETPBh+Vod7oOiQ
 LsIjb1XHPLsAU0OqkHmEnU7I/HVoPxRNLnEeRZUyqtE1/Kr0o6BPP4RAwnlijVQ1xx
 0yDCgGej9jAu+Thor8WyBMgt3cbr9WHI6z8tFvEhzpy4GWMZM8ttXAtSt88lDIT62W
 5lh8AWnf5eQGQ==
Message-ID: <8d64f47c-9040-ab00-975c-6d9d0af11ef9@benettiengineering.com>
Date: Thu, 17 Feb 2022 20:41:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <20220217184209.16736-1-kuzminov.sergey81@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220217184209.16736-1-kuzminov.sergey81@gmail.com>
X-CMAE-Envelope: MS4wfPthHl3QDYgOrbucINKgsKi61Pjfd/J5bufmUWG/InXQ4s+FFaPFHnlqpyRqaOcdXBojRsvP5nQcHkhvKHJPhShKhfiZ2EsjtdjwFFe3o2RhkbWpfayJ
 w7u3qgJC4dWbiPhfW6XC9ZPYs8ibn0esn2hX3inmxFFPjho3ROG9E6eciX9Kza0mu3hm61wZA90RkeJ8tLNloz62ef/M5WnfFyxzlV95EzIR/2/3w76ZCyK3
 osdSf10uhrs4zueHpJSPtQ==
Subject: Re: [Buildroot] [PATCH] configs/orangepi_pc_defconfig: switch to
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

On 17/02/22 19:42, Sergey Kuzminov wrote:
> Changes:
> * Switch to common scenarios for multiple boards to create an SD image: board/orangepi/common.

^^^ * Switch to common orangepi scenario for multiple 
boards(board/orangepi/common) to create an SD image.

> * Exclude FAT partition, it is no longer needed for U-Boot.
> * Switch SD image from MBR to GPT for partition-uuid to work.
> * Switch to extlinux, this is convenient for debugging.
> 
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>

Except that reword:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: built only]

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   board/orangepi/orangepi-pc/boot.cmd     |  8 ------
>   board/orangepi/orangepi-pc/genimage.cfg | 37 -------------------------
>   configs/orangepi_pc_defconfig           |  9 ++----
>   3 files changed, 3 insertions(+), 51 deletions(-)
>   delete mode 100644 board/orangepi/orangepi-pc/boot.cmd
>   delete mode 100644 board/orangepi/orangepi-pc/genimage.cfg
> 
> diff --git a/board/orangepi/orangepi-pc/boot.cmd b/board/orangepi/orangepi-pc/boot.cmd
> deleted file mode 100644
> index 9da625c803..0000000000
> --- a/board/orangepi/orangepi-pc/boot.cmd
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -setenv fdt_high ffffffff
> -
> -setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> -
> -fatload mmc 0 $kernel_addr_r zImage
> -fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc.dtb
> -
> -bootz $kernel_addr_r - $fdt_addr_r
> diff --git a/board/orangepi/orangepi-pc/genimage.cfg b/board/orangepi/orangepi-pc/genimage.cfg
> deleted file mode 100644
> index 14e326cc56..0000000000
> --- a/board/orangepi/orangepi-pc/genimage.cfg
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -# Minimal SD card image for the OrangePi PC
> -#
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"zImage",
> -			"sun8i-h3-orangepi-pc.dtb",
> -			"boot.scr"
> -		}
> -	}
> -
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
> diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
> index 44ea9b95c4..fd0f64e0e6 100644
> --- a/configs/orangepi_pc_defconfig
> +++ b/configs/orangepi_pc_defconfig
> @@ -5,8 +5,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
>   BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
>   BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
> @@ -14,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc/linux.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> @@ -27,9 +29,4 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc/boot.cmd"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
