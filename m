Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA11AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 21:58:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729606120F
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 21:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 729606120F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43D1E403BD;
	Mon, 15 Nov 2021 21:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_2PqfvHQRWw; Mon, 15 Nov 2021 21:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47A79403CF;
	Mon, 15 Nov 2021 21:58:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7E241BF2F9
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 21:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A626A607A7
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 21:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpKGUJHV9NRE for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 21:58:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A00946078A
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 21:58:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6D3A020003;
 Mon, 15 Nov 2021 21:58:52 +0000 (UTC)
Date: Mon, 15 Nov 2021 22:58:51 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211115225851.25a820dd@windsurf>
In-Reply-To: <20211115152604.84814-1-kory.maincent@bootlin.com>
References: <20211115152604.84814-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/psplash: bump to revision
 44afb75
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
Cc: phil.eichinger@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Nov 2021 16:26:03 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> This includes the following changes:
> 
> 44afb75 Add configure options to disable progress bar
> fdbd111 Improve warnings from probing for double buffering
> f5203fd Update mailing list details since the move to groups.io
> 0a902f7 Fix psplash-systemd failures
> 4cf1330 Remove generated psplash-poky-img.h
> aea172a Makefile.am: Fix out of tree builds
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  package/psplash/psplash.hash | 2 +-
>  package/psplash/psplash.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
