Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC420C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 815B940477;
	Sun, 11 Dec 2022 10:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 815B940477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AigM2yajoN_2; Sun, 11 Dec 2022 10:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF227403A7;
	Sun, 11 Dec 2022 10:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF227403A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7ADD91BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46551401DA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46551401DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVqJxkajzTDu for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:51:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A6B401CB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9A6B401CB
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:51:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A1DBBFF804;
 Sun, 11 Dec 2022 10:51:10 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:51:09 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221211115109.106f7018@windsurf>
In-Reply-To: <20221210123048.306724-1-ju.o@free.fr>
References: <20221210123048.306724-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670755870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Utj05StubypoUloUaUkRUuk0zGXAy0b9Vfwa7xUlJAQ=;
 b=PrLDLJvDIaeShEEgaaefFXSFvHZmS7G2hVHxnqPWajHTTRsJAgnh37zMFa26+yjQPMnLVN
 o7ua5Dy+N/Rp7//o4SiMwCcMNNQFj8+ehovPASQCSU99XRNP8fUMbFfzzaPKP71Zj6YYgg
 hIlae8AuGqtwzLDVo/hdLRVoK0xgya9bDzbec/r6ITTr5O7Hw/jMkMrx2pXptlXTx2D8n8
 Eht91+Ji7ZUn3Ogyvn/SWVE7oCdajDCNWItqBTCh7WAUzR1odXXAKnQ6ca3dw1nyipb1oG
 m3SiOv9aL/NZqdesSuUutm3zEUmchsi69twoRSrbCfzeYzwPqbkVjdyQU4MAmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PrLDLJvD
Subject: Re: [Buildroot] [PATCH 1/2] package/ncdu: bump to version 1.18
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
Cc: Bogdan Radulescu <bogdan@nimblex.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Dec 2022 13:30:47 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 1.17, see:
> - https://dev.yorhel.nl/ncdu/changes
> 
> This commit also adds md5 and sha1 hashes published on the web site.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/ncdu/ncdu.hash | 4 +++-
>  package/ncdu/ncdu.mk   | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
