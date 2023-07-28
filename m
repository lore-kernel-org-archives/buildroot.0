Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57E8C0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F8A784528;
	Fri, 28 Jul 2023 19:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F8A784528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHJ232fwc-k1; Fri, 28 Jul 2023 19:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B88E584549;
	Fri, 28 Jul 2023 19:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B88E584549
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A89201BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F4B842172
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F4B842172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlz4SgFzKAAN for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:17:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F15642171
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F15642171
Received: by mail.gandi.net (Postfix) with ESMTPSA id 892931C0004;
 Fri, 28 Jul 2023 19:17:41 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:17:40 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230728211740.1cc13dde@windsurf>
In-Reply-To: <20230728064123.1220713-1-christian@aperture.us>
References: <20230728064123.1220713-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690571862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxCzEPQ5WuSu9DiScXlezpgpgtk6SP7OrT1V4/dIcWw=;
 b=F1kp4lCAZNrTSszzzRwE3UP2M6b0gmLGk3Pi2ZHtsogoSWARZDguifnsj7BGeFvwlOL7dU
 8KKHOYsH8EfiSkMzEOXx/2vPhDCGa7Ykz18pfAnW7d4wUt5AO8MDiT9PAZwyKbS6nALFqq
 BsA7UEnGgwUmKAoVHSGWs1Nls30wnDpqfs9yM+OT8QrDVPX5lW4R68nzuyJ4egVo+6D+r4
 L8ftB1MzSbC5bkpMyy1Wcg1flan+zvVLTxiYfMNEldPg/trFjcDdU6HwNZqSoAFQUMih96
 zbQJGrEYVg7JvOSKbUu3nKqPK0y3fiuxdbCZj0OrCKohYXGxXods9H7t7nj4kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F1kp4lCA
Subject: Re: [Buildroot] [PATCH v2 1/2] package/docker-engine: bump version
 to v24.0.5
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jul 2023 23:41:22 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Bug fixes & enhancements.
> 
> One major bug fix included in this release: The Go client now avoids using UNIX
> socket paths in the HTTP Host: header, in order to be compatible with changes
> introduced in go1.20.6.
> 
> Previously docker commands would fail with "invalid Host header."
> 
> This supersedes two other patches to back-port this fix to Buildroot:
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20230717041047.1510851-1-christian@aperture.us/
> https://patchwork.ozlabs.org/project/buildroot/patch/20230717041047.1510851-2-christian@aperture.us/
> 
> https://github.com/moby/moby/releases/tag/v24.0.5
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
