Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DCFEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8600E41E98;
	Tue, 11 Jul 2023 22:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8600E41E98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJ_QcU_kKcxH; Tue, 11 Jul 2023 22:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5566041EA5;
	Tue, 11 Jul 2023 22:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5566041EA5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D59A61BF32D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D7C841E5D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D7C841E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7VB8ez_ymb9 for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:01:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD28B41EA4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD28B41EA4
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:01:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FC021BF207;
 Tue, 11 Jul 2023 22:01:48 +0000 (UTC)
Date: Wed, 12 Jul 2023 00:01:47 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230712000147.55686040@windsurf>
In-Reply-To: <20230610093042.3292143-1-bernd.kuhls@t-online.de>
References: <20230610093042.3292143-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689112909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1HBnziNjNpgZ7vaCnX+l/0ZJbpKQiBJxPB12xrjYBo=;
 b=Ys1PmMnx+/QCcFTgpnkDo1nUEP02equ3RmQSX83gKfhDeMmT7wMQbQD7P2HYDU6GadwUyQ
 EsvYXXBl8RWl7YbEvhvu29KeG+nrI9c4J1z/GSjA0gkxnPezjWmx0N73VFTdykxINnjzch
 oGRVVW2t9IzyX71j2BZaUH/itX45qlw0m1/6O9AyQ/X2Htuyca8LFRk7n8T198URcR+6yz
 2k/kKX3u4jO08btwHrs7bqENnw7ySeylgv16mfuYGgDC75udFqTlFIHKUV7PtjhO/McOWd
 uOQt8QIJzvVbAfH2EIvwLt/bJQ6WxL7gYxy7g2Zz44pkFvzJVO7Qke8w+ZlyHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ys1PmMnx
Subject: Re: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.45.0, 3.1.0_libuv_v1.45
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Jun 2023 11:30:42 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated license hashes due to upstream commits:
> - various cleanups, parts of old license file was moved to LICENSE-extra
>   https://github.com/libuv/libuv/commits/v1.x/LICENSE
> - copyright year bump
>   https://github.com/skypjack/uvw/commit/68803053f42bb3b0e139a984837a5539e5da7fe6
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libuv/libuv.hash | 5 +++--
>  package/libuv/libuv.mk   | 4 ++--
>  package/uvw/uvw.hash     | 4 ++--
>  package/uvw/uvw.mk       | 2 +-
>  4 files changed, 8 insertions(+), 7 deletions(-)

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
