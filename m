Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C13ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 10:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3349410C3;
	Sat, 17 Sep 2022 10:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3349410C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7kMfgckuhOx; Sat, 17 Sep 2022 10:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7D6940FCE;
	Sat, 17 Sep 2022 10:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7D6940FCE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7895B1BF5A4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 351DD842CA
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 351DD842CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5gjLZ89T1gF for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 10:57:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB33E842B4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB33E842B4
 for <buildroot@busybox.net>; Sat, 17 Sep 2022 10:57:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AEDEB1C0009;
 Sat, 17 Sep 2022 10:57:55 +0000 (UTC)
Date: Sat, 17 Sep 2022 12:57:54 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220917125754.6e05489f@windsurf>
In-Reply-To: <20220917101646.2761096-1-francois.perrad@gadz.org>
References: <20220917101646.2761096-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663412276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BsZFZmj1Q4BADtO9OWHnMegSWvxNB4CJlGs2HpPYlag=;
 b=JCjWS6MQn7Y9/SwOmsV3gcP5hnt8l1ChIU4hj0YK3ZNLuyBQo2Q62/SD+9Ur8E6/3baYIH
 yIRfCy2PW/RNkQWI6C1Mv0lZYDkCdPA6GSOK3nO2jmR33TAt1vULpjfvYwd1XUmNaYAexX
 F1k9rLivR+jKGesAFuVJeX1KzD8H3kwWXvsWDnhXRzRZZDrxUOWZCdd3TFYJQsp9tJX6XT
 WDBp++8NhKPB81pEaSJRyOPVjt4ndHIDPxp/X+BxfS0RTHkQ1uyNH/NSTy++r2G4lKH9EF
 xMowXzyJPpzwepMI/RNeIkvY1QQRZvbps2SG2aL8N7cahcsySu05Oz32U5wLSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JCjWS6MQ
Subject: Re: [Buildroot] [PATCH] package/qoriq-cadence-dp-firmware: bump to
 version lsdk2012
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

On Sat, 17 Sep 2022 12:16:46 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../qoriq-cadence-dp-firmware.hash                          | 6 +++---
>  .../qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk  | 2 +-
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
