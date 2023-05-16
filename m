Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2B6C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 12:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CEF14098F;
	Tue, 16 May 2023 12:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CEF14098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olYvnWXYCKrU; Tue, 16 May 2023 12:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 126B0405AE;
	Tue, 16 May 2023 12:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 126B0405AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67CA21BF2F2
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 12:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3738483B2F
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 12:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3738483B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXdpl3_9vBbi for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 12:30:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A5482279
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5A5482279
 for <buildroot@buildroot.org>; Tue, 16 May 2023 12:30:29 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 524F6C000F;
 Tue, 16 May 2023 12:30:26 +0000 (UTC)
Date: Tue, 16 May 2023 14:30:25 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230516143025.3efbe264@booty>
In-Reply-To: <20230516054053.22133-1-neal.frager@amd.com>
References: <20230516054053.22133-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1684240227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5cG/j75m3PP3SW2vZ3wdHpJmuKYCaJ9uPNShtAuQ73E=;
 b=eC6tf912oWGdsamE6u0yN6TUgzRd3wPHo5RW1FglLSBz56GV3DQvlWXVc3JhWx7jwjtXRS
 dizZf3e0AhbB5ZH9zIPenj+Nrk2iSp5wXBgeJatlaXst/BYes/vtgoR04ANVRq662Bk++d
 v1q/JoGmo/j4FdVQnHwhueofrPPfHfyr6Uc3xPUw2e1i/W8UuoCA2iNt+mpasZI6LaruXw
 QJd5rEV50ywHvaZ3mmGpp5mz7dhhmpVFVFHh2ihrlaE/LbSpwHQhS2Zljt3V0WCpp6yyrv
 n4u9mu2beY7yGJaF2oClbeudZzau4+2BNdubjz4bvf82SJHyGHQL0vtt5QESrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eC6tf912
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynq_zc706_defconfig: bump
 to xilinx-v2023.1
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Tue, 16 May 2023 06:40:51 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynq_zc706_defconfig to xilinx-v2023.1 which includes
> the following updates:
> 
> - Linux v6.1.5
> - U-Boot v2023.01
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/zynq_zc706_defconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> index 3ad8cbafe3..55e4d8ea23 100644
> --- a/configs/zynq_zc706_defconfig
> +++ b/configs/zynq_zc706_defconfig
> @@ -2,12 +2,12 @@ BR2_arm=y
>  BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"

Booting a mainline kernel and/or U-Boot on is still far away in the
future? :-/

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
