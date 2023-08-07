Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB33EC001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B2E81A6F;
	Mon,  7 Aug 2023 20:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B2E81A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDaklZ97BZYD; Mon,  7 Aug 2023 20:23:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADC2F8183D;
	Mon,  7 Aug 2023 20:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADC2F8183D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F4231BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A245400E5
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A245400E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFX52oywq6Xd for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:23:08 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D311A4002A
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D311A4002A
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD21540007;
 Mon,  7 Aug 2023 20:23:04 +0000 (UTC)
Date: Mon, 7 Aug 2023 22:23:03 +0200
To: Gary Bisson <bisson.gary@gmail.com>
Message-ID: <20230807222303.0d7c2ef7@windsurf>
In-Reply-To: <20230807195846.1553615-1-bisson.gary@gmail.com>
References: <20230807195846.1553615-1-bisson.gary@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691439785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B78yOBw1sI8BeOnV7ggQuEZtB8m0w2Ax4KqHzI71Rxo=;
 b=IlQloSsvXeQAemUPsQZhzu/X20JHk4tOvM6YfEl6/FHOhsxZiaN3QLhDcLNE6IUcKbw1Q7
 Ny9LNTgxBh3ke5TnxumpkkuRxT2RBBtcOIclH5ZZO3LXj2/WnuRqZP1jW2BsXMp4X8aBAZ
 PtZQhw2mm3yzSg5NSnJfHmX4dad15IB85mB08Z4HlBDhQDK3fX/huDUlXGa4l1deJ8Z4Ii
 RqwT2za/zjLTjCRR9Tfx6kBu2vvBTAYNk8HqdRI/7U0vvzMsmm5mYLFi5U4/M/P5vdv+E+
 yih16jdI2HGPsnqRNRc04gVDJ6OnzBgVFQW5s7IMje35aPGnQdIXm5NXwx9aoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IlQloSsv
Subject: Re: [Buildroot] [PATCH 0/3] configs/nitrogen*: update & fixes
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

Hello Gary,

On Mon,  7 Aug 2023 21:58:43 +0200
Gary Bisson <bisson.gary@gmail.com> wrote:

> Gary Bisson (3):
>   configs/nitrogen8*: bump atf version to v2.8
>   configs/nitrogen*: bump u-boot revision
>   configs/nitrogen*: update kernel to lf-6.1.22-2.0.0

Even though the U-Boot bump doesn't per-se fix any build issue, I've
applied the whole series to master (for which we only accept fixes at
this time, as -rc1 has been cut already).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
