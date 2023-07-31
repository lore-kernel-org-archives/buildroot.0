Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F48C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7145560675;
	Mon, 31 Jul 2023 14:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7145560675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fI2X7rAVGnGe; Mon, 31 Jul 2023 14:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7267605A2;
	Mon, 31 Jul 2023 14:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7267605A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67A7A1BF31B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E04B405CD
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E04B405CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwbzBSHxDHcU for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:43:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1889840204
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 14:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1889840204
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9AFFE0004;
 Mon, 31 Jul 2023 14:43:22 +0000 (UTC)
Date: Mon, 31 Jul 2023 16:43:21 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230731164321.615664d5@windsurf>
In-Reply-To: <a9b895f5-5136-6d92-34a7-ada38a3da21f@benettiengineering.com>
References: <20230726202838.1931660-1-christian@aperture.us>
 <20230726202838.1931660-3-christian@aperture.us>
 <a9b895f5-5136-6d92-34a7-ada38a3da21f@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690814603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZ0H6CYvTXVJhFw0RXFnIf4WJEProcnW7wcmUWSPvPM=;
 b=WlYUkv3/ZjeWPx9n0aZ5g3pQON5zO34Ow8ohpq9DTXwAmY9kvpIvYw1gml9HrjNkpHHvhA
 HztHiH8mzAziuH0nJvf7hrYpUQrztkdxQjap5djWXuUHCNcs2M4bGUqgvbcmw8aBiMK2R0
 3thQNW+Vr2o0vYDeuAhisetMI1bKOuvyYyo7QncKgx5+tWGWlplg4x5yX0TyqwTzwW04Vp
 +lNIKg2pCnSGqI3nSeOFYRslSOgfHy5kwHsFCr1RUo8kB3M9/eb25HC15nUOTGiQ8Qsflh
 BmNqiRMrf4nPy7X4mXFJhFndlfR59KnIH5o/OYfUFvctTcCBDqd4p4wPiSz8Cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WlYUkv3/
Subject: Re: [Buildroot] [PATCH v1 3/3] boot/uboot: add host-python-pylibfdt
 dependency if needed
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 16:10:48 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> U-Boot approach for this is to force Python3 to build libfdtpy[1]
> but what we experience here is a consequence of Buildroot's commit 
> 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33 [2]
> 
> Something happens after that patch has been applied that basically
> passes Buildroot's host dtc to UBOOT_MAKE_OPTS:
> ```
> UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
> ```
> The root cause seems to be Python3 anyway as U-Boot patch points.
> 
> Since we can't patch every U-Boot version we could fix Python3 but
> using the approach proposed by Christian is easier to be honest.
> 
> To prove it's a Python3 issue you can see from one of my Gitlab-CI
> failure[3] that various U-Boot versions are different, not the last
> one(2023.07).

Hm, thanks for your feedback, but even after reading 3 times your
e-mail, I still don't grasp what's going on. You've pointed out that
Buildroot commit 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33 is when build
failures starting to occur. But what's the relationship between setting
DTC and U-Boot having issues finding pylibfdt?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
