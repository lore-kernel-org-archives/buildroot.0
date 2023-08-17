Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FB6C27C7A
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 09:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6404183A5A;
	Thu, 17 Aug 2023 09:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6404183A5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2OJbqZuV9AC; Thu, 17 Aug 2023 09:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A552680E9F;
	Thu, 17 Aug 2023 09:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A552680E9F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 577EB1BF215
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 09:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 045274181D
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 09:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 045274181D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iTye9REVEO0 for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 09:45:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D697841815
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 09:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D697841815
Received: by mail.gandi.net (Postfix) with ESMTPSA id 061D4FF809;
 Thu, 17 Aug 2023 09:45:04 +0000 (UTC)
Date: Thu, 17 Aug 2023 11:45:04 +0200
To: yann.morin@orange.com
Message-ID: <20230817114504.58473b4e@windsurf>
In-Reply-To: <ZN3Z6ixzNKiu2JbS@tl-lnx-nyma7486-2>
References: <20230816092439.570839-1-jamie.gibbons@microchip.com>
 <20230816092439.570839-2-jamie.gibbons@microchip.com>
 <20230816142316.76d45449@windsurf> <20230816150442.GB1340200@scaer>
 <20230817094015.5324e023@windsurf>
 <ZN3Z6ixzNKiu2JbS@tl-lnx-nyma7486-2>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692265506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flYIlRKSX/Ifg1cLKUWHSxdQeiKHHjKumgA98UBPls8=;
 b=VrmQHjrjOiPpLcNF5/Ar6XXgiu7UftLKII2L66Layk6UfqqrLnQoE4W117d6k1pyyXDTbE
 M1oNtzfOupaGo2LM7Ml1BrR+RGvB0Klfy2QtbHrugsk1Dof6ZSF+S6xweXmPtHYRc/LD+J
 0Y4eu+lxUgmieas5Gl6zXWdZPNnD/XgrbwMtDYYTzzGlKtBzpygXFHzSjGObJ1i3cNuLuK
 SLsP6A8vzHCiXP/Yw/cYD499ORG4KXBYIBDMzSlG2smWJwNDk+FLvYjvFzM7O253y2SCfX
 Bz/rI1BJyPZcv5jc0t5QvW2OCvR8L6Al48Wr2nnZ4vKEMoAsTmsKD4EVfE2vSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VrmQHjrj
Subject: Re: [Buildroot] [PATCH v2 1/3] arch/Config.in.riscv: update
 instruction set ext
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>, buildroot@buildroot.org,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 17 Aug 2023 10:27:22 +0200
yann.morin@orange.com wrote:

> With the change Yann@home suggests, it makes it obvious and visible that
> generic forces IMAFD, without having to guess (or look at generic's help
> to see what symbols it selects).

Ah, I see what you propose. Yes, it also makes sense.

> However, why do we want to expose those extra sets (C, V) to be optional
> for generic? Isn't that really in fact just defining a custom silicon,
> which is the reason we have a "custom" choice to begin with?
> 
> Or do we want to interpret "generic" as "base", e.g. "base that is able
> to run a Linux system without too much hurdle, anything else less
> featured will not cope very well at build or runtime, or may restrict
> the set of packages you may enable; you may enable further extensions" ?

That was my idea indeed. To me "G" is a shortcut for IMAFD, but
potentially you can have extra extensions as well.

> Note that G is anyway a superset of IMAFD, as it also contains the Zicsr
> and Zifencei extensions. In Buildroot, as for the I set, we expect those
> two extensions to always be available (see arch/arch.mk.riscv@33 and
> commit d479264b34f2).

Agreed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
