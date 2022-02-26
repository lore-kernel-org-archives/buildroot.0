Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7B4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8399160C1B;
	Sat, 26 Feb 2022 10:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iRhANIBmPDU; Sat, 26 Feb 2022 10:52:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9FFC60A81;
	Sat, 26 Feb 2022 10:52:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 092291BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA33540018
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajjD-Nx3W1Ut for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:52:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTP id C03D14010E
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:52:50 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NugxnT89troAhNugynImTE; Sat, 26 Feb 2022 11:52:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645872768; bh=fcUupOMIIH8GfOlBj52oq5tqVxWp4fJBfBP493sqF4g=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=HVvfvYq6AWgH1+BlbmbkSp2GCrCwUUvkz5kCdvpRDoIdXma/eMU+5gy+CtIwdCF8w
 0yy6ZLBw8Fsa/Q4RW1lLp88A+Hl5bbI9cL9lHxld5sXVgSEu7gY0uuCBTWTcnBGFXB
 9EnjkkuBRX8+cF9IdJfXsElkSu7no+JBx72dZkl4qdHXjaUJRTC05SptXlA6rbsq7h
 iz2wH3nxYlXSK1I5ktsjH/GbWUlsnjsuGPf2iT7OX7hAuBa/AMRDM3FsT7uok9heFx
 K0O3PhwIBqkJhE22R4pVTvaRVPOwCSw4ySgfXFbEWkPGFJ3NOXQXKc8XU1qSISm4J3
 O0dSqOlLA/Jig==
Message-ID: <c22ad0a5-a379-9f98-41e7-e3c185dbc1a2@benettiengineering.com>
Date: Sat, 26 Feb 2022 11:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220225072622.3584480-1-geomatsi@gmail.com>
 <20220225072622.3584480-3-geomatsi@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220225072622.3584480-3-geomatsi@gmail.com>
X-CMAE-Envelope: MS4wfJCss51FlKZRHtX//Q7omawuqoAo5uDxE7YDGsioVaWg0rUtrNFmAAWnjhalK+A4mmirX+B2fbxob9wGFuTVl1OQIl3EtGbuPAYdSAtg8/UH0E+2xu5E
 e8P6Y3qFyxaG0iCDCUnsGMLwveIwpkL7QNjB3Wm9XEU5f3PPRHuNoLnmLA0MzNXf1mXke6S1SuXhggPGSGIOrVtQQ06kNdU9i3Tp4yhhbxN6zhBygAQ9nmeB
 BdQ6zLPsUDC/isPB2qoZ4asBV20pnFRuSWnDq3Vg+5o=
Subject: Re: [Buildroot] [PATCH v2 2/6] board/orangepi/orangepi-pc-plus:
 switch to extlinux
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
>   board/orangepi/orangepi-pc-plus/boot.cmd     |  8 ----
>   board/orangepi/orangepi-pc-plus/genimage.cfg | 43 --------------------
>   configs/orangepi_pc_plus_defconfig           |  9 ++--
>   3 files changed, 3 insertions(+), 57 deletions(-)
>   delete mode 100644 board/orangepi/orangepi-pc-plus/boot.cmd
>   delete mode 100644 board/orangepi/orangepi-pc-plus/genimage.cfg
> 
> diff --git a/board/orangepi/orangepi-pc-plus/boot.cmd b/board/orangepi/orangepi-pc-plus/boot.cmd
> deleted file mode 100644
> index c91f77942f..0000000000
> --- a/board/orangepi/orangepi-pc-plus/boot.cmd
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -setenv fdt_high ffffffff
> -
> -setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
> -
> -fatload mmc 0 $kernel_addr_r zImage
> -fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc-plus.dtb
> -
> -bootz $kernel_addr_r - $fdt_addr_r
> diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
> deleted file mode 100644
> index 3812d785d5..0000000000
> --- a/board/orangepi/orangepi-pc-plus/genimage.cfg
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -# Minimal SD card image for the OrangePi PC Plus
> -#
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"zImage",
> -			"sun8i-h3-orangepi-pc-plus.dtb",
> -			"boot.scr"
> -		}
> -	}
> -
> -	size = 10M
> -}
> -
> -image sdcard.img {
> -	hdimage {
> -		# for root=PARTLABEL support
> -		partition-table-type = "gpt"
> -		# default GPT location conflicts with bootloaders, move it after
> -		gpt-location = 1M
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
> -		partition-type-uuid  = "F"
> -		bootable = "true"
> -		image = "boot.vfat"
> -	}
> -
> -	# 'rootfs' will be used as the partition label, used
> -	# with root=PARTLABEL=rootfs kernel command line
> -	partition rootfs {
> -		partition-type-uuid = "L"
> -		image = "rootfs.ext4"
> -		size = 512M
> -	}
> -}
> diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
> index c3ff8bc417..ba946e5285 100644
> --- a/configs/orangepi_pc_plus_defconfig
> +++ b/configs/orangepi_pc_plus_defconfig
> @@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc-plus"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc-plus/linux-extras.config"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> @@ -27,14 +28,10 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc-plus/boot.cmd"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc-plus/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>   
>   # wireless driver and firmware
>   BR2_PACKAGE_RTL8189FS=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
