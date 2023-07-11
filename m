Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE49EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F39402AE;
	Tue, 11 Jul 2023 22:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F39402AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gcW8SMYWYye3; Tue, 11 Jul 2023 22:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2963140360;
	Tue, 11 Jul 2023 22:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2963140360
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 349571BF2C0
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17B6340169
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B6340169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7HueZNGJgmg for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:18:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5B0B40360
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5B0B40360
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:18:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 431491C0004;
 Tue, 11 Jul 2023 22:18:10 +0000 (UTC)
Date: Wed, 12 Jul 2023 00:18:09 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230712001809.6d2a6e05@windsurf>
In-Reply-To: <20230610120818.968354-1-christian@aperture.us>
References: <20230610120818.968354-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689113890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IvISA0SQFFDZaucyL9i8PkqZe7H7C0JcJtmWlbhCi0=;
 b=OfmipU7TtU5orQ0K2f/IQ1hXYKp17uMfq8ChVEZJb+lY4bZd38VZz753sbQ14XzOC1TFcR
 sNwM6qrXerjHNTbUZE3q9aJ1WwWDmSK+EN6YH1dj/q9pJORR1Knpp/McmLJuzvCnIvfJSB
 838tPa5sRQ6n2V7cssZoE5/qbEpmPP9vboWLCR20BOEIIhaymsv/NG9b5zCKAURiOc7e9F
 +rbAep9ie6SKnjbvn+1ZtJxenv0D+S1y7kDfKGpiquGxwE/jvRqUDoYU1Er9L4E0VcHPi4
 0OcX9DqyNkFbXF2m8Zj0fXTTIDWkComSFnfMo1Pvfj1qI4YTJupSiuCqOWee3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OfmipU7T
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: bump version to
 v24.0.2
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Jun 2023 05:08:17 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> v24.0.0 release notes:
> 
> https://github.com/moby/moby/releases/tag/v24.0.0
> https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A24.0.0
> 
> v24.0.1 patch release notes:
> 
> https://github.com/moby/moby/releases/tag/v24.0.1
> https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A24.0.1
> 
> v24.0.2 patch release notes:
> 
> https://github.com/moby/moby/releases/tag/v24.0.2
> https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A24.0.2
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
