Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B10C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 20:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFBB860B9C;
	Sun,  6 Aug 2023 20:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFBB860B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Gobj9FQQd_M; Sun,  6 Aug 2023 20:49:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA9560BC1;
	Sun,  6 Aug 2023 20:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA9560BC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05AC11BF2F3
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5681404E2
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5681404E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kaHWrGCZsmiV for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 20:48:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2E5C402BB
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 20:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2E5C402BB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 690EF240003;
 Sun,  6 Aug 2023 20:48:41 +0000 (UTC)
Date: Sun, 6 Aug 2023 22:48:40 +0200
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20230806224840.79d0eabb@windsurf>
In-Reply-To: <20221115235235.74897-3-abrodkin@synopsys.com>
References: <20221115235235.74897-1-abrodkin@synopsys.com>
 <20221115235235.74897-3-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691354921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HrRDcFT7CMB0GnHOfjwvSV8II9aIBNdmdy7NCauscko=;
 b=Dm7PD4Rq63fVV80AB/XKGw+iHYa7a9oWFagtHW5N+XnzbH6f/eIzXx1HcNNGP25+l8QokA
 zc+ufJb/AviXTUpCyxQiWxGXgSjiOYLmIHR03964VrFbb6ZBEEeK9awql+OnMeeqqKoLPa
 Nro/U/y1FGOWPDqthv2KRuFdNnGbg4XXQs7crytxNURlKAdxoDSeaqCyPdgD/YyhVGFnzQ
 1hUp6JjokU7lCGuT7hfiOJEujK/OAK+tZXR/HgxnLSRornSPPNpJyXWhSngy/jZZpMW4k/
 kRbN+tYzzxPhtLBlMtCtZoPuV5e1XBgYkjrlmX0BSq9FpMIVcxfEu1LLbSEZIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dm7PD4Rq
Subject: Re: [Buildroot] [PATCH 2/2] configs/snps_arc700_nsim_defconfig: add
 ARC700 target for nSIM
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 16 Nov 2022 00:52:35 +0100
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
> 
> Add ARC700 image configuration for nSIM instruction set simulator.
> 
> This is a nice starting point for ARC700 in nSIM.
> 
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  board/synopsys/nsim/readme.txt     | 43 ++++++++++++++++++++++++++++++++++++++
>  configs/snps_arc700_nsim_defconfig | 18 ++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 board/synopsys/nsim/readme.txt
>  create mode 100644 configs/snps_arc700_nsim_defconfig

Applied to next after adding an entry in the DEVELOPERS file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
