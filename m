Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703BCCA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 09:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 295AB60594;
	Sun, 24 Aug 2025 09:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWvkP-048Jfu; Sun, 24 Aug 2025 09:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5652B6146E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5652B6146E;
	Sun, 24 Aug 2025 09:35:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DFBFE19C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D190541AB0
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDcrKyxpktfW for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 09:35:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E182F40963
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E182F40963
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E182F40963
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:35:46 +0000 (UTC)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 23A61C6B382;
 Sun, 24 Aug 2025 09:35:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 098CB605F1;
 Sun, 24 Aug 2025 09:35:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FE0A1C229FC3; 
 Sun, 24 Aug 2025 11:35:26 +0200 (CEST)
Date: Sun, 24 Aug 2025 11:35:25 +0200
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Damien Le Moal <dlemoal@kernel.org>,
 Michel Stempin <michel.stempin@wanadoo.fr>
Message-ID: <20250824113525.7f0d0261@windsurf>
In-Reply-To: <20250823211802.2213734-1-ju.o@free.fr>
References: <20250823211802.2213734-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756028131; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=egBA2roGepuMfKyaNCpYBrB9JpFG/EOiDVGa0xM2jPU=;
 b=I1LU2OBHdRRoNY5Ewu9p3lg8lP47vVnfSG/eNJ8s2dIFrjg1x0rvCm6MsL2u6LbRd8Mq91
 bUx8reWjYSgSnlV3QzcvwlyzcUgiZVO8Pz7/KotKnv0pQP8cOxYY8joDjqfLCn+0MsJne2
 KWqSfZZkHxytvOOQ/E8ydWuM3GU7WZHxfFNrRNIbqXdSH04bLyTixc8i9VvILOlHJ3Iohg
 pmTuVYX65OIvX7A/l5bNaFGV2ck59Obca+Pg9NddvNIN1jTjOiN+b9nbB062BAPlKRO0Yr
 PwU1u7oh9GH/68hr+HwwSkdUfvd10kWWONWXaajjcRUf5ZcW14ma2cd2aKbgIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=I1LU2OBH
Subject: Re: [Buildroot] [PATCH 1/1] configs/sipeed_licheepi_zero: update
 Linux, U-Boot to fix build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Sat, 23 Aug 2025 23:18:02 +0200
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> Since Buildroot commit [1] dc0f7215c6 "package/gcc: switch to 13.x as
> default", sipeed_licheepi_zero_defconfig fails when building the Linux
> kernel with the error message:
> 
>     drivers/ata/libahci.c: In function 'ahci_led_store':
>     ./include/linux/compiler.h:350:45: error: call to '__compiletime_assert_1138' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
>       350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
> 
> This issue is fixed by upstream Kernel commit [2].
> 
> This commit fixes this issue by updating the Linux Kernel from v5.3.5
> (which is not a LTS series) to v6.12.43 (which is a LTS series
> including the fixes). With this update,
> BR2_LINUX_KERNEL_INTREE_DTS_NAME is updated accordingly to follow the
> new DTS organization.
> 
> This commit also updates U-Boot from 2022.01 to 2025.07. This new
> version now requires BR2_TARGET_UBOOT_NEEDS_GNUTLS=y.
> 
> While at it, this commit also switches to a stable glibc Bootlin
> external toolchain, to follow the new guidelines from [3].
> 
> Finally, this commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and the
> corresponding hash files. The .checkpackageignore is also updated to
> reflect that change.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771001
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/dc0f7215c604e845009e03784a221332867bf35a
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f07788079f515ca4a681c5f595bdad19cfbd7b1d
> [3] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Cc: Michel Stempin <michel.stempin@wanadoo.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks for the patch!

However, for defconfig, don't we normally require that changes are
runtime tested on the HW? That's a bit the whole point of our defconfig
I believe. Jumping from 5.3 to 6.12 is a big jump that deserves testing
on HW. If HW is no longer available because the defconfig maintainer is
not responsive and nobody else has the HW to test, the defconfig should
be dropped I'd say.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
