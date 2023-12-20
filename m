Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E24C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 21:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD9B46156D;
	Wed, 20 Dec 2023 21:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9B46156D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWSw9GKqSoPd; Wed, 20 Dec 2023 21:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4508861546;
	Wed, 20 Dec 2023 21:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4508861546
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BA061BF361
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 21:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E554981DEA
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 21:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E554981DEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GB6niC5gl41Q for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 21:04:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4447281D18
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 21:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4447281D18
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67503C0003;
 Wed, 20 Dec 2023 21:04:49 +0000 (UTC)
Date: Wed, 20 Dec 2023 22:04:48 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231220220448.66f7aa2a@windsurf>
In-Reply-To: <20231217172514.1897244-1-bernd@kuhls.net>
References: <20231217172514.1897244-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703106289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f49s8HvdJpySABE0YRGF0mTMvMuAD+lqL4L8Nh2Q190=;
 b=AYDWfvh/T3/sMXJvKU8y6p5OFmAnMyt0UBBGw4hJVdboad1FPt69awAi88kS1UhA+BvWx5
 rxePL19/+5O8NeDjeVQGoCoPZZVg5mXXopM8LDLnbBEo2GSxWPLeXCAfD/C6a7L288uoB4
 Z3fwOuNYku8arfn2xqs85uc0KZzI8DBzOwiQoqBxBIZsHb4MOiL12lI/qWs5siR7cSDFLc
 mD1i1xIOBQMCsdxh18BsjHdJxPlZgE0LDjYTNG8AcWT69FGKDflv7Bsjb8Ryn/2WX14OxF
 YP0C7q98caa8q+KT7dR7IE8O+nXBjCm+R/emg0Z7oG8OywyCwV4vsijWMszgEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AYDWfvh/
Subject: Re: [Buildroot] [PATCH 1/1] package/transmission: bump version to
 4.0.5
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

On Sun, 17 Dec 2023 18:25:14 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/transmission/transmission/releases/tag/4.0.5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/transmission/transmission.hash | 2 +-
>  package/transmission/transmission.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
