Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625A5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E102611EA;
	Mon, 30 May 2022 19:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFr6TWVVv5Im; Mon, 30 May 2022 19:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3296960FCF;
	Mon, 30 May 2022 19:19:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76A8F1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 643B960FCF
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEzF3T2tgvoV for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:19:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 401AA60DFE
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:19:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 81E21100002;
 Mon, 30 May 2022 19:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653938337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZnWeugAYDkr4K0Vm4fp6Teve/Ci6ZSDnZpNBavJ3P0=;
 b=LpYi5Zwy1Tmp9CZQXz3Lify+0rIp3fiuet1HavrYEHzCf/i/hJSNr2PJgFFu30fX3flMtR
 XSmIj+Ggvg+Cxj/ArVa65nzkgRe1hVPVnKrT2wVMqVsvgiB4OmJwOVh/xUO73RFca4Ywkd
 qvyJRogAoH+1pAPPXVruUUoM7baKGK7ZHHXdj3+f8ke+nA3GG6toWcpN8hEzM5NMzcDPZf
 7WWc3XSkSDdBCNp9Z6nG0BasanaLHwN8aiOKi0JUnQdxsa3CqtfFkk1dCdTP305QSfet0C
 oRCzbCaGodAxnrBR+m/j2FGmusI/5nM6x3d6GFXbwPWv4BT0EXoOCaQtN+sGsA==
Date: Mon, 30 May 2022 21:18:55 +0200
To: Damien Le Moal via buildroot <buildroot@buildroot.org>
Message-ID: <20220530211855.60912dd7@windsurf>
In-Reply-To: <20220530033836.474926-5-damien.lemoal@opensource.wdc.com>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
 <20220530033836.474926-5-damien.lemoal@opensource.wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 04/11]
 configs/qemu_riscv64_nommu_virt_defconfig: new defconfig
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alistair Francis <alistair@alistair23.me>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Damien, Niklas,

On Mon, 30 May 2022 12:38:29 +0900
Damien Le Moal via buildroot <buildroot@buildroot.org> wrote:

> From: Niklas Cassel <niklas.cassel@wdc.com>
> 
> Add RISC-V 64-bit nommu defconfig for QEMU virt machine with MMU
> disabled.
> 
> Unlike qemu_riscv64_virt, qemu_riscv64_nommu_virt does not use OpenSBI,
> since the kernel is running in machine mode (M-mode).
> 
> After the build is complete, you can start QEMU using the launcher
> script:
> $ output/images/start-qemu.sh
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>  board/qemu/riscv64-virt/readme.txt        |  2 ++
>  configs/qemu_riscv64_nommu_virt_defconfig | 35 +++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 configs/qemu_riscv64_nommu_virt_defconfig

I have applied to our next branch, after changing two things:

 (1) Adding an entry in the DEVELOPERS file for the new defconfig, so
 that Niklas will receive notifications from our Gitlab CI if the
 defconfig fails to build now or in the future.

 (2) Changed to use BR2_GLOBAL_PATCH_DIR to point to
 board/riscv/nommu/patches to get the Linux kernel patch that is
 currently needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
