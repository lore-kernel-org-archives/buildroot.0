Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FF9C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B720640BE5;
	Wed,  8 Feb 2023 11:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B720640BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OA6vWsOOu3j4; Wed,  8 Feb 2023 11:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FE2440BE2;
	Wed,  8 Feb 2023 11:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FE2440BE2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E10771BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BACC5610DA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BACC5610DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mE3A6MzhUB8 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:13:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 457A6610C4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 457A6610C4
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:13:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4F1B4240002;
 Wed,  8 Feb 2023 11:13:56 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:13:55 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208121355.07893b6d@windsurf>
In-Reply-To: <20230207171721.2973997-11-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-11-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675854836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85o9ruNcq3msI1aSWabpehAzyWzmN+jkrkRwjxnsYkI=;
 b=lzHPW6kxd6RDBrq8gask/azqR3V874hAym0mt76keNmCZhMCoa3HyHBRjE8125cA32G2w9
 YFRd3/VW71jxByOsSnaQ64mc75nQyGBpbX8xT9J3zq2h5bFtmPYMZ8zCF9UIjN0q2Oe7gk
 IRk/xheBxeG8l4GYgNha4kNJWicW6EYig0K1vVrDmR9fpt+EpWT3iF1WwNQRlWYilxi5Qa
 Tjtt1WStetoiS1/7mIdgo688FZcdM4wGkGNuXM8IJByI/Cgu894ano96P9eidtyyd/nDaX
 l9ywR0jYdfU2suncFK1zaGGVnuZOTl2OMmV10d/APQJF/udzsCll6KveMSaLiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lzHPW6kx
Subject: Re: [Buildroot] [PATCH v6 10/13] package/qt6/qt6base: add support
 for kms
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
Cc: jesseevg@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 18:17:18 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Jesse Van Gavere <jesseevg@gmail.com>
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/qt6/qt6base/qt6base.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
