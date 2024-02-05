Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCB0C48297
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 747C74053F;
	Mon,  5 Feb 2024 14:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 747C74053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igcBIUYSrzCv; Mon,  5 Feb 2024 14:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AE2D40A49;
	Mon,  5 Feb 2024 14:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AE2D40A49
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55E551BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DD6A41528
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DD6A41528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjhuqROH9k8V for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:34:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3280041522
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3280041522
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3918C1BF207;
 Mon,  5 Feb 2024 14:34:10 +0000 (UTC)
Date: Mon, 5 Feb 2024 15:34:09 +0100
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240205153409.042e2be1@windsurf>
In-Reply-To: <20240115214137.2350453-3-petr.vorel@gmail.com>
References: <20240115214137.2350453-1-petr.vorel@gmail.com>
 <20240115214137.2350453-3-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707143650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QD9JCCD3UspUT7bsp597quFUxADazAvILGM9Yw/KTgI=;
 b=Fchmzt3a8fda8zycYPfyt626vVqq712UqDsU0DSP2chwEWDJVb2ZxUg3qNKwEQMJcwfl9H
 5I31zHW5Oiwba7lpVJ91o0WFSP9NTZPgSIzkDCLaslqX5mLiC0+oXgDWRJ5b+bzumD4Mfy
 yc9Jgyo9k4dXYaiEzqf32C5dk8RSnNy0sUf17iJ7NpgDGtexE9fiRE9AWK6mJkCeM72PnB
 uSRrcp9n/xyB6NSEM178mEF9vZ1b6aUQF03XHvb5nbYR8/8uAyvcR5xPpbbSAgU9e9mC44
 WA4en2EeGyP7HIi2YBB79dT2xDW74m1JLw4hqoTZjZqdq++KAaLDmoRorlG9Sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fchmzt3a
Subject: Re: [Buildroot] [PATCH 2/3] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6}.x series
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Angelo Compagnucci <angelo@amarulasolutions.com>, "Yann
 E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Petr,

On Mon, 15 Jan 2024 22:41:36 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  afe2e5a661bb886d762684ebea71607d1ee8cb9dd100279d2810ba20d9671e52  linux-6.6.11.tar.xz
> -sha256  98dce69077c35cffca799dcdbbd32a02242aad6b0950eb931936bb2ef69f0926  linux-6.1.72.tar.xz
> +sha256  1fd7ec8c3d9c4e4b3a41d11e2c6d151e5fbf875dd08b3577f73afd6ee6674605  linux-6.6.12.tar.xz
> +sha256  6cad48706bf1cde342613dca2a2cd6dd4f79f88f9e4d356263564e4b2a5d7e87  linux-6.1.73.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  5a807a5fa2a80ada957d8079681dfb5cc196ec26f43244d1c8a4fd7af592d192  linux-5.15.146.tar.xz
> -sha256  86ace9892296bf1534d574894edd27614b68de4085c03fd3f60121751a334f1b  linux-5.10.207.tar.xz
> -sha256  da072f7e6fe719c01e517cac1fa9988b2f5fa87d62a8501b7dc16d3b62b2acb6  linux-5.4.266.tar.xz
> +sha256  56c1e65625d201db431efda7a3816e7b424071e7cb0245b2ba594d15b1fdfcd4  linux-5.15.147.tar.xz
> +sha256  9025147a09547f28ec8f496c12efc30bd2fc03b2824a668e8636b2ca0ef1fb6e  linux-5.10.208.tar.xz
> +sha256  42d28def2cc1502251edbfeaca3b25ee764ad1e471b6c703ccb2267f38471c43  linux-5.4.267.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> -sha256  cdc6a5d51aaff7c50bfe4ac4adf5cc3727043a24641145dc268e858db2a4b598  linux-4.19.304.tar.xz
> +sha256  da82425c7410623dfb2405915347ee9617fc0e33a63ca821c33aeed160cddae8  linux-4.19.305.tar.xz

Many of these bumps already took place (because we were too slow to
apply your patch), but some did not (like the 5.15.x bump). Could you
resubmit on top of master?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
