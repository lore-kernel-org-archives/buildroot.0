Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F882C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 16:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C00607FA;
	Mon,  3 Jun 2024 16:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpQrt6wRsn5e; Mon,  3 Jun 2024 16:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 381C760854
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 381C760854;
	Mon,  3 Jun 2024 16:25:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D47A1BF397
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A28F40992
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6elQ0IxOhUO for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 16:25:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B22440930
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B22440930
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B22440930
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:25:46 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id D998BC160D
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:19:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 399681BF20C;
 Mon,  3 Jun 2024 16:19:17 +0000 (UTC)
Date: Mon, 3 Jun 2024 18:19:15 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240603181915.4d09f3c5@booty>
In-Reply-To: <20240603115212.184529-2-neal.frager@amd.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <20240603115212.184529-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1717431560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6S4fN/+wWcvnNk86ZjEuEjGruV6H/waDNrNRElO307k=;
 b=FfNnZTU3SyqO5i2xTO43XmFWoX+L3yZyprUz/SoriKkcV/LtQYJxAI/Y3PISHK4Oldofhd
 wwDF+aj3V8AmLqJRIdSTA1Glz85zj2bR2PD8h3UH+rp4A+/isDDX3i3IC4+U20f2juuB7T
 TiIBq3BExANPtwUKkD2UvIfCtRp5qleAzY/3sEcPzKwTy0otljBa0MqXZIoFQJ6iAZzSG8
 bT2o6DizT/AZ8h26fOH4vS1JGhrZGY8c03DTDpvqBgQGVb/BbmjIVg2JQdlpOHOC1Xoo6z
 Ka6JoNRuZIOAKqUnz51+6svqC80mnHnvBvwUoTOuR+3rxDOb5D3pM696LQBUFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FfNnZTU3
Subject: Re: [Buildroot] [PATCH v1 2/3] configs/zynqmp_zcu104_defconfig:
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
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 3 Jun 2024 12:52:11 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynqmp_zcu104_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1
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
