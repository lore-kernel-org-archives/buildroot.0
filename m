Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6F2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CB0741B56;
	Mon, 30 May 2022 20:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1Nltdd3UT1Z; Mon, 30 May 2022 20:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57C2541A66;
	Mon, 30 May 2022 20:19:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B47AA1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE5E682771
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9yg1Y7wJEUHb for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:18:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9524582733
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:18:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B6461240004;
 Mon, 30 May 2022 20:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653941934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svZFptpNhsGkl/qP7uvmNEE1Cv53uf+h1u1WOHftEgE=;
 b=l8go4CHrS8k3XSNjcgkyFr9xibhcnrS3fWmmlazeh+3LRsF2iMKh/6bsfRxw2Zpc/bbbHq
 0/nnZjPaLAaZFfnqcV1kxgwoaQEm5IUG04voDQeEcS5VMG6GN1S0qIh944/TCAWugZG1DF
 Qe7nJCpj6gIOSDpGLH8GrRXy2biGQRKyRk9eWIJCsBdI+z7xyGLjTbJN2JTfxYxrXVYgV9
 W4KBumo9NstBD6gOk0pKk0mcEd3CNyCLfdcbowax9as9eV5x1/xaM40mqPrAPWM5ifv/Uz
 bw0Vmko+bmMsMhop+1WcibSXJmBM2xCJNAAAJOVueWJNHzD4wPT9kxeAHoOm+A==
Date: Mon, 30 May 2022 22:18:52 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20220530221852.203f0782@windsurf>
In-Reply-To: <20220524220006.906954-1-festevam@gmail.com>
References: <20220524220006.906954-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/imx6-sabresd: bump U-Boot and kernel
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

On Tue, 24 May 2022 19:00:06 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Bump U-Boot to 2022.04 and kernel to 5.15.41 version.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6-sabresd_defconfig     | 4 ++--
>  configs/imx6-sabresd_qt5_defconfig | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
