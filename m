Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD751C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 21:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AD8240309;
	Mon,  1 Aug 2022 21:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AD8240309
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adHMPND8sMmu; Mon,  1 Aug 2022 21:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3264F402F8;
	Mon,  1 Aug 2022 21:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3264F402F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B01FD1BF319
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 690C5813D1
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 690C5813D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MgGppTXmdUL6 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 21:07:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59654813D6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59654813D6
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 21:07:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7462820005;
 Mon,  1 Aug 2022 21:07:12 +0000 (UTC)
Date: Mon, 1 Aug 2022 23:07:11 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220801230711.3d2a4227@windsurf>
In-Reply-To: <20220730203711.439923-1-ju.o@free.fr>
References: <20220730203711.439923-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659388032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6T2G6yzdQN7klrkyAaeO/fh5poZQT227OkCowZadcNI=;
 b=l6S+VzDvGenwvSGQ8XWGN8L5VK05w78IjG+GUMPfiX215KskZRPcnNR4pb5+Xy5ixuSZCw
 ELvid7KGLuwr39OQNVhsdgXF7MIgxDfPCCGKP9iTIltxRv3GfcjXdEyvWY1qK+v/HBwfud
 tNbOVTKbwMpPrqNU9pTK2gfKxd8sfKg4VTHfemAVPIy9N+/UpxLNmLKZnvQSiu8SoPy28j
 0FIjkBXIwEZIJEffiAA9NPx9MJanf+KkyCdAs6vemLPF48fpA2ejwRlaZeqO3R0GUIZQRm
 HWSCLb/2vIXV/g2a2scxmEc6JzCx2OwTo4uqMK1vWjOkDleOTsf5MFelFupviA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l6S+VzDv
Subject: Re: [Buildroot] [PATCH 1/2] configs/imx8mmpico: bump bsp components
 to version tn-hardknott_5.10.72-2.2.0
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

On Sat, 30 Jul 2022 22:37:10 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Those components are aligned with NXP BSP lf-5.10.72-2.2.0.
> 
> This commit also refresh the readme.txt file:
> - update no longer working URLs,
> - enhance flashing instructions (use ${mmcdev} uboot variable),
> - add "bs=1M" option to dd for better flashing performances.
> 
> Fixes:
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800730
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  board/technexion/imx8mmpico/readme.txt | 18 +++++++++++-------
>  configs/imx8mmpico_defconfig           | 11 ++++++-----
>  2 files changed, 17 insertions(+), 12 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
