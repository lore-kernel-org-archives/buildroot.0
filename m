Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591CCC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 154F04209A;
	Mon,  6 Nov 2023 22:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 154F04209A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGcbKjcUD86h; Mon,  6 Nov 2023 22:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A475420E7;
	Mon,  6 Nov 2023 22:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A475420E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E70B1BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7D51415C8
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7D51415C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uFIf4vzIyLTv for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73D9441183
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73D9441183
Received: by mail.gandi.net (Postfix) with ESMTPSA id A565A60008;
 Mon,  6 Nov 2023 22:26:01 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:25:33 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232533.3158fc02@windsurf>
In-Reply-To: <20231105032339.2781378-1-james.hilliard1@gmail.com>
References: <20231105032339.2781378-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkJKa82oFRbqx4yenORriztmSpKDmqpMmxLz5wy+wx8=;
 b=MNxT1Xnvb5drdYjSBSwGHLErtGodKoCPzFh24sBkZVcm7Q/BG0g1A7STDFK+tg+nRLKjNu
 T6l4sUZ88F7MUwbeZiAqGRAcJmB7St3MH5TCkFxz9Og04ATbBVKRDPN5aKMYWojimYhQxl
 uVqM5GdtG/QvYsBkb3lDSgR3JQfAXT5zodZVu1WFD6KjU74Q5UK9sMRKyfGZQr6JyW+hEs
 M5QsOguHQLtSd2voi2wB1EqtCgbR9NMpc0TRDoOZzgTzfj4RayOTQNAM8Mk+bFvDwnLIhm
 Sba5bYttFs1zKoWfQhS1wKPEyiaStB8Nd09Y8EoN0iwK/SXxQ96sNQoJp+U6hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MNxT1Xnv
Subject: Re: [Buildroot] [PATCH 1/1] package/python-crontab: bump to version
 3.0.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 21:23:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-crontab/python-crontab.hash | 4 ++--
>  package/python-crontab/python-crontab.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
