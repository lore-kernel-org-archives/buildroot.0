Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C749BC61D97
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 08:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7062940133;
	Fri, 24 Nov 2023 08:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7062940133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RkxKXbmU3Mlb; Fri, 24 Nov 2023 08:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9861C41466;
	Fri, 24 Nov 2023 08:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9861C41466
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EE9E1BF5AA
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 08:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34E234206D
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 08:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E234206D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-s4tO0PiYXt for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 08:53:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7D014206A
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 08:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7D014206A
Received: by mail.gandi.net (Postfix) with ESMTPSA id B467F20009;
 Fri, 24 Nov 2023 08:53:46 +0000 (UTC)
Date: Fri, 24 Nov 2023 09:53:45 +0100
To: Byron Gallagher <trippgallagher98@gmail.com>
Message-ID: <20231124095345.3652c590@windsurf>
In-Reply-To: <CAAmzYqn7P5mqWuorwSy2McooKGSfn_VWoOx+dXXv1fpF1J=y0g@mail.gmail.com>
References: <20231121174722.4164-1-trippgallagher98@gmail.com>
 <20231123111528.3f88828e@windsurf>
 <CAAmzYqn7P5mqWuorwSy2McooKGSfn_VWoOx+dXXv1fpF1J=y0g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1700816026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wef+Q8lItJMdxcU1fGvMoHnclAMqoAIw+ganPzeV+aA=;
 b=BivLPKOORUPZN00lwcThRZ31OqsHsMdFALUnM4Sq8h9kFcBd5sDyIhZwed0Ys5ysaT6Unh
 k+F7qIxTa7Y2ctjN5UMH0H0X74Zi9T6p0T448tiyIE6o5XJXzyhRr85P9nDB+OM/Etbirm
 aF9rRdEN/vaN7GQjwoz26TSm7y5jcjviZT4bGm9+M7hGAFeg3ESJeh85aOK2b5d2ZS+Wxl
 u83/4gNIie45HTmLdUYURhcA+TEl6/cunQvGAfTd4//HKztHSO2CoC6o8Xgn+WqI1EoycC
 WYDEMKaotYHu4BDoXRGGQ+rDUC/C/B0ekxjs+YORvheuix3UEm7XV6k7n1Fh8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BivLPKOO
Subject: Re: [Buildroot] [PATCH] package/socat: fix static openssl
 compatibility
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

Hello Byron,

On Thu, 23 Nov 2023 12:55:33 -0500
Byron Gallagher <trippgallagher98@gmail.com> wrote:

> That makes sense. In this case would it be sufficient to add another layer
> of AC_TRY_LINK to check the static case? i.e. we try with -lssl -lcrypto
> first and if fail, try again with -lssl -lcrypto -lz?

That's an option indeed. But the best solution is really to use
pkg-config, through PKG_CHECK_MODULES(), and only if not found via
pkg-config fall back on the existing crap that uses AC_TRY_LINK().

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
