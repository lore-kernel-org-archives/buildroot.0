Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF52C27C50
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 16:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9BD960A7D;
	Mon,  3 Jun 2024 16:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heGJIOAe75oG; Mon,  3 Jun 2024 16:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A403560A8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A403560A8C;
	Mon,  3 Jun 2024 16:25:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85DDD1BF397
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72ACA81452
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgtoRs2EtQTr for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 16:25:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5655D8144A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5655D8144A
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5655D8144A
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:25:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 61308C412B
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:21:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45AAA1BF209;
 Mon,  3 Jun 2024 16:21:31 +0000 (UTC)
Date: Mon, 3 Jun 2024 18:21:30 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240603182115.459a7399@booty>
In-Reply-To: <20240603121435.197680-2-neal.frager@amd.com>
References: <20240603121435.197680-1-neal.frager@amd.com>
 <20240603121435.197680-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1717431691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gn6Sf3iZj0cb6GDlPtUD9CLljtKL5tUPwiCOcVpKlU4=;
 b=a4fE27yPLhkruFtVJv/kyDnx9RzMDTLOSU71P5fkCTaZ3/gehBQ/ViS7ueYoevc9576l52
 4pvXN94pFNdfx2ViyEzQjIi4O+9nzPacwoLpXz6E4gW4wOaduSGUXXQzTVh4YluWiZ0Alh
 6OhOJjPEZcwXI7D1x333lLAF91oT1lx6IHaFM9wdZSJgBBLiC3OqSGQ8rjYxsPbdqoz3OK
 Uh6ZqoZC38Wf10Pv6OwB8UI3bF/lWZd6evtC+FaPkD3Fe88oy5dQH5TdU3NjDQsEinATA9
 PEvArk7ow96jtFuV6tYI03YuPKI0On33lVCxi1fAxOlHd+8oq9aXXB4+EZ6skQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a4fE27yP
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_kria_kr260_defconfig:
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

On Mon, 3 Jun 2024 13:14:35 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynqmp_kria_kr260_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1
> 
> Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
> needed.
> 
> With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
> the offset between the base address of the boot.bin and u-boot.itb instead of
> a raw base address of u-boot.itb. This allows for A/B firmware updates since
> the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.
> 
> Thus, Kria SOMs come with the following QSPI address table.
> 
> Partition A:
> 0x200000 - boot.bin
> 0x280000 - u-boot.itb
> 
> Partition B:
> 0xF80000 - boot.bin
> 0x1000000 - u-boot.itb
> 
> This patch updates the addressing in the readme.txt accordingly.
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
