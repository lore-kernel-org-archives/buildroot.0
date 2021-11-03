Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B02C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:39:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C94610EA
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47C94610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D862607D4;
	Wed,  3 Nov 2021 22:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnixky4LtmSg; Wed,  3 Nov 2021 22:39:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77E07607C7;
	Wed,  3 Nov 2021 22:39:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 294FE1BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F4D8105C
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cqy4j1t6X09E for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:39:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 120668105B
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:39:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9E67BFF807;
 Wed,  3 Nov 2021 22:39:46 +0000 (UTC)
Date: Wed, 3 Nov 2021 23:39:45 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Grossholtz <julien.grossholtz@openest.io>
Message-ID: <20211103233945.679af96e@windsurf>
In-Reply-To: <20211030213600.3445223-2-julien.grossholtz@openest.io>
References: <20211030213600.3445223-1-julien.grossholtz@openest.io>
 <20211030213600.3445223-2-julien.grossholtz@openest.io>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] configs/raspberrypi: bump kernel to
 581049d (5.10.76)
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
Cc: Peter Seiderer <ps.report@gmx.net>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Oct 2021 23:35:59 +0200
Julien Grossholtz <julien.grossholtz@openest.io> wrote:

> Raspberry-Pis Linux kernel is now based on 5.10.76. The previous release
> was 5.10.63.
> 
> Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
> ---
>  configs/raspberrypi0_defconfig        | 2 +-
>  configs/raspberrypi0w_defconfig       | 2 +-
>  configs/raspberrypi2_defconfig        | 2 +-
>  configs/raspberrypi3_64_defconfig     | 2 +-
>  configs/raspberrypi3_defconfig        | 2 +-
>  configs/raspberrypi3_qt5we_defconfig  | 2 +-
>  configs/raspberrypi4_64_defconfig     | 2 +-
>  configs/raspberrypi4_defconfig        | 2 +-
>  configs/raspberrypi_defconfig         | 2 +-
>  configs/raspberrypicm4io_64_defconfig | 2 +-
>  configs/raspberrypicm4io_defconfig    | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)

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
