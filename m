Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3677AC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3771404D8;
	Wed, 28 Dec 2022 20:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3771404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id auzOwKFl_wGj; Wed, 28 Dec 2022 20:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 204EF40574;
	Wed, 28 Dec 2022 20:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 204EF40574
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBE731BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5BA5403CC
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5BA5403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBMrnaldIzPC for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 20:02:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75DCE40356
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75DCE40356
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 20:02:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BA96AC0002;
 Wed, 28 Dec 2022 20:02:23 +0000 (UTC)
Date: Wed, 28 Dec 2022 21:02:22 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221228210222.3efdf575@windsurf>
In-Reply-To: <20221228181149.2433577-1-bernd.kuhls@t-online.de>
References: <20221228181149.2433577-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672257744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dEQ2yNnhBa474g1PKdm/fbeoJrUwHMl8TjSZw5edYV8=;
 b=HTgcbw0Q85BsN+MT3Va+CGPGjdu9b8VSLnnY6LmtusATToJNTrmhNnr6OQGqeIq7QQ+GqC
 uEx580e0ko46VPjcj4e6DE2TYuP5DufW3RAfQruF25LeTGF04peZJFeDWH1TJ38zt2huh6
 1BwYydqloxXeIEc0qHxGxPhgv1hJuKEOoginlK+bDNPXtD4tBNcz+9tmGnPWvOc87gqulG
 wn0sq8dM9gbujDNWj09ZqqsZs2IW1XTMdfQTGbcPkgxaWh6p/vGP7eCBlyzPIbPNwSYeho
 P0CPpSnVN87RTYs4APM3pgJsGrEfemA4Kf34zmjGEAtW0LRTGyiKbYahE0SOCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HTgcbw0Q
Subject: Re: [Buildroot] [PATCH 1/1] package/rng-tools: fix build with
 updated jitterentropy-library
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Dec 2022 19:11:49 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Commit a8807ddbe2 bumped package jitterentropy-library to version 3.4.1
> which broke building rng-tools.
> 
> Add two upstream patches which improve jitterentropy-library detection.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a6f/a6f1381b3d1aa2a27412286167f5c8be5f6fdaf8/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ropy-detection-to-look-for-the-setti.patch | 30 ++++++++++++++
>  ...ropy-library-to-timeout-fail-on-long.patch | 39 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch
>  create mode 100644 package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch

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
