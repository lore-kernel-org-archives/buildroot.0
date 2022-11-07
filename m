Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C90C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 14:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0D0A40356;
	Mon,  7 Nov 2022 14:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0D0A40356
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsuxJygttRNU; Mon,  7 Nov 2022 14:32:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73B5B40352;
	Mon,  7 Nov 2022 14:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73B5B40352
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDE11BF94D
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 14:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 725BB813EA
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 14:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725BB813EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWQpx_PdTJy0 for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 14:32:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20FF2813A2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20FF2813A2
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 14:32:00 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C3D7440013;
 Mon,  7 Nov 2022 14:31:55 +0000 (UTC)
Date: Mon, 7 Nov 2022 15:31:54 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221107153154.601c4cf1@booty>
In-Reply-To: <20221107124318.21725-1-neal.frager@amd.com>
References: <20221107124318.21725-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667831516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xKUmVGbzlnUO54xPKk5fQUE1EgDgmcZa+OhzvYt6eb0=;
 b=GPnjXfYkCT0aeVUmBZ5DZjejdj1BfYjBWQsaN30puyaTJXIgqJeblrWt6QSFpS7PI1wJc4
 OGmud8N4tA8TjwY+f8tzRvW5BbWFejVz61hPQ8GfopjgZfdxLTTgDP6ALMoAQeoii7PSEw
 lV0thzG1EOnSsppK7ElX29No97c0HomuwbBvy16a+6Bf9dk3Nk68suJS9CMGxg1UFepKTj
 qWjl9iJpwFYBcetAOxkq9riAV7epZD9xf9yoCtuQN8xju7lNZ4R5KpScm0d5DH+5KMRESl
 cX/dwrFCd6dT5JsSLX8lJPaFTxjqlbsbixA08zUeKvpIgKWw7BJpM3VtQF1iMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GPnjXfYk
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynq_xxx_defconfig: use
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 7 Nov 2022 05:43:18 -0700
Neal Frager <neal.frager@amd.com> wrote:

> This patch migrates the u-boot device tree definition
> from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
> instead for the zynq_zc706, zynq_zed and zynq_microzed defconfigs.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...before Peter applies the patch, this time! ;-)

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
