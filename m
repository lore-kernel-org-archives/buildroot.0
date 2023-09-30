Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0065E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF19418DD;
	Sat, 30 Sep 2023 16:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF19418DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9j7TPQSrYmH; Sat, 30 Sep 2023 16:00:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B7C41D7D;
	Sat, 30 Sep 2023 16:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96B7C41D7D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2436F1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAD5560BD3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAD5560BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTJFz3MRGPk5 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:00:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB85C606E6
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB85C606E6
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5F9EC0005;
 Sat, 30 Sep 2023 16:00:18 +0000 (UTC)
Date: Sat, 30 Sep 2023 18:00:18 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230930180018.58d273f5@windsurf>
In-Reply-To: <20230927144237.66777-1-romain.naour@smile.fr>
References: <20230927144237.66777-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696089618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwSuqCxDe0szPQFIxKAIXXtTd6tJ/9R/8BqlzJofiA0=;
 b=pBG5l/5JDLgi+uCGvFNyfgusJq3SrYLdIQK/6H2ZbGlZRelpEkim9noI3jZ9mgBi7Q6Mst
 bQhGeji6jAbknEJzTQRLC8axGENF9GnM5HzE6y/FT9fgrxvwsrBkvOoM2R+kEPOu6aaCzZ
 NOzfhUZx3VUTIZl3cplC+WYWbTsy2v/A95bGZCrlXoDiCAtpu+gNXbSKMk4p9+8QpEfgjs
 3oKf41P/hYwnF8Yl7FReWzjywxN+WtwBZqivW3nsBy8i125Ej/2tsLqpiMb5brHBCNk+AZ
 JozkthZyudpZ11CQGYBfNh2XwPOo5ZQkZnDVsUcPmWUH/KidCnaihrVpx6wtZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pBG5l/5J
Subject: Re: [Buildroot] [PATCH] configs/freescale_imx8mpevk_defconfig: bump
 to version lf-6.1.22-2.0.0
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

On Wed, 27 Sep 2023 16:42:37 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Update the linux-imx kernel to be aligned with the NXP BSP
> LF6.1.22_2.0.0 (same release used in meta-freescale [1]).
> 
> Add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y and BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
> since they are new dependencies for building mkeficapsule u-boot tool.
> 
> The uboot-imx doesn't use the default imx8mp-evk devicetree anymore due
> to commit [2]:
> 
> "Change to use imx8mp-evk-revb4.dtb and imx8mp-ddr4-evk-revb4.dtb
>  as default kernel DTB for iMX8MP re-design EVK board. Old EVK
>  board is EOL, to boot old EVK, user can switch to old DTB manually."
> 
> Since the freescale_imx8mpevk_defconfig only install imx8mp-evk.dtb in
> the final image, the boot stop with:
> 
>   Booting from mmc ...
>   Failed to load 'imx8mp-evk-revb4.dtb'
>   WARN: Cannot load the DT
> 
> Add a u-boot defconfig fragment to revert this change [2] and use the
> imx8mp-evk.dtb by default.
> 
> Runtime tested on i.MX 8M Plus EVK REV B2.
> 
> [1] https://github.com/Freescale/meta-freescale/commit/e6b1b6725cd1d44550ba473ff6a80c1b80663965
> [2] https://github.com/nxp-imx/uboot-imx/commit/a60e787a6e35b9c14c391e03d41468e4ad63d598
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  board/freescale/imx8mpevk/uboot-fragment.config |  3 +++
>  configs/freescale_imx8mpevk_defconfig           | 11 +++++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
>  create mode 100644 board/freescale/imx8mpevk/uboot-fragment.config

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
