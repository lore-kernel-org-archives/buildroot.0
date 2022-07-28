Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F5DC19F2B
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 22:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C57F260E2D;
	Thu, 28 Jul 2022 22:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C57F260E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjRiZgNrDTsd; Thu, 28 Jul 2022 22:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A634460D67;
	Thu, 28 Jul 2022 22:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A634460D67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5D71BF301
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 22:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81D5C60D67
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 22:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81D5C60D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIg7AJLjWFen for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 22:28:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F53960D5D
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F53960D5D
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 22:28:55 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HBzxoTsANPF2eHBzxox1HQ; Fri, 29 Jul 2022 00:28:53 +0200
Message-ID: <733d97a0-7ee5-d788-6cba-ccac757befdb@benettiengineering.com>
Date: Fri, 29 Jul 2022 00:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Jan Havran <havran.jan@email.cz>, buildroot@buildroot.org
References: <YlBzP4J4FGA4Z7nL@arch-zen.localdomain>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <YlBzP4J4FGA4Z7nL@arch-zen.localdomain>
X-CMAE-Envelope: MS4xfBOP771BXdZEu7s1SF1YMDirKIFp+Xue0xm4TTqE7EfvZF7M6pVmo+bVbEy4ChjD4k/Mg8Hy53rqMoK5goseJH7FDANhe4gGrLBw5VT4MxPR0Rx4Uhg0
 HXRAc1VT7aNUrAN8slZZ+OP1/8+5NwCSMtEDw3ucxuwUNIkyLsujleB0Je3ef4uzGYvK/xRfZJgqsU8M38+mZSikp5GRo7Zp9e2kTE6TLW090PXVW/3VUdei
 BhI3kF4yDPVDymYYMdcOQ/EiD7peG/gRqkvdTJwb5gx9C9Iaoa7pKWjCpkDuHOmI
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659047333; bh=Turi3UeXJTxebJs2egaFw3EPI+gjJIrGcohiI8Ch4mI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=iABsLNdO18MU8GpJSK9ndQDYeDrlCPDfxs78zng6a7cZGGN0i/n6NkjD/qUHW+Qbg
 IuDs2/yeetzr2/GYxWr7JpIGpVwPIlQtAN/a+DLNzYHfpHzKSiMwI7dLbsMs21uYrv
 B7eKdPuYR9DFCb3FtcvecimyOX7NsNrBfVd54xJKYyn0k+SIzEgN+jURqSGOGhmfoA
 o+FJ/tXd2CPOPYScW8eMkY+bG3w0BZ4T1kX12VAMG+Fmzp7ljuAgjhPPiJAcXLiELx
 umgEoB4H90Xc/uhKvtWAi5EyPDUgo+1qAkRbPD75cojjjpqk/329J1M/boZP1xeDfx
 SCcddYtAlJMDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=iABsLNdO
Subject: Re: [Buildroot] [PATCH 1/1] board/pine64/pinecube: new board
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jan,

On 08/04/22 19:39, Jan Havran wrote:
> Add support for PineCube with:
> - U-Boot 2022.01
> - Linux 5.15

Here I would briefly describe the board(various I/Os) and add a https
URL to the board official webpage if it exists.

> Signed-off-by: Jan Havran <havran.jan@email.cz>
> ---
>   DEVELOPERS                         |  4 +++
>   board/pine64/pinecube/boot.cmd     |  6 ++++
>   board/pine64/pinecube/genimage.cfg | 34 +++++++++++++++++++++
>   board/pine64/pinecube/readme.txt   | 31 ++++++++++++++++++++
>   configs/pinecube_defconfig         | 47 ++++++++++++++++++++++++++++++
>   5 files changed, 122 insertions(+)
>   create mode 100644 board/pine64/pinecube/boot.cmd
>   create mode 100644 board/pine64/pinecube/genimage.cfg
>   create mode 100644 board/pine64/pinecube/readme.txt
>   create mode 100644 configs/pinecube_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a66b9d7eee..d418a1af99 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1356,6 +1356,10 @@ F:	package/pangomm/
>   F:	package/rpm/
>   F:	package/yad/
>   
> +N:	Jan Havran <havran.jan@email.cz>
> +F:	board/pine64/pinecube/
> +F:	configs/pinecube_defconfig
> +
>   N:	Jan Heylen <jan.heylen@nokia.com>
>   F:	package/opentracing-cpp/
>   
> diff --git a/board/pine64/pinecube/boot.cmd b/board/pine64/pinecube/boot.cmd
> new file mode 100644
> index 0000000000..d8b62e0b4a
> --- /dev/null
> +++ b/board/pine64/pinecube/boot.cmd
> @@ -0,0 +1,6 @@
> +setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait rw
> +
> +fatload mmc 0 $kernel_addr_r zImage
> +fatload mmc 0 $fdt_addr_r sun8i-s3-pinecube.dtb
> +
> +bootz $kernel_addr_r - $fdt_addr_r

The lastest boards use extlinux.conf instead of boot.cmd since it's
pretty easier to use it during debugging. So it's better to have
extlinux.conf here and when one finalize the project then it can create
the corresponding boot.cmd

> diff --git a/board/pine64/pinecube/genimage.cfg b/board/pine64/pinecube/genimage.cfg
> new file mode 100644
> index 0000000000..af175811ad
> --- /dev/null
> +++ b/board/pine64/pinecube/genimage.cfg
> @@ -0,0 +1,34 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +			"sun8i-s3-pinecube.dtb",
> +			"boot.scr"
> +		}
> +	}
> +
> +	size = 8M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot-sunxi-with-spl.bin"
> +		offset = 8K
> +		size = 504K # 512KB - 8KB
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +	}
> +}
> diff --git a/board/pine64/pinecube/readme.txt b/board/pine64/pinecube/readme.txt
> new file mode 100644
> index 0000000000..7770bbfe42
> --- /dev/null
> +++ b/board/pine64/pinecube/readme.txt
> @@ -0,0 +1,31 @@
> +Intro
> +=====
> +
> +This directory contains a Buildroot configuration for building a
> +Pine64 PineCube.
> +
> +Board homepage: https://www.pine64.org/cube/
> +Board wiki:     https://wiki.pine64.org/wiki/PineCube

These ^^^ are the URLs I ask you for in commit log

> +
> +How to build it
> +===============
> +
> +  $ make pinecube_defconfig
> +  $ make
> +
> +Note: you will need access to the internet to download the required
> +sources.
> +
> +How to write the SD card
> +========================
> +
> +Once the build process is finished you will have an image called "sdcard.img"
> +in the output/images/ directory.
> +
> +Copy the bootable "sdcard.img" onto an SD card with "dd":
> +
> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> +  $ sudo sync
> +
> +Insert the micro SDcard in your PineCube and power it up. The console
> +is on the serial port 2, 115200 8N1 (check Wiki for board pinout).
> diff --git a/configs/pinecube_defconfig b/configs/pinecube_defconfig

Since this is a Pine64 board and you also use board/pine64/pinecube it's
better to rename pinecube_defconfig to pine64_pinecube_defconfig like
pine64_sopine_defconfig

> new file mode 100644
> index 0000000000..1064167d8e
> --- /dev/null
> +++ b/configs/pinecube_defconfig
> @@ -0,0 +1,47 @@
> +# Target options
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_NEON_VFPV4=y

This ^^^ should be removed since NEON doesn't support complete FPU
standard API, so it's better to keep the default for BR2_cortex_a7

> +
> +# Toolchain options
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="pinecube"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to PINECUBE"

"Welcome to Pine64 Pinecube" ^^^

> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pinecube/genimage.cfg"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"

Here ^^^ please use latest stable 5.15.x version, now it's 5.15.57:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/

and re-test it

> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-s3-pinecube"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pinecube"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/pinecube/boot.cmd"
> +
> +# Required host utilities for building an SDCard image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Here ^^^ remember to check which Host tool is needed after changing to
extlinux.conf

Anyway I've built it successfully with Buildroot's utils/docker-run.

Waiting for V2 patch then.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
