Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA73C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 17:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DDFC81BA8;
	Sun, 21 Aug 2022 17:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DDFC81BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WiLgv4AnmksW; Sun, 21 Aug 2022 17:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A79981B52;
	Sun, 21 Aug 2022 17:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A79981B52
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65B9E1BF30E
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 17:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4725E605AC
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 17:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4725E605AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Een5bS7befyY for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 17:53:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25CE96058F
Received: from smtpcmd09100.aruba.it (smtpcmd09100.aruba.it [62.149.156.100])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25CE96058F
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 17:53:20 +0000 (UTC)
Received: from [192.168.8.175] ([86.32.48.35])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Pp8QojdSScFgjPp8QoO3GM; Sun, 21 Aug 2022 19:53:18 +0200
Message-ID: <2515e8ef-16ef-2d1b-8395-8d63eae8724f@benettiengineering.com>
Date: Sun, 21 Aug 2022 19:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: Jan Havran <havran.jan@email.cz>, buildroot@buildroot.org
References: <YwIRMgNSkvP/T9a+@arch-zen.localdomain>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <YwIRMgNSkvP/T9a+@arch-zen.localdomain>
X-CMAE-Envelope: MS4xfPW86ZQS2mQ+dQAEJWLtUHpp6MXCwnPvJ0N0TvSm8b2Txxfhgp4f4kPrOKxBADIRYxHIzu+/h3WsWVg8ymVCQGM8isAm/fxAYLv8OwrcHdohWVpnXlY6
 2i2g1P708irmsqRwJ0ybj3lqO5vdSVprppc1VjCXxxQcz2wNSiS0o8KWf8B3wkK6Jh59DDqb9WvTYnU8E7uGGzBQnHKEbjPQCNgC/Dj78WeSefcz3s4uLvJF
 OjbbNqrIAt4Cun4EYm0AulGI/UnFt95Mz8+bG6TGesSoBkq7oKEroZN32fhnFjeQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1661104398; bh=nGIZXAyNQThq81kwlwXPFSvf3gyVyU5MU9tbPtGVmN4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=h1pKRPFpbcBZa3im7pFoMDVW/uE2YKqqr5ImJrYsjG1ITchsuckhpcsbmxCOCICMj
 myGlOSISdRthR2QcZwmJbrscs6OrJWSkTJoVUiaPOVXxLF4KtgzjVYoTlHzj3cuHiO
 WDYRT8Uc8w5AYMGmrBmotoytaBgBuRnDPWS2WCPvt8hf9dWlxFV3TfHMyL4SWpt3Cs
 VrAKetLBZVbVXsAHln3ynDP3UVVv9obFhLDt4ifVuRU1TovXF9V641MblPQvh2WyXO
 5+CWkwXBUGg4rwaM+7mGWjoWYWQeAagTJx4A3IEkmFXOEvAdBFHeR6zhNy5bnpIcz+
 v0ELRySjj3Tog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=h1pKRPFp
Subject: Re: [Buildroot] [PATCH v2] board/pine64/pinecube: new board
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

On 21/08/22 13:04, Jan Havran wrote:
> Add support for PineCube with:
> - U-Boot 2022.04
> - Linux 5.15.61
> 
> PineCube is a low-powered, open source IP camera
> with the following specs:
>   - Allwinner S3 Cortex-A7
>   - 128 MiB DDR3
>   - 16 MiB SPI flash
>   - 5 MPx OV5640 camera
>   - MicroSD slot
>   - 10/100M Ethernet with passive PoE
>   - 802.11 b/g/n WiFi
>   - Bluetooth 4.1
>   - USB 2.0
>   - 26 pins GPIO header
>   - Microphone
>   - IR LEDs for night vision
> 
> Board homepage: https://www.pine64.org/cube/
> Board wiki:     https://wiki.pine64.org/wiki/PineCube
> 
> Signed-off-by: Jan Havran <havran.jan@email.cz>
> ---
> Changes v1 -> v2 (review by Giulio Benetti):
>    - Updated commit message
>    - Replaced boot.cmd by extlinux.conf
>    - Renamed pinecube_defconfig to pine64_pinecube_defconfig
>    - Changed welcome message (generic issue)
>    - Updated U-Boot 2022.01 to 2022.04
>    - Updated Linux kernel from 5.15 to 5.15.61
>    - Removed NEON from FPU (but kept VFPV4)
> ---
>   DEVELOPERS                          |  4 +++
>   board/pine64/pinecube/extlinux.conf |  4 +++
>   board/pine64/pinecube/genimage.cfg  | 34 ++++++++++++++++++++++
>   board/pine64/pinecube/post-build.sh |  5 ++++
>   board/pine64/pinecube/readme.txt    | 31 ++++++++++++++++++++
>   configs/pine64_pinecube_defconfig   | 45 +++++++++++++++++++++++++++++
>   6 files changed, 123 insertions(+)
>   create mode 100644 board/pine64/pinecube/extlinux.conf
>   create mode 100644 board/pine64/pinecube/genimage.cfg
>   create mode 100755 board/pine64/pinecube/post-build.sh
>   create mode 100644 board/pine64/pinecube/readme.txt
>   create mode 100644 configs/pine64_pinecube_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 4287fd9cf7..74f57af6fa 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1410,6 +1410,10 @@ F:	package/pangomm/
>   F:	package/rpm/
>   F:	package/yad/
>   
> +N:	Jan Havran <havran.jan@email.cz>
> +F:	board/pine64/pinecube/
> +F:	configs/pine64_pinecube_defconfig
> +
>   N:	Jan Heylen <jan.heylen@nokia.com>
>   F:	package/opentracing-cpp/
>   
> diff --git a/board/pine64/pinecube/extlinux.conf b/board/pine64/pinecube/extlinux.conf
> new file mode 100644
> index 0000000000..6a18d9a2cb
> --- /dev/null
> +++ b/board/pine64/pinecube/extlinux.conf
> @@ -0,0 +1,4 @@
> +label buildroot
> +  kernel /zImage
> +  devicetree /sun8i-s3-pinecube.dtb
> +  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait rw
> diff --git a/board/pine64/pinecube/genimage.cfg b/board/pine64/pinecube/genimage.cfg
> new file mode 100644
> index 0000000000..398d45e2f7
> --- /dev/null
> +++ b/board/pine64/pinecube/genimage.cfg
> @@ -0,0 +1,34 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +			"sun8i-s3-pinecube.dtb",
> +			"extlinux"
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
> diff --git a/board/pine64/pinecube/post-build.sh b/board/pine64/pinecube/post-build.sh
> new file mode 100755
> index 0000000000..ba29375c05
> --- /dev/null
> +++ b/board/pine64/pinecube/post-build.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +
> +install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
> diff --git a/board/pine64/pinecube/readme.txt b/board/pine64/pinecube/readme.txt
> new file mode 100644
> index 0000000000..4cf6df2110
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
> +
> +How to build it
> +===============
> +
> +  $ make pine64_pinecube_defconfig
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
> diff --git a/configs/pine64_pinecube_defconfig b/configs/pine64_pinecube_defconfig
> new file mode 100644
> index 0000000000..8f60115f8f
> --- /dev/null
> +++ b/configs/pine64_pinecube_defconfig
> @@ -0,0 +1,45 @@
> +# Target options
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_VFPV4=y

About this ^^^ there is an ongoing discussion if use mixed VFVP4+NEON or
not:
https://lists.buildroot.org/pipermail/buildroot/2022-August/649770.html

For the moment it's ok to me keeping this way and when we've all
clarified FPU strategy on 32-bit ARM cortex then we can modify and
you could test it or even provide the patch for this.

Have you re-tested the board with such modification?

> +
> +# Toolchain options
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="pinecube"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Pine64 Pinecube"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/pinecube/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pinecube/genimage.cfg"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.61"
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
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pinecube"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +
> +# Required host utilities for building an SDCard image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Overall looks good to me, it builds correctly with buildroot/docker-run
so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Expect this patch to be part of 2022.11 since 2022.08-rc1 has been
released on 12th August and from -rc1 to 2022.08 only bug fixes and
security patches are allowed.

Thanks for the contribution!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
