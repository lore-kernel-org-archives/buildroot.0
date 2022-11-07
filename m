Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28D2C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA1981A46;
	Mon,  7 Nov 2022 22:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA1981A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sjQKveAFm66v; Mon,  7 Nov 2022 22:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A6F7819F6;
	Mon,  7 Nov 2022 22:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A6F7819F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40D5C1BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B51960BF0
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B51960BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HC5bSg1-1r6o for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:19:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AA7B60BE7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AA7B60BE7
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:19:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BBDBD60002;
 Mon,  7 Nov 2022 22:19:21 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:19:21 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221107231921.19cc5c5d@windsurf>
In-Reply-To: <20221107124318.21725-1-neal.frager@amd.com>
References: <20221107124318.21725-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WU99Es4KYwh5NeNNHpJ2qXbCHGxAQqPpQnEzx1eoG/w=;
 b=JfSZEIBylof2S5qrp2ISV1t33OnHrth0s6JzLfy/wU1kDvjwOEjglhYqRfUi6gJYmVC9Jp
 JKUSgCpg+yHiiLOOgRHYUvZC4CCoa+xlQ+6JRJCXwhW3jxND5EE7/7XkrxMZQiynEYJ55P
 zSHgF5JzlC4xI5TflmWY2WXiuE0UEZBb1xIscmU4YbHoh8ZV2IS57ooLNwMGjQRtwLTXow
 wF64t1sYnO+QVA0OkcXS2rOCx1cyl/jXFKTtgthXebdF0iGoLTsTPX8Qss6K9bqwLv9lmE
 oHymgE+4mQX+cxM0NI4bcKOUoOGIcskOSGygneUUXy5vX+UyRrE+sIe/RDehIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JfSZEIBy
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 7 Nov 2022 05:43:18 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch migrates the u-boot device tree definition
> from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
> instead for the zynq_zc706, zynq_zed and zynq_microzed defconfigs.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynq/microzed/uboot.fragment | 1 -
>  board/zynq/zc706/uboot.fragment    | 1 -
>  board/zynq/zed/uboot.fragment      | 1 -
>  configs/zynq_microzed_defconfig    | 2 +-
>  configs/zynq_zc706_defconfig       | 2 +-
>  configs/zynq_zed_defconfig         | 2 +-
>  6 files changed, 3 insertions(+), 6 deletions(-)
>  delete mode 100644 board/zynq/microzed/uboot.fragment
>  delete mode 100644 board/zynq/zc706/uboot.fragment
>  delete mode 100644 board/zynq/zed/uboot.fragment

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
