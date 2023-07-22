Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147D6C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6718832C7;
	Sat, 22 Jul 2023 21:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6718832C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDkyU5XyUiIq; Sat, 22 Jul 2023 21:07:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95CBD832D8;
	Sat, 22 Jul 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95CBD832D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 350E71BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CF91410C1
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF91410C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OnrnnZmx2CZB for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:07:36 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A0C54109F
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A0C54109F
Received: by mail.gandi.net (Postfix) with ESMTPSA id E189BFF803;
 Sat, 22 Jul 2023 21:07:32 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:07:31 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230722230731.7a47ed7d@windsurf>
In-Reply-To: <CAEpB38PEOYRLS3x-V3y55H_yDcNqoJOeB72tyX7tNK7pGkixMQ@mail.gmail.com>
References: <CAEpB38PEOYRLS3x-V3y55H_yDcNqoJOeB72tyX7tNK7pGkixMQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690060053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOvY0BYLI7pyCryPEIWTu3EjV/O8sFkyiiaKNqilX+A=;
 b=DqtL7DjXfJTNnG75nh/hrgXECf3mbZLRXYtKEIvQRMlIrYNnltHma3ynKaRKSNIdji4N8a
 VO1IXKq2yZKBTFoWxKSysZAvWChHmGCEu5OcEX8uy64Mn08pE4bYp23FUc/xB2GRRh0VfR
 ecIYMEoDrh50U5Xj26TN25xmyXS+K5XHIcNasP8dyYYEBDRqz/Dy8eGnkCiomIloonDzbU
 UG9+MmRpwIQhBt8yQ2sTjtvGCtKWZd0jMFmdbGvq2KPtjlx8400GFwrnOfoUOQlytF+ngX
 srBo3B8RxRkdfLjOtL6PVb2HzCIir8H1z8MYOqF83t/QLCWhUQ5lwzw3IVeyKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DqtL7DjX
Subject: Re: [Buildroot] Go 1.20
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Fri, 21 Jul 2023 21:11:35 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> I'd like to request an update on why we have not yet merged the go 1.20
> series.
> 
> Many modules now require go 1.20 to work properly and this is already
> potentially causing some issues today.

This is your lucky day: I had quite a lot of dead time today while
traveling, and one of the things I did was to review your patch series.
I've now applied PATCH 1/4 to PATCH 3/4. I will reply to them, and also
to PATCH 4/4 that I haven't applied for the moment.

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
