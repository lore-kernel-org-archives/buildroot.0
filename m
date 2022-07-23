Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787B1C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E63484645;
	Sat, 23 Jul 2022 13:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E63484645
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhvQE4h7el78; Sat, 23 Jul 2022 13:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF4B84123;
	Sat, 23 Jul 2022 13:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF4B84123
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 039181BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC5F141716
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC5F141716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OMx1v3azeuRY for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:25:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED2234170A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED2234170A
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:25:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 420E660004;
 Sat, 23 Jul 2022 13:25:04 +0000 (UTC)
Date: Sat, 23 Jul 2022 15:25:03 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220723152503.5e2417cb@windsurf>
In-Reply-To: <5fd9249b-0815-0b8a-9cb5-a301d04ec5d3@smile.fr>
References: <20220529131811.481017-1-romain.naour@gmail.com>
 <20220723143921.1e89b49f@windsurf>
 <5fd9249b-0815-0b8a-9cb5-a301d04ec5d3@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658582705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CHKRvDukY1QYmNzqJCSUr4hAsV67nOzUAuvN491sZE=;
 b=O/XEyrCr/zG/8E+luZXF8wm5nvhw1r8ORyee1KXgz6PljanG7XIBhG9ybWn99P2Zaw1b9y
 O8ey53LIbmUFnPXg4kNy8lUsI2zTWHRds6tYxHk0r4Ybx6//oLmMxabFk9210QzonulzjD
 AmAfMp4meOKzfdp7wYzXocSCpoXioy7BVT1Ue3MmXFp3gOUAkoicyMm1/6ewgvoG8BC2mo
 fm0ZDOFWaEcMLP8jQVFZ3TvtlGrfisnO3Ru+ldwpeh0p5+QMew8cPDmILrNjzjFVTKgCwd
 pcSQUDS+DmazA95BRttdgnuSZsEXGirNWuaArmQJKrTZ9z0Zu4+/rwFKjtxxJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O/XEyrCr
Subject: Re: [Buildroot] [PATCH for-next 01/11] arch/Config.in.riscv: add
 Zicsr and Zifencei standalone extensions
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
Cc: Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 23 Jul 2022 15:00:40 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> I'm not familiar with the riscv instruction set, so I was not sure if we should
> support the possibility to disable Zicsr and Zifencei standalone extensions with
> gcc 12. AFIU, they are unconditionally enabled in previous gcc releases.

Correct, which is why I think they will always be present in
Linux-capable RISC-V cores. The reason I believe they were split from
the I part of the ISA is because I is the base part of the ISA, and
some people wanted to make RISC-V designs without those instructions,
but not RISC-V designs targeting Linux.

So for now, I think we should simply make the assumption that all
RISC-V cores will have those instructions.

If that turns out to be wrong in the future, we can always revisit that.

> Additionally we have received two patches to add "vector operations extension"
> 
> http://patchwork.ozlabs.org/project/buildroot/patch/20220704085552.3499243-2-abel@x-silicon.com/
> 
> http://patchwork.ozlabs.org/project/buildroot/patch/20220627135359.2232222-1-fhunleth@troodon-software.com/
> 
> But this requires gcc-12
> 
> http://patchwork.ozlabs.org/project/buildroot/patch/20220627135359.2232222-1-fhunleth@troodon-software.com/#2933736
> 
> Do you think "Vector Instructions (V)" deserve an option ? (I would say yes).

Yes, V definitely needs an option, as there will clearly be
Linux-capable RISC-V cores that do not implement the V extension.

The option for the V extension will have to select
BR2_ARCH_NEEDS_GCC_AT_LEAST_12.

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
