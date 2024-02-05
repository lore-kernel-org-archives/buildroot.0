Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46F4C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686C3419D3;
	Mon,  5 Feb 2024 15:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 686C3419D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 074Yto0u-qEu; Mon,  5 Feb 2024 15:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85EDF41989;
	Mon,  5 Feb 2024 15:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85EDF41989
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1981BF215
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A38240AA4
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A38240AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJWxcVrxZL45 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:05:40 +0000 (UTC)
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06E9240A49
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06E9240A49
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X0XPrm5LAD7V9X0XQrmlFH; Mon, 05 Feb 2024 16:05:36 +0100
Message-ID: <f9d02825-f811-469b-864e-1886ac7ba085@benettiengineering.com>
Date: Mon, 5 Feb 2024 16:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20231104192335.2920640-1-fancp2007@gmail.com>
 <20231208003746.9505-1-fancp2007@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231208003746.9505-1-fancp2007@gmail.com>
X-CMAE-Envelope: MS4xfHRZdjJ0R2XqNNaLMjH+TTp3FBGx8zA1N0xtHt2fWnqz5f3FW0DalZPrsTs7Zyvnf3cp6Dk6eNvFmr8WjDV8zCv2JhOZ6bLhuYm1Xe7XHYUXQqR7y0OC
 yKN59erSdCanKVamSlJEtxQsKE96d/99HHHRozvbBRjnMOBtsxXXSR6R1tnD0BK4mXIVcQ6oe4DkQ177Kvy11MitBKf09XF52IX6oLHzcusex3bdtUhVA4YB
 IoO0l0EJw4P7H39dV3Pj2w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707145536; bh=fGoruAiclutd8SDQTfW/zj+t4tF4ht5O8D8J8n8qbbM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=WsOLfJHjP5jWJFSSEpHaKub74BJtY0u0ZfjXLGi9Va2CfMhWeMVTrEebe/IULcTAq
 X/M4kPLLbBlHICct3OWjOUzRXYfqdr2S0l9e8H4D5jkygISy/64BaIsMQ4VMk1kYYs
 +eYfSHGpzVXO4ZvJwoAOOnYSKB5EAZ5jMbtgqhOxpHm2ObhlHUwbpRcNTG/JfLB9jW
 4fei8mTVRQaf1Z95jo+2S7Z48HARwqp7JQ9/vJZabw65ol58gZp4hBN/z4isnKRYx2
 9klESEUfRVLpgwBNHjvXEtDFzNQYwtLtjb69Qug/a9Z2TfvPjK8V7DKM6EkrYsjzGv
 cqOjT3sQykI1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WsOLfJHj
Subject: Re: [Buildroot] [PATCH v5]
 configs/friendlyarm_nanopi_neo2_defconfig: new board
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

Hi Scott,

On 08/12/23 01:37, Scott Fan wrote:
> Add support for the FriendlyARM NanoPi NEO2 with mainline components:
>    - U-Boot 2023.10
>    - Linux 6.1.65
> 
> Board's wiki page:
>    - https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO2
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
> Changes v1 -> v2:
>    - Fix issues from 'utils/docker-run make check-package'
>    - Add atf custom version in the defconfig
>    - No need for sudo to run sync
> 
> Changes v2 -> v3:
>    - Update patch file, add the upstream tag
> 
> Changes v3 -> v4:
>    - Use a single integrated image file (u-boot-sunxi-with-spl.bin)
>    - Remove patch file for uboot, switch to binman
>    - Merge boot partition into rootfs partition
>    - Bump kernel version to 6.1.61
> 
> Changes v4 -> v5:
>    - Bump kernel version to 6.1.65
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>   board/friendlyarm/nanopi-neo2/extlinux.conf |  4 ++
>   board/friendlyarm/nanopi-neo2/genimage.cfg  | 16 +++++++
>   board/friendlyarm/nanopi-neo2/post-build.sh |  5 +++
>   board/friendlyarm/nanopi-neo2/readme.txt    | 34 +++++++++++++++
>   configs/friendlyarm_nanopi_neo2_defconfig   | 48 +++++++++++++++++++++
>   5 files changed, 107 insertions(+)
>   create mode 100644 board/friendlyarm/nanopi-neo2/extlinux.conf
>   create mode 100644 board/friendlyarm/nanopi-neo2/genimage.cfg
>   create mode 100755 board/friendlyarm/nanopi-neo2/post-build.sh
>   create mode 100644 board/friendlyarm/nanopi-neo2/readme.txt
>   create mode 100644 configs/friendlyarm_nanopi_neo2_defconfig
> 
> diff --git a/board/friendlyarm/nanopi-neo2/extlinux.conf b/board/friendlyarm/nanopi-neo2/extlinux.conf
> new file mode 100644
> index 0000000000..482a069f74
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo2/extlinux.conf
> @@ -0,0 +1,4 @@
> +label friendlyarm-nanopi-buildroot
> +  kernel /boot/Image
> +  devicetree /boot/sun50i-h5-nanopi-neo2.dtb
> +  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
> diff --git a/board/friendlyarm/nanopi-neo2/genimage.cfg b/board/friendlyarm/nanopi-neo2/genimage.cfg
> new file mode 100644
> index 0000000000..67e4e5efdb
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo2/genimage.cfg
> @@ -0,0 +1,16 @@
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition u-boot-tpl-spl-dtb {
> +		in-partition-table = "no"
> +		image = "u-boot-sunxi-with-spl.bin"
> +		offset = 8K
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +		offset = 1M
> +	}
> +}
> diff --git a/board/friendlyarm/nanopi-neo2/post-build.sh b/board/friendlyarm/nanopi-neo2/post-build.sh
> new file mode 100755
> index 0000000000..c7ec875068
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo2/post-build.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname "$0")"
> +
> +install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${TARGET_DIR}/boot/extlinux/extlinux.conf"
> diff --git a/board/friendlyarm/nanopi-neo2/readme.txt b/board/friendlyarm/nanopi-neo2/readme.txt
> new file mode 100644
> index 0000000000..c896a57525
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo2/readme.txt
> @@ -0,0 +1,34 @@
> +Intro
> +=====
> +
> +This default configuration will allow you to start experimenting with the
> +buildroot environment for the NanoPi NEO2. With the current configuration
> +it will bring-up the board, and allow access through the serial console.
> +
> +Wiki link:
> +https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO2
> +
> +This configuration uses U-Boot mainline and kernel mainline.
> +
> +How to build
> +============
> +
> +    $ make friendlyarm_nanopi_neo2_defconfig
> +    $ make
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
> +  $ sync
> +
> +Insert the micro SDcard in your NanoPi NEO2 and power it up. The console
> +is on the serial line, 115200 8N1.
> diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
> new file mode 100644
> index 0000000000..a955ec323a
> --- /dev/null
> +++ b/configs/friendlyarm_nanopi_neo2_defconfig
> @@ -0,0 +1,48 @@
> +BR2_aarch64=y
> +BR2_cortex_a53=y
> +BR2_ARM_FPU_VFPV4=y
> +
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +
> +# Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo2"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.65"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo2"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Filesystem
> +BR2_TARGET_GENERIC_ISSUE="Welcome to FriendlyARM NanoPi NEO2"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo2/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo2/genimage.cfg"

It looks good to me except you miss:
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

So adding that line:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Only build-tested using docker-run]
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Please use buildroot/utils/docker-run to check defconfigs and packages
so we're sure that all host dependencies are met.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
