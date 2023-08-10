Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112BCC001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 21:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A07CE40A70;
	Thu, 10 Aug 2023 21:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A07CE40A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OayXOb824cKx; Thu, 10 Aug 2023 21:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFD4E408D4;
	Thu, 10 Aug 2023 21:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFD4E408D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6EEA1BF379
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A924B83F4B
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A924B83F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0m1fgZjl2lkt for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 21:12:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC62883F48
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 21:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC62883F48
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E603E0004;
 Thu, 10 Aug 2023 21:12:36 +0000 (UTC)
Date: Thu, 10 Aug 2023 23:12:34 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230810231234.74e65cc9@windsurf>
In-Reply-To: <88f0eecd-cde8-4069-a750-ee2cbab679fb@gmx.at>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
 <20230809225901.470e0270@windsurf>
 <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
 <20230810090721.1e052f35@windsurf>
 <12cfcd50-66e4-4c03-febd-b9a259bf10d7@mind.be>
 <20230810154241.3faee0fc@windsurf>
 <2dce28a5-8e0d-f240-9b11-d3ff08604e88@mind.be>
 <88f0eecd-cde8-4069-a750-ee2cbab679fb@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691701956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhUG5lYkxhdOrSd2bQ9vavVOjsgQ+H2nW47rz2cHbic=;
 b=JAoTmtJ5IbZ4bEG9EwWTpcN95aPEmW9hZNbLD8Nmi5KZOmpJqMPhkFcEHA11GxGJD9MKBR
 uLV9lfqlF1w+fYmWoYzuwmBycF+fVQPcncThw4RKOI/P8Dr2KLxUliZVhbdJG1o+UBuvdQ
 Vs5AKk6yAFMan9la9Wqxi1RAo9NawC0nLyrChjVk4oKHtxEHzbEov5c/aX9o5guHrTAT6V
 CDDAC726hXJtCpPhcjpuuy04o3T9GSOBEogKth5znROlpponvZV+xIGtd3G4xkK+0uT966
 ThDpqbAZS1zBKenQ9yu5JP4ovT0hD+e0kpmJfrrAeoSfRsyn4rE1DKXA7uaDOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JAoTmtJ5
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
Cc: buildroot@buildroot.org, clement.ramirez@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Aug 2023 22:12:36 +0200
Daniel Lang <dalang@gmx.at> wrote:

> The thing that's relevant for me in the current patchset [0]:
> Do we want to keep gen-missing-cpe or drop it?
> I'm asking because a lot of additional data needs to be stored
> to the database for gen-missing-cpe to work (title, reference urls...).
> Dropping that script would also mean simplifying the database,
> which is easier now than once transition happened.

On my side, I've never used it. In order to have all the entries in the
CPE database kept up-to-date with the zillions of version bumps getting
into Buildroot every day/week, there would be a massive work, I doubt
anyone is ever going to do this. So to me, gen-missing-cpe can probably
go away.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
