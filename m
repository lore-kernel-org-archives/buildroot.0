Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AF3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:30:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE84960E90
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE84960E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C6480C68;
	Mon, 18 Oct 2021 19:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1i7Topf3Yrzf; Mon, 18 Oct 2021 19:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F02A880BC3;
	Mon, 18 Oct 2021 19:30:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEA1C1BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC9DF40477
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Suyv3IsN-9B0 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:22:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2AFB400EF
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:22:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5384B1BF207;
 Mon, 18 Oct 2021 19:22:18 +0000 (UTC)
Date: Mon, 18 Oct 2021 21:22:17 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20211018212217.727be240@windsurf>
In-Reply-To: <20211017152511.32136-1-post@lespocky.de>
References: <20211017152511.32136-1-post@lespocky.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/fastd: bump version to 22
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 17 Oct 2021 17:25:11 +0200
Alexander Dahl <post@lespocky.de> wrote:

> There's a new feature to offload L2TP to the Linux kernel, which depends
> on libmnl.  A new menu option was introduced for that.
> 
> It's possible to link an internal version of libmnl
> statically for smaller binary size on constraint targets, but this was
> not added to the buildroot package for complexity reasons (both build
> and licensing).
> 
> The COPYING file gained an additional paragraph for internal libmnl
> which does not apply, because internal libmnl is not used in the
> package.

Thanks for providing this explanation, very good!

> +config BR2_PACKAGE_FASTD_OFFLOAD_L2TP
> +	bool "l2tp offload support"
> +	default y

I don't think there was much reason for this option to be enabled by
default, and we try to not enable optional features by default in
Buildroot, so I dropped this "default y" when applying.

Applied to master this change. Thanks!

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
