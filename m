Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07F5EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914094007B;
	Wed, 12 Jul 2023 19:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914094007B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GH22j7FhjYS4; Wed, 12 Jul 2023 19:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3A641F19;
	Wed, 12 Jul 2023 19:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3A641F19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDEBA1BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1728404AE
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1728404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phZqhI5eMtXA for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:51:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67B814015A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67B814015A
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:51:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32359C0005;
 Wed, 12 Jul 2023 19:51:17 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:51:16 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230712215116.6df58c7d@windsurf>
In-Reply-To: <20230711224449.1799384-1-christian@aperture.us>
References: <20230711224449.1799384-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689191478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=co1XepN+RWkvIzl02i6Z+43Gh77Wc1sVc2lrzRr3qDs=;
 b=XeW+7rMTU/nxhXMFedhw0NEmDjz/NBlcteSqhmkOty4f90kQOC10j5aFxkCJGKxCIXM6GX
 FhRqnIkwQfFlPAjc4/o1wZQZcC5oWzjVpHgqsdPak0cXfA/xCqGoYLWnIXPLiGq+IctHUg
 YUtgJg/51O0weCbWGg0lk9LgQOe/Kvp5dfX9hxA1LPYEFrK9OFWpsL4otUlKakRBvhRHqA
 iZloIVDArjPuB+nxd6yJYgdINaOfENxw8xRFjmN9nqjV7P8WH594PnY/mLeCS2oSdI4Xnr
 bDigX5pW2+plgbJ+nEojyAYSfTLG6ZyynlvJ1h4+IFAer2/hSkzGctG7EfI1xQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XeW+7rMT
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump to
 version v2.20.0
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
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jul 2023 15:44:49 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/docker/compose/releases/tag/v2.20.0
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/docker-compose/docker-compose.hash | 2 +-
>  package/docker-compose/docker-compose.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
