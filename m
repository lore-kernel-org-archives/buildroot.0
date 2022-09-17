Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57661ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 19:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5DAA60A6D;
	Sat, 17 Sep 2022 19:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5DAA60A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4VLttMmgEtu; Sat, 17 Sep 2022 19:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA05B60687;
	Sat, 17 Sep 2022 19:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA05B60687
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3C381BF267
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C73D260687
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C73D260687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jWZU5zDruMKV for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 19:20:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9D2C605E3
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9D2C605E3
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 19:20:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A2521200004;
 Sat, 17 Sep 2022 19:20:05 +0000 (UTC)
Date: Sat, 17 Sep 2022 21:20:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20220917212004.134f13f2@windsurf>
In-Reply-To: <VI1P190MB0493696F52BC73BAD412C26D9F419@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493696F52BC73BAD412C26D9F419@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663442406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSGYSHR/1HSQcK+tezfXSaxf1dtWGPTwOHsSh8jLQ3E=;
 b=bZYirMtHNVQ8IO+6tU9o3fAVM/opxeUZxEG0DhJwxGbLDMpy8MaUrJY5nA6kjl2TZDrkGk
 xrCQA7pNLIo5iVQkOInrXa26mb4XpsbpJwPzSxmaTvEXdv83ibkn/J1f/DoKd1VjwoemV/
 A83Zhr/B3NI/1hLLQHgpV3Suc81MgGmUHn9WKfCrYX1srz6ZzHZZQkmeHyWU/TiMMFXlwU
 Q9MPXwduefUMEmfRTaPyKvYHjfpAGUFsESRhD6llOEzzTgUohzu00n06IzHQx6l9vHBqnU
 SW5X9vlwPCWbQJEfbDmlvYkfcRVmYbeHIZ+SFDkl2Sbn11OnXWfCkG2CbgNFgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bZYirMtH
Subject: Re: [Buildroot] [PATCH-next 1/1] package/dbus-cxx: bump to version
 2.3.0
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 7 Sep 2022 08:38:22 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/dbus-cxx/dbus-cxx.hash | 2 +-
>  package/dbus-cxx/dbus-cxx.mk   | 2 +-
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
