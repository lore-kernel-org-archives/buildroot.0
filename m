Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC862C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 06:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 273ED40CB0;
	Mon, 25 Jul 2022 06:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 273ED40CB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5WeRgB_7MTIF; Mon, 25 Jul 2022 06:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20859403EA;
	Mon, 25 Jul 2022 06:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20859403EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6D201BF38C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E8B9417A9
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E8B9417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ivt8KDL1riU for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 06:42:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4839D416C1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4839D416C1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 06:42:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF07320002;
 Mon, 25 Jul 2022 06:42:26 +0000 (UTC)
Date: Mon, 25 Jul 2022 08:42:25 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20220725084225.40a20846@windsurf>
In-Reply-To: <CA+h8R2rcc=sqTDY0HtE4UNUJydVZFd16PWXLXGaHo+wK0aVN6Q@mail.gmail.com>
References: <20220625224224.1446787-1-christian@paral.in>
 <20220723184104.0032a7dc@windsurf>
 <CA+h8R2og5UzGbLs-NHFKdLYyEus0v20EqgdZMtHnJDQa9dY4Gg@mail.gmail.com>
 <20220723222237.7989b5c6@windsurf>
 <CA+h8R2qUUZ9q9L1Xs4V5GOB1W1iJcKPaMxs_-h0d2dAOKwybGg@mail.gmail.com>
 <20220725082556.33cfb04b@windsurf>
 <CA+h8R2rcc=sqTDY0HtE4UNUJydVZFd16PWXLXGaHo+wK0aVN6Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658731347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usiEWvfdn+Q0x6mnlTlkjl4bjsP4B5REAoOdEJfTB/E=;
 b=cZS1PP3lvFERfoYFcjyYIR8ffhxlB+hqCx1B5kgAE09zTje4kWvDa4fG+yJIODPCB4S42l
 jrhDhyqnnMKk7TH9R541KYnB7JGi5mapSAt6ea+TQhRg7jKWY91aQAvwZV0BlvJHW6LgTz
 VSR3/Mu4+Bk/jdW16oYqsx7OH84T326WSZRJPlYPS3fwt/aLXmDHeM3R9lO6cKWulyZ10G
 shRGfYqVngcEOw+oN1oLZZdVUysxlqdY7V0uj9tsgJeiqad6YmkgNMbIQEilH2UBXGK2mo
 kUnxyiOyLgOeS47eSaTtM8W9PzlbPDPOs+d31le8LWa4D+fcFhncP5ruvMyaww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cZS1PP3l
Subject: Re: [Buildroot] [PATCH 1/1] package/gocryptfs: fix build against
 riscv
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
Cc: Anisse Astier <anisse@astier.eu>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Jul 2022 23:27:46 -0700
Christian Stewart <christian@paral.in> wrote:

> I don't think it's that the fork changed the deps, rather that the
> newer version of Go (1.18) drops those lines whereas a previous
> version would have kept them.

Ah, ok, makes more sense to me, thanks for the explanation.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
