Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCAAC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 22:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D476361134;
	Wed, 23 Nov 2022 22:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D476361134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAVFEcEbIClb; Wed, 23 Nov 2022 22:00:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A137D610A4;
	Wed, 23 Nov 2022 22:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A137D610A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBA3F1BF20B
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A443060BC2
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A443060BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGEd08pbeAKD for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:59:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1FF960A9E
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1FF960A9E
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:59:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC533100004;
 Wed, 23 Nov 2022 21:59:02 +0000 (UTC)
Date: Wed, 23 Nov 2022 22:59:01 +0100
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20221123225901.0c739d58@windsurf>
In-Reply-To: <20221123195304.1582783-4-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
 <20221123195304.1582783-4-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669240743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3ZEbgc/MXvxni5I34ThVWwY3H4jnA6CdTSSKlKF3x0=;
 b=SfGUUKw7JCnJZt3gLtSPN1oJaTW3aaI/SgP8/ggqDucCm4O0NbLscpD3sHc/VuqDmaRUM9
 7JQum+Jst1iHWgMQwsoGtahpecxKBthp3ynlKdj+L9dV0MaJYiaZAAz38A6LzuPZk1JKSp
 4oNQ97lEOQ5P1tQiR7K0pQfs+L/+KYSFwSBlr2LyVX1T/Ow9xgvQnlvzykelIgbXXdO1bb
 vzYXlAhjidVLOaK5T0ecnDi9cLEaeUS224i2DCUsIRimYWPrGIF5IAqBhPTaZDpmmmXI7l
 YIOP49wB3XHZlPfy21tbHhYpI+co77vOpOmT70YaISlGZJFsImUP0kbGJfm3+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SfGUUKw7
Subject: Re: [Buildroot] [PATCH 4/7] package/freescale-imx/imx-gpu-g2d: bump
 version to 6.4.3.p4.4
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Nov 2022 11:52:54 -0800
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> - To match NXP 5.15.52-2.1.0 release.
> - EULA/COPYING: update to LA_OPT_NXP_Software_License v39.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
>  package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
