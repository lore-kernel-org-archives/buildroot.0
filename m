Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8240AC27C77
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 15:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45A6A60A3A;
	Tue, 11 Jun 2024 15:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsVjgmZZyBLD; Tue, 11 Jun 2024 15:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 458A960A55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 458A960A55;
	Tue, 11 Jun 2024 15:08:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B48311BF38C
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 15:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D580405E4
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 15:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_9MtuiCqtDO for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 15:08:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46F0240516
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46F0240516
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46F0240516
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 15:08:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2531CC5C13
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 15:08:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7210CFF805;
 Tue, 11 Jun 2024 15:08:17 +0000 (UTC)
Date: Tue, 11 Jun 2024 17:08:16 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240611170816.5a412e67@booty>
In-Reply-To: <ZmHU1-EPxRFiHZDl@landeda>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <ZmHU1-EPxRFiHZDl@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718118498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ujXfqJEXaZnqcFVrfex1HwZVVq3btfeX4xzyP+E+NZI=;
 b=KK01YxgH1Lb2OhI48IQ3c1DZF+HCfISEPiBGRp6+igo//Q4Uk9rKORXObu4i3/Q6FdPffP
 VY53rk3YZi4vRtlcfv85oFOIuJ+Y/IVudbf8nvM/MpEDtWI1yJw/5/zD2WhehCSh5KA+ml
 Fj+oWurf/nTnIAKKhmIOoEFfsEjwrpOWx77sbAKuHN0AZJQ9rwe965BpS65JcILlWvtBou
 1U66SON7YljvtMNwSOwj68fHpJOsyQQXb0psc8IOwEfoJXpkir+PoMoyPub2IzPRTjCenl
 VDiHxEHhMPIMVMaZ6gQdiFj4KAE/dpjlQSKttopOtqbTxwpEkVJTyn7PN79N7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KK01YxgH
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig:
 bump to xilinx-v2024.1
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
Cc: ibai.erkiaga-elorza@amd.com, Neal Frager <neal.frager@amd.com>,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Thu, 6 Jun 2024 17:25:11 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Still, for this case, I wonder if that would not be better to intriduce
> a new package (e.g. boot/xilinx-soc-prebuilt-firmware/ ) which would be
> properly versioned, and on which uboot would depend when
> BR2_TARGET_UBOOT_ZYNQMP=y.
> 
> Luca, do you remember the details why a package was not introduced bacj
> when you added the ZYNQMP PMU support?

Apologies for the delay.

I think the answer is just "it didn't look like necessary at that
time"... :-/

But if you ask me now, I think introducing a package would be a good
idea.

Building the pmufw within Buildroot using Neal's patches is a very good
option, but I suspect build would have a relevant increase, so keeping
the option to download a prebuilt binary would be good.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
