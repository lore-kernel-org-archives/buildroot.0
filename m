Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF895C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 18:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4861081F68;
	Tue, 22 Nov 2022 18:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4861081F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nallmeunTUNu; Tue, 22 Nov 2022 18:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ACB181F45;
	Tue, 22 Nov 2022 18:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ACB181F45
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E23221BF2C7
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 18:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBA8441874
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 18:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA8441874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQ7VBDPv1BZi for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 18:07:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 261F5402FD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 261F5402FD
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 18:07:46 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E0C102000B;
 Tue, 22 Nov 2022 18:07:44 +0000 (UTC)
Date: Tue, 22 Nov 2022 19:07:43 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221122190743.2610e8e9@booty>
In-Reply-To: <20221122171315.7a749d61@windsurf>
References: <20221122053611.44757-1-neal.frager@amd.com>
 <20221122100124.3a441eb7@booty>
 <CH2PR12MB5004DF92B82E671197A06306F00D9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20221122171315.7a749d61@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669140465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwxgWlGKEz9G88x2R6KTqpVfpCRkaufkm6YYUz9JuDI=;
 b=je8V0O1fNrO43iON5HtrjhC284Lq9BMtyRtvkwt74LDoVWsg/fR/j4McfxWxA147usH5XQ
 pzQAnweKgm9di1040gT7vGJTVnzzNUsZpgQEkz7mqX7NVSLTffXxMako/Ox7hr8jfnLz1I
 3EI7U9lqEL3pnsal4jm8yrjkhm9VOSjSrIhXC6TzX3BnZzyiYURvAI5f4u+c2fY9zxV1+y
 fCyAXSFZCGwKTHyy3YLrTE/FHZdxXhb2pRDVf6yIFPAF2830NgdwMX4uXeVSNUiRKKbf/a
 P3FjQb78VUBWJ3oO+xhFjflPJpw7ODlsuGY8CXMkPA6wfvyZeWU9r4i5pwfsZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=je8V0O1f
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
Cc: "Frager, Neal" <neal.frager@amd.com>, "Frager,
 Neal via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Tue, 22 Nov 2022 17:13:15 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Neal,
> 
> On Tue, 22 Nov 2022 09:43:45 +0000
> "Frager, Neal via buildroot" <buildroot@buildroot.org> wrote:
> 
> > Perhaps just checking every file for existence when running the loop below is the best option like below.  The idea is to keep this as simple as possible.  What do you think?
> > 
> > define UBOOT_INSTALL_IMAGES_CMDS
> > 	$(foreach f,$(UBOOT_BINS), \
> > 			$(if test -f $(@D)/$(f), \
> > 			cp -dpf $(@D)/$(f) $(BINARIES_DIR))/
> > 	)  
> 
> I think we should change:
> 
> config BR2_TARGET_UBOOT_FORMAT_ELF
>         bool "u-boot.elf"
> 
> to:
> 
> config BR2_TARGET_UBOOT_FORMAT_ELF
>         bool "u-boot"
> 
> (because this is really what it is doing)

Right.

> 
> and then introduce:
> 
> config BR2_TARGET_UBOOT_FORMAT_ELF_STRIPPED
>         bool "u-boot.elf"
> 
> which installs the stripped u-boot.elf file.
> 
> This way, BR2_TARGET_UBOOT_FORMAT_ELF_STRIPPED can be enabled on
> configurations that need it, without breaking configurations that
> provide u-boot but not u-boot.elf.

I agree with the principle you are proposing.

However, according to the U-Boot source code, u-boot.elf appears as
u-boot.bin repackaged into an ELF file. Is "stripped" a correct word
for this?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
