Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61947C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1159C60C1D;
	Wed, 22 Jun 2022 20:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1159C60C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_pPZfiJxk4A; Wed, 22 Jun 2022 20:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17C5C60BFD;
	Wed, 22 Jun 2022 20:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17C5C60BFD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F31421BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC64F409E9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC64F409E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwUvQBggDkvT for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:26:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEF2A400DA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEF2A400DA
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:26:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d108:8c48:c119:a22b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8C399B0051E;
 Wed, 22 Jun 2022 22:26:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 22 Jun 2022 22:26:13 +0200
Date: Wed, 22 Jun 2022 22:26:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@xilinx.com>
Message-ID: <20220622202613.GC2608@scaer>
References: <20220622042439.30423-1-neal.frager@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622042439.30423-1-neal.frager@xilinx.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1655929580;
 bh=EBrTZTnLGIwW+SvoEuiD73pDYUfQrVA2LTHDr5eUtxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b8XAQyw78pRqSSjVbLMFD0W+0++rNJqOuSot6GX1gV6ZGo1IRHL6Gae9PM1sKBEpz
 IDseMP6kEzh0PWDhQQsGLNSbKLeCNncRCL3f0a37a0vSvdamU8KmskMwlvP1xKY8W4
 aA//kEjSg8217QOEUWEoTNjt9QIW03Qb9H40KVkrPnyt4JBR2GFhpyJPKkH+ym30Uq
 LS6tEQAOSuWoA2PLRtISys55MKgWkeJscW8YCP1TfTbGm1GLcH8JGrgqB2bSUDUC6s
 Fa2uP8H7P79gEZd0cK20Qn3cpUxkP6KCORe5SSVkZGyUUewVj4AitQhbOBckUmCHdE
 ZvCPDunoBAPEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b8XAQyw7
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix to u-boot.itb generation
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
Cc: michal.simek@amd.com, giulio.benetti@benettiengineering.com,
 wesley@sonifex.co.uk, luca.ceresoli@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2022-06-21 22:24 -0600, Neal Frager spake thusly:
> This patch is a temporary fix for the kv260 u-boot.itb generation
> until a proper fix has been implemented within u-boot.
> 
> The problem is u-boot can only be configured to use the kria k26
> som dts configuration at build time, and the kv260 carrier board
> overlay is missing from the build.  Without this, all of the carrier
> board drivers are missing.
> 
> This patch will be removed from buildroot once u-boot can build a
> correct u-boot.itb for the kria kv260 starter kit including the
> carrier board overlay and corresponding drivers.
> 
> Signed-off-by: Neal Frager <neal.frager@xilinx.com>

Applied to master, after just adding the URL as pointed out by Luca,
thanks.

Regards,
Yann E. MORIN.

> ---
> V1->V2:
>   - improved comments describing the u-boot.itb build issue
> ---
>  board/zynqmp/kria/kv260/kv260.sh    | 12 ++++++++++++
>  configs/zynqmp_kria_kv260_defconfig |  4 ++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>  create mode 100755 board/zynqmp/kria/kv260/kv260.sh
> 
> diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
> new file mode 100755
> index 0000000000..e3467f3068
> --- /dev/null
> +++ b/board/zynqmp/kria/kv260/kv260.sh
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +# This is a temporary work around for generating kv260 u-boot.itb.
> +# The problem is there is no way to currently configure u-boot to apply 
> +# the carrier board dtb overlay during build, so all kv260 carrier board 
> +# drivers are missing.
> +# This will be removed when u-boot can build the kv260 u-boot.itb natively.
> +
> +UBOOT_DIR=$4
> +
> +fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
> +${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
> diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
> index c1366b705c..d98ac89c63 100644
> --- a/configs/zynqmp_kria_kv260_defconfig
> +++ b/configs/zynqmp_kria_kv260_defconfig
> @@ -1,8 +1,8 @@
>  BR2_aarch64=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> -BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
> -- 
> 2.17.1
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
