Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D0FEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4ABD6120F;
	Fri, 28 Jul 2023 21:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4ABD6120F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j42lPpfNRfBm; Fri, 28 Jul 2023 21:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFBDC614F1;
	Fri, 28 Jul 2023 21:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFBDC614F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B4D21BF20B
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 045F48454B
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045F48454B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xl0vfLryedtF for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:59:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C64A084500
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C64A084500
Received: by mail.gandi.net (Postfix) with ESMTPSA id 886FC40002;
 Fri, 28 Jul 2023 20:59:53 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:59:52 +0200
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20230728225952.70b2d130@windsurf>
In-Reply-To: <20230527081151.59902-1-raphael.pavlidis@gmail.com>
References: <20230527081151.59902-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690577994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dr4SqvPgXzGBWL6gov9Xx0kvPJyGvqMzk+0l6ri2liw=;
 b=CjxwYGtQQUDrMocZph4AwmBIUEP5ClZULQdXRv6fCo6ysPKHG3psI05gUeXMEwsGxaP0XU
 4XPH4NAiqgDsiya6IZylbFcf4JFXx6iPLO68HaE0e2XM1qSHJ36ku1r/mEMfLcDN2lInhq
 fkWSgzxNSXrvky+wiTCuVJdok4xxaLQxqnMNTNoEAkyPs9Lg9y6vfA94ZN8wacVLmfTm/i
 cZlM1Ot00bv6RCzLoGiawrdxo/mSC5Ytte9x/QAj2j3jambIpFge7bVvQ61sR9wddFwqpe
 x/PBnvVi5L8UNE9ZqBYv8ad8IHyWPa9RAS0oJw0s5YnOzbPde5UGtWIkS2127Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CjxwYGtQ
Subject: Re: [Buildroot] [PATCH v1 1/1] package/x11r7/xwayland: bump version
 to 23.1.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 May 2023 10:11:51 +0200
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>  package/x11r7/xwayland/xwayland.hash | 6 +++---
>  package/x11r7/xwayland/xwayland.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
