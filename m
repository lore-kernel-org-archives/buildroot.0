Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D520CD72A16
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 20:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF68846D1;
	Fri, 29 Nov 2024 20:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyWFXdczvIWz; Fri, 29 Nov 2024 20:57:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA19846DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA19846DF;
	Fri, 29 Nov 2024 20:57:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 178FD712
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 20:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 130846090C
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 20:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BiV3-ts7oofi for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 20:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA0B9608EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA0B9608EF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA0B9608EF
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 20:57:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B43A819F593;
 Fri, 29 Nov 2024 21:57:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48768])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 29 Nov 2024 21:57:30 +0100
MIME-Version: 1.0
Date: Fri, 29 Nov 2024 21:57:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
In-Reply-To: <20241129095304.950313-1-neal.frager@amd.com>
References: <20241129095304.950313-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <cff9d6616dec33f287e9ae82308103bb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732913858;
 bh=MLY4Pr3aXJd/X7oS/Jm+tR0s+0jJ6eLPF9qB8m6LC7s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hHAtMj8omqwkf6kTrgtfo41pLoIA5lKfVWfyJ4gP4VSV0OpGvssdCzSvngbi1oICs
 UvclcQAlI05HmdXSIThWNpNsTHzzX4bIwTGxNsl4z4RzS5BQ5aQEJcKfb9ci/x1eRl
 +od8bb8nVsg0IN1LEMqbws9fZqsWK5kchxIQ+Thc7uW/wpSQoiphf0/5I4C47k/LH/
 wtFfZc08fjxSML+I6zqRj5Uhb0qUxabQJQ+ga1XQF0OyXS2Hfj/GBLBCFgUYihXrRd
 5bBdP4ng4TVPkFARrR9T6BLnIe6CM/ETGIIh5PNabcVO7AnIchJ6iWGtigqLfrmgbf
 gEnipVIxl+H+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hHAtMj8o
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

On 29/11/2024 10:53, Neal Frager via buildroot wrote:
> This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.2 
> which
> includes the following updates:
> 
> - ATF v2.10
> - Linux v6.6.40
> - U-Boot v2024.01
> 
> The board specific u-boot patch for the kd240 is no longer necessary, 
> as it is
> included with the xilinx-v2024.2 release tag.
> 
> The following patch has thus been removed:
> board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to next, thanks.

> ---
>  ...arm64-zynqmp-Enable-usb3-for-k24-som.patch | 81 -------------------
>  configs/zynqmp_kria_kd240_defconfig           |  8 +-
>  2 files changed, 4 insertions(+), 85 deletions(-)
>  delete mode 100644 
> board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
> 
> diff --git 
> a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch 
> b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
> deleted file mode 100644
> index 0cc10d344e..0000000000
> --- 
> a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From 73c99c29508d7adfe11b6a81f13cf00efab5f9de Mon Sep 17 00:00:00 2001
> -From: Neal Frager <neal.frager@amd.com>
> -Date: Tue, 4 Jun 2024 09:15:23 +0100
> -Subject: [PATCH] arm64: zynqmp: Enable usb3 for k24 som
> -
> -This patch corrects the mio and pll configuration registers for using 
> usb3
> -on the kd240 starter kit.  Without this patch, the usb3 to sd card 
> bridge does
> -not initialize correctly and u-boot is unable to find the OS located 
> on the
> -kd240 starter kit sd card.
> -
> -In addition, this patch correctly configures mio76 and mio77 as gpio 
> pins
> -which are used as reset gpio pins on the kd240 starter kit.
> -
> -Signed-off-by: Neal Frager <neal.frager@amd.com>
> -Upstream: 
> https://patchwork.ozlabs.org/project/uboot/patch/20240604083854.2033917-1-neal.frager@amd.com/
> ----
> - .../zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c  | 23 
> ++++++++-----------
> - 1 file changed, 10 insertions(+), 13 deletions(-)
> -
> -diff --git a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c 
> b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
> -index 166e61431b..274203ffaa 100644
> ---- a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
> -+++ b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
> -@@ -528,8 +528,8 @@ static unsigned long psu_mio_init_data(void)
> - 	psu_mask_write(0xFF180124, 0x000000FEU, 0x00000002U);
> - 	psu_mask_write(0xFF180128, 0x000000FEU, 0x00000002U);
> - 	psu_mask_write(0xFF18012C, 0x000000FEU, 0x00000002U);
> --	psu_mask_write(0xFF180130, 0x000000FEU, 0x000000C0U);
> --	psu_mask_write(0xFF180134, 0x000000FEU, 0x000000C0U);
> -+	psu_mask_write(0xFF180130, 0x000000FEU, 0x00000000U);
> -+	psu_mask_write(0xFF180134, 0x000000FEU, 0x00000000U);
> - 	psu_mask_write(0xFF180204, 0xFFFFFFFFU, 0x50000000U);
> - 	psu_mask_write(0xFF180208, 0xFFFFFFFFU, 0x00B02020U);
> - 	psu_mask_write(0xFF18020C, 0x00003FFFU, 0x00000FC0U);
> -@@ -569,21 +569,16 @@ static unsigned long 
> psu_peripherals_init_data(void)
> - 	psu_mask_write(0xFD1A0100, 0x0001807CU, 0x00000000U);
> - 	psu_mask_write(0xFF5E0238, 0x001A0000U, 0x00000000U);
> - 	psu_mask_write(0xFF5E023C, 0x0093C018U, 0x00000000U);
> --	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000000U);
> -+	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000000U);
> - 	psu_mask_write(0xFF5E0238, 0x00000001U, 0x00000000U);
> - 	psu_mask_write(0xFF180390, 0x00000004U, 0x00000004U);
> - 	psu_mask_write(0xFF5E023C, 0x00000400U, 0x00000000U);
> --	psu_mask_write(0xFF5E0238, 0x00000040U, 0x00000000U);
> --	psu_mask_write(0xFF180310, 0x00008000U, 0x00000000U);
> --	psu_mask_write(0xFF180320, 0x33840000U, 0x02840000U);
> --	psu_mask_write(0xFF18031C, 0x7FFE0000U, 0x64500000U);
> --	psu_mask_write(0xFF180358, 0x00000008U, 0x00000008U);
> --	psu_mask_write(0xFF180324, 0x03C00000U, 0x00000000U);
> -+	psu_mask_write(0xFF5E0238, 0x00000080U, 0x00000000U);
> - 	psu_mask_write(0xFF5E0238, 0x00000400U, 0x00000000U);
> - 	psu_mask_write(0xFF5E0238, 0x00008000U, 0x00000000U);
> - 	psu_mask_write(0xFF5E0238, 0x00000010U, 0x00000000U);
> - 	psu_mask_write(0xFF5E0238, 0x00007800U, 0x00000000U);
> --	psu_mask_write(0xFF5E0238, 0x00000004U, 0x00000000U);
> -+	psu_mask_write(0xFF5E0238, 0x00000006U, 0x00000000U);
> - 	psu_mask_write(0xFF5E0238, 0x00040000U, 0x00000000U);
> - 	psu_mask_write(0xFF4B0024, 0x000000FFU, 0x000000FFU);
> - 	psu_mask_write(0xFFCA5000, 0x00001FFFU, 0x00000000U);
> -@@ -591,13 +586,15 @@ static unsigned long 
> psu_peripherals_init_data(void)
> - 	psu_mask_write(0xFFA60040, 0x80000000U, 0x80000000U);
> - 	psu_mask_write(0xFF260020, 0xFFFFFFFFU, 0x05F5DD18U);
> - 	psu_mask_write(0xFF260000, 0x00000001U, 0x00000001U);
> --	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
> -+	psu_mask_write(0xFF0A0284, 0x03FFFFFFU, 0x01000000U);
> -+	psu_mask_write(0xFF0A0288, 0x03FFFFFFU, 0x01000000U);
> -+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
> -
> - 	mask_delay(1);
> --	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000002U);
> -+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0000U);
> -
> - 	mask_delay(5);
> --	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
> -+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
> -
> - 	return 1;
> - }
> ---
> -2.25.1
> -
> diff --git a/configs/zynqmp_kria_kd240_defconfig 
> b/configs/zynqmp_kria_kd240_defconfig
> index 8cbc172a41..d47c3e27e5 100644
> --- a/configs/zynqmp_kria_kd240_defconfig
> +++ b/configs/zynqmp_kria_kd240_defconfig
> @@ -1,13 +1,13 @@
>  BR2_aarch64=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> -BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/kd240/patches 
> board/xilinx/patches"
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh 
> board/zynqmp/kria/kd240/kd240.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call 
> github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call 
> github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
> @@ -17,14 +17,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call 
> github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call 
> github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
>  
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call 
> github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call 
> github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> --
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
