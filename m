Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33FBC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 22:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 497D740111;
	Sat, 12 Aug 2023 22:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 497D740111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHP5chhnU7nL; Sat, 12 Aug 2023 22:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A04BF40150;
	Sat, 12 Aug 2023 22:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A04BF40150
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8EBB1BF291
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 22:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 898A281213
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 22:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898A281213
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0i97nt1rDQTc for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 22:08:56 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8496B81212
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 22:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8496B81212
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F55F240005;
 Sat, 12 Aug 2023 22:08:53 +0000 (UTC)
Date: Sun, 13 Aug 2023 00:08:52 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20230813000852.21a575a5@windsurf>
In-Reply-To: <6691f34e23b7c34d8458417421e7ea27@zgyarmati.de>
References: <20230812175348.1449808-1-zgyarmati@zgyarmati.de>
 <20230812215559.65936b40@windsurf>
 <6691f34e23b7c34d8458417421e7ea27@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691878133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUI9EBwY8nWggX6fKLMqMkiczaEHnCNmNBTkqc3RDdU=;
 b=J/8y+RF/VDvn3FxHQk7+c6RPGtKPXHByMCQaJYbtT9s4Z7pM6zy9Ia6Zt+0zK1fYPIw6XZ
 p4LvSI438slyiG3JCttkTAE3WPMF4kov2lQ2UAq4mXXcQuHpsy8G7jOWwjakMJES+Xbhui
 9DO/e/K3rlqb1yLqcQteCyIxUqsLSS3Qo/H+jdMieP8zazxupgFbGHmx9dAcFmpwZCKrzI
 vpFycYNXgjcijQG17jVsAgSpXtYymkzWKRoMjGcYhS0IM1B5THxFYHqA4n9gfJnCmgJQmF
 WZXY659mmj+K1hfGhqGsJJofsgQzRwTHYyhReMvnSAKVfZOHF5zOtBZRuLZUAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J/8y+RF/
Subject: Re: [Buildroot] [PATCH 1/1] package/libusb-compat: bump to 0.1.8
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 12 Aug 2023 23:54:03 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Thanks for the feedback! Unfortunately this release tarball doesn't have 
> the `configure` scripts and other files generated. Gonna send a v2 here 
> and send a feedback to upstream.

This is totally fine, just put a comment above the AUTORECONF = YES
that explains this. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
