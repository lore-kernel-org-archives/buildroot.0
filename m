Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B6C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F4F740535;
	Sun, 24 Dec 2023 16:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F4F740535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22B5cJd8CFRE; Sun, 24 Dec 2023 16:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C55340572;
	Sun, 24 Dec 2023 16:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C55340572
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E65C1BF5DB
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F189F41604
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F189F41604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id drLpxhT0xM5w for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:09:19 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2E9F41603
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2E9F41603
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31DCDC0003;
 Sun, 24 Dec 2023 16:09:17 +0000 (UTC)
Date: Sun, 24 Dec 2023 17:09:16 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20231224170916.546766ef@windsurf>
In-Reply-To: <20230916140613.1869975-1-ju.o@free.fr>
References: <20230916140613.1869975-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703434157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9sKcUVeYVqWTnW4QvIx7hZfzrNYzc5rothAEOQfoofU=;
 b=cb6i5Li7eLWxQSy2/c7wOnu96fwQxiRRLH2EIrdU0tVWQ9+dN2PW9geI+LxCNEhgO9Pi/f
 NalR01GdYuxiMbPfLlnPY1acZf7PHvArMrAoqvLtUwMg7taiZO1cfV3erBU0301rEjsi+G
 uryYX+1qmhLAO5r4nGXdh5EjFElE4mEoMq4Yg3rf5nAU8JQoFlwGK1eCgUsFgD+RgBOOhw
 mrLLK6x4z1w927qzsgrGqdNRPlrGzY4zwlGOCkO5pCCdMo6uUL80N/N9kQ4ltpTYLosL6K
 GLoUKA6YKvM4rmwN9Q6Xn8YbFEGtbUj+czuri2Rf0fSYgmBMbwz4+FRdSSKp+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cb6i5Li7
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mmpico: bump bsp components
 to version tn-kirkstone_5.15.71-2.2.0
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

On Sat, 16 Sep 2023 16:06:13 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Those components are aligned with NXP BSP lf-5.15.71-2.2.0.
> 
> This commit introduces arm-trusted-firmware upstream patches to
> compile the needed version with newer gcc and binutils.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366606
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 971f8ad with commands:

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
