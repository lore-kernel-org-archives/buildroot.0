Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBAC7618E
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 14:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC9860F2D;
	Sat, 22 Apr 2023 14:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC9860F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OhpFtMyGbjKR; Sat, 22 Apr 2023 14:57:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D9A260E79;
	Sat, 22 Apr 2023 14:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D9A260E79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C29491BF2F5
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 14:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96E4B41898
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 14:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E4B41898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEx2mXvK67fs for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 14:57:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 095E441888
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 095E441888
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 14:57:01 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id qEfap1A8OYUwjqEfap0Ajs; Sat, 22 Apr 2023 16:56:59 +0200
Message-ID: <c26cc589-8662-30f2-f4c6-5fe698b55206@benettiengineering.com>
Date: Sat, 22 Apr 2023 16:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, it
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20230422140018.616018-1-dario.binacchi@amarulasolutions.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230422140018.616018-1-dario.binacchi@amarulasolutions.com>
X-CMAE-Envelope: MS4xfIqQ8kc2m9ac74+/9/xTjuEgNjYPlsNJ5DfYMHtUpD3fRM19XiRLrAVBDB9tnDxEcZrSmnRwFfjQdZdUPQXO3EdE1YAEpTJQq2vXiWFZq+drP3ibXHKD
 obOfx6Tk/uhbxa2B69dArPZOk/PtHso2dtjW9hX5yhoa8sRyMBFuJexjUsrB12mt08llYQungycf2X/29IhsJvMG+MrkNI68m/ZEF4ebW++LWPh8LjFqWpp/
 kX3SmUKWMCu/GTN6WnaMsYnxaofOWOl0ykJKoqiCvJU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1682175419; bh=wI7oMhIb/2+OIy2rJXa/PipTj9YIDUVC1V+HfMbLpCg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=HR1/lY9FurD92dvmrXMqBeEZ3/7jv5KbSL6V2SWdb6GyUDY4ZjCQoYTNkgxJ8UMkT
 XGunH9NrUSIHbLdXZzFGLbrOWJGK1vfnhy+1XMlNhiLTlGfcG3cpgu9naLxQrKW8wC
 0a1Y1yaxs6XY7uBX69OHNeQ76rDETl1SxD7VNe7yzyuZ1PSpcNOTUGdglkWAidwYLr
 V+w4MqKxisMucpO4xb0Bm6oGZMy1wvJG7cgPfuhjLqXDqgEiWTMi9y7d6mIT3XrGK7
 08CpMomPcv5pvBeevBmrPb+PEW0V7g432rnYJnkmbWoZ3yuJ0UHubhBX541nhyidfe
 v+ECLngpFRtRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=HR1/lY9F
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd_defconfig:
 new defconfig
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

Hi Dario,

On 22/04/23 16:00, Dario Binacchi wrote:
> Board support package includes the following components:
> - mainline Linux kernel 5.14.21
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
> Link: https://www.st.com/en/evaluation-tools/32f769idiscovery.html
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   DEVELOPERS                                    |  2 ++
>   .../stm32f769-disco/extlinux.conf             |  4 +++
>   .../stm32f769-disco/flash_sd.sh               | 18 +++++++++++
>   .../stm32f769-disco/genimage.cfg              | 27 ++++++++++++++++
>   .../stm32f769-disco/linux-sd.fragment         |  1 +
>   .../stm32f769-disco/post-build.sh             |  7 ++++
>   .../stm32f769-disco/readme.txt                | 32 +++++++++++++++++++
>   configs/stm32f769_disco_sd_defconfig          | 30 +++++++++++++++++
>   8 files changed, 121 insertions(+)
>   create mode 100644 board/stmicroelectronics/stm32f769-disco/extlinux.conf
>   create mode 100755 board/stmicroelectronics/stm32f769-disco/flash_sd.sh
>   create mode 100644 board/stmicroelectronics/stm32f769-disco/genimage.cfg
>   create mode 100644 board/stmicroelectronics/stm32f769-disco/linux-sd.fragment
>   create mode 100755 board/stmicroelectronics/stm32f769-disco/post-build.sh
>   create mode 100644 board/stmicroelectronics/stm32f769-disco/readme.txt
>   create mode 100644 configs/stm32f769_disco_sd_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5cd882b5791c..88ed40412ae8 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -702,8 +702,10 @@ F:	package/xinetd/
>   
>   N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   F:	board/bsh/
> +F:	board/stmicroelectronics/stm32f769-disco/
>   F:	configs/imx8mn_bsh_smm_s2_defconfig
>   F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
> +F:	configs/stm32f769_disco_sd_defconfig
>   F:	package/sscep/
>   F:	package/uuu/
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
> index 000000000000..4d43658403ca
> --- /dev/null
> +++ b/configs/stm32f769_disco_sd_defconfig
> @@ -0,0 +1,30 @@
> +BR2_arm=y
> +BR2_cortex_m4=y

Here ^^^ it is a BR2_cortex_m7

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.21"

It would be great if you could use Linux latest stable 5.15.108 that has
patch for MMU-less fix committed[0]. I've found and fixed the bug on
i.MXRT but it should affect every MMU-less system.
Or you could bump Linux to latest version 6.2 that has the patch
committed too.

This could be done also for the stm32f4xx boards you're bumping for
uboot.

[0]: 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.15.y&id=7ae0262748e5d8ff1e42b77bb19bba474733f280

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
