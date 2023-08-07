Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFEDC001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 22:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BB5340A00;
	Mon,  7 Aug 2023 22:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BB5340A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxR31ohnAuzQ; Mon,  7 Aug 2023 22:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13F42409FB;
	Mon,  7 Aug 2023 22:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F42409FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C781A1BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A032B60E6A
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A032B60E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4uKjHkRWPWt for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 22:02:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8198D60E5F
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 22:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8198D60E5F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E77C1BF207;
 Mon,  7 Aug 2023 22:02:50 +0000 (UTC)
Date: Tue, 8 Aug 2023 00:02:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230808000249.43e10184@windsurf>
In-Reply-To: <20230804155009.576919-1-bernd@kuhls.net>
References: <20230804155009.576919-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691445770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CtqARY5s7sV8jZi1urqrU/N0yRYHpmCVQZro7IAOf/Y=;
 b=czQlcvK1YfBxLWg7BW0sHTkh2Ya6y4WOnn+Mr+4kT8+m1IgNPywPaW+R07eUcMST8xNLw5
 3S2msk7iMQZJdbOrsEapY6eDwqVs+i8LYoWpfj0p831CzsOiNK8jIl3bNWjFD6Cn/jCDuU
 vPA2OMXjBDHGyGgk6czcFK/TwtzVTVRcUpSuamIBK+TciaT+/9cJVqHO5ldyzXdtDg+Ueu
 3j0k9UVMZvoKx89Fb77714NF8W2ezkjwd4KlqUjgDIBojXCU3TOzJJIZv3eQ2YdY1WzFAz
 CvlYyJ3dPx34QYedQu4lEbIbz4vjYciFEbgEDFILkj18wu7w+0OZko5eeke33w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=czQlcvK1
Subject: Re: [Buildroot] [PATCH v2 1/1] package/composer: needs host-php to
 extract phar files
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

Hello Bernd,

On Fri,  4 Aug 2023 17:50:09 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Although composer has host-php as build dependency, in the case of
> BR2_PER_PACKAGE_DIRECTORIES=y host-php was not built during extract stage
> of the composer package.

It's not just BR2_PER_PACKAGE_DIRECTORIES=y that is broken. If you run
"make host-composer-extract", you'd get the same result, without
per-package directories. I've adjusted a bit the commit message.

>  HOST_COMPOSER_DEPENDENCIES = host-php
> +HOST_COMPOSER_EXTRACT_DEPENDENCIES = host-php

Here I hesitated a bit because those dependencies (build and extract)
are now slightly redundant. However, it's true that we need host-php at
extract time, but also to use host-composer. But for host packages we
don't really have the concept of runtime dependency: the only way to
ensure a runtime dependency will be there at runtime is to make it a
build-time dependency, which is what we do here with
<pkg>_DEPENDENCIES. So I've kept it like you did, but I will certainly
be willing to hear arguments of others as I don't have a very strong
opinion there.

Applied to master with the tweaked commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
