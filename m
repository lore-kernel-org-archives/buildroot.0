Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E400BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9464C4040D;
	Sat, 26 Feb 2022 10:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQzjXuS_GFGl; Sat, 26 Feb 2022 10:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 529E94010E;
	Sat, 26 Feb 2022 10:53:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAE3E1BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C848340256
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chz9XaxGhfio for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:53:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTP id C12FB4024A
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:53:02 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NuhBnT8GZroAhNuhBnImW0; Sat, 26 Feb 2022 11:53:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645872781; bh=PCxD1AAqM6ngkcXCDIE6aE0M5NuAkvmNl4LsiMYjjBA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=iOsC5a44bDdJe7kYya54GKu5QE2a+r5gqwVoaJgHzl1rdUAmmh3gVmy8y9bqXnVcB
 qmgjX7weYNy7meisF/RLu4iTxvKaSIgkOK/tPvY1TAzEDdlmPS1K3dNKfPyds4UKWK
 H8nUPBdJB4aJOrxhZhvOeYfHSieXwET0V6vHheDjWlsRMadvHG/blNF4a5X+6eFtIZ
 HTAM3EjI5gLUUOom0QVzKcpbwtKK3FkwkioeVe4mnb/Z1ovaZcFhcFuo2gw+bhpr1T
 +6jEAcL/JhK2KxCm6ZeUXEvNSshz6gvRsrbZ3Xbbdmb9jETIURsm+DQ4Aors/nRTMl
 8d8ZqN4eaC3ZA==
Message-ID: <fbc14f66-0fb3-e9a1-0521-386fca65edc1@benettiengineering.com>
Date: Sat, 26 Feb 2022 11:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220225072622.3584480-1-geomatsi@gmail.com>
 <20220225072622.3584480-4-geomatsi@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220225072622.3584480-4-geomatsi@gmail.com>
X-CMAE-Envelope: MS4wfEkRTejkVkxsjwI6kUKh+Dq4/lvMO8AdsbYnGxwnprYHI+wmG/cyeI9QKQiLo6pkisTuvhvBd1Sk0Hp6eUW+sDgtyp/ag1DQw7ov8LAfEkYGPHXEJLu2
 FDFeohaK4331fplU5vBqvQtTfafUkmfq/9NdNazy9EiSu66L7dJ2gAEjDp1BNQFjLbLvukg9G6WISOLQb+I95Mx+Ph4R+z68/6bzUpGCjz+FmkCTcAAsSYK0
 WmybtqPntEXBcIj5dbyXgMQQjaSfz3fGyv+xG6oXvi4=
Subject: Re: [Buildroot] [PATCH v2 3/6] board/orangepi/orangepi-one: switch
 to extlinux
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

On 25/02/22 08:26, Sergey Matyukevich wrote:
> Switch to extlinux instead of U-Boot boot script. Drop custom
> boot script and genimage config. Instead use common orangepi
> files from board/orangepi/common.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: build tested only]

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   board/orangepi/orangepi-one/boot.cmd     |  8 -----
>   board/orangepi/orangepi-one/genimage.cfg | 37 ------------------------
>   configs/orangepi_one_defconfig           |  9 ++----
>   3 files changed, 3 insertions(+), 51 deletions(-)
>   delete mode 100644 board/orangepi/orangepi-one/boot.cmd
>   delete mode 100644 board/orangepi/orangepi-one/genimage.cfg
> 
> diff --git a/board/orangepi/orangepi-one/boot.cmd b/board/orangepi/orangepi-one/boot.cmd
> deleted file mode 100644
> index ab616e6ac9..0000000000
> --- a/board/orangepi/orangepi-one/boot.cmd
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -setenv fdt_high ffffffff
> -
> -setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> -
> -fatload mmc 0 $kernel_addr_r zImage
> -fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-one.dtb
> -
> -bootz $kernel_addr_r - $fdt_addr_r
> diff --git a/board/orangepi/orangepi-one/genimage.cfg b/board/orangepi/orangepi-one/genimage.cfg
> deleted file mode 100644
> index 2a14dcdec2..0000000000
> --- a/board/orangepi/orangepi-one/genimage.cfg
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -# Minimal SD card image for the OrangePi PC
> -#
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"zImage",
> -			"sun8i-h3-orangepi-one.dtb",
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
> diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
> index 1a2772a307..ba128424a0 100644
> --- a/configs/orangepi_one_defconfig
> +++ b/configs/orangepi_one_defconfig
> @@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-one"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> @@ -25,11 +26,7 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-one/boot.cmd"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-one/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
