Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61005C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 08:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE3A18183D;
	Thu, 29 Dec 2022 08:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE3A18183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hz0P2vWyfDZ0; Thu, 29 Dec 2022 08:58:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 117C981852;
	Thu, 29 Dec 2022 08:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 117C981852
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED6131BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7110402B8
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7110402B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CcTuGFAJvv3K for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 08:58:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 554EC40245
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 554EC40245
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:58:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A03820003;
 Thu, 29 Dec 2022 08:58:00 +0000 (UTC)
Date: Thu, 29 Dec 2022 09:58:00 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221229095800.64a5f115@windsurf>
In-Reply-To: <20221228205323.71420-1-giulio.benetti@benettiengineering.com>
References: <20221228205323.71420-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672304281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4RAUxgW9OU53dVcWBzWvKshsUNeemvVmu6xPJGCxys=;
 b=mx0yQZxGaYPqG4xba19o/K/nxoKBVAsBtMMM9PzbhltYnwmhOijYTRAlXFkPwXvwgA3QBF
 abERFT2byzuB+0mBh6deRAGadlm5TkJf0+EaSw0WX0VScp9dC8gQ+gOmgGPlbNRNBFvq/Z
 Ebo+Nzvw/we7MlqHR+hLCIxaywCVvGLDjLLkg52oNR0k46peopfd4NbeGnJNqLDXGjkRjm
 CaYDuF0D/pAEhLghBjyHiI73x1wuXvvZCGfMW1c9sDn7RmK3i1y8mS5z7FPGdSsZXR7cSv
 PJmtLta7UHSymrzODjeXFIte8YBmjIV6JENumnoUtgycXM5L7khKaBAiQm6KxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mx0yQZxG
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure up
 to Linux 6.1
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
Cc: Kris Bahnsen <kris@embeddedTS.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Dec 2022 21:53:23 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add patches pending upstream[0] to handle various data types and api
> changes up to Linux 6.1.
> 
> [0]: https://github.com/embeddedTS/wilc3000-external-module/pull/2
> 
> Fixes:
> http://autobuild.buildroot.net/results/6aa7475a21a6060e9fce3552f73e6e7100a8b2aa
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...missing-prandom_u32-with-Linux-6.1.0.patch |  34 +++
>  ...fix-build-failure-on-remove-callback.patch |  44 ++++
>  ...uild-failure-with-Linux-5.19-and-6.1.patch |  98 ++++++++
>  ...on_parameters-Linux-6.1-build-failur.patch | 216 ++++++++++++++++++
>  4 files changed, 392 insertions(+)
>  create mode 100644 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
>  create mode 100644 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
>  create mode 100644 package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
>  create mode 100644 package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch

Applied to master, thanks. However, it is worth mentioning that the
real "upstream" for this driver is the linux4sam Linux tree at
https://github.com/linux4sam/linux-at91. They are currently based on
5.15, but I suppose they will rebase soon on 6.1, so they might be
interested in your fixes. I don't know if/when the out-of-tree variant
of the WILC driver at
https://github.com/embeddedTS/wilc3000-external-module gets synced from
the linux4sam tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
