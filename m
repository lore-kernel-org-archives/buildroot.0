Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F60C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 09:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5736740160;
	Tue, 22 Nov 2022 09:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5736740160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id inEroJJEnF0j; Tue, 22 Nov 2022 09:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79EBE4049E;
	Tue, 22 Nov 2022 09:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79EBE4049E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C53A21BF30F
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 09:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB6CA416D2
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 09:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB6CA416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnwiSBL13OY8 for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 09:01:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BAD4416C9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BAD4416C9
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 09:01:28 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F02F21C000A;
 Tue, 22 Nov 2022 09:01:25 +0000 (UTC)
Date: Tue, 22 Nov 2022 10:01:24 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221122100124.3a441eb7@booty>
In-Reply-To: <20221122053611.44757-1-neal.frager@amd.com>
References: <20221122053611.44757-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669107686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TUHHGg7XHmXBRZMFQfBY5jrvc2rKUHcfc6RlIeMZ81k=;
 b=h/LfOF0hG8xrQscxbca6koYw9z/TS66QM1EAkgnxFtjczEyWHkdTav5FYXkeZXhm02u03p
 UsDlgRwxbUBWHpYTDf3l7M627qpzBX9qkKzsOZcrCFxy7gKW50dYT+q49pNML5+2DnfmSu
 su/0cCj3jEMnbVZYlgzbmEUnkPDRmtne2ofzUhEzWEJ3Mp3me8RTn4nIX/lqyVhfYORsif
 ZzVBAWNWQtyRri6NgNmdEIXfXavSu4np/htpbpLoZH9/xFDlvGq6zCPeqKKT+jUjnoiu/U
 JjNSfgjjV8qlvE1ETmw4I97xZrcluoXvTySFGT49B1uV2wNm1yIIGzz/i9UGBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h/LfOF0h
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add stripped
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Mon, 21 Nov 2022 22:36:11 -0700
Neal Frager <neal.frager@amd.com> wrote:

> If a user requests a u-boot binary in elf format,
> they may actually want the stripped u-boot.elf version.
> This patch provides the stripped u-boot.elf binary.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>   - reduced scope to only 64-bit ARM arch platforms
>   - non-ARM platforms may not have a u-boot.elf by default
> ---
>  boot/uboot/uboot.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 0439ec5e4b..61b3074163 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -54,6 +54,9 @@ endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
>  UBOOT_BINS += u-boot
> +ifeq ($(BR2_aarch64),y)
> +UBOOT_BINS += u-boot.elf
> +endif

Is it really assured that all arm64 do build this file? And that
u-boot.elf is not useful for other architectures?

Looking at the U-Boot source code, it looks like this file is built if
CONFIG_REMAKE_ELF is enabled, which seems independent on the
architecture and happens for some non-arm64 defconfigs as well (e.g.
netgear_dgnd3700v2_ram_defconfig).

At first glance, it looks like we need (yet) another Kconfig knob in
Buildroot to manage this cleanly. Otherwise in
UBOOT_INSTALL_IMAGES_CMDS we might just install u-boot.elf if it is
present,skip it silently otherwise.

Not sure which solution is less appealing. :(

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
