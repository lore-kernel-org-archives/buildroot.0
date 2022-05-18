Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC70C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 21:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 306E841CE4;
	Wed, 18 May 2022 21:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GyAqgNn96tcb; Wed, 18 May 2022 21:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09EC241CE0;
	Wed, 18 May 2022 21:35:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E44451BF380
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 21:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D264941CE0
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 21:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-cfMtIxaodx for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 21:35:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 507E341CDF
 for <buildroot@buildroot.org>; Wed, 18 May 2022 21:35:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51F4D240007;
 Wed, 18 May 2022 21:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652909703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6/6YQ2oHoi7fVejx1Z6ys7vgkUrqeLXkbBUNFWDaSM=;
 b=VsJ2tIJs2a4l1LHNfEtO4tgEAkLPMWdlgKViWqHkPrmOql6cFrN8UpOssMHb3IE3A38CG1
 yzGDQBMaYVGlQxmc1EPPX3sKod282X95jchJJp9CQPVhxSYOdinH9hcD0+SCk3usGc/M5U
 nRYFM/GrBx9aUQCqHBMoY6DS464BchG6kIKBFTaKuLOEvEKsHMplQ6oOCHLHiKZJs9Gb93
 Dso2vLVGugVarFFjEDQ9bsjvIEQJSUXoQb1gpvGqH99bHomt++gSRmj9ZZdUzv5q3zAqkr
 z74Au/CFzfJT1MB0czZUlmL5+FoNXRgcftyXF4wS1vtjYDPANXIwfMbwV/UhdQ==
Date: Wed, 18 May 2022 23:35:02 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220518233502.5237d35d@windsurf>
In-Reply-To: <22e590f7-80a4-0e7f-9b36-33f6d0e6ddae@gmail.com>
References: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
 <20220419213450.887728-3-thomas.petazzoni@bootlin.com>
 <22e590f7-80a4-0e7f-9b36-33f6d0e6ddae@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] arch/Config.in.arm: re-organize MMU
 selection
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 18 May 2022 22:24:28 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> > In practice, MMU-capable ARM cores are always used with their MMU
> > enabled, so it doesn't make sense to support the use case of not using
> > the MMU on such cores.  
> 
> So, it means that we can remove qemu_arm_versatile_nommu_defconfig since
> BR2_arm926t -> BR2_ARM_CPU_ARMV5 -> BR2_ARCH_HAS_MMU_MANDATORY

Yes. I don't think supporting ARMv5 noMMU makes much sense, as
explained in the commit log. Supporting ARMv7-M definitely makes sense,
but not ARMv5 noMMU.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
