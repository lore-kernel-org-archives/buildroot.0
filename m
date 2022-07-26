Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E131EC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5970D408B4;
	Tue, 26 Jul 2022 21:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5970D408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVY4cgmIHzJc; Tue, 26 Jul 2022 21:07:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E34B3408B3;
	Tue, 26 Jul 2022 21:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E34B3408B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 857871BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D1BC408B2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D1BC408B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAaIjLB2cLCi for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:07:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC60408B4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCC60408B4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:07:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51EA120009;
 Tue, 26 Jul 2022 21:07:43 +0000 (UTC)
Date: Tue, 26 Jul 2022 23:07:42 +0200
To: Xuanhao Shi <x-shi@ti.com>
Message-ID: <20220726230742.0e538187@windsurf>
In-Reply-To: <8d1611db-29ae-e53b-f900-f57c037cfd01@ti.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-3-x-shi@ti.com>
 <20220726205529.0e85e2de@windsurf>
 <8d1611db-29ae-e53b-f900-f57c037cfd01@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658869664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFH9dsg7x0X8mJ4AhRxxl6Qvq+ipvcUKOP8IaHTnp7I=;
 b=TAkhN91n+KGWkWPka63d1Pdwrr2ZhlDtKyZrbwg7pzCnyhOO7W39X2mN/hCusV6cXOaf3D
 KTFL8537wjgtJfOpD+zkw3hh6uIe3aHkHsEwb4dx51YBSBych+Npgk7X5IlSblVv5icTOD
 1/NRP7Gmr6ibvjUEU1swW728ufVLaRYg9TnjF9J5ptEBf2lDUJ1NZJvqyH/rdKocYDvUr8
 t5hCo8qn3kPD/c070yrzJeQ1gMe+SM4xnEjcjx1OmYVtY+saZlq6g/zcvJKG1PUR6xDuik
 i5xhCGnqPHBJd1Ac7wIfpdszJIG8Tgsld8sIeOK/477iSekqNxh1ooNbZSvEGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TAkhN91n
Subject: Re: [Buildroot] [PATCH 2/4] package/k3-image-gen: new package
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 26 Jul 2022 15:56:31 -0500
Xuanhao Shi <x-shi@ti.com> wrote:

> > Could you explain what you are trying to do? Is it because you need to
> > build two different U-Boot configurations?
> 
> Yes, the R5 core requires a different U-Boot build than the A53 core. I 
> mentioned a bit about it above.
> 
> I understood that this patch currently does not achieve that in a proper 
> way. Would you mind recommending a proper way to do this? Should I find 
> a way to patch U-Boot directly so it has an option for a separate build?
> 
> Since you mentioned earlier that k3-image-gen should be a package in 
> boot/, should the patch modify boot/uboot/ for the separate U-Boot build 
> instead?

One option that I see, which isn't very nice, is to do like Barebox in
boot/barebox/, where boot/barebox/barebox.mk contains most of the code,
but in fact two barebox packages exist, boot/barebox/barebox/ and
boot/barebox/barebox-aux/.

Another option, much simpler, is to do something that is more TI
specific, such as a ti-am64x-r5-loader package that would download your
U-Boot for R5 and build it, but without relying on the boot/uboot/
package. Exactly like if you had a custom bootloader/firmware for the
R5. I think this is the best option.

What do you think?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
