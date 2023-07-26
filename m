Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBF2C001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 20:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 715E781FA2;
	Wed, 26 Jul 2023 20:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 715E781FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-c247IdWXKo; Wed, 26 Jul 2023 20:01:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC42982ACA;
	Wed, 26 Jul 2023 20:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC42982ACA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 158071BF336
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC52C40B81
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC52C40B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ru8NLfnn30vp for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 20:01:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9892D40A59
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 20:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9892D40A59
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B4491C0004;
 Wed, 26 Jul 2023 20:00:56 +0000 (UTC)
Date: Wed, 26 Jul 2023 22:00:55 +0200
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230726220055.7e901eec@windsurf>
In-Reply-To: <4498335.LvFx2qVVIh@kilian-aisec>
References: <20230714064413.11433-1-kilian.zinnecker@mail.de>
 <20230714234326.1ab918e8@windsurf>
 <3751483.kQq0lBPeGt@kilian-aisec> <4498335.LvFx2qVVIh@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690401657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=torrjviK/seJnUvzi0BBtsdQIbgLP/p/6dX/4J9tpnU=;
 b=nvMRuEmYk96oMLroEeIsuFy5yiM/LsYLj/hjjO2YM+oOdu3BHJJlMCZKYzjzNwiI+9+dLv
 NvpR47cDkZ1+N9Fbc+rckKIpPsPw5uEboG9U4avXfeSXml/otlGevG9JsHDkm+Zca9O/jG
 wH2tHzhjKuo3FCGCYhFsvyQI4+W0ZAwWdk3brKvV1TRY5Ph/OCQBNXM+hzvk+0fCkuGHqv
 GclAr0+8/lsLlx2jHYIUh8jVMCVQ3Yjs9k/eZb0Bn9y0UxD4Aoey7LhmptbAuKEfrwZ3oT
 xfzwNwEtvCaSKT+G7oiOuRKbdZ5zqf13HVjwmWNKw/9nH+MbyVcXhNDKmj6vHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nvMRuEmY
Subject: Re: [Buildroot] [PATCH v6 1/3] package: add rockchip-rkbin package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>,
 Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jul 2023 20:28:56 +0200
Kilian Zinnecker <kilian.zinnecker@mail.de> wrote:

> It does allow redistribution of the binaries. I made an 8th version of the 
> patches, removing the "ROCKCHIP_RKBIN_REDISTRIBUTE = NO" and adding a 
> "ROCKCHIP_RKBIN_LICENSE_FILES = LICENSE". I sent the patches to the buildroot 
> mailing list. Are there more things, which would need to be fixed, or would 
> this be sufficient to add this board support to buildroot?

I've seen your v8, thanks a lot for your efforts! I was precisely
talking with Yann E. Morin who told me he was going through your patch
series right now. Expect some news from him soon!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
