Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8F0C001DB
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1048404C2;
	Thu, 10 Aug 2023 13:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1048404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30K7PpNzjlwq; Thu, 10 Aug 2023 13:42:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13909405C2;
	Thu, 10 Aug 2023 13:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13909405C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B58CF1BF4E2
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 13:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 790D183F8B
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 13:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 790D183F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wFpCrvDDa18 for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 13:42:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F12D583BB4
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 13:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F12D583BB4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9361CFF80C;
 Thu, 10 Aug 2023 13:42:42 +0000 (UTC)
Date: Thu, 10 Aug 2023 15:42:41 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230810154241.3faee0fc@windsurf>
In-Reply-To: <12cfcd50-66e4-4c03-febd-b9a259bf10d7@mind.be>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
 <20230809225901.470e0270@windsurf>
 <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
 <20230810090721.1e052f35@windsurf>
 <12cfcd50-66e4-4c03-febd-b9a259bf10d7@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691674963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayqXQSU9ipyJjSZ0ty7tucQKJCaud1AE7jMhlIIQeb4=;
 b=SHnb/TNm3XAjkpiZui0p/VneQcczusIdvzH9o5fQ5s6RjpxZA0EJJ+8wcVvJHgPNLpSrw2
 rcYxwCLLg6AzW/LaDxzWvPpdL31gd04B2Iypt6EydTS/evAyOMthmcI7zp4CQXATNzdMMo
 xHXAZgVgYB2bK12CqhXoSyV3SsNrlG9t12SKzL/9RqNsJHqb11mtkjdRSwQhCUzrpSwsSW
 evoNDH9TpHGLHe0cY1U+FErnsScv1dmG8OLS7sb6/Jm8OmC6YN64WajU4S2qOqD4oGx1L/
 lPIv9olzuJecW48CT2QtJQiNnA99qnSTRGYAjpP6a/Bnnr3E2fwJos1RjS0ebA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SHnb/TNm
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Cc: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org,
 clement.ramirez@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Aug 2023 15:18:42 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > It could still be useful to have something to contribute new entries,
> > for those packages that have no entry at all (regardless of their
> > version number) in the CPE database.  
> 
>   This makes no sense at all. The only reason to have a CPE database entry is in 
> order to link it to a CVE. If there is already a CVE, then it should already 
> have a CPE entry. If there's no CVE yet, then will the first person to ever 
> submit a CVE for it use the same ID?

Well, that would be my expectation indeed. A package in Buildroot has
no CPE in the database, no CVE. We submit a CPE to the NVD database. My
hope (but perhaps I'm dreaming too much) is that the day there is a CVE
on this software component that CPE identifier that was submitted will
be used, and therefore our CVE tracking will work.

Maybe I'm dreaming here, but if it doesn't work like this, it basically
means that for any package in Buildroot that never had any CVE, we have
absolutely no guarantee that we will properly notice when the first CVE
gets reported. Maybe that's life and we have to live with it, but it
kinda sucks.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
