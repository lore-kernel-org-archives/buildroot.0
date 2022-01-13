Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE71C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E246FC71;
	Thu, 13 Jan 2022 21:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pkFOVWN1Xfr1; Thu, 13 Jan 2022 21:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A8846FC2E;
	Thu, 13 Jan 2022 21:45:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F15F31BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDEF96FC2E
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id silPtTvnb5_9 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:45:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1EDB607FF
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:45:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C7832FF807;
 Thu, 13 Jan 2022 21:45:32 +0000 (UTC)
Date: Thu, 13 Jan 2022 22:45:31 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gilles Talis <gilles.talis@gmail.com>
Message-ID: <20220113224531.6f9ac64a@windsurf>
In-Reply-To: <20211024113931.88898-1-gilles.talis@gmail.com>
References: <20211024113931.88898-1-gilles.talis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/friendlyarm_nanopi_r2s: new
 defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gilles,

On Sun, 24 Oct 2021 13:39:31 +0200
Gilles Talis <gilles.talis@gmail.com> wrote:

> The NanoPi R2S is a FriendlyElec mini-router based on:
> 
> - Rockchip RK3328 SoC
> - 1GB (or 2GB) DDR4 RAM
> - Gigabit Ethernet (WAN)
> - Gigabit Ethernet (USB3) (LAN)
> - USB 2.0 Host Port
> - MicroSD slot
> - Reset button
> - WAN - LAN - SYS LED
> 
> https://www.friendlyarm.com/index.php?route=product/product&path=69&product_id=282
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

This obviously looks very good, but there is one question: could you
drop the VFAT partition, and have the kernel, DTB and extlinux.conf be
directly in the ext4 partition, with U-Boot loading them from the ext4
partition directly?

This would simplify things a bit.

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
