Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FC7C43217
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37DA0813C3;
	Mon, 14 Nov 2022 22:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37DA0813C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9kCl0alITcLs; Mon, 14 Nov 2022 22:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D7780C09;
	Mon, 14 Nov 2022 22:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70D7780C09
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 283281BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02A7F40217
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02A7F40217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IvI1Pkax_Gb5 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:14:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6C2140155
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6C2140155
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:14:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DD8E5C0002;
 Mon, 14 Nov 2022 22:14:55 +0000 (UTC)
Date: Mon, 14 Nov 2022 23:14:55 +0100
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20221114231455.361b7885@windsurf>
In-Reply-To: <20221113100914.1012977-1-fido_max@inbox.ru>
References: <20221113100914.1012977-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668464096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HDDMU1Yyi9JUnnCVlGaPGxFT3aR/IqseMIMRr0yvoo=;
 b=b0MqB5qJ+gCglaY4owRCQBfWg7bFslK78bbx6HkvoyvtP9RqUDXTXb/sugMzkEnfSCsmzw
 yA8Z+M0fSfohJ0lUY3M7hkGHIgLv0TKBfn/XrOZn62M8ZbPvLeTGD2utzZTPBgbr7KCUbv
 i5g01vv0Y4Jomi5HrYrpGaYvVgc5baI1+sQXYraKwLqurx0BULi5MRXDK/+jdpb1MeENjN
 MvnXEM4lZJiSJaM8vmoESrHLs8VlQhR203QdKA2l0Is8k4gv/rW/yDIJ5bSEJ/QJRNI+xY
 F7/YODE9hCepnz5I1/aBlbZdjyIreb3FlSljyHnjCKvbVp6xRSvs8IqhGTq6aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b0MqB5qJ
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.3.2
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

On Sun, 13 Nov 2022 13:09:14 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> All patches are merged into upstream, so drop them.
> 
> https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.3.2/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  ...e-forced-static-linking-of-liblwgeom.patch | 31 ----------------
>  ...kefile.in-do-not-force-static-linkin.patch | 35 -------------------
>  package/postgis/postgis.hash                  |  2 +-
>  package/postgis/postgis.mk                    |  2 +-
>  4 files changed, 2 insertions(+), 68 deletions(-)
>  delete mode 100644 package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
>  delete mode 100644 package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
