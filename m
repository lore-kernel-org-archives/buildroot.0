Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E25AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCFDE81770;
	Sun, 20 Mar 2022 17:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cq_XVOtLxP3A; Sun, 20 Mar 2022 17:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE0E80BD9;
	Sun, 20 Mar 2022 17:11:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A104A1BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF4380BD9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 10FmWlZboOAj for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:11:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95C2880ACB
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:11:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D0FABFF802;
 Sun, 20 Mar 2022 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647796282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACQRHExbnlI5Yjal21wG9mPLXda1trfDHarBv11Zh1k=;
 b=ZrWju/tSDGOXyXGUPntXb8RJCDnKpuii2D6qe84qIEOH5Sx3qTQBHzkMCrYt+Y9e2cae4P
 sFUTV1pKcBK+fhOJJvtAT/pI2ypfizMzv+F2wrSyd1WLwv59+rrOfXNiOQtOXMlEc3VNXn
 lyQZWrzlEKAgSKKPtkU7At1SZT2YCNuumdeiImkSZgI7Mzy67T/uf/b+l1G2t1FxLPN2EE
 HMA3Ywd0utFCLVmLW3wLLTLLK6tyMkwcvTekv1icU1Y1y3yo7P2/sFyzkq74PDJAyjhT9l
 n66W8mtc4M/OGct6kzdeAcXC3IeSo7ZXOeKsQMLrJgdkqEq352ka8fPGXVva1Q==
Date: Sun, 20 Mar 2022 18:11:20 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20220320181120.250e1916@windsurf>
In-Reply-To: <20211130103919.19428-1-kory.maincent@bootlin.com>
References: <20211130103919.19428-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/octavo_osd32mp1_brk: new
 defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 30 Nov 2021 11:39:18 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> This patch adds support to Octavo Systems Brk board.
> 
> Very similar to the other stm32mp157-based boards. We use the TF-A, U-boot
> and Linux version from ST used by the Octavo constructor.
> 
> Reference:
>     https://octavosystems.com/octavo_products/osd32mp1-brk/
> 
> The device tree blobs come from Octavo System:
>     https://github.com/octavosystems/OSD32MP1-BRK-device-tree.git
> 
> The uboot patches come from Octavo System:
>     https://github.com/octavosystems/BRK_Developer_Package_patches/tree/master/u-boot-v2020.01-stm32mp
> 
> The kernel defconfig has been extracted from the prebuilt image.
> 
> Device tree and patch are licensed under BSD 2-Clause.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---

Both patches applied to the master branch, after rewording a bit the
commit log. It seems like since your patch, Octavo has related an
updated BSP, perhaps it is worth having a look and do an update?

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
