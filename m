Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1EEC4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 12:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A59881589;
	Mon, 19 Dec 2022 12:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A59881589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8qJQCNr9RTGD; Mon, 19 Dec 2022 12:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23DB6813E5;
	Mon, 19 Dec 2022 12:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23DB6813E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCD741BF267
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 12:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B828160A8C
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 12:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B828160A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAM_WiHfWp74 for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 12:36:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4364C60586
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4364C60586
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 12:36:31 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB2D2240006;
 Mon, 19 Dec 2022 12:36:27 +0000 (UTC)
Date: Mon, 19 Dec 2022 13:36:26 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221219133626.3e8ad15a@booty>
In-Reply-To: <20221208094620.38498-1-neal.frager@amd.com>
References: <20221208094620.38498-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1671453388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8ns130sSy6XumIEKhR4w79eclLrAz/Yc8Nfn+h8zjs=;
 b=UqFkkWYfcBRdU2UBsnEnU8dEdqCRgdZSEVYyNf8+6ibEUxJ+dEbd8mCXgqoohHW/DQRuAR
 dVtDKWi+cQR+QBGRMY+6nzEV44wrq79qJz0n2mbNq7fsr4S+m0xlXS0rEihsjky+yEYfD9
 egj+xmM6atf7Gvt2cxWuS0bDxM8RZZxVQsd+wnruwv8nPTy4ldrAg+Kxb1uA6RQFH4H5QB
 8xFp+tTmmVhlyIiZvMZ9nkO15sNpQkz8YFG/8O6edgItx18zq+L2/nQJxKBYhp/r+eSRYL
 SR1EoS25Eiu39bDeTNSYyc1zpuCTx+pbNNAXwlVLmCSU5vfSSwPALDjJcgmrnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UqFkkWYf
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
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

On Thu, 8 Dec 2022 02:46:20 -0700
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds support for Xilinx Kria KR260 starter kit.
> 
> KR260 features can be found here:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
> 
> While the Kria SOM is based on a ZynqMP SoC, there are some key
> boot config differences from the other ZynqMP evaluation boards.
> 
> 1. There are no boot switches on Kria SOMs. The boot mode is thus
> hard configured for QSPI flash. A pre-programmed boot.bin comes
> with every Starter Kit. U-Boot can then find the Linux kernel and
> file system on the SD card.
> 
> Optional instructions for updating the boot.bin in the QSPI flash
> can be found in the readme.txt file and the link below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM
> 
> 2. Kria SOMs use UART1 for the console instead of UART0. For this
> reason, Kria Starter Kits will use a separate extlinux.conf file
> from other ZynqMP evaluation boards.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
