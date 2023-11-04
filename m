Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8F8C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7ACF822ED;
	Sat,  4 Nov 2023 14:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7ACF822ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqbat2Nya4sW; Sat,  4 Nov 2023 14:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7EC82330;
	Sat,  4 Nov 2023 14:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F7EC82330
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EEF81BF2AB
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 081D782300
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 081D782300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAzG7Liw7F4v for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:13:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11CF6822FC
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11CF6822FC
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDC42E0006;
 Sat,  4 Nov 2023 14:13:01 +0000 (UTC)
Date: Sat, 4 Nov 2023 15:13:00 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104151300.0d28f6c8@windsurf>
In-Reply-To: <20231104140524.46968-1-fontaine.fabrice@gmail.com>
References: <20231104140524.46968-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699107182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=di9Igvjoh6WeHRI3B7RaEmjIvqfJ3c0FFfIlrbWvhPw=;
 b=d0ilD+pOKjJDT9c2m/RKDuHD0hNaqOHbaMKTWF6s7funJL4ViY2M4V9srmmfsS0wtLGZ8H
 dpoofMFn7BvF2LmYzAA7j2OUQgJhY1da7Fdb+MfOd3twP1U1YzWpw5lr4gB+MJTDiKV47v
 HelWXEEfb172yQpps/5fSwTy3h5DxLBi8At4fevYrCQL4b3762/+hs1z7dZfYbErMKn92X
 ViKLhIPF1HY6BnyyuSZ77zb0B6ler4ugJT5TwC8Ha9LrukBhKO1IoJXg7iwRqJ2rYqBlpU
 OhP7AM6Bw75jFpEPLzOiPg+HJ667gaVxeEFQTj8PZLdRu3vRdA/zRmrQI9N9sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d0ilD+pO
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/freeradius-server: fix redis handling
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
Cc: David GOUARIN <dgouarin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 15:05:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> redis handling is wrong since the addition of the package in commit
> 736c4c1655d93652a9a7e79235bbe726b3d46176. Indeed, freeradius-server
> needs hiredis, not redis
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Drop rlm_cache_redis

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
