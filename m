Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBECAC00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5808A60FA1;
	Sun, 30 Jul 2023 20:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5808A60FA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t35NKd-aSydg; Sun, 30 Jul 2023 20:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 968B66101C;
	Sun, 30 Jul 2023 20:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 968B66101C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E3E11BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5870E6101C
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5870E6101C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OU6sdhNehgC for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:42:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52A5961026
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A5961026
Received: by mail.gandi.net (Postfix) with ESMTPSA id 234CA1BF204;
 Sun, 30 Jul 2023 20:42:40 +0000 (UTC)
Date: Sun, 30 Jul 2023 22:42:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730224240.2e35d7e6@windsurf>
In-Reply-To: <20230730101422.2276724-1-bernd@kuhls.net>
References: <20230730101422.2276724-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690749761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L/ZxW4ffail8z92ld7CtwOW/JBQXI1if0QRVaXZpLDc=;
 b=nOtW6Z9RiDSPVyzLK6jcOmpTpE8QmMCwbWezcYAy55iYF383VUU0Yc8roU+TGGlATxGp36
 BXcGEGC2NleaJ0B6797CVHpeU94zrXHkIC2bdBBuov7IBXZTnoqZke45si/f+34vNQU2X6
 zXZioPGVgC7WyCeXh2ihp7PLIPGyYcLTsAvOPBH1LjoPxogX1EEpI/79CnRQh6RePBlr7J
 6WytS6mwJh1GQwXawcp2IR045CTt3u+x5MuH+3GCfifu8IPUK4GHtm13B7tXCOrBkDWDO+
 y9P9/1L8vDltOO0/jneBKyfoWai4AQy5wvjcwpOtoDHLU9zGbwUQMFURBXod0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nOtW6Z9R
Subject: Re: [Buildroot] [PATCH 1/1] package/libuv: remove POST_PATCH_HOOK
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

On Sun, 30 Jul 2023 12:14:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 1738b5582ba0cf715303f4ebfa1d2323a33d0ae4, which
> switched  _SOURCE to an upstream-provided tarball, forgot to remove the
> POST_PATCH_HOOK which adds a file already present in the tarball.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e4d0c06e3babed6b290b6223a1cf7e4cce38064c/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libuv/libuv.mk | 12 ------------
>  1 file changed, 12 deletions(-)

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
