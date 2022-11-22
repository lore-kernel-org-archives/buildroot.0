Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E00C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 16:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FB2D8200A;
	Tue, 22 Nov 2022 16:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB2D8200A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAsMVDSfZEZQ; Tue, 22 Nov 2022 16:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83DA58200B;
	Tue, 22 Nov 2022 16:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83DA58200B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BC431BF841
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 16:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5523840B13
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 16:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5523840B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7erRM8CTNhUF for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 16:13:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3184401AF
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3184401AF
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 16:13:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92BDD100010;
 Tue, 22 Nov 2022 16:13:16 +0000 (UTC)
Date: Tue, 22 Nov 2022 17:13:15 +0100
To: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Message-ID: <20221122171315.7a749d61@windsurf>
In-Reply-To: <CH2PR12MB5004DF92B82E671197A06306F00D9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221122053611.44757-1-neal.frager@amd.com>
 <20221122100124.3a441eb7@booty>
 <CH2PR12MB5004DF92B82E671197A06306F00D9@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669133597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAc3ia95zicu3CD+nMZd8jgY8ijAuAbJ3r08WF2N8nQ=;
 b=DwOoJ6B17HXjfBa7sOBvHJzMyrRelb7v8U9fsgsEkwPFHUQ14+tsoc7Zt0pOHS51PNGPjp
 Ft2obMB69LiaRtd5UUWhwFVVD8/5Zfp4OcQ+x9HEAppDke+F/URQ+nf4sq05gt+MKruGsl
 XRloagm6QokiGbPt8XZLX19y2wmKyMdPV5HGjxcGWaDTKK/T/1Z5PZz9Fr9qPQQOD4po89
 nqjPos4CdCF4iY9tt4Qsxp6QyjqeYJbBQVLwyuNJBhJT1uAWo9354KIuE5PetGhpwAMnFI
 twQD2Mpaeb5DQMC+XvQAmdt+Nz/Bc9S/MYKbBD1HBUUIbbhXEmnOAlyBCBrPGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DwOoJ6B1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Frager,
 Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Tue, 22 Nov 2022 09:43:45 +0000
"Frager, Neal via buildroot" <buildroot@buildroot.org> wrote:

> Perhaps just checking every file for existence when running the loop below is the best option like below.  The idea is to keep this as simple as possible.  What do you think?
> 
> define UBOOT_INSTALL_IMAGES_CMDS
> 	$(foreach f,$(UBOOT_BINS), \
> 			$(if test -f $(@D)/$(f), \
> 			cp -dpf $(@D)/$(f) $(BINARIES_DIR))/
> 	)

I think we should change:

config BR2_TARGET_UBOOT_FORMAT_ELF
        bool "u-boot.elf"

to:

config BR2_TARGET_UBOOT_FORMAT_ELF
        bool "u-boot"

(because this is really what it is doing)

and then introduce:

config BR2_TARGET_UBOOT_FORMAT_ELF_STRIPPED
        bool "u-boot.elf"

which installs the stripped u-boot.elf file.

This way, BR2_TARGET_UBOOT_FORMAT_ELF_STRIPPED can be enabled on
configurations that need it, without breaking configurations that
provide u-boot but not u-boot.elf.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
