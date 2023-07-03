Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CEDC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10CC281C40;
	Mon,  3 Jul 2023 20:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10CC281C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtBUPGVNPj3d; Mon,  3 Jul 2023 20:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67708817B3;
	Mon,  3 Jul 2023 20:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67708817B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E07F51BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B389F4091C
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B389F4091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Igt9p2RjUjJG for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:03:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704A8408EF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 704A8408EF
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:03:42 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 600982000A;
 Mon,  3 Jul 2023 20:03:40 +0000 (UTC)
Date: Mon, 3 Jul 2023 22:03:39 +0200
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20230703220339.62e71e11@windsurf>
In-Reply-To: <20230702122236.1113430-1-m.niestroj@grinn-global.com>
References: <20230702122236.1113430-1-m.niestroj@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688414620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c42YAqOfBPKwRjZTH88H7rdHBb+z3GMS+H3NLiC1vPs=;
 b=HaM0A4qT9KMRj6UQ9zGrgfG7xeWZgcUc8UNVxyw4cXCVX2N6DOr3U1wLVLJquClAMX2+i/
 /deaE2V9oN6y/NFDV+LCIeo3haJZzHnygFYTO7a/jLzhwl4QmgKrEqQun300M1XKrjkCAr
 Py+l7iflPDkT/cs/3jXcoOlPzCOjztwq3mh9bA3P9WsI9yAIFnJVzyYPbM760wY+Xhotsj
 JNOYENNghrxbSqfqJCoyeIrhETeCmnSPtWdNeJb6YBw8lgVruQFUqMX1S3eSou3Bi13jd7
 uGamI5oDS0QBfiovfuRmRllPNbNCEqXsFa2LtVQNJ8fU89FS7YlxYaTvesfJog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HaM0A4qT
Subject: Re: [Buildroot] [PATCH] configs/chiliboard: uboot needs openssl
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

On Sun,  2 Jul 2023 14:22:35 +0200
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Fixes uboot build errors:
> 
>   In file included from tools/imagetool.h:24,
>                    from tools/aisimage.c:7:
>   include/image.h:1383:12: fatal error: openssl/evp.h: No such file or directory
>    1383 | #  include <openssl/evp.h>
>         |
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  configs/grinn_chiliboard_defconfig | 1 +
>  1 file changed, 1 insertion(+)

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
