Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932D5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 06:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E62C64010E;
	Sat, 15 Jan 2022 06:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wr71ywBLRyfH; Sat, 15 Jan 2022 06:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C510F40529;
	Sat, 15 Jan 2022 06:57:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71FBE1BF48C
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 06:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 602B04024D
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 06:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbDf0w42KIGm for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 06:56:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E4BF40248
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 06:56:59 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id x11so11695195lfa.2
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 22:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lt3GQRoEujPEeLBooJjDHI1MAMSIRxoIGxTB76lXtww=;
 b=Z7NGMtcZvCzGCHrBzQYZuYt9vGuZld7AS/jMQ81nrrFglXJyZHYrDA1dvaECcUfYoy
 TE81Oj+uxtiln3JsPEI7WxJ/K9rR4qAsqr3UUC0Ag6CC1iYRAbR3up/yl+zFLCNt4dAG
 R3RzHjo04KxJ0+Z8lcRSLRfycG7xes1hG9/bWOoCtEC6AyQvBKeg1XxfGJyC1Zgx7gEo
 RzW0wLXCJkQeWxACGoM5B/6cx9IZPTRGFPCbO4vhmcZeGKxDKTNe3asZVgslrKkgr2RD
 hjAVVsmjKgnIFKCEEBdJoK0U+nQ21Kz1tBlT34IDVKBlck21V4dvq4qgqzJXcZgegJAK
 Xpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lt3GQRoEujPEeLBooJjDHI1MAMSIRxoIGxTB76lXtww=;
 b=vgkjnyutXfk4hOn5tBnGJqXCYRczYNj0E/6dtvApYTjgrABiFhdREoLixGroIS5Z4X
 4twVxTsBUaenAIyzz3lLTUHbsM5lMSu+fMOhCndIj7WBave1cTFxuT65nC/BvR79eY88
 bSKS+2NDpeaJfW46wIbWHYQ3U9ips9B4sU8uKcUFf582yMHby67tJ5L5b3Un09z+OFPx
 k9vZK03XCGmao3JvMdy5AQQR6SIhGPGc+O5fp+CplKMCqaiPAEMu+T67U5bpsYB8Pa/5
 UassLSv23pJSNWaf2JSBzsmzmWI0xQFG2/C5+siQh3hEz/ZtEC8MMy7RP32/F/g5KZzl
 X5Zg==
X-Gm-Message-State: AOAM533sItode04P6CSmmOzxVmBUc4eUK6x5D0FtlmIbIg7Tj9aLfV6z
 XQ0N7sjX2dx7PT0tsPlplYC6P4PvVTDat42WOz4=
X-Google-Smtp-Source: ABdhPJyT/D2KMgUnYeYADfkX/yAevIiPL+HZBt+iaceQ22dujAT89aQ6lCGIXj1mhPcLP6Wq0clXFU04vUeDX/w+1V4=
X-Received: by 2002:a05:651c:1066:: with SMTP id
 y6mr8338400ljm.276.1642229817201; 
 Fri, 14 Jan 2022 22:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20220114024555.319448-1-festevam@gmail.com>
In-Reply-To: <20220114024555.319448-1-festevam@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 15 Jan 2022 07:56:45 +0100
Message-ID: <CAEyMn7bX0YgDmvmmewcrhy0k+O53_1fdbP4KkCQm0ffKfyC2qA@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] configs/imx8mmevk: new defconfig
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
Cc: frieder.schrempf@kontron.de, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabio,

Am Fr., 14. Jan. 2022 um 03:46 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
>
> Add support for imx8mmevk_defconfig that allows booting kernel, U-Boot and
> TFA from the upstream repositories.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Also use TF-A and U-Boot upstream versions.
>
>  DEVELOPERS                                    |  1 +
>  board/freescale/imx8mmevk/genimage.cfg        | 16 ++++++++
>  board/freescale/imx8mmevk/readme.txt          |  6 +++
>  .../boot/extlinux/extlinux.conf               |  4 ++
>  configs/imx8mmevk_defconfig                   | 39 +++++++++++++++++++
>  5 files changed, 66 insertions(+)
>  create mode 100644 board/freescale/imx8mmevk/genimage.cfg
>  create mode 100644 board/freescale/imx8mmevk/rootfs_overlay/boot/extlinux/extlinux.conf
>  create mode 100644 configs/imx8mmevk_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 12777e8d61..e19072a14e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -839,6 +839,7 @@ F:  configs/imx6ullevk_defconfig
>  F:     configs/imx6ulpico_defconfig
>  F:     configs/imx7d-sdb_defconfig
>  F:     configs/imx7dpico_defconfig
> +F:     configs/imx8mmevk_defconfig
>  F:     configs/imx8mqevk_defconfig
>  F:     configs/mx25pdk_defconfig
>  F:     configs/mx51evk_defconfig
> diff --git a/board/freescale/imx8mmevk/genimage.cfg b/board/freescale/imx8mmevk/genimage.cfg
> new file mode 100644
> index 0000000000..3a83aa1f03
> --- /dev/null
> +++ b/board/freescale/imx8mmevk/genimage.cfg
> @@ -0,0 +1,16 @@
> +image sdcard.img {
> +       hdimage {
> +       }
> +
> +       partition imx-boot {
> +               in-partition-table = "no"
> +               image = "flash.bin"
> +               offset = 33k

Giulio pointed out to me that the units should be described with
capital letters.

> +       }
> +
> +       partition rootfs {
> +               partition-type = 0x83
> +               image = "rootfs.ext4"
> +               offset = 8M
> +       }
> +}
> diff --git a/board/freescale/imx8mmevk/readme.txt b/board/freescale/imx8mmevk/readme.txt
> index 7b69405d30..a8e80a48f9 100644
> --- a/board/freescale/imx8mmevk/readme.txt
> +++ b/board/freescale/imx8mmevk/readme.txt
> @@ -10,8 +10,14 @@ Build
>
>  First, configure Buildroot for the i.MX8MM EVK board:
>
> +If you want to use the NXP kernel:
> +
>    make freescale_imx8mmevk_defconfig
>
> +Or if you want to use a mainline kernel:
> +
> +  make imx8mmevk_defconfig
> +
>  Build all components:
>
>    make
> diff --git a/board/freescale/imx8mmevk/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/imx8mmevk/rootfs_overlay/boot/extlinux/extlinux.conf
> new file mode 100644
> index 0000000000..0ba2e4cbfc
> --- /dev/null
> +++ b/board/freescale/imx8mmevk/rootfs_overlay/boot/extlinux/extlinux.conf
> @@ -0,0 +1,4 @@
> +Label imx8mm-evk-buildroot
> +  kernel /boot/Image
> +  devicetree /boot/imx8mm-evk.dtb
> +  append root=/dev/mmcblk1p1 rootwait rw

I my respin I used:

append root=PARTUUID=%PARTUUID% rootwait rw

The UUID is created in a post-build.sh script and set it in
extlinux.conf and genimage.cfg

With that the image would not limited to be located on the SD card.


> diff --git a/configs/imx8mmevk_defconfig b/configs/imx8mmevk_defconfig
> new file mode 100644
> index 0000000000..170b8d273b
> --- /dev/null
> +++ b/configs/imx8mmevk_defconfig
> @@ -0,0 +1,39 @@
> +BR2_aarch64=y
> +BR2_ARM_FPU_VFPV3=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> +BR2_ROOTFS_OVERLAY="board/freescale/imx8mmevk/rootfs_overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imx8mmevk/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.14"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
> +BR2_PACKAGE_FIRMWARE_IMX=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="240M"

Do you need 240MB here?

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30890000"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> --
> 2.25.1
>

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
