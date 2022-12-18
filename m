Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EDCC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 17:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EEC040863;
	Sun, 18 Dec 2022 17:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EEC040863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pFjpbCUiX_qG; Sun, 18 Dec 2022 17:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCEA240917;
	Sun, 18 Dec 2022 17:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCEA240917
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6DB1BF3A7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 17:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 421A6402E5
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 17:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421A6402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILkRm-dvwv9d for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 17:37:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5425B400D3
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5425B400D3
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 17:37:12 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6xb1pYLe2eKXr6xb2pgHPU; Sun, 18 Dec 2022 18:37:08 +0100
Message-ID: <134278fe-ae90-ae80-ae56-eea2dc5c506e@benettiengineering.com>
Date: Sun, 18 Dec 2022 18:37:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
References: <20221218055003.701405-1-Mr.Bossman075@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221218055003.701405-1-Mr.Bossman075@gmail.com>
X-CMAE-Envelope: MS4xfP/aRTVZrtAvnUeKxoruNoiN0MVfgs/ylzxVcWDOnLgsedxBopbmtmqe/VmL0GpY0EE+vKbMQXdykd0DZQL15VL6qcohClVqVBY7mLG0iGzlz7Edywd3
 eAP64EFvqJovr8+Nd8Un8kn6a9Q958JFsEI8eZv0xr9Ez8FskDimzJm7iGXDvjJi1ko2rSj7oPZQnqPVQYVQLS+K02llZVuTBWoH3pFemcddylTlkMlrp8wo
 EgfJOgAhj2TxUJYq+/zef0nwZAuhz58UNu3qQjqNZorTkNNEF7WG6moCno4aUpLetPwG/xEU9Yu43XrEPFpc83MiAAoPtWwzPt7bbBa0ojliQ7+ct+Yo/hQ/
 mEhfjkxiiWPP960LQcpA31EgCBB6Sg2qBG1Nhcgi8i439P+fw0M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1671385028; bh=8w6eDAFl3IaWQWDdYzv/uQSBMP/znrpO1mzOI4quSko=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=nLS0osz5fV6JhovPAsxQ9hJZvJErJjZraXni5GY8AtDHd9i2H4Mw9BPcKODsE40BE
 IUVYgODbUJ4bHu2w85t44Vraf6hlyf9rilXwPEfOYP2aXpq3gU1FJQw2fsW6lfQfI/
 NWNnIoGqKxuSqPaw1P+Uuo3wi0/+GOAcqWgy95+sncKgih3luGPW9MnI30Zj/rLsqV
 gfcSEN8RX+HoGphaOdLNBBOSlVMS55FN0oTKMAKNoTRRudkIf0vli63nAt2XGSsPlm
 HERyyvZFnGbO4o5kL9DDNI3xyX8SOrur3Wl+jtmkRt0IYlf93Kg5r/4lcSzRP3uWZ+
 TCsB4tUXswzWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nLS0osz5
Subject: Re: [Buildroot] [PATCH v5] configs/imxrt1050-evk: New defconfig
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
Cc: maeva.manuel@oss.nxp.com, James Autry <jautry@tekvox.com>,
 festevam@gmail.com, stephane.viau@oss.nxp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse,

On 18/12/22 06:50, Jesse Taube wrote:
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

Here you've missed the changelog.
Also please set the V4 patch as superseded in Patchwork.

> ---
>   DEVELOPERS                                  |  6 ++++
>   board/freescale/imxrt1050evk/genimage.cfg   | 40 +++++++++++++++++++++
>   board/freescale/imxrt1050evk/readme.txt     | 30 ++++++++++++++++
>   board/freescale/imxrt1050evk/uboot.fragment |  2 ++
>   configs/imxrt1050-evk_defconfig             | 40 +++++++++++++++++++++
>   5 files changed, 118 insertions(+)
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
> index 0000000000..7dc58d1e7f
> --- /dev/null
> +++ b/configs/imxrt1050-evk_defconfig
> @@ -0,0 +1,40 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_m7=y

Here you must specify:
# Toolchain
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y

otherwise the latest Linux Headers will be picked, and once version 6.2
will come out the headers will be unaligned with the Linux version.

> +
> +# Image
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
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

Have you tried to build the imxrt1050-evk_defconfig using
buildroot/utils/docker-run ?

Using that I've found you also need to add:
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_MTOOLS=y

I've retested on the board and it works good except the points above.
So with those 3 options enabled you can add:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I wait for V6.
Remember to set as superseded this V5 patch too once you've sent the V6.

Thank you!
Kind regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
