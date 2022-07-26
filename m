Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3CBC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 18:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C16340147;
	Tue, 26 Jul 2022 18:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C16340147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3tFECWBG3hN; Tue, 26 Jul 2022 18:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B2C640126;
	Tue, 26 Jul 2022 18:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B2C640126
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7D1F1BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE787400CE
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE787400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkaVfPYwv9wW for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 18:58:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73BBB40025
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73BBB40025
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 18:58:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5BB2D60003;
 Tue, 26 Jul 2022 18:58:21 +0000 (UTC)
Date: Tue, 26 Jul 2022 20:58:20 +0200
To: Xuanhao Shi <x-shi@ti.com>
Message-ID: <20220726205820.0dfda49b@windsurf>
In-Reply-To: <20220726165041.17584-4-x-shi@ti.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-4-x-shi@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658861901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iAepjy0TMsDZ2AOZK61+bEKZs8Oypfg9BVajQoq9MU=;
 b=b8Ix2FuqEkK6wjWWDnHB5KQYmfnhjV7sAjxSdDX0IvupgUGWZ3YfKTGzNNAVCBMyl6PaeM
 YIgmD9JPEZyKSc+w3989X1+PxHxp7dO/OBuv2oSTFyyGTkw/bujGI8xHWLuxq/DMCMdYyf
 9GflX1gKV0IpDJFWBvGbut8iLHeZlF8EVel61ho+i6RM9PU2mAxP1nY1epFl1fXmro1J+t
 G+m8Implgc/HpnYBhLCvKcG/nCQYsGAz3kQgL5vdR1zwjlHdX+cDx19M1HlMPvWmUANLOn
 xpy1pxE7/5KCOPxErnb7NarOx8hbYy78rWHCTtbUfzOwe+r5UybA0vNVoeqiNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b8Ix2Fuq
Subject: Re: [Buildroot] [PATCH 3/4] board/am6x: add new board support
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 26 Jul 2022 11:50:40 -0500
Xuanhao Shi <x-shi@ti.com> wrote:

> Adds the board support for TI's AM6X SoCs after patch,
> Currently just AM64X to start.
> 
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> ---
>  .../linux/ti_sdk_arm64_release_defconfig      | 1983 +++++++++++++++++
>  board/am6x/genimage.cfg                       |   27 +
>  board/am6x/readme.txt                         |   41 +
>  3 files changed, 2051 insertions(+)
>  create mode 100644 board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig
>  create mode 100644 board/am6x/genimage.cfg
>  create mode 100644 board/am6x/readme.txt
> 
> diff --git a/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig b/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig
> new file mode 100644
> index 0000000000..7000ee1170
> --- /dev/null
> +++ b/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig

Just board/am6x/am64x/linux.config

Does your board have an actual name? Because am64x is just the name of
the SoC, no?

> @@ -0,0 +1,1983 @@
> +CONFIG_SYSVIPC=y
> +CONFIG_POSIX_MQUEUE=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_PREEMPT=y
> +CONFIG_IRQ_TIME_ACCOUNTING=y

[...]

This is a huge config file, with obviously stuff that isn't needed for
your platform. Could you review it and strip it down to some reasonable
level? It enables zillions of drivers that make absolutely no sense for
a TI platform.


> +##################################################
> +# TI Baseport Config Options
> +##################################################

Please do not manually edit the kernel configuration file.


> diff --git a/board/am6x/readme.txt b/board/am6x/readme.txt
> new file mode 100644
> index 0000000000..b08c385146
> --- /dev/null
> +++ b/board/am6x/readme.txt
> @@ -0,0 +1,41 @@
> +Texas Instuments AM6X Evaluation Modules
> +
> +Description
> +===========
> +
> +These configurations will build a complete image and 
> +device tree blobs for the the TI AM6X boards.

Which "boards" ? Normally, we have one readme.txt per board, as the
details are board-specific, such as where is the UART connector, how to
flash, etc.

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
