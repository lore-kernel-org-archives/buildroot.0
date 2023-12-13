Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A123C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF84E419BF;
	Wed, 13 Dec 2023 20:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF84E419BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-t3C4cCyooK; Wed, 13 Dec 2023 20:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C093540399;
	Wed, 13 Dec 2023 20:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C093540399
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2A2C1BF475
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 20:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB539416DA
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 20:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB539416DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDNDgnHx4Y8P for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 20:24:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CC12416C9
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 20:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CC12416C9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E976240003;
 Wed, 13 Dec 2023 20:24:17 +0000 (UTC)
Date: Wed, 13 Dec 2023 21:24:16 +0100
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Message-ID: <20231213212416.642d5dab@windsurf>
In-Reply-To: <CAOf5uw=zfi=zOPh=K-kaT5MmScBxqod3okjxtnK600qn4_sZpA@mail.gmail.com>
References: <20231209214918.2071047-1-michael@amarulasolutions.com>
 <20231213210804.39fe194f@windsurf>
 <CAOf5uw=zfi=zOPh=K-kaT5MmScBxqod3okjxtnK600qn4_sZpA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702499057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mzjwk1Yk6CfeLCJKmrYnH1bnRpbLfc4UljNiE9S8mPg=;
 b=DKtMa+/pS/1e5y/7bQAE61MzMU4i3Hfr+o4p+7rx7cMa3luNwJVq2hzzWUgTS992wSazKg
 8OAUJNSSINQU3g3Rxok540BWtHH2z5F7BHPHhDVS9uo1yOiyxe6UAjmckx7kYRbLb2gBZl
 FB6WAFiehvcp0Qur3A28Kzf8ZuKMCbJfkJ4JE76HpotpvvMqjLo8DJ3/3iTCImWuC6sYzR
 jCyw36OSng5+4A3GuoVH8oCaj2WDU07qY3nC5IdwMjrD9gCb414uzJPOMGQipQlQ5HyTtG
 gfPwzbk3d3lgIIgcTLLE1UIs2iN+2fVzOgUBZoben+Hd+ER9mvKbWSade2UFcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DKtMa+/p
Subject: Re: [Buildroot] [PATCH V2] package: gdb: Add helping kernel gdb
 functions compilation
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 13 Dec 2023 21:17:34 +0100
Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:

> My V1 was addressing your concern?

No, your v1 was just adding a Buildroot option that allows to enable a
kernel option. This is useless, as you can simply enable the kernel
option in question, and it doesn't make any sense for Buildroot to
replicate 1:1 each kernel option as a Buildroot option. It only makes
sense to do so when enabling the kernel option requires that Buildroot
builds additional host tools/libraries. But for something as simple as
enabling CONFIG_GDB_SCRIPTS, just enable it in your kernel config.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
