Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E359ECAAD8
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 21:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3D96408D4;
	Mon, 29 Aug 2022 21:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D96408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXC6LIRZvfVp; Mon, 29 Aug 2022 21:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 685B7408C0;
	Mon, 29 Aug 2022 21:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 685B7408C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 315FA1BF3D8
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 21:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAC1181391
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 21:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAC1181391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQ7O8glI8B50 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 21:46:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5938181387
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5938181387
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 21:46:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 20D5CFF804;
 Mon, 29 Aug 2022 21:46:41 +0000 (UTC)
Date: Mon, 29 Aug 2022 23:46:39 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220829234639.27f59aa0@windsurf>
In-Reply-To: <20220829194828.GA3615594@scaer>
References: <20220614175048.6352-1-raphael.pavlidis@gmail.com>
 <20220614180152.15846-1-raphael.pavlidis@gmail.com>
 <a7ed0285-fea7-16f6-6ef8-9ff93fee1461@googlemail.com>
 <20220827120837.GV37358@scaer>
 <553c9903-0b75-d35b-cd30-848a05168eb7@gmail.com>
 <20220829194828.GA3615594@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661809601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWr4puYPT+t/GDhITmD79EIVO6Wqag0mYphWFDCgpTE=;
 b=NmzRCXiVOeOPUVU2+J0gXlU+R9ewWV4xx2Uu4HcDebyP5tqm1E2bqMQ1zBiWb6WDuLG867
 xkaKqwof5o0Z0dTkWhc6tVziXmSkij3hK4XY/eKPA99lpbVex8S6TpbabFuj3UbpVyL4pq
 u6b3OjTKWwKfIYrOjkbI82EBPA08/AaNu2e1c4X/R6QoGtw/jYNWk75J14IQ/LuV6kxEUm
 2Kcq8+EPsoZQj8orBDGQtU20x/fUACvIByhrWCbIQ6BfZYV30GvKtYqp4UzzbDrFKiTvrJ
 qdpSiJ1a5ZhB83M4yhxM4jfF3+8G5A1lawY+1ItcETXLhMOOaejVw2nwXLLJHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NmzRCXiV
Subject: Re: [Buildroot] [PATCH v2] package/slirp4netns: new package
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 29 Aug 2022 21:48:28 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yes, the idea is that, by submitting a package, you show an interest in
> having that package work flawlessly in Buildroot.
> 
> Listing the package in DEVELOPERS will ensure that you are copied on the
> build failures about that package, that the autobuilders [0] may uncover
> when running the random configurations.
> 
> It also ensures that, should someone submit a change to that package,
> you get listed by the utils/get-developers script, so they would put you
> on Cc to the change, on the assumption that you know (at least a bit)
> about the package.

And also, by being in the DEVELOPERS, you get notified by e-mail when:

 - The upstream project corresponding to your package makes a new
   release, hinting you that you should perhaps update the Buildroot
   package. This works fine if the corresponding project is known by
   release-monitoring.org, and release-monitoring.org has a mapping
   between the Buildroot name and the name of the project as known by
   release-monitoring.org.

 - There is a CVE (security vulnerability) reported on the upstream
   project. This works fine is the CPE variables in your package are
   correctly defined.

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
