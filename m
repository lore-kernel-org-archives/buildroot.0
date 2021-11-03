Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1AFC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:20:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69F9D60F58
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69F9D60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C8FA80EFE;
	Wed,  3 Nov 2021 21:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1h-p6F2Q_2-P; Wed,  3 Nov 2021 21:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C87280EF6;
	Wed,  3 Nov 2021 21:19:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2271BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE09D60730
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHIyMOQleOHJ for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:19:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2600606B3
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:19:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6B897E0007;
 Wed,  3 Nov 2021 21:19:51 +0000 (UTC)
Date: Wed, 3 Nov 2021 22:19:50 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211103221950.373e93c7@windsurf>
In-Reply-To: <20211103195520.147558-4-aduskett@gmail.com>
References: <20211103195520.147558-1-aduskett@gmail.com>
 <20211103195520.147558-4-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mender-grubenv: fix grub module
 checks
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
Cc: Mirza Krak <mirza.krak@northern.tech>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Wed,  3 Nov 2021 12:55:19 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> +ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y)

Are you sure this is correct? Indeed I believe
BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI is also used for the
BR2_TARGET_GRUB2_I386_EFI, BR2_TARGET_GRUB2_ARM_EFI and
BR2_TARGET_GRUB2_ARM64_EFI cases, isn't it ?



> +MENDER_GRUBENV_MODULES_MISSING = \
> +	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
> +		$(MENDER_GRUBENV_MANDATORY_MODULES))
> +else
>  MENDER_GRUBENV_MODULES_MISSING = \
>  	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\

Also BR2_TARGET_GRUB2_BUILTIN_MODULES no longer exists, it's
BR2_TARGET_GRUB2_BUILTIN_MODULES_PC.

I'm really sorry we overlooked this when doing the changes on grub2 :-/

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
