Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0276C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5215F611EA;
	Mon, 30 May 2022 19:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4vcsgKKhkqm; Mon, 30 May 2022 19:18:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7005660FCF;
	Mon, 30 May 2022 19:18:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B851E1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A586840ADE
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rvn_5J2cIlU9 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:18:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80F40409C1
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:18:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FFD020004;
 Mon, 30 May 2022 19:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653938280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKYxoVRMPEen6/GUpi6lImwMzXtx/EWJyzOumQqHVLY=;
 b=Cae+OeOr5+d2pyfqJYE4FfDPSVOWNHIqCjhVYpUBYh5kzf3Bg+nAEq7iZJmwV2xE3j55z7
 KRn+LMOhs+gCoTYj/zLSD9jZqXl3QGpTNb14MvPe2HY8ESARy7+gjyMjPul053Fd7nsIoX
 cviMvnjf6h8uoTU6PpI4IUSO2LR3JRbvDefDr5lMyPzbStjYOvL+BuWZY6MtEgw9QA6SUZ
 ZMDfxrag8IURHOi3I+f/b1kE/w0uHSlVqLdXGYJIGgTuLgAjPxCy2skxlUW8wLoBXV629w
 xAgF1l3ko3wGDBa5FPqppJdb4wOrAmD+U6hYMMqBpVX9tinTdFURIeZ3i/xpxw==
Date: Mon, 30 May 2022 21:17:57 +0200
To: Damien Le Moal via buildroot <buildroot@buildroot.org>
Message-ID: <20220530211757.3fbb52c5@windsurf>
In-Reply-To: <20220530033836.474926-4-damien.lemoal@opensource.wdc.com>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
 <20220530033836.474926-4-damien.lemoal@opensource.wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 03/11] board: Add common Linux kernel
 support for RISCV NOMMU builds
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

Hello Damien,

On Mon, 30 May 2022 12:38:28 +0900
Damien Le Moal via buildroot <buildroot@buildroot.org> wrote:

> Add the board/riscv/nommu directory to add Linux kernel patches used for
> all RISC-V NOMMU builds (QEMU and Canaan Kendryte K210 SoC based
> boards).
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Thanks, I have applied to our next branch, but after moving the patch in
board/riscv/nommu/patches/linux/5.18/. This way, we can use
BR2_GLOBAL_PATCH_DIR on board/riscv/nommu/patches/, and also ensure
that the patch gets only applied to version 5.18 of the kernel.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
