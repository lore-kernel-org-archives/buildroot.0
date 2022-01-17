Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01BDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 19:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE3604040C;
	Mon, 17 Jan 2022 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TxvPFIssuOlc; Mon, 17 Jan 2022 19:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACEA940323;
	Mon, 17 Jan 2022 19:58:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF5281BF395
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 19:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B50540323
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4gc8zVZZZK_O for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 19:58:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EE5E401B1
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 19:58:53 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9Y9Un0okjc6LX9Y9Unolhi; Mon, 17 Jan 2022 20:58:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642449532; bh=nI9mElS/MzMUZDkiZjqk++uzxBpvmAxwZKAKnEe1myo=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=SbDCIWRRlqwI0oHNe2ekQJk6dnSwwbXXPXsAnH8SsW99Oh3vDwY2XWF1WB4TNlKl6
 0bVI64fFTevmnWISSi1fwN55A2k+al0nVGeuS0JmEf4IXoXzP7m8wGhgfoUohrJdhI
 t3pxbA2oO5Y0RQQ8W1ndmx4y78xc+cKfdxtJ/9oAeT94E5EQMUdnIAryRXANSqvIaH
 3XF03YhlkdAsbZyWOx75cp410P5T371ISDtmx3wpl5DyKy4a2r2h0NdgEwuVliJ9Gp
 QQ/C5TASUlc9sEnKQpO+hx7LfQBIvdVw6qvGj5U9RhD0kWFYtmeCVFIcflzkQ9SIWV
 mbQe90V9JTnVA==
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20220114211525.2697606-1-heiko.thiery@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <752cc85f-d3d6-950b-cb5c-fb39e5020bc3@benettiengineering.com>
Date: Mon, 17 Jan 2022 20:58:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220114211525.2697606-1-heiko.thiery@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNjuasDfkTlp2VXlbD5lahWkbzViqmpo5sOHiQ8IB834dJ9Cf1N/gBEBvZbkZAdoixpiakbbKMA2oSI+HWlcLCokFg5H+Zg6ThITYxapWwmAlsw6IMXB
 9oSKCRx9ULVzg+agbWnmRvpbmBKUzR2si/yWmQd4+EbTEasAFqmiLTiduLKGSr/2X13AdldZ8cowqT4Mn93TaMtJ/+j5uiGorPpULTKbp/mC7yLkkW101wkH
 eLb5uVYfxJoFhIWhKoWKc8/zpapny0RGwPhBboeb+EoG17TOXnCV+Yu3zxu+UrF0a4PDBrbRPfbbmvVJoTEZV2Vxw6E/5kZDW2PS3GTs1LtdUhSWivUllQnX
 zmsXrBTx
Subject: Re: [Buildroot] [PATCH v2] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Heiko,

I've missed one thing below,

On 14/01/22 22:15, Heiko Thiery wrote:

[SNIP]

> diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
> new file mode 100644
> index 0000000000..5b5648cc14
> --- /dev/null
> +++ b/configs/kontron_bl_imx8mm_defconfig
> @@ -0,0 +1,59 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_ARM_FPU_VFPV3=y

i.MX8MM supports VFPv4-D16, so I would substitute this ^^^ with:
BR2_ARM_FPU_VFPV4D16

This is to achieve the maximum performance.

Kind regards!
-- 
Giulio Benetti
Benetti Engineering sas

> +
> +BR2_GLOBAL_PATCH_DIR="board/kontron/bl-imx8mm/patches"
> +
> +# System
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-kontron-n801x-s"
> +BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
> +
> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
> +BR2_PACKAGE_FIRMWARE_IMX=y
> +
> +# Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +
> +# Bootloader
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880000"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
> +BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
> +BR2_TARGET_UBOOT_SPL=y
> +
> +# Required host tools to create the SD/eMMC image
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/bl-imx8mm/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
