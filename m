Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91D1E7070C
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 10:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FA883C3A;
	Thu, 21 Sep 2023 10:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82FA883C3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFCKyY7-zWhc; Thu, 21 Sep 2023 10:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C77FC812FF;
	Thu, 21 Sep 2023 10:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C77FC812FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E9931BF3C2
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ADA6812FF
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ADA6812FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfREq3Ye1Xtq for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 10:30:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5948F80D2B
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 10:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5948F80D2B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76BFC1BF203;
 Thu, 21 Sep 2023 10:30:17 +0000 (UTC)
Date: Thu, 21 Sep 2023 12:30:16 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230921123016.0f3bff25@windsurf>
In-Reply-To: <20230921035827.70379-2-dalang@gmx.at>
References: <20230921035827.70379-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695292217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yljQ9iEl8j0Dg87W+Q3KLMxQc/AKKStkTxizMDEtMM=;
 b=mRxL6Yr2+QR+r2ZP/AAqOcB3wRa7Ws5o5FZWkjPFM6Y9pi36rKlCYMs319PpOpf09wrTg2
 leNiRthL4KFIQvAoljXds568SEm/Fcnlx9cFSnxWt3tKHmsmfxwafb57bs02NqfXm1i14X
 4r9mtBpOZjwswwE710mU6HL0tM/JUTFQHkj8ecWF53bRWiYsAQy/yCWOCJupb754xVpyvx
 zlArt2sX1vlCuVQuD75PrPtFwRpoWLPp8X+GX7EI/UCdYzGtVTboAqFSbNZ863euXegIgT
 KKMX1BYWVW9x652UB0t0gXCvtWiUp5ayKbut9XHBSLCr8J01EZcoVMWZmlQRag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mRxL6Yr2
Subject: Re: [Buildroot] [PATCH] package/fail2ban: drop CVE-2021-32749 from
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Sep 2023 05:58:27 +0200
Daniel Lang <dalang@gmx.at> wrote:

> CVE-2021-32749 affects fail2ban <= 0.9.7, 0.10.0 through 0.10.6, and
> 0.11.0 through 0.11.2.
> The mentioned patch was removed in 76853089 when bumping to 1.0.1.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/fail2ban/fail2ban.mk | 3 ---
>  1 file changed, 3 deletions(-)

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
