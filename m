Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD2AC433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 14:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D82B14051C;
	Mon, 21 Nov 2022 14:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D82B14051C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id echiW2jWZEav; Mon, 21 Nov 2022 14:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DFE04049E;
	Mon, 21 Nov 2022 14:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DFE04049E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C65B1BF86C
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 14:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E86AE60EB8
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 14:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E86AE60EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IEhRpfiGu9BF for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 14:49:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A3DD60B27
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A3DD60B27
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 14:49:22 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA0862000B;
 Mon, 21 Nov 2022 14:49:18 +0000 (UTC)
Date: Mon, 21 Nov 2022 15:49:17 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221121154917.59ce2022@booty>
In-Reply-To: <CH2PR12MB5004C153A3109B9BC5400F46F00A9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221108200704.23955-1-neal.frager@amd.com>
 <CH2PR12MB5004C153A3109B9BC5400F46F00A9@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669042159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UwX3CxElVk3SzrFHAM8Pfx5hyZdIl+WnT8GlzcLj8ok=;
 b=mLS4yoQAgX1g0wlefjnKBl9ES7yAh9FgU0jtvgNMPEYcvqKyHY77/gKOtGjekoHm7IqIl1
 AU+kqyfa19cuuFKs0sOGAPYC3Ih5Qf/3c76EZH4Z/TROiw0NXAGQ04TShLXCo4UgbJXnTq
 DNsS0RjHgX+2yLfLbw2lsJ+IboHhZA0Oe1dRHCj2/lGiN5GXbBTo1PzsFn2oSDIcyMBcKk
 sK5MOQAWNIm0opkX30ccI4QDlraSL5cmiumbg3Tk1kFZCjbgVl/yrKtE8bGJI7c0yo6Ast
 +JZajaZuhnvHolPHFvfZ4x53xYsuOworvg+gfTIo39Jx9sMPUNFoQOIkN7wQ9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mLS4yoQA
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/uboot/uboot.mk: add stripped
 u-boot.elf support
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Mon, 21 Nov 2022 09:12:05 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hello everyone,
> 
> Just a friendly reminder regarding this patch.  Any feedback?
> 
> If a user requests a u-boot binary in elf format, they may actually want the stripped u-boot.elf version.
> This patch provides the stripped u-boot.elf binary.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk index 0439ec5e4b..216efc5a13 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -53,7 +53,7 @@ UBOOT_BINS += u-boot.dtb  endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
> -UBOOT_BINS += u-boot
> +UBOOT_BINS += u-boot u-boot.elf

This assumes BR2_TARGET_UBOOT_FORMAT_ELF will always result in
building u-boot.elf, but I don't think this is true for all platforms.

At a quick test with a RISC-V build and BR2_TARGET_UBOOT_FORMAT_ELF=y I
got a failure with your patch applied because u-boot is produced but
u-boot.elf isn't.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
