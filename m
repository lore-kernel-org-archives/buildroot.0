Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26E9C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:46:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707C4610A0
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 707C4610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 461E081882;
	Thu, 19 Aug 2021 20:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EK6qe07ZKBrl; Thu, 19 Aug 2021 20:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9FE818A1;
	Thu, 19 Aug 2021 20:46:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A4E31BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 276FE81882
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvdIMHYl3B2p for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:46:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1EB2818A1
 for <buildroot@busybox.net>; Thu, 19 Aug 2021 20:46:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9D093E0002;
 Thu, 19 Aug 2021 20:46:30 +0000 (UTC)
Date: Thu, 19 Aug 2021 22:46:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Eugen Hristev via buildroot <buildroot@busybox.net>
Message-ID: <20210819224629.191c13bc@windsurf>
In-Reply-To: <20210819113522.250804-1-eugen.hristev@microchip.com>
References: <20210819113522.250804-1-eugen.hristev@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] boot/at91bootstrap3: updated to released
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu, 19 Aug 2021 14:35:22 +0300
Eugen Hristev via buildroot <buildroot@busybox.net> wrote:

> Update to AT91Bootstrap 4.0.0 version.
> 
> This package is now released under MIT license.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v2:
> - Added conditional license block according to version

Thanks, I have applied to master, but I've made a change to use the
license file which is now available in the at91bootstrap code base.

This means this change will be in 2021.08.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
