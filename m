Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81077C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 21:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B55BD408A6;
	Sun, 20 Nov 2022 21:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B55BD408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77KyHvCktLKp; Sun, 20 Nov 2022 21:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E3A4089D;
	Sun, 20 Nov 2022 21:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6E3A4089D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 303B31BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 21:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 176694089D
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 21:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 176694089D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 418dyjRe-XmB for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 21:50:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 551A34089C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 551A34089C
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 21:50:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8F720C0005;
 Sun, 20 Nov 2022 21:50:18 +0000 (UTC)
Date: Sun, 20 Nov 2022 22:50:17 +0100
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20221120225017.2e11ac4f@windsurf>
In-Reply-To: <4418d046-678f-912c-8c44-348cc82c9f06@vivier.eu>
References: <20220904095237.1401885-1-laurent@vivier.eu>
 <20220904095237.1401885-3-laurent@vivier.eu>
 <10716f6f-5738-5dbb-d0e7-6711331835d1@kaod.org>
 <4418d046-678f-912c-8c44-348cc82c9f06@vivier.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668981019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SSflcOCasuvwWrgBK5fHOIxv+yKOfg7sNN3dktT/mI=;
 b=bRWa+6zxo1cy+xG+YOkPouiZe8xJQSi3evUQzBm/apLmikp7BM4ywuU9ZFyZgXAx8GoRkf
 cddVxtch6gz7pkDjUi3bUnnGXs2V7AlXTDf8/Qy9NMIbls+1kIWq6bODgiOW/moV4hE5rI
 30xYlOQywt4UTD9jUc+bNKB+A7vbgT6D+vK+BGsmWhinoIa0H/t/VkDtxgEJ1Kor12D2gs
 KxFxZG+d/4Uav1wsBt9WmwtTZwrqY47gR8i3etFe5pdbgaTdhol4wmBLIOKFj63LV2meqS
 hZu1T1gY7S1WnZATY+W3ORJLYIe0Pr61ZeuKKW1Cv/3jD36zV2IyHhoaCRwDWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bRWa+6zx
Subject: Re: [Buildroot] [PATCH v5 2/2] board/qemu/m68k-virt: Add virt-m68k
 linux config
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 17 Nov 2022 20:19:33 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Because it doesn't have all the needed options to kexec a kernel and to use RAID/LVM/Device Mapper

One option is to add a Linux kernel configuration fragment to add just
the few additional options that you need.

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
