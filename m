Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42F0C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5107F6114F;
	Tue, 22 Nov 2022 21:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5107F6114F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2skiTyAft5E; Tue, 22 Nov 2022 21:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 910B360FFE;
	Tue, 22 Nov 2022 21:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 910B360FFE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A77AD1BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81F5660FFE
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81F5660FFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id om2Usc8SiXAp for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:46:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3932260ADA
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3932260ADA
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:46:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 8F124D50EF
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:28:28 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED535C0003;
 Tue, 22 Nov 2022 21:28:22 +0000 (UTC)
Date: Tue, 22 Nov 2022 22:28:21 +0100
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20221122222821.58d7a364@booty>
In-Reply-To: <20221122201701.65681-1-brandon.maier@collins.com>
References: <20221122201701.65681-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669152503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGbw25hjYCksVNryaml71t6V6MaMpoBih2ep5jGIl10=;
 b=ndtvkgtpU5oShR60TClrb2mSMUJUImmy2a5AyZY1Xqlx3vhsMLAb0IVXozmv0JkeFNaZ6v
 9J8Kqmg9KuPKcadJnkXo2vy4fbFKlbXrfvK00bmmT0j70XcXP7VGEXsTsgF8rkqfezYYFS
 r11ez/DC5PvvE+FAV3UOJlmzBRx6bpqhZWBGtyRehYWUtFKGFSFvExMjr6XuhRztgnzQKP
 aRRM4Jj8aj1eTuvS5osZuDOFlI8EaovcOY+cUpN8gDxP3t8ta0z/ySHzJgcAu2ERRj3FQq
 UElxMsWTlMNiTAhggCyvEm6Ihf3yayckPuwpIJrQ4Ny1AMVKO6XzqeOt/zapkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ndtvkgtp
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: fix zynqmp
 without pmufw
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

On Tue, 22 Nov 2022 14:17:01 -0600
Brandon Maier <brandon.maier@collins.com> wrote:

> Commit d07e6b70 (boot/uboot/uboot.mk: add pmufw.elf support) broke
> configurations where the UBOOT_ZYNQMP_PMUFW was blank. Previously it
> would set the U-Boot CONFIG_PMUFW_INIT_FILE to the blank string, but now
> it will set it to ".bin" which causes U-Boot to fail to build.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
> v2:
>   - support pmufw with any extension
> ---
>  boot/uboot/uboot.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 19e4183927..d037ae9c12 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -394,8 +394,9 @@ UBOOT_ZYNQMP_PMUFW_BASENAME = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
>  
>  define UBOOT_ZYNQMP_KCONFIG_PMUFW
>  	$(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
> -		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)
> -	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin")
> +		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin
> +		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin"),
> +		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)"))
>  endef

Using the else branche of $(if) is different from what I had in
mind, but it is fine as well.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
