Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4795C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 626AF41E6A;
	Tue,  6 Feb 2024 10:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626AF41E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nI8S64tQzg9g; Tue,  6 Feb 2024 10:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD7F041E84;
	Tue,  6 Feb 2024 10:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD7F041E84
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15C221BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2C6941E72
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C6941E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dttR1apbwdDB for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:34:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E34341E67
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E34341E67
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFE9940002;
 Tue,  6 Feb 2024 10:34:47 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:34:47 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113447.279e114d@windsurf>
In-Reply-To: <20240109071647.4027355-1-james.hilliard1@gmail.com>
References: <20240109071647.4027355-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLj0T15hoWyVY2rTChA4lbepqyPBEXhBx7H96CTKl18=;
 b=IcR6gpWd/+SdIY29uPt9yAJQaEKSINF7Y3LtOJYX3nPEnZcOG8TfT/xWuQXFMJZNsVnTrB
 bB89KO2meeWBPe+hkakwNWmP2dcCi76y/abd4LgRTYIMCSP11M/TeyZIWoc4Gf8IAMfOsE
 dycwZ+17EmKNrirnQz4O3yXw9mRMdTMnv6BFwDY/0NCsg/79e9I53oxjUP3dYRGhJj29d1
 N6HVnmygv3mcRMC3OehRC+PsQxG8FQOun+6EGbMzULJOWVWp8R/zwF/ya4YVH4wKATfJp5
 cHp3yaqCzoDwPHLrhy3hH/6KIXvI94CIemM/Q0aVaTfwapxgr0Orlr2Hqw+jLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IcR6gpWd
Subject: Re: [Buildroot] [PATCH 1/1] package/python-engineio: bump to
 version 4.8.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 00:16:47 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-engineio/python-engineio.hash | 4 ++--
>  package/python-engineio/python-engineio.mk   | 4 ++--
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
