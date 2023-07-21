Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA23C0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5C4C41860;
	Fri, 21 Jul 2023 21:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5C4C41860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id haHVaYLbElOH; Fri, 21 Jul 2023 21:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04DAB41859;
	Fri, 21 Jul 2023 21:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04DAB41859
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0021BF299
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1435E41FCF
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1435E41FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFT7JqdqcZaG for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:00:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71B3441FCD
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B3441FCD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28DEC240003;
 Fri, 21 Jul 2023 21:00:40 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:00:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721230039.4ce4faa2@windsurf>
In-Reply-To: <20230721174241.3931298-1-bernd@kuhls.net>
References: <20230721174241.3931298-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689973240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17ojn7vDQS6g6FPRdgOpKx6b/WODVllp1ZLcfgbwFS4=;
 b=X+dJ4ZAviFdpv2HRrd8HnrqtBI2AZz3+CUd5oYOTY+Igms43fYuCMgJiVSTHuI5wn6zY93
 xq9D5z6KOxTDEjGro0v0D4W057BtqC4G6+1uAbeMVyCPIJt+Jsx/TGYnTL8gJVO5cEY8FK
 BZOSJhG3YBNAD1B5tCqg2lvSRHPxhqxEGf8dbYJe2Kuids1tt1CzrE6MThoukgd+H9FSbK
 GKFxPB5e+y1+Rz5ZDySC0ggyTehgdtkCLBKXzcNEFlc5eBTwdmBUmJg9372c0/vlJ61YH4
 cSEsH6ANaYcoA9ylw1pC4wgW5tm7eXWsomSdPRNAUtiTbxJBLhK+s/wCf3XAVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X+dJ4ZAv
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.4
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 21 Jul 2023 19:42:41 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2023-July/000724.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  package/mesa3d/mesa3d.hash               | 6 +++---
>  package/mesa3d/mesa3d.mk                 | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
