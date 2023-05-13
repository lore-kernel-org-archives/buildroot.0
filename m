Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B30C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 18:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54DC742A6C;
	Sat, 13 May 2023 18:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54DC742A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQFUx4weHQLt; Sat, 13 May 2023 18:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB47D42A4A;
	Sat, 13 May 2023 18:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB47D42A4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08E8F1BF5B5
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 18:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D612941CB7
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 18:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D612941CB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlE4joAbrCcM for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 18:04:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 722E640524
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 722E640524
 for <buildroot@buildroot.org>; Sat, 13 May 2023 18:04:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7DA3719F574;
 Sat, 13 May 2023 20:04:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 20:04:34 +0200
Date: Sat, 13 May 2023 20:04:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230513180434.GY2582048@scaer>
References: <20230423170820.1395767-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230423170820.1395767-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684001077;
 bh=bgBWvzQrgFmNwu4zfuKLlCxxtl5kAfoLQoexvawohYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VjS3N4A15ZfCXPpzga22cJVdo2eKt5xvKjwBtktbbyiK4R8XhUgGDEzrNSr1ocsR0
 l1EeRgf+Sfeevn62kaNGBECQJFzWCRAp2visu9Q+590X4FtldGrohSrzNpnG8CfNih
 yYEcKBG4G8D6dVyCwcwTFLtUSPxbpsUzvUCkCL2I4WBeMdxE9/QJtUDtf/srUwUu/L
 Jxtq5pXmosPGHYdC22SYLwcpzM/r60QyYHHUDACuIt2lAdOlvQMXqKlWdMOGvVlcIO
 4a2h+TDqf1t5Acwg4yvhafYiN6g8D/ZtO84iQmcQgfPCkHd83CNI7lsUSu7+K4Q3Iy
 gF78mMtUhl/dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VjS3N4A1
Subject: Re: [Buildroot] [PATCH v2 1/1]
 configs/stm32f769_disco_sd_defconfig: new defconfig
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-04-23 19:08 +0200, Dario Binacchi spake thusly:
> Board support package includes the following components:
> - mainline Linux kernel 5.15.108
> - mainline U-Boot 2023.04
> - default packages from buildroot
> 
> Note: There is a problem in u-boot display management. It should display
> the ST microelectronics logo but "noise" is displayed (like when running
> the command dd if=/dev/urandom of=/dev/fb0 in Linux). I also tried to
> change version (even the first version in which this feature was
> introduced), but without success. Despite this I decided not to disable
> the video management configuration to remind us that it needs to be
> fixed :).
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Link: https://www.st.com/en/evaluation-tools/32f769idiscovery.html
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Changes in v2:
> - Replace BR2_cortex_m4 with BR2_cortex_m7
> - Use Linux kernel version 5.15.108
> 
>  DEVELOPERS                                    |  2 ++
>  .../stm32f769-disco/extlinux.conf             |  4 +++
>  .../stm32f769-disco/flash_sd.sh               | 18 +++++++++++
>  .../stm32f769-disco/genimage.cfg              | 27 ++++++++++++++++
>  .../stm32f769-disco/linux-sd.fragment         |  1 +
>  .../stm32f769-disco/post-build.sh             |  7 ++++
>  .../stm32f769-disco/readme.txt                | 32 +++++++++++++++++++
>  configs/stm32f769_disco_sd_defconfig          | 30 +++++++++++++++++
>  8 files changed, 121 insertions(+)
>  create mode 100644 board/stmicroelectronics/stm32f769-disco/extlinux.conf
>  create mode 100755 board/stmicroelectronics/stm32f769-disco/flash_sd.sh
>  create mode 100644 board/stmicroelectronics/stm32f769-disco/genimage.cfg
>  create mode 100644 board/stmicroelectronics/stm32f769-disco/linux-sd.fragment
>  create mode 100755 board/stmicroelectronics/stm32f769-disco/post-build.sh
>  create mode 100644 board/stmicroelectronics/stm32f769-disco/readme.txt
>  create mode 100644 configs/stm32f769_disco_sd_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d9e95a3d0531..438d4738b307 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -702,8 +702,10 @@ F:	package/xinetd/
>  
>  N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
>  F:	board/bsh/
> +F:	board/stmicroelectronics/stm32f769-disco/
>  F:	configs/imx8mn_bsh_smm_s2_defconfig
>  F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
> +F:	configs/stm32f769_disco_sd_defconfig
>  F:	package/sscep/
>  F:	package/uuu/
>  
> diff --git a/board/stmicroelectronics/stm32f769-disco/extlinux.conf b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
> new file mode 100644
> index 000000000000..48483a01fc4e
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
> @@ -0,0 +1,4 @@
> +label stm32f769-disco-buildroot
> +  kernel /zImage
> +  devicetree /stm32f769-disco.dtb
> +  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
> diff --git a/board/stmicroelectronics/stm32f769-disco/flash_sd.sh b/board/stmicroelectronics/stm32f769-disco/flash_sd.sh
> new file mode 100755
> index 000000000000..0ff3ae7dbfb3
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f769-disco/flash_sd.sh
> @@ -0,0 +1,18 @@
> +#!/bin/bash
> +
> +OUTPUT_DIR=$1
> +
> +if ! test -d "${OUTPUT_DIR}" ; then
> +    echo "ERROR: no output directory specified."
> +    echo "Usage: $0 OUTPUT_DIR"
> +    exit 1
> +fi
> +
> +"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32f769i-disco.cfg \
> +  -c "init" \
> +  -c "reset init" \
> +  -c "flash probe 0" \
> +  -c "flash info 0" \
> +  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
> +  -c "reset run" \
> +  -c "shutdown"
> diff --git a/board/stmicroelectronics/stm32f769-disco/genimage.cfg b/board/stmicroelectronics/stm32f769-disco/genimage.cfg
> new file mode 100644
> index 000000000000..41f9da512489
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f769-disco/genimage.cfg
> @@ -0,0 +1,27 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +			"stm32f769-disco.dtb",
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
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext2"
> +		size = 32M
> +	}
> +}
> diff --git a/board/stmicroelectronics/stm32f769-disco/linux-sd.fragment b/board/stmicroelectronics/stm32f769-disco/linux-sd.fragment
> new file mode 100644
> index 000000000000..846229d0d468
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f769-disco/linux-sd.fragment
> @@ -0,0 +1 @@
> +# CONFIG_XIP_KERNEL is not set
> diff --git a/board/stmicroelectronics/stm32f769-disco/post-build.sh b/board/stmicroelectronics/stm32f769-disco/post-build.sh
> new file mode 100755
> index 000000000000..c8cca3de8c9b
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f769-disco/post-build.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +BOARD_DIR="$(dirname "$0")"
> +
> +# Kernel is built without devpts support
> +sed -i '/^devpts/d' "${TARGET_DIR}"/etc/fstab
> +
> +install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
> diff --git a/board/stmicroelectronics/stm32f769-disco/readme.txt b/board/stmicroelectronics/stm32f769-disco/readme.txt
> new file mode 100644
> index 000000000000..8f4f79a86138
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f769-disco/readme.txt
> @@ -0,0 +1,32 @@
> +STM32F769 Discovery
> +===================
> +
> +This tutorial describes how to use the predefined Buildroot
> +configuration for the STM32F769 Discovery evaluation platform.
> +
> +Building
> +--------
> +
> +  make stm32f769_disco_sd_defconfig
> +  make
> +
> +Flashing
> +--------
> +
> +  ./board/stmicroelectronics/stm32f769-disco/flash_sd.sh output/
> +
> +It will flash the U-boot bootloader.
> +
> +Creating SD card
> +----------------
> +
> +Buildroot prepares an"sdcard.img" image in the output/images/ directory,
> +ready to be dumped on a SD card. Launch the following command as root:
> +
> +  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
> +
> +*** WARNING! This will destroy all the card content. Use with care! ***
> +
> +For details about the medium image layout and its content, see the
> +definition in board/stmicroelectronics/stm32f769-disco/genimage.cfg.
> +
> diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
> new file mode 100644
> index 000000000000..2ae27fb2d852
> --- /dev/null
> +++ b/configs/stm32f769_disco_sd_defconfig
> @@ -0,0 +1,30 @@
> +BR2_arm=y
> +BR2_cortex_m7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.108"
> +BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f769-disco"
> +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_OPENOCD=y
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
