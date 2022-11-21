Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E1CC4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 22:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C468405E6;
	Mon, 21 Nov 2022 22:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C468405E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQBJ2hViV83f; Mon, 21 Nov 2022 22:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 888B8405E3;
	Mon, 21 Nov 2022 22:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888B8405E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 504941BF3A9
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 22:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DE5D40317
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 22:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DE5D40317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6irv07ALiQGN for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 22:13:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B394402FD
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B394402FD
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 22:13:49 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 202A9240002;
 Mon, 21 Nov 2022 22:13:43 +0000 (UTC)
Date: Mon, 21 Nov 2022 23:13:42 +0100
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20221121231342.50bafc4a@booty>
In-Reply-To: <20221121201638.30951-1-brandon.maier@collins.com>
References: <20221121201638.30951-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669068824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aOIYFSY3otmPScxTZU47PtwLospkBhNytIMSNiPyES8=;
 b=fZpneEFlLdeoKQdaDq12eunwPWT4AHmprUcuYyCnR2F83RYNaMMXqqZVvqLjsNxlJVVuky
 lMbX3Z7QHZFYEEhjmOkJSWV4sp54MrujwP328MzhHBhX3VgDHEaCJP6WCnSpFX5sRloMk/
 elJrWA2BkFXZpFQOjLoKhJ8Rjba4ruvMVETgA57h1AOopAXPmRsVDWEOO1lfSmWXb0iQhP
 1i64LS0Z7w5rceefRefgRzD9ZWHxeBv3WYKw2l0uKHISWu5XiDsZrSXgMNIvKBGZjErHaL
 26ZLYeDehi7N16EGZ8oW57zQoqmBo1v0ZK6R0QdHyJncUpAUhkEldRcbBVTbQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fZpneEFl
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot/uboot.mk: fix zynqmp without
 pmufw
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
Cc: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

On Mon, 21 Nov 2022 14:16:38 -0600
Brandon Maier <brandon.maier@collins.com> wrote:

> Commit d07e6b70 (boot/uboot/uboot.mk: add pmufw.elf support) broke
> configurations where the UBOOT_ZYNQMP_PMUFW was blank. Previously it
> would set the U-Boot CONFIG_PMUFW_INIT_FILE to the blank string, but now
> it will set it to ".bin" which causes U-Boot to fail to build.
> 
> To fix, disable all the pmufw code if the UBOOT_ZYNQMP_PMUFW is blank.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

You are right, this was missed during patch review. Thanks for
reporting!

> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 0439ec5e4b..b86248e1f7 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -383,6 +383,7 @@ endef
>  ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>  
>  UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
> +ifneq ($(UBOOT_ZYNQMP_PMUFW),)
>  

I don't like an empty line after the ifneq unless we have one before
_and_ one before the endif too. But this is minor, stylish nitpicking,
see below for something a bit more interesting.

>  ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
>  UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
> @@ -398,6 +399,7 @@ define UBOOT_ZYNQMP_KCONFIG_PMUFW
>  		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)
>  	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin")
>  endef
> +endif # UBOOT_ZYNQMP_PMUFW
>  
>  UBOOT_ZYNQMP_PM_CFG = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PM_CFG))
>  ifneq ($(UBOOT_ZYNQMP_PM_CFG),)

This would be an effective fix for the known cases (empty string, .elf,
.bin), but it would break again whenever Xilinx or anybody else invents
another extension. Not likely maybe, but overall I would prefer a fix
like (untested):

 define UBOOT_ZYNQMP_KCONFIG_PMUFW
+       $(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)")
         $(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
-                objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)
+                objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin
+                $(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin")))
 endef

The above reverts to always setting CONFIG_PMUFW_INIT_FILE to the
unmodified value of UBOOT_ZYNQMP_PMUFW_PATH as we used to do before
d07e6b70, then mangles it only in the special "*.elf" case.

Would you mind testing that and sending a patch?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
