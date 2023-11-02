Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33AFC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE8942E75;
	Thu,  2 Nov 2023 17:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAE8942E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TTk3btMnyIgK; Thu,  2 Nov 2023 17:50:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFE8F42E8D;
	Thu,  2 Nov 2023 17:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFE8F42E8D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF6351BF98E
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BAEA42E8D
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BAEA42E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tinGv2ouYrO for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:50:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20B544F24F
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20B544F24F
Received: by mail.gandi.net (Postfix) with ESMTPSA id C52F240002;
 Thu,  2 Nov 2023 17:50:28 +0000 (UTC)
Date: Thu, 2 Nov 2023 18:50:27 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231102185027.4f48ba66@windsurf>
In-Reply-To: <20231014184521.87527-1-giulio.benetti@benettiengineering.com>
References: <20231014184521.87527-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698947429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oY6yy7qo0JBgnGrKScW697masmaE5ghUJRTq04dgFac=;
 b=oFp3GYGfeLkB/m3MNDz7kkZmu7Mb+t2p6v1krruVuszTxobshL6T3ZFvvx0DaoBsK0o+JV
 ElVuHHKoM/IVMKqmopRbuCq3bSMn7ag0aaPU2NnEtEJslsrWAoinuCErZvhEHOZWhg0A+C
 GFgF17fp8c79bBz3lMl2uxgJE1hYyqBJBQF3i8gBEw50E7McrejtfqEBuYcC0xD+x5UUUT
 XDkbFWEConWYOkqvhwp6A4yyrLHpa122kFMcV80wa9CjfFUYMs+oCCEs5a6uaxA0Gl3Eh/
 8qxEliAxZDuFn1klJRV8qVXKHVV916LQZYI7qnU9uWDFqMjVLg07V51WwYrXLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oFp3GYGf
Subject: Re: [Buildroot] [PATCH 1/2] configs/rockpro64_defconfig: bump ATF
 to 2.9, U-Boot to 2023.07 and Linux to 6.5.7
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Oct 2023 20:45:20 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Also, since wi ith Linux commit [1] it's been defined the mmc* order
> making sd-card number to be 1 instead of 0. This prevent to boot from
> mmc0 with Linux version 5.10+ so let's change mmcblk0p4 to mmcblk1p4 in
> extlinux.conf in order to boot since we bump to Linux 6.5.7
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0011c6d182774fc781fb9e115ebe8baa356029ae
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  board/pine64/rockpro64/extlinux.conf |  2 +-
>  configs/rockpro64_defconfig          | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
