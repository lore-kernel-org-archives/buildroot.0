Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C62EECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E8AF41DA6;
	Sat, 17 Sep 2022 14:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E8AF41DA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGu-XBcW-CKI; Sat, 17 Sep 2022 14:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EAAC41DA1;
	Sat, 17 Sep 2022 14:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EAAC41DA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5742E1BF575
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 193C16113F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193C16113F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CL2sdMCiS7Mp for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:26:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB9A56112B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB9A56112B
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:26:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EFD7F60002;
 Sat, 17 Sep 2022 14:26:26 +0000 (UTC)
Date: Sat, 17 Sep 2022 16:26:25 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20220917162625.002b037a@windsurf>
In-Reply-To: <20220906193620.2778490-2-chris.dimich@boundarydevices.com>
References: <20220906193620.2778490-1-chris.dimich@boundarydevices.com>
 <20220906193620.2778490-2-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663424788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otVuN2wSVeo1/4srB7MpUNrI+FedtfGfSKDo40iRmVc=;
 b=SkH6t+rXR+GNL9wFrHxZX4cVoclGQ0MZOGRTtufxEb5t7ppuhmeFtrl4JR+8fDvjh8/hMF
 yu7TnwFI9p7Ytmwh/C0T3CWja4KD9U9hi7Vvtt1C3e8vCS8Gg2Jeebcn4hI2O53dZ06HYK
 xGrGRyVXusF4Tc6LVQj5olJKoQG/ESwa57Hkj15N13bOtYwH3Ujd+9iPSZg21GWbemJF7W
 964v7ycYfXFL/erSgL2KuQxuoBD48GRot44SUCUjpqZRcZOAo3IzuceQ6eKR4v/iJa1+fj
 /KNK0iaST97OHFkLVrBpbksNn/R4olY07rOSfXmK+zGDQjHSzid/iY5Cf5PWKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SkH6t+rX
Subject: Re: [Buildroot] [PATCH]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p4.2
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
Cc: Gary Bisson <bisson.gary@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  6 Sep 2022 12:36:20 -0700
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> To match NXP 5.15.32-2.0.0 release.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
>  .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
