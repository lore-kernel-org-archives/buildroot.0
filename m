Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BCFC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13864151F;
	Mon,  5 Feb 2024 15:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D13864151F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGvAoiXn0oHq; Mon,  5 Feb 2024 15:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E529C416DE;
	Mon,  5 Feb 2024 15:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E529C416DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDD751BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A05CE40377
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A05CE40377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLTWJoJvBjU5 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:36:25 +0000 (UTC)
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B823140320
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B823140320
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X0zbrmaKpD7V9X11BrnArA; Mon, 05 Feb 2024 16:36:22 +0100
Message-ID: <f90afd5c-0be1-48d4-8e2c-de29fdab7cf8@benettiengineering.com>
Date: Mon, 5 Feb 2024 16:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240131173827.1281120-1-romain.naour@smile.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240131173827.1281120-1-romain.naour@smile.fr>
X-CMAE-Envelope: MS4xfGFprHd2PO+KBH/LMciX2MIc9gi3cKfBZ4UJFtf5ZX5Z1avYsOZh7t/iA/xZohsItuCbFGrDltAz9VTAYpTAAjkmq6YEc9Sjq2Jd+UINaYkFMNQgxX05
 RfaI4mUIlm0F2ON5pNePl4QyMAjxTnbsxlrXOfmn0jcUKt+X65/GmA21c42ZLv55/ioGFkAhTZC+c8OmruRqik8X0dDKeE1PH+WU61AEVvX2mObXHaemLOnr
 kBOHK1NaGSCXs6EAcruRqQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707147382; bh=XFyMjezoBgixnJ2KT4+YPs/PJQEaoxBuY5UtUWHwpV0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=QopqCkf+jaKjEx2fifhwgp5HeR7RxQCZbHLCoYg8lGBwQjlRuYFWE7qPn4dV0ZJD4
 oQer8WZl+DQbsxMvT0RZM4dkgsdb/IOJaIgj1DF+OY8+pzUzYLRRnI1WgIftmDbVk6
 eaWGkYHSaGyai6exCcrilopjtnsgdKLVHJLePXvu31EY5Br/9XOenHabP91ofIk5fp
 K9XDqTcPPRARt9RWch9QrXJ73XxmpZJRCEdf656IJc6Ljao86c91B5vWFR5eUC6bvM
 MHjSgPNBmYOq2UcOBTdxDy1PU/JHODku675CJZbTf/G9OihZSaonS5H2i6ec2smNrI
 tjHqdQN040APQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QopqCkf+
Subject: Re: [Buildroot] [PATCH] configs/am574x_idk_defconfig: new defconfig
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

Hi Romain,

On 31/01/24 18:38, Romain Naour wrote:
> This patch adds a basic support for AM574x Industrial Development Kit
> [1].
> 
> Use multi_v7_defconfig as kernel configuration file instead of
> the deprecated omap2plus_defconfig [2].
> 
> The main differences between upstream kernels and the TI vendor tree
> (5.10.x based) are:
> 
>    - pru based 100M ethernet ports will not work with upstream kernels
>    since the prueth driver for AM57 is not upstream yet (as of 6.8-rc2)
>    [3].
> 
>    - The ARM/DSP examples provided by TI [4] will not work either since
>    they requires an experimental patch [5] adding "remote-processor
>    messaging sockets".
> 
>    - There is no support for the POWERVR GPU SGX544 that requires
>    additional userpace vendor (closed source) libraries.
> 
> [1] https://www.ti.com/tool/TMDSIDK574
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=cca9f6838bac3441a42fa906314bf5e3bff50ac5
> [3] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?id=792b57aac224416f66175c15d60379a4cf581d0f
> [4] https://git.ti.com/cgit/processor-sdk/big-data-ipc-examples
> [5] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?id=f4b978a978c38149f712ddd137f12ed5fb914161
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   board/ti/am574x-idk/extlinux.conf |  4 +++
>   board/ti/am574x-idk/genimage.cfg  | 30 +++++++++++++++++++++
>   board/ti/am574x-idk/post-build.sh |  4 +++
>   board/ti/am574x-idk/readme.txt    | 28 +++++++++++++++++++
>   configs/am574x_idk_defconfig      | 45 +++++++++++++++++++++++++++++++
>   5 files changed, 111 insertions(+)
>   create mode 100644 board/ti/am574x-idk/extlinux.conf
>   create mode 100644 board/ti/am574x-idk/genimage.cfg
>   create mode 100755 board/ti/am574x-idk/post-build.sh
>   create mode 100644 board/ti/am574x-idk/readme.txt
>   create mode 100644 configs/am574x_idk_defconfig
> 
> diff --git a/board/ti/am574x-idk/extlinux.conf b/board/ti/am574x-idk/extlinux.conf
> new file mode 100644
> index 0000000000..29e0ecfa14
> --- /dev/null
> +++ b/board/ti/am574x-idk/extlinux.conf
> @@ -0,0 +1,4 @@
> +label am5749-idk-buildroot
> +  kernel /zImage
> +  fdtdir /
> +  append console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
> diff --git a/board/ti/am574x-idk/genimage.cfg b/board/ti/am574x-idk/genimage.cfg
> new file mode 100644
> index 0000000000..02a9ffe013
> --- /dev/null
> +++ b/board/ti/am574x-idk/genimage.cfg
> @@ -0,0 +1,30 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"MLO",
> +			"u-boot.img",
> +			"zImage",
> +			"am574x-idk.dtb",
> +			"extlinux"
> +		}
> +	}
> +
> +	size = 16M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition u-boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +                image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +		size = 1G
> +	}
> +}
> diff --git a/board/ti/am574x-idk/post-build.sh b/board/ti/am574x-idk/post-build.sh
> new file mode 100755
> index 0000000000..5dcdb352eb
> --- /dev/null
> +++ b/board/ti/am574x-idk/post-build.sh
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +BOARD_DIR="$(dirname "$0")"
> +
> +install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
> diff --git a/board/ti/am574x-idk/readme.txt b/board/ti/am574x-idk/readme.txt
> new file mode 100644
> index 0000000000..4869984cf1
> --- /dev/null
> +++ b/board/ti/am574x-idk/readme.txt
> @@ -0,0 +1,28 @@
> +Texas Instuments AM574x IDK Test and Development Board
> +
> +Description
> +===========
> +
> +This configuration will build a basic image for the TI AM574x IDK
> +board: https://www.ti.com/tool/TMDSIDK574
> +
> +How to build it
> +===============
> +
> +Configure Buildroot:
> +
> +    $ make am574x_idk_defconfig
> +
> +Compile everything and build the USB flash drive image:
> +
> +    $ make
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
> diff --git a/configs/am574x_idk_defconfig b/configs/am574x_idk_defconfig
> new file mode 100644
> index 0000000000..bbae73dff4
> --- /dev/null
> +++ b/configs/am574x_idk_defconfig
> @@ -0,0 +1,45 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a15=y
> +
> +# System
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.14"
> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am574x-idk"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Image
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am574x-idk/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am574x-idk/genimage.cfg"
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am57xx_evm"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="MLO"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +
> +# Required tools to create the SD image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

It looks good to me and I've build tested it using docker-run.

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Build Tested]
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
