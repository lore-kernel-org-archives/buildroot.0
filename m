Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6EDE77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA8B42208;
	Sat, 30 Sep 2023 15:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA8B42208
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wFgTH_3CwkR; Sat, 30 Sep 2023 15:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AAD341D7F;
	Sat, 30 Sep 2023 15:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AAD341D7F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE531BF5A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14DC183D7F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14DC183D7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsrOrRq9csJQ for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:58:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7BAE83D79
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7BAE83D79
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78AFA60007;
 Sat, 30 Sep 2023 15:58:26 +0000 (UTC)
Date: Sat, 30 Sep 2023 17:58:25 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20230930175825.3b184230@windsurf>
In-Reply-To: <20230921215633.34828-4-brandon.maier@collins.com>
References: <20230921215633.34828-1-brandon.maier@collins.com>
 <20230921215633.34828-4-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696089506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDlvgNoBHNh+Enc8Va1LutsDp3alOG3vv4VAAN1yDRY=;
 b=jXXYVpbQrtm1vqpzq1ZryNoWL5jVvTaSu5ALnTnP27rk1OOww5sKTBF3p2oz8kwTZhN07S
 lsZ2yMhMegqaCKc26kfA8W0vo2CEOeAafE4BLAOTygBvFuwr6SiFjQ6KrQg5Wj/hSdMoEG
 SUkpclTrc98cobMA52Sm/2+a0fTOBBATM4DRsUdXEUvWdC5+tq4W1mwfyAH4SlkGXFAn2A
 YSUIRDxotlA3yZh2tG3BusEOYRE+lVip1AdpbLtzMYdA5opMw3hlAhbtrZNH53GdsIxON1
 EF7yzNOt37Gl22WjNGEO84ZEUxFxfQ0DQKAf6sg4Zcrm72uBJ+HVz8BncjaC6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jXXYVpbQ
Subject: Re: [Buildroot] [PATCH 4/4] configs/ls1046a-frwy: new defconfig
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
Cc: Maeva Manuel <maeva.manuel@oss.nxp.com>,
 Gilles Talis <gilles.talis@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Sep 2023 21:56:33 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> This is a development platform for the NXP LS1046A SoC.
> 
> The config is heavily based on the ls1028ardb_defconfig.
> 
> see https://www.nxp.com/design/software/qoriq-developer-resources/ls1046a-freeway-board:FRWY-LS1046A
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  DEVELOPERS                                    |  2 +
>  board/freescale/ls1046a-frwy/genimage.cfg     | 29 ++++++
>  board/freescale/ls1046a-frwy/readme.txt       | 90 +++++++++++++++++++
>  .../boot/extlinux/extlinux.conf               |  4 +
>  configs/ls1046a-frwy_defconfig                | 61 +++++++++++++
>  5 files changed, 186 insertions(+)
>  create mode 100644 board/freescale/ls1046a-frwy/genimage.cfg
>  create mode 100644 board/freescale/ls1046a-frwy/readme.txt
>  create mode 100644 board/freescale/ls1046a-frwy/rootfs_overlay/boot/extlinux/extlinux.conf
>  create mode 100644 configs/ls1046a-frwy_defconfig

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
