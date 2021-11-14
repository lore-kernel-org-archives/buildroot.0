Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC297C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:24:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91EE061104
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91EE061104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6683B40226;
	Sun, 14 Nov 2021 14:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7loNxQ_-7xrd; Sun, 14 Nov 2021 14:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5F3640214;
	Sun, 14 Nov 2021 14:24:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0DF1BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EC5B80D66
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8VjB9GoSETd for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:24:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD88D80D7C
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:24:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id E5B87240003;
 Sun, 14 Nov 2021 14:24:32 +0000 (UTC)
Date: Sun, 14 Nov 2021 15:24:32 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211114152432.419c57f3@windsurf>
In-Reply-To: <20211112180556.2124148-1-giulio.benetti@benettiengineering.com>
References: <20211112180556.2124148-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/olimex_a64_olinuxino_defconfig:
 backport gcc >= 10 u-boot and linux patch
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Nov 2021 19:05:56 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> The old U-Boot version used does not build with hostcc >= 10. Backport a
> patch fixing that issue. Same goes for Linux so let's backport a patch for
> it too.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966188
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...ve-redundant-YYLOC-global-declaratio.patch | 52 +++++++++++++++++++
>  ...e-redundant-YYLOC-global-declaration.patch | 28 ++++++++++
>  configs/olimex_a64_olinuxino_defconfig        |  3 ++
>  3 files changed, 83 insertions(+)
>  create mode 100644 board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
>  create mode 100644 board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch

Applied to master, thanks. However, it would be great (if you have the
hardware) to update to newer U-Boot/Linux versions, so we no longer
need those backported patches.

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
