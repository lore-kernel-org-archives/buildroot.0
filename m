Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD869E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8733340A7E;
	Sat, 30 Sep 2023 13:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8733340A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Tp07FSh5n8R; Sat, 30 Sep 2023 13:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 858E440B0E;
	Sat, 30 Sep 2023 13:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 858E440B0E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68B131BF5A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517F660ADD
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 517F660ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xP2HUr--mv-k for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:23:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01A8460A92
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01A8460A92
Received: by mail.gandi.net (Postfix) with ESMTPSA id 225161BF204;
 Sat, 30 Sep 2023 13:23:24 +0000 (UTC)
Date: Sat, 30 Sep 2023 15:23:23 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230930152323.2f4febd0@windsurf>
In-Reply-To: <20230930132145.GB2579@scaer>
References: <20230930132145.GB2579@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696080204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOhc2+S/Xtt+YTscfuUVPWhEPqxBK/7CloqkgAKcPFo=;
 b=VrCrlXXHBBhAP7z0aI3eM/qiDZPZ75gEhZV2JlzabHyZxKoz3x9qj4RvwVpLaHjXk/zkCg
 wt4zICmMLE49qnKX+9nAr/4dTgGQTuUcbJnhD5ucnvvvkDnApPa3Ae3pH88JTCGLT98/5X
 Yj6bg4EKCXeGx/2VaH+gPZiXNuWO2DRizyR/dffZrXkO9jnKO+F3sULme+/ZzXcMAgQG2e
 J3ZMZJ39qL03Hb/1UxeLtymX+TmpSYVjHThCGRTvcFurEFaW6Bwt4IvAuCm9GkyYmJnWDI
 t1FQcjZCVE0jXmzUD3ddYvSMjyM8UUo/OxJSSMV2Eyxyby3C1kmEBpbAo0O3pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VrCrlXXH
Subject: Re: [Buildroot] New maintainer on board
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Buildroot ML <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Sep 2023 15:21:45 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Welcome on board Romain, let the Force be with you!

Welcome on board Romain, may the push be with you!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
