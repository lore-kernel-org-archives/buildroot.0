Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DC0ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA0A418F7;
	Wed, 21 Sep 2022 18:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AA0A418F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6r368EWJQXPN; Wed, 21 Sep 2022 18:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56A76418E9;
	Wed, 21 Sep 2022 18:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A76418E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0AEC1BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAA58418E9
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAA58418E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldr0HAXxz9kL for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:25:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 846DA418E7
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 846DA418E7
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:25:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B71BD240005;
 Wed, 21 Sep 2022 18:25:16 +0000 (UTC)
Date: Wed, 21 Sep 2022 20:25:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20220921202515.778e1db6@windsurf>
In-Reply-To: <VI1P190MB049339702A088B8ABC4110729F4C9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB049339702A088B8ABC4110729F4C9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663784717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2oLlf9Uhwsa/MzJm//xLyk5hQnHAWsMV+sUbpPqBF5k=;
 b=Edjz4wmEETw2P2p/kTlTlAWuHU1Oy3FVStLCiXQ31wSFhiWaiLwDD8QbsnTqVZZ1Q5WeON
 DzqRKYWj3iP3t2dacTyzKK7302QT0DovJ8+PN/t0X7t8Hnyk8fznAbCunoJggpCc9xrUK3
 jKJLONACRCEJzZg880LeSh6j3W153qJnYMLfuPARWtDnLAIedWc0OmfCpwAdfT/r9AJ7hx
 KKIwLgQQ9FBD11WwLQLoqv1mTSiB5y/562EegAs9vLw8vsrRSMH6jMMesEHKiFGESW5lA0
 z/to2mhc/ATuDJ6B4myLDkmaTXFnmu7YZzdo25wdpftfg/rhMji9z5NBRFiMYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Edjz4wmE
Subject: Re: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version
 0.3.3
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 07:52:29 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/libubootenv/libubootenv.hash | 2 +-
>  package/libubootenv/libubootenv.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
