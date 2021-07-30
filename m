Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DC3C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:42:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6AF260560
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6AF260560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99DE960E74;
	Fri, 30 Jul 2021 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6D2C5FvMVww0; Fri, 30 Jul 2021 21:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F076F607B6;
	Fri, 30 Jul 2021 21:42:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0F3A1BF488
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E767A607B6
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CM0nb43qJt-W for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 21:42:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC91460768
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 21:42:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B761020002;
 Fri, 30 Jul 2021 21:42:36 +0000 (UTC)
Date: Fri, 30 Jul 2021 23:42:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Eugen Hristev <eugen.hristev@microchip.com>
Message-ID: <20210730234234.31bc6aa0@windsurf>
In-Reply-To: <20210730103908.11270-1-eugen.hristev@microchip.com>
References: <20210730103908.11270-1-eugen.hristev@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/at91bootstrap3: updated to released
 4.0.0 final version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Eugen,

On Fri, 30 Jul 2021 13:39:08 +0300
Eugen Hristev via buildroot <buildroot@busybox.net> wrote:

> Update to AT91Bootstrap 4.0.0 version.
> 
> This package is now released under MIT license.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Thanks for the patch.

> -AT91BOOTSTRAP3_LICENSE = Atmel License
> +AT91BOOTSTRAP3_LICENSE = MIT

While this change is correct for at91bootstrap 4.x, I don't think it's
true for at91bootstrap 3.x, so I suppose this should instead be
conditional?

The problem is... what should be the condition? Indeed, testing on
BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION vs.
BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X is not working, because the
user can specify a custom Git or a custom tarball, and there we don't
know what version is used (3.x of 4.x).

I must admit I don't have a good idea here.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
