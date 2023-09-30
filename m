Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D872DE77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FE7C42CC4;
	Sat, 30 Sep 2023 16:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE7C42CC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-IKDTORyrzb; Sat, 30 Sep 2023 16:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D49342CAD;
	Sat, 30 Sep 2023 16:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D49342CAD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5121BF3B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44FAE81E9D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44FAE81E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOucpc5ycVfr for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:05:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41BBB81F97
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41BBB81F97
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4AEE1C0002;
 Sat, 30 Sep 2023 16:05:43 +0000 (UTC)
Date: Sat, 30 Sep 2023 18:05:43 +0200
To: Chris Dimich <cdimich2188@gmail.com>
Message-ID: <20230930180543.367f7a6e@windsurf>
In-Reply-To: <20230927164640.67592-1-cdimich2188@gmail.com>
References: <20230927164640.67592-1-cdimich2188@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696089944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3Hmx7uuhYoALiQRu//i/DZ/OCv9Vgp42tsjaA3soGk=;
 b=aDkHnTdE3++Z6/ti0K94ZX6LcxNNvWeR3zd3WQnmXG4oLF1x57yWeWIKmXDf8ihNLdqPJU
 ShRyyLLCB+HvMtNPe5WpCmPo0KtgBnVREG9GWDoKUObJvseF0YQRvP+wa2f1DLTNpmwDhy
 APb9QGdJ2jH6dWeJnlxM+VkbfxJ/BBDTqSv6uOcf4NJEBC4F3y6R2TUdA7JhuXp4lOCsgx
 VzxpFaT2ioQ/64IJ+Ej/FYT9EE2xx95uwgs3vucGpvkxKHYcd0tJ3C3BBEklgtxuutwVBU
 J/MB2kdO600q0Xv1ksUzba+BFs/ugqkAuUBMlNk8mMTIOWmVZ2yzfMRackmS3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aDkHnTdE
Subject: Re: [Buildroot] [PATCH 0/5] freescale-imx: update various packages
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Sep 2023 09:46:35 -0700
Chris Dimich <cdimich2188@gmail.com> wrote:

> Chris Dimich (5):
>   package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
>     6.4.11.p.1.2
>   package/freescale-imx/imx-gpu-viv: bump to version 6.4.11.p1.2
>   package/freescale-imx/imx-gpu-g2d: bump to version 6.4.11.p1.2
>   package/freescale-imx/imx-vpu-hantro: bump version to 1.29.0
>   package/freescale-imx/imx-vpu-hantro-daemon: bump version to 1.1.7

All applied. Thanks!

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
