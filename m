Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2693C43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A0C340ADC;
	Mon, 18 Jul 2022 10:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A0C340ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-5XecWiOvz6; Mon, 18 Jul 2022 10:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43E7D403A5;
	Mon, 18 Jul 2022 10:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E7D403A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E79BF1BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7F9C409F1
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7F9C409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2O5arVsS5Kt8 for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:05:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 281FD40947
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 281FD40947
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:05:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36A611BF206;
 Mon, 18 Jul 2022 10:05:38 +0000 (UTC)
Date: Mon, 18 Jul 2022 12:05:37 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220718120537.5c77cfb0@windsurf>
In-Reply-To: <20220718043901.873466-1-james.hilliard1@gmail.com>
References: <20220718043901.873466-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658138738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XwUwEj7HJAtXR4Og/rdb4Q93nxQ0I18WOCOIGN0584=;
 b=BUguW6jZljJa9HMQGxeG+FdDnJooKGrG/wYEtbVEV19fcX3fEkhpqS4+pWtGd54dML8o5T
 rDHFS9im6+ONb0/L4FDPLyzlEU0/6BXBC8//ArhqgOeQgY8XKjWyWiCagdMNMNy8nFiD7s
 gH052nkard9rUYjvwe74P/xx7smUIBKqwKSrLwRk4k26N0KWMbyTY3EGkFbxrnbG66R+rd
 S62lppNuy+SPonvA8TcLo5ouHbfTDQKl9wKwaqvlo6OsOGpJ+07uae8hfj5x4AfKUj/VsP
 Z1rXlwt73gSfsxRd/8RJT/uCnHch48sjslX1RKKyhIN+colBH97P8NM79RjGqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BUguW6jZ
Subject: Re: [Buildroot] [PATCH buildroot-test v2 1/1]
 scripts/autobuild-run: make hung build timeout configurable
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

On Sun, 17 Jul 2022 22:39:01 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> A reasonable value for this may vary depending on system load, specs
> and how many parallel builds are being run, so we should make it
> configurable.
> 
> Tweak LoadConfigFile parser to properly convert arg types.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I am just wondering if it really makes sense to make this configurable.
Indeed, it's very hard to figure out what is the "right" value.

Have you seen specific problems with the current timeout?

Thoas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
