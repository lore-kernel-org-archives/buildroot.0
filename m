Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF630C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 22:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5515E40463;
	Wed,  9 Nov 2022 22:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5515E40463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id llJcZpd6AkkF; Wed,  9 Nov 2022 22:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86936400EC;
	Wed,  9 Nov 2022 22:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86936400EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE841BF308
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2089A400EC
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2089A400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtTCOfvZrv21 for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 22:05:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8EC40018
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB8EC40018
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 22:05:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 95D81FF803;
 Wed,  9 Nov 2022 22:05:08 +0000 (UTC)
Date: Wed, 9 Nov 2022 23:05:07 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221109230507.39d8f8d8@windsurf>
In-Reply-To: <20221019051823.26706-1-neal.frager@amd.com>
References: <20221019051823.26706-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668031509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNa1aftHyboZRZDJaTJhWCVISANq550qxgg98kX2TXk=;
 b=G4LYjA+odHEobB8x0mbdcEre7L2COW5yQlhT9ZZ4FfIvYI6Yt/mx5pOsGtCXS6rWcaGqcQ
 7Fjkaukcc3dxqXoxjJheRYZI+3RqREyEHy2AqFbyTxO7OLAVRI+RvktAmMzFoaWIhLLntc
 xLAscjvGeggayBnMlRhF3yJYLh6fxW/RAyA5pr3cEQwNR58u5S1IGRK0hQM/O/wFMHFUiq
 yJdT9gq2F9qnEiVAnfUq3mk9qApB9ADhElbi43fNi1cnrtd0oViwUrFLdyncEhdcwcUT7S
 adq4Lw7ofKCx2QwXq4Gte3DWmbOkN5h5YrPopj8N94RzBW6v0vcMUM5TwHFL/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G4LYjA+o
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynq_zc706_defconfig: bump
 to Xilinx 2022.2
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
Cc: luca.ceresoli@bootlin.com, ju.o@free.fr, michal.simek@amd.com,
 giulio.benetti@benettiengineering.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Oct 2022 23:18:21 -0600
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch bumps the zc706 to Xilinx release 2022.2.
> 
> Xilinx 2022.2 includes:
> - U-Boot 2022.01 bug fixes
> - Linux bump to Linux 5.15.36 with bug fixes
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/zynq_zc706_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

All three patches applied to our next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
