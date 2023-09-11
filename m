Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C33EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A9381EEC;
	Mon, 11 Sep 2023 19:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A9381EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kquc53O39_5b; Mon, 11 Sep 2023 19:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DD7281EF1;
	Mon, 11 Sep 2023 19:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD7281EF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABF861BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F4D781EEA
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F4D781EEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZO-gUgZPFarN for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:43:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9866D81EEE
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9866D81EEE
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA2B7FF80E;
 Mon, 11 Sep 2023 19:42:45 +0000 (UTC)
Date: Mon, 11 Sep 2023 21:42:45 +0200
To: Chris Packham <judge.packham@gmail.com>
Message-ID: <20230911214245.3ca5404f@windsurf>
In-Reply-To: <20230911085000.559230-2-judge.packham@gmail.com>
References: <20230911085000.559230-1-judge.packham@gmail.com>
 <20230911085000.559230-2-judge.packham@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694461384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9oOyMm3yLkx6djrYEO2P91J1aExMh92C5ET9w8mMLs=;
 b=WqBDC/vqx5JO0ssH5IlOFM6WTSa+wvGe2A+Qz8gZ1XmFYvFF1IBetgWpb/FkNUPRZy4NxC
 zhJD1Qf47E9JFz0IdKJ0QR4U4aKDNj6wbB8cCWlUyyg+Zmd1DYpQ+5nZTR3/J+Yuj167MW
 ayL+nNqlLgOeUYHKr1CofGQLEAzVIeZAlCm9IPzA7QYoCCXrxAJcgKqWcyXln5ibG+tD1w
 Czj4klNLxIsOaPDISU0v8OEgexN4oJZLPXYYzDVRYqTdG8a40ymnYbDb3D9XohnmvRFRWg
 o1f1x1CKbPQtqpv/6S1TrE+oDuJQGDv3FY31y5n58kGTv9HuecfUji1r4XqN2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WqBDC/vq
Subject: Re: [Buildroot] [PATCH 2/2] gst1-shark: Update to v0.8.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 11 Sep 2023 20:50:00 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> Update to the latest release.
> 
> Release notes:
> https://github.com/RidgeRun/gst-shark/releases/tag/v0.8.1
> https://github.com/RidgeRun/gst-shark/releases/tag/v0.8.0
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/gstreamer1/gst1-shark/gst1-shark.hash | 2 +-
>  package/gstreamer1/gst1-shark/gst1-shark.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Adjust commit title to:

	package/gstreamer1/gst1-shark: bump version to v0.8.1

and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
