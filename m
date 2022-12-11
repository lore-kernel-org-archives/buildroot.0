Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C242EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 21:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6948260BE2;
	Sun, 11 Dec 2022 21:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6948260BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5yJLwxPndUy; Sun, 11 Dec 2022 21:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F63F60BD8;
	Sun, 11 Dec 2022 21:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F63F60BD8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E75E1BF309
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE07081414
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE07081414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAfgCii6ri4v for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 21:47:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7348C81413
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7348C81413
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 21:47:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88DEF40002;
 Sun, 11 Dec 2022 21:47:05 +0000 (UTC)
Date: Sun, 11 Dec 2022 22:47:04 +0100
To: Christian Stewart <christian@paral.in>
Message-ID: <20221211224704.33be71cd@windsurf>
In-Reply-To: <CA+h8R2qPG=2ghvntT=jXAp0s+0tsZANvJUvV7F1iU7ukLkh1Ng@mail.gmail.com>
References: <20221201014538.679048-1-christian@paral.in>
 <20221211212504.4ee65e0e@windsurf>
 <CA+h8R2qPG=2ghvntT=jXAp0s+0tsZANvJUvV7F1iU7ukLkh1Ng@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670795225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Db8U4rOaFHgqgVB5GxYBm7aDyf6Q7+2afnS7ocsVA60=;
 b=UKd6fa+E1EHOtOkMqhXsKSaLMFILn8ETfbQth0i5QgwJ0S48+dNytrck0yqsLJZyrdnQ/q
 WulSAIjYGBT/jxBGCgCQ6gBp1J3zjmoHGcvy9fB3Ksz15qLQWceM3WAbH2z6yJIYicyMy4
 uQD0fWU5CEBMvFhNA3zdiTFrY+A6NC9y8HJr1yPiGbYvK1PPh6qe1Jdy061Rt/nETB0WrD
 e3njtHPdPoIS7MGPiGobOrCpDu4ksSrBbPKL6ZfRa7GOoLfVTg5VSwFoHNGfhlySmTWqC4
 egi0E7c0/fP1pM1ID2IZtajBK1RiZ4P1j3hsQ7TCSbmv5sTmKqlQ3aYhi4pi2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UKd6fa+E
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rtl8821cu: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Dec 2022 12:32:59 -0800
Christian Stewart <christian@paral.in> wrote:

> The first, yes, and it's been merged:
> 
> https://github.com/morrownr/8821cu-20210118/commit/3b594e7654ef1320ff9cac6b6472fa1b17af134b
> 
> The second, no. Since removing the compiler version check for
> -Wno-date-time is not something they want, and more of a Buildroot
> thing, I think the patch probably will need to stay.
> 
> Shall I resubmit or can you fixup those two little things?

If you could resubmit, with the details of the upstream status for each
patch, and the license hash fixed, it would be great. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
