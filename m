Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E26C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 20:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6365400BB;
	Mon,  2 Jan 2023 20:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6365400BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPghqFiMmnVZ; Mon,  2 Jan 2023 20:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD54E40153;
	Mon,  2 Jan 2023 20:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD54E40153
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 669AB1BF33B
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 20:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4250C60A84
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 20:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4250C60A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgCTzvnXwNmC for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 20:24:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 121F060A66
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 121F060A66
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 20:23:59 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CRLgpPJQZ8R19CRLhpLuvC; Mon, 02 Jan 2023 21:23:57 +0100
Message-ID: <e149509d-ebad-cb8e-93ed-ce6f7f344036@benettiengineering.com>
Date: Mon, 2 Jan 2023 21:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
References: <20230102181603.3337480-1-Mr.Bossman075@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230102181603.3337480-1-Mr.Bossman075@gmail.com>
X-CMAE-Envelope: MS4xfHQtgnCpwTlXwxRE7it3LSfGFy7ICttflGbKyQ6PfeGxIv2C8K4E7SP6UIG+/lfBYRd5/TzNLibT0WLfjk9o8ri0YKaEkQ3cuK+B/+zzqPdOswUWj+u+
 fwYNYlQTDAFoTtQYPwz598ye7hXIPPAOkHgkoqOxofXNjW5ZbYrdo7khorRQ98/98rUGEwZlYqX0otp9pZA3oK6gqsfWGZcnMUVLBfL+/hA+qowStKYpnFdi
 J7uLqQQ5GQgfrp21X/uB/0tqK0O/Ca4gmCPslepUmFwXRAaB6zFu9Zax1BawWcXUmqQQxiky8TLab6IWL86xCoEtBQa4MAACDoU1JNU4iIic5cHiBCV2Ujd/
 c+S2nQy6
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672691037; bh=WwAOtc3WTCjTo8rrk7eGkXUlBi/ecW4qpjJURYh9GDs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Ec5zlVI8rJYjPbjzAqlTfDXuOTAp7OxfFWEU4acGdh5lMonCyD1tJfJwikr/bPVsc
 B/JQ6DQPcG/jVJ+YPKVgMllR6G82D4YAdKFxQk5ysGv1I7vqgyH8BQ2kfQSGATfabB
 cXt8QV6hj+Sjr/a/ednDSfE1pqS7wCvtvMoMuztTE31lf5em6Gptq9pjpDkqAhv+E3
 XMdqiDLMbqYQKNc+yrykV+FVN3E4ovb+TGJuWmave3AnQzgKS0Hek6jSg48nIKfa55
 QiFhK/tzcN9BFWfs4nHw7aSEFDAhGoYQCknFqzbGqNHjxEwe5bV6p6OC+4oEvUkLBz
 A6qNyDMDF00Qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Ec5zlVI8
Subject: Re: [Buildroot] [PATCH v6] configs/imxrt1050-evk: New defconfig
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
Cc: festevam@gmail.com, maeva.manuel@oss.nxp.com, stephane.viau@oss.nxp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse,

On 02/01/23 19:16, Jesse Taube wrote:
> Add defconfig for imxrt1050-evk is a development board from NXP.
> 
> Giulio and I worked on Linux and U-boot for this board. And now I'm
> adding support for the new board in Buildroot.
> 
> The i.MXRTxxxx family spreads from i.MXRT1020 to i.MXRT1170 with the
> first one supporting 1 USB OTG & 100M ethernet with a cortex-M7@500Mhz
> up to the latter with i.MXRT1170 with cortex-M7@1Ghz and
> cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU, 2x 1Gb and
> 1x 100Mb ENET. The i.MXRT family is NXP's answer to STM32F7xx, as it
> uses only simple SDRAM, it gives the chance of a 4 or less layer PCBs.
> Seeing that these chips are comparable to the STM32F7xxs which have
> buildroot ported to them it seems reasonable to add support for them.
> 
> https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   DEVELOPERS                                  |  6 +++
>   board/freescale/imxrt1050evk/genimage.cfg   | 40 ++++++++++++++++++
>   board/freescale/imxrt1050evk/readme.txt     | 30 ++++++++++++++
>   board/freescale/imxrt1050evk/uboot.fragment |  2 +
>   configs/imxrt1050-evk_defconfig             | 45 +++++++++++++++++++++
>   5 files changed, 123 insertions(+)
>   create mode 100644 board/freescale/imxrt1050evk/genimage.cfg
>   create mode 100644 board/freescale/imxrt1050evk/readme.txt
>   create mode 100644 board/freescale/imxrt1050evk/uboot.fragment
>   create mode 100644 configs/imxrt1050-evk_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 59121c6a54..ee33c65fd4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1132,9 +1132,11 @@ F:	package/webp/
>   F:	package/xapian/
>   
>   N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
> +F:	board/freescale/imxrt1050evk/*
>   F:	board/olimex/a*
>   F:	configs/amarula_vyasa_rk3288_defconfig
>   F:	configs/asus_tinker_rk3288_defconfig
> +F:	configs/imxrt1050-evk_defconfig
>   F:	configs/olimex_a*
>   F:	package/at/
>   F:	package/binutils/
> @@ -1477,6 +1479,10 @@ F:	package/wmctrl/
>   F:	package/x11r7/xdriver_xf86-video-imx/
>   F:	package/x11r7/xdriver_xf86-video-imx-viv/
>   
> +N:	Jesse Taube <Mr.Bossman075@gmail.com>
> +F:	board/freescale/imxrt1050evk/*
> +F:	configs/imxrt1050-evk_defconfig
> +
>   N:	Jesse Van Gavere <jesseevg@gmail.com>
>   F:	package/qt6/qt6serialport/
>   
> diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
> new file mode 100644
> index 0000000000..daa51bdbe0
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/genimage.cfg
> @@ -0,0 +1,40 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"uImage",
> +			"imxrt1050-evk.dtb",
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
> +	partition SPL {
> +		in-partition-table = "no"
> +		image = "SPL"
> +		offset = 1K
> +		size = 127K
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot.img"
> +		offset = 128K
> +		size = 512K
> +	}
> +
> +	partition boot {
> +		partition-type = 0xc
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +	}
> +}
> diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
> new file mode 100644
> index 0000000000..1fc4edd88b
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/readme.txt
> @@ -0,0 +1,30 @@
> +NXP i.MXRT1050 EVK board
> +------------------------
> +
> +i.MX RT1050 are NXP's crossover MCUs. They combine the high performance and high
> +level of integration of an applications processors with the ease-of-use and
> +real-time functionality of a microcontroller. The i.MX RT1050 MCU runs on the Arm
> +Cortex-M7 core at 600 MHz.
> +https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
> +
> +To build a minimal support for this board:
> +
> +$ make imxrt1050-evk_defconfig
> +$ make
> +
> +Buildroot prepares a bootable "sdcard.img" image in the output/images/
> +directory, ready to be flashed into the SD card:
> +
> +$ dd if=output/images/sdcard.img of=/dev/sdX
> +Where 'sdX' is the device node of the uSD.
> +
> +Jumper settings:
> +
> +   SW7: 1 0 1 0
> +
> +Where 0 means bottom position and 1 means top position (from the
> +switch label numbers reference).
> +
> +Connect the USB cable between the EVK and the PC for the console.
> +
> +Insert the micro SD card in the board, power it up and U-Boot messages should come up.
> diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
> new file mode 100644
> index 0000000000..1c5bb6af35
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/uboot.fragment
> @@ -0,0 +1,2 @@
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 uImage;bootm 0x80000000 - 0x80800000"
> diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
> new file mode 100644
> index 0000000000..e1b8f2013b
> --- /dev/null
> +++ b/configs/imxrt1050-evk_defconfig
> @@ -0,0 +1,45 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_m7=y
> +
> +# Image
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
> +
> +# Toolchain
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
> +BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
> +BR2_LINUX_KERNEL_UIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
> +
> +# NOMMU Busybox
> +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +
> +# Required tools to create the SD card image
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MKPASSWD=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_MTOOLS=y

I've retested with this patch and everything works fine.

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
