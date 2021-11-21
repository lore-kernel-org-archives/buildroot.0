Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FE1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A83F780B9D;
	Sun, 21 Nov 2021 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nodApwRiO44v; Sun, 21 Nov 2021 20:58:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C52B80B84;
	Sun, 21 Nov 2021 20:58:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A77821BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4998605D4
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qE2s-mei1D6e for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:58:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2389605B7
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:58:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D887B20003;
 Sun, 21 Nov 2021 20:58:47 +0000 (UTC)
Date: Sun, 21 Nov 2021 21:58:46 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gary Bisson <gary.bisson@boundarydevices.com>
Message-ID: <20211121215846.64208e7d@windsurf>
In-Reply-To: <20211119143632.2565197-1-gary.bisson@boundarydevices.com>
References: <20211119143632.2565197-1-gary.bisson@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/nitrogen8mp: update device trees
 list
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
Cc: chris.dimich@boundarydevices.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gary,

On Fri, 19 Nov 2021 15:36:32 +0100
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> - remove the A0 device tree as this (pre-prod) version of the CPU isn't
> supported any longer
> - add '-m4' variant to enable remoteproc api to Cortex-M core
> - add ENC variants for our ENC carrier [1] (+ 1 with tc358743 support)
> 
> [1]
> https://boundarydevices.com/product/nitrogen8m-plus-enc-carrier-board/
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Applied to master, thanks!

> This fixes the build of the kernel for this board as the a0 dtb doesn't
> exist any more. But I couldn't find any report of the defconfig failing,
> are those still built regularly?

It definitely failed recently, see
https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045913

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
