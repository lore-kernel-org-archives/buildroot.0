Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A81C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 14:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DC3F60E62;
	Mon, 27 Dec 2021 14:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkEbB57lk87v; Mon, 27 Dec 2021 14:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0B1660D71;
	Mon, 27 Dec 2021 14:44:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D44C1BF3ED
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7F660E62
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1fKPAwrCLeI for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 14:44:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A335D60586
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:44:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B809F40008;
 Mon, 27 Dec 2021 14:44:05 +0000 (UTC)
Date: Mon, 27 Dec 2021 15:44:04 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Walle <michael@walle.cc>
Message-ID: <20211227154404.6186c450@windsurf>
In-Reply-To: <20211227105550.916883-1-michael@walle.cc>
References: <20211227105550.916883-1-michael@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/kontron_smarc_sal28: move gpt
 between rcw and bootloader
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

On Mon, 27 Dec 2021 11:55:50 +0100
Michael Walle <michael@walle.cc> wrote:

> genimage v15 complains about the GPT overlapping with the RCW. Move it
> to offset 16k which is between the rcw (which isn't expected to grow
> much more) and the bootloader.
> 
> This will fix the following error:
> ERROR: hdimage(sdcard-emmc.img): partition [GPT array] (offset 0x400, size 0x4000) overlaps previous partition rcw (offset 0x1000, size 0x580)
> ERROR: hdimage(sdcard-emmc.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

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
