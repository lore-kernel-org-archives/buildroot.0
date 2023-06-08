Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713A2C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 16:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB26783EB7;
	Thu,  8 Jun 2023 16:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB26783EB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8qbexvtiu73; Thu,  8 Jun 2023 16:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00BF383CA8;
	Thu,  8 Jun 2023 16:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00BF383CA8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8098F1BF292
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 16:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59FEF61488
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 16:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59FEF61488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0HUU93CvPq7j for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 15:59:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EDD06001B
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EDD06001B
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 15:59:59 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358FxtxK102313;
 Thu, 8 Jun 2023 10:59:55 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358FxtK1010469
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Jun 2023 10:59:55 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 10:59:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 10:59:55 -0500
Received: from dasso (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358FxtDb026237;
 Thu, 8 Jun 2023 10:59:55 -0500
Date: Thu, 8 Jun 2023 10:59:55 -0500
To: "Gadiyar, Anand" <gadiyar@ti.com>
Message-ID: <20230608155955.m7rqwkencyowlvqo@dasso>
References: <70cc5213bb4d4e4d8e4b21b1c7122daf@ti.com>
 <20230608063000.882363-1-patrick.oppenlander@gmail.com>
 <b043f10789294e3d9bdb56e551933c69@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b043f10789294e3d9bdb56e551933c69@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1686239995;
 bh=M/v9SZBbMGFVZEOOCZkCaleMyZwV43LazDyzH5FX1rg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=GvIVE6mJgOJoPP0iYudCj+7i109FvcfXWTPF0If3t8F3FjR4XihDpR2Jju5X9yY7Q
 boQOTAEG3C7+OgkeS304yqQyNSudXTBVBczoKmxu8Z29tkdjOHbXqeycF2VhnJ8wrF
 gn5N6BocnkYNyOGbuY9eEG2fR3ffK939vRUcEgg8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=GvIVE6mJ
Subject: Re: [Buildroot] [PATCH v7 0/3] add support for TI's AM64x boards
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: "Brattlof, Bryan" <bb@ti.com>, "Davis, Andrew" <afd@ti.com>,
 "X15000177@gmail.com" <X15000177@gmail.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>,
 "patrick.oppenlander@gmail.com" <patrick.oppenlander@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On Thu, Jun 08, 2023 at 01:29:02PM +0000, Gadiyar, Anand via buildroot wrote:
> > From: patrick.oppenlander@gmail.com <patrick.oppenlander@gmail.com>
> > 
> > Hi,
> > 
> > I'm looking to use buildroot with a PHYTEC phyCORE-AM64x SOM which is based on
> > the same TI part as the SK-AM64/SK-AM64B. Happy to post patches if I happen to be successful.
> > 
> > Ideally it would be easiest to build support for the SOM on top of these
> > patches. Is this series still alive?
> 
> Hi Patrick,
> 
> I gave up after the last round of review comments, but there is someone
> at TI who has taken it up again recently.
> 
> They're focusing on the AM62x including other goodies like display and GPU, and
> has a working baseline. He was planning to post the series upstream shortly after.

I work for TI and have since picked up the work on the v7 patch series
that Anand and others last worked on. I've been forward porting the
exisiting patches on top of the latest 'master' commit, doing some
further cleanup also considering v7 feedback, plus making enhancements
needed to better support TI K3 SoCs. I've also added AM62x support, and
currently working on adding GPU support for AM62x (I have it already
working being able to run Weston and Chocolate Doom for testing
purposes, just needs some more cleanup).

My intermediate work is posted here [1] together with some instructions
and how to get it to work for anybody interested in the full solution
*today*.

My plan is once GPU support is complete and cleaned up I'll post a v8
series to this mailing list here with everything in it, and work with
the community on any further cleanup that may be needed. I expect to be
able to start this process next week. So I'd appreciate if we can
refrain from posting additional TI K3 patches until then.

Once merged, the temporary page [1] will get updated and/or dismantled.
It is certainly not meant to be a "forked solution" of sorts, and was
only intended to be a stop-gap measure for some immediate customer needs
we had here at TI.

Thanks,

--
Andreas Dannenberg
Texas Instruments Inc

[1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1226815/faq-buildroot-support-for-sitara-am62x-am62ax-am64x-devices

> 
> The series 7 should still work functionally. All the review comments were
> valid though and might be easy to address if you want to start from there.
> 
> Since there is community interest in having AM64x support, I would love to
> take this up again.
> 
> Best Regards,
> Anand
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
