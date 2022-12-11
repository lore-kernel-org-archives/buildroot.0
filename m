Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43F0C001B2
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F4240324;
	Sun, 11 Dec 2022 10:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51F4240324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ck40NCT-5G_o; Sun, 11 Dec 2022 10:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472A140219;
	Sun, 11 Dec 2022 10:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472A140219
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEC281BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD0DF80C50
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD0DF80C50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQXTa61WhwyM for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:40:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5527880C03
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5527880C03
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:40:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 451C440006;
 Sun, 11 Dec 2022 10:40:00 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:39:59 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211113959.2f98620a@windsurf>
In-Reply-To: <20221208223850.32191-1-christian@paral.in>
References: <20221208223850.32191-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670755200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdXSTsyJPSu79PSs2OinlIPmko/Ui0qoLhXshuip+8k=;
 b=AUsm6JXNiKfxleEEP9igRQ1Jm8i0zZboEpW5TMYv3GRKR2SyfNTskWPsL6Ga6A77LCsZUm
 tikisRnu0593htjfAZ9TIyK3M/DBn9FFta/UciFFKppjSfJUvrRA18Csv3bWN0Gcms02kb
 meFNjBPQ1f2KZEYJdGUC1N28+aBX6QY9KX7jDLT4g5xI77TWx/k9QBgvjiUGVKLLKs91AJ
 zJsVSjXr9v+DIfal+CvBWYYN20HCMDuP605iX3RKF7jRysF35ARQ31JZZA6EThTneOds80
 +G310Inyt/wTri5wLYNk3vS77nNlm6uYP4sSjo9dBxrUrg+xaMN+F86QajvVIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AUsm6JXN
Subject: Re: [Buildroot] [PATCH 1/1] package/mosh: bump to version 1.4.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Dec 2022 14:38:50 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Many new features & bugfixes.
> 
> https://github.com/mobile-shell/mosh/releases
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/mosh/mosh.hash | 2 +-
>  package/mosh/mosh.mk   | 2 +-
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
