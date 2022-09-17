Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A0FC6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3843404AF;
	Sat, 17 Sep 2022 08:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3843404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AD9HPaFZgYIG; Sat, 17 Sep 2022 08:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B17B7400CC;
	Sat, 17 Sep 2022 08:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B17B7400CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7721BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 205D481A29
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 205D481A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DIiGQPzK5PV4 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:13:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D181381063
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D181381063
 for <buildroot@busybox.net>; Sat, 17 Sep 2022 08:13:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 940CC1C0002;
 Sat, 17 Sep 2022 08:13:53 +0000 (UTC)
Date: Sat, 17 Sep 2022 10:13:52 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220917101352.4e0fafff@windsurf>
In-Reply-To: <20220913181841.2703389-1-francois.perrad@gadz.org>
References: <20220913181841.2703389-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663402434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vrH18iYa33EMi6e+7eFSdRwnO/0F4B6BwgJRIEw814Q=;
 b=kfm7OCgz+pGRpsjKHR80E1RY6TTOUu7SMUDdbD8Swsjby+IjpldZ154DSHy2DkOUe7Eiub
 Ub/RcgY/nm9EBl8oKJggjwaDKFoy1g9tbrgZdId25zDinCY2br6tA4AvY9rLqiZy59aE3U
 3I/0Bk7gqjVYbpOaG+dTDQqNOJC5tdWsriNgeyY0PyqjzYPNFgoW+AB0taGZ4h0Wgjuvg4
 4OgEltDPNkeiT6osa/TzciyxXDFRywBWplvLvz2hKa4cQymTwH+yTnZx+kQkmAsRCZngRG
 xZkJ/oSfYJI9RtJh4vAO8LyqA+I3mbo9QImUYkCMmuTwqbWrhu9BsDP30GwUSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kfm7OCgz
Subject: Re: [Buildroot] [PATCH] package/libxml2: security bump to version
 2.10.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Sep 2022 20:18:41 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> COPYING was a link to Copyright, this link is now removed
> 
> with 2.10.0, fix CVE-2022-2309
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libxml2/libxml2.hash | 6 +++---
>  package/libxml2/libxml2.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
