Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C71C48BF8
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 13:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 980CE41C56;
	Thu, 22 Feb 2024 13:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFW3YEuIc08m; Thu, 22 Feb 2024 13:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4478041C51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4478041C51;
	Thu, 22 Feb 2024 13:12:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECFDA1BF40B
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 13:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA41D8248F
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 13:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uU4NeK0N3xMI for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 13:12:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D66CA82662
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D66CA82662
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D66CA82662
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 13:12:34 +0000 (UTC)
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id d8sJr1xh7POkKd8sJrgQXw; Thu, 22 Feb 2024 14:12:32 +0100
Message-ID: <9f844f84-2566-4de6-9e85-7490f3633c11@benettiengineering.com>
Date: Thu, 22 Feb 2024 14:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20231208003746.9505-1-fancp2007@gmail.com>
 <20240222130716.1311432-1-fancp2007@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240222130716.1311432-1-fancp2007@gmail.com>
X-CMAE-Envelope: MS4xfCtt5tmADK1qen8+CFWu6Ts0YMw/vx7ZOqI+IVyE6QUuwkRNYJpKoAylZc0IXIJ0SGl/vDWIlXwmm1cGgKg6C2sc4vEOq+qfqY/7v6YvKmB9hYO4vqb1
 E5EeIrjYE79ZyGFGcKWACGVpMW7yEmL5UK5r1EPvwjHkww7cwNmyvBwkdYeHEIoZBAvBeD7hUmEuFX9jOQGRD4bN81SKzvsaBicnWjzMaAr7YbEy8TuV1+t6
 e7U7JrXsJX4EiPaXTHnjrw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708607552; bh=nZUKA4mWCCbDmUqLOifPgdO76JslGzq1o8gjq3neNfI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Qu38UVu2I10oH0S4Il+4vIcH+v7lIkeVND6WTcPh/rrMa+4Ov9MmlbKFrCxfexWCg
 E2Tv5gewhP7SQpwecMJtUgY0cDIrLNiK1WG+T/qZ1NgppVpXQqnChLW7tqk90ttFF/
 12gAniDjMQgPoo8wxyaT3VJbadZ4SgRJl8NUJ1+mUAvykpOL9+PIxDrRmKxD9W6/6a
 yPvlLwqvmQW+f5HHfMOJvyUcetoh/6+gXxom6Dsp+4azGgR9EPNjMExeBuTMVmr2+6
 8oJZp7Jgq8XToJlTDMX+JNxlz5fLBfKrwLeNUecu4EKx52QrLHjri0NKXBxMQRRfOa
 8R8gtXn5rlI7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Qu38UVu2
Subject: Re: [Buildroot] [PATCH v6]
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

no need to resend, and...

On 22/02/24 14:07, Scott Fan wrote:
> Add support for the FriendlyARM NanoPi NEO2 with mainline components:
>    - U-Boot 2024.01
>    - Linux 6.6.17
> 
> Board's wiki page:
>    - https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO2
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

... if you resend please keep my:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Only build-tested using docker-run]
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
> 
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
> Changes v5 -> v6:
>    - Bump kernel version to 6.6.17
>    - Bump uboot version to 2024.01
>    - Add option BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> ---
>   board/friendlyarm/nanopi-neo2/extlinux.conf |  4 ++
>   board/friendlyarm/nanopi-neo2/genimage.cfg  | 16 +++++++
>   board/friendlyarm/nanopi-neo2/post-build.sh |  5 +++
>   board/friendlyarm/nanopi-neo2/readme.txt    | 34 ++++++++++++++
>   configs/friendlyarm_nanopi_neo2_defconfig   | 49 +++++++++++++++++++++
>   5 files changed, 108 insertions(+)
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
> index 0000000000..a60aba06d9
> --- /dev/null
> +++ b/configs/friendlyarm_nanopi_neo2_defconfig
> @@ -0,0 +1,49 @@
> +BR2_aarch64=y
> +BR2_cortex_a53=y
> +BR2_ARM_FPU_VFPV4=y
> +
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
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
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo2"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.17"
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
