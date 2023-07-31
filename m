Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AC4C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 12:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF8A8179B;
	Mon, 31 Jul 2023 12:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DF8A8179B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7lGWsOHcNBYO; Mon, 31 Jul 2023 12:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBAAD81776;
	Mon, 31 Jul 2023 12:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBAAD81776
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14B251BF3CA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF6B840489
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF6B840489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZ0BSwqYcjfa for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 12:51:59 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 926E74016D
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 12:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 926E74016D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 484C520004;
 Mon, 31 Jul 2023 12:51:54 +0000 (UTC)
Date: Mon, 31 Jul 2023 14:51:53 +0200
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20230731145153.638a3898@windsurf>
In-Reply-To: <87zg3c1d1e.fsf@tarshish>
References: <20230731122022.1686951-1-robimarko@gmail.com>
 <87zg3c1d1e.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690807915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uAt6An3Keh+sCWzfx193Y9bFUXxTUFJ6ir9WqcBR3ek=;
 b=LK6M+zsoKiHXMJHUAfzkxn8xvPTuWfUKwos1zyOtiIULFqJbx1uvBDgPtakvnzeUrMJZ8J
 Cms8fqZpuetiA668gUa7zNLQ+zu3znWuK/lGPR65xb+uGXm+FM7aRHctLJCaN/I/oZbxJS
 n4beRyZtePdetQn5jmsyo66rBMod9PAneX80qcdgggKS5ItVGPaNz0BLCAYQ8JW5HtDtBo
 vqIReq6x35FaIEa6DZtyP+h64Ff4f11qTUyA2GRgfSKcmyVbgHFC358fGlxBN8p2LoLjwg
 rJms6xgPy1CY8TluaBJhRbGKirY+5Bp3ZbBu4vW4nN+BdzdjtLflqABaw6V0kQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LK6M+zso
Subject: Re: [Buildroot] [PATCH v2] package/mhz: add new package
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
Cc: Robert Marko <robimarko@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 15:24:14 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> > +define MHZ_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" -C $(@D)  
> 
> Are you sure you need TARGET_LDFLAGS here?

What about:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

This will also pass LDFLAGS, which is used by the upstream Makefile.

Thoams
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
