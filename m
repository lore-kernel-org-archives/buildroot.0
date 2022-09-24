Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434C2C6FA83
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 08:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B7560B3A;
	Sat, 24 Sep 2022 08:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B7560B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZAewh10PXQ2; Sat, 24 Sep 2022 08:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2413E60AD2;
	Sat, 24 Sep 2022 08:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2413E60AD2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48CCC1BF861
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FEA6401B3
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FEA6401B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E0HVtr_nrDQL for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 08:31:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B9F40067
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7B9F40067
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 08:31:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8B775C0006;
 Sat, 24 Sep 2022 08:31:22 +0000 (UTC)
Date: Sat, 24 Sep 2022 10:31:21 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20220924103121.6c8747c3@windsurf>
In-Reply-To: <20220902221936.969471-1-pevik@seznam.cz>
References: <20220902221936.969471-1-pevik@seznam.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664008282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4imgujQZGGNFMOUuobL/o++KESj7wG60bYQmPJl0vX4=;
 b=jsQBeNGof+m2/czKN7pJIA6suKo7HV5sKZ7fqZIpXArF6VjfeZXKYP0oEF5R59Yt52sLa3
 mSJbrK6ZF6qezhXhgzoQ/iEdw697fMgVhYM6pRnIx1l8qr6p1BTkOredo1vNPodOjof2gM
 vqI6F2F4fg7WHFXb5VZerGrR0NVgrX864V54VwLDrdFfzgWX6XFNPDmOPmDSOQfq8/EXpq
 /Hl68RmJRdr1Yy/4UraeYAEk/bidNEXNUTWY2ZmDQVrqTjXlU8nH7930r8EfK+8619RmHl
 boX3SLUJt4O9puGdSSSPI1lSt6/F8TEfFy2xOxLWjiag4COA6W1OJ4S9SKHaVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jsQBeNGo
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: build
 getcontext01.c on musl
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Sep 2022 00:19:36 +0200
Petr Vorel <pevik@seznam.cz> wrote:

> From: Petr Vorel <petr.vorel@gmail.com>
> 
> It was fixed for musl during conversion to the new API in 0f519d0da
> (released in 20220527).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
