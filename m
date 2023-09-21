Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DB9E7070F
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 10:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1C1283C46;
	Thu, 21 Sep 2023 10:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1C1283C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BICG-rvj6u_V; Thu, 21 Sep 2023 10:32:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B18B812AF;
	Thu, 21 Sep 2023 10:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B18B812AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 001EA1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCA6560BA7
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCA6560BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3CLEtIgQVAx for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 10:32:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AECD460BAD
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 10:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AECD460BAD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B2EF1BF211;
 Thu, 21 Sep 2023 10:32:19 +0000 (UTC)
Date: Thu, 21 Sep 2023 12:32:19 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230921123219.4ae575e9@windsurf>
In-Reply-To: <20230921041955.72520-2-dalang@gmx.at>
References: <20230921041955.72520-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695292340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWbu1qXdnsNZd8OHeR1gjkznepeWqbI1cfBa7WTAEO4=;
 b=CEjHd4Eo27jBpif7JCR1ENxfQRyobPt1OhcU7TPruW9i45JRKJys8kkhj20lTu8tSaauZf
 GJZ546lqQ+D3my6MzFFaqPP2jkegEvi1T0BV5jivS13f/NGia1QAvObDk0VYB87zKUARHB
 Uf4c1UofKoiAn2MBdNeVpavHv5NUJgUF4QVcKRzexiJbBVvl70WLQ+S8kMoaBYcfxjQriR
 RwUGimeMjxXmMebBP3KXACyqmgNY56B7wDRYzQA4lkIFbpFKIvzrXY/SwndAgjV8k4e4Ct
 /JeXPJ9ANR2JHQ+dG1BDFxzJNfe4lfPytL97BrHyeECVf/phuxFxU0T3smGBBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CEjHd4Eo
Subject: Re: [Buildroot] [PATCH] package/tar: drop CVE-2007-4476 from
 IGNORE_CVES
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

On Thu, 21 Sep 2023 06:19:54 +0200
Daniel Lang <dalang@gmx.at> wrote:

> As off 2021-05-17 NVD added 1.19 as the first version that isn't
> affected by CVE-2007-4476.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/tar/tar.mk | 2 --
>  1 file changed, 2 deletions(-)

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
