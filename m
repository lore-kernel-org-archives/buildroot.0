Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C2EC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 10:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6A8460E5D;
	Wed, 24 Aug 2022 10:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6A8460E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZ-lWI3PFpBp; Wed, 24 Aug 2022 10:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F4B60E40;
	Wed, 24 Aug 2022 10:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15F4B60E40
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C468B1BF592
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A01FE40B0E
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A01FE40B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4bv3o3I8M5z for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 10:39:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC3F40105
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EC3F40105
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 10:39:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 52B8E24000B;
 Wed, 24 Aug 2022 10:39:56 +0000 (UTC)
Date: Wed, 24 Aug 2022 12:39:55 +0200
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20220824123955.372ad8bc@windsurf>
In-Reply-To: <20220824030229.2531548-3-chris.dimich@boundarydevices.com>
References: <20220824030229.2531548-1-chris.dimich@boundarydevices.com>
 <20220824030229.2531548-3-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661337597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NnYQQKcmG0M6JQJtdOh8zPtaguB4ku+5p17tzpXs4dM=;
 b=oODzeEUxZz5RmrcGFcU+1u+KZSV3Nif73vSLGYpDjMV6R0WNgMF3+z4ifBGf+PxECltLvR
 QcnNCevs1gu464ToeqhyTrylBXaD01nNtp0lh32U91zxvQvwTrbL6QZk1kKKdmIulN8xfo
 nPlRyW55nYz6AombP5PJGBdLkXd65XCGe8D4aty/NnmN9pQyJuvU5DplA1RRXaTbOEA81N
 csSEGdiMDL1FV17QIcMXtW6pHwWVBQRR2ekRd2plHlK04o5eha5ksMfUA0xJMIvs72QNKi
 4bZr1TUyUlAp6dOW+VAEN//T00ZZU9vWhNy5BNRJH4znIqlnYsvMOkJewNrPTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oODzeEUx
Subject: Re: [Buildroot] [PATCH 1/2] configs/nitrogen*: update kernel to
 boundary-imx_5.15.y
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
Cc: Gary Bisson <bisson.gary@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Aug 2022 20:02:28 -0700
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> Also bump linux headers version to 5.15.
> Based on NXP 5.15.32-2.0.0 release.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  configs/nitrogen6sx_defconfig | 8 ++++----
>  configs/nitrogen6x_defconfig  | 8 ++++----
>  configs/nitrogen7_defconfig   | 8 ++++----
>  configs/nitrogen8m_defconfig  | 8 ++++----
>  configs/nitrogen8mm_defconfig | 8 ++++----
>  configs/nitrogen8mn_defconfig | 8 ++++----
>  configs/nitrogen8mp_defconfig | 8 ++++----
>  7 files changed, 28 insertions(+), 28 deletions(-)

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
