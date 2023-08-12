Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D4AC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 21:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 643BE40033;
	Sat, 12 Aug 2023 21:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 643BE40033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p01mTre0wWGG; Sat, 12 Aug 2023 21:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FAAB414CD;
	Sat, 12 Aug 2023 21:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FAAB414CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D2731BF5DC
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 21:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71D5B414CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 21:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71D5B414CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j934MZw6GPnG for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 21:13:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E53FA414CA
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 21:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E53FA414CA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12FBB1C0002;
 Sat, 12 Aug 2023 21:12:55 +0000 (UTC)
Date: Sat, 12 Aug 2023 23:12:54 +0200
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20230812231254.57db4775@windsurf>
In-Reply-To: <20230626160030.93063-10-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
 <20230626160030.93063-10-bmeng.cn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691874777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6clBp1AZHuYtVmnta36UaUiBW9SOxjIEPjol89A/g7M=;
 b=QirKzKGcC/QxzELRHeQ/MzP5E5ihYntbAUbMC+W/qWD1v3zVbjVO+9tBlU+vx8El9p3Aqb
 kwji/A+dU6Tsu+Iedm3PUIAgV3zs1525N7K4XVHteGhmtJqh85KoijqVXSwl3avDB2wqHT
 xKGRBlzP+8sJdx+YthmjfqG/hzhmShnENHiVc4c1fizknhwazxLTsdVDIdHF2lgzflijCI
 Btj6r6MLvv8mqJzZRDzyNIAHPHmVw7ZNytyr8qCYi1OskjsrFba17rT7vn29QvWkbBGxAY
 0dwTrp83yv1t40lO+3Z4nZmG7RLE5pNfjhhs+ulwaC2DX10UgdzMIGjSs3+cBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QirKzKGc
Subject: Re: [Buildroot] [PATCH 09/10] board/sifive: hifive-unleashed:
 Update rootfs offset
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 27 Jun 2023 00:00:29 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bmeng@tinylab.org>
> 
> As the rootfs size is set to 60M, let's put it right on the 4M offset
> in the SD card, so that the generated sdcard.img can be exactly 64M.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Applied to next after adding more explanations about the "why 64 MB":
because Qemu requires power of two sizes for the image files.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
