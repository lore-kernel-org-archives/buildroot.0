Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229B0EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE3FE60AFD;
	Sat,  1 Jul 2023 20:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE3FE60AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LGEni1COqxN; Sat,  1 Jul 2023 20:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CA9160AE8;
	Sat,  1 Jul 2023 20:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CA9160AE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6117A1BF2BA
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A1EC4010C
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A1EC4010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TR9G4_JZ6X_P for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:01:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AD1E400C6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AD1E400C6
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:01:17 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09CA6FF803;
 Sat,  1 Jul 2023 20:01:14 +0000 (UTC)
Date: Sat, 1 Jul 2023 22:01:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701220113.3532c8a0@windsurf>
In-Reply-To: <20230620054325.2652382-1-bernd@kuhls.net>
References: <20230620054325.2652382-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688241675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bW70038C+wKM+iC76L2+RxuYRhFxShfs2fny4mdKwMw=;
 b=epC1WjicvCk6YsiUQmr6xlKLR53hjpWa58LVRAnggoppBgWPI3kGVlxstB9f2OlhQzC1YF
 fBQJoL67Vb6hnH5aIqYdDBp2c3/D46ttOC8XflHD3eoyKk5uCV4f+PCGZ3JLrSgg2FzKCh
 YPklEDgGDxDvNFICKmfNeCjcXRouJsEryDtkNGFaKVxf+igSf3mFwbmoqm8wF9jbhZ7YhC
 lLLcF4B1midx1PiaqKj9fy5CPsnvgxoPlB7oWBol5bgrl/c7OMFOYo8doulXfvgMjEmQSD
 NF9gmnizVFszbDytR+0YQ/2tiHPae3VMzvNeg32nTTefYNGin833IRLYT+m9OQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=epC1Wjic
Subject: Re: [Buildroot] [PATCH 1/1] package/lightning: bump version to 2.2.2
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Jun 2023 07:43:25 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.gnu.org/archive/html/lightning/2023-04/msg00004.html
> 
> Fixes:
> http://autobuild.buildroot.net/results/c50/c50fa2d861c634eb0800cf551fc4a7e5fa5752bf/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/lightning/lightning.hash | 2 +-
>  package/lightning/lightning.mk   | 2 +-
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
