Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9ECC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 15:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D40402B3;
	Sun, 30 Jan 2022 15:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tSOovrqFYI-a; Sun, 30 Jan 2022 15:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6013040299;
	Sun, 30 Jan 2022 15:03:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E86001BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 15:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C725383E59
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 15:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFb30oxIvaCe for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 15:03:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A33EC83E57
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 15:03:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 95E0D40004;
 Sun, 30 Jan 2022 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643554979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7VghQCKPC45G9XnX3IR62ecd/rVDTkM6JbzUfhibfA=;
 b=Ckn9zj4ypuSbwgQDHkkb2bnL6m5EXu06dxO9CdVfpAJ9j5R/AqKcFaDkWKBbZxmevofN78
 hPnlwLxP1WSfIdqOclFyQl2ObC3DqDFRz6U8qBQjzXzTZRxLTqOQR/B7vDJAkagBi7YECr
 oHfvgPxeIHM8dxJ2HSzDh0yInmCq/p5Y9YE69QQYryG6QPtwnIP2cypo8qbi2acbcPJPHi
 X/uYRcBeQQCRUWTjEb38ji3n6yCrkN4441Utg06S1xzXaBstnK5SsyvIhk+nkDgx2WFhbL
 UkxuPvKysbux3fd1aN8XiNPjjqmQK93xgWKUpdW+bgavFxoxv4yQ7+wiUfE+RA==
Date: Sun, 30 Jan 2022 16:02:58 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220130160258.20d80a8d@windsurf>
In-Reply-To: <20220129104425.3724653-1-fontaine.fabrice@gmail.com>
References: <20220129104425.3724653-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/htpdate: fix static openssl build
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jan 2022 11:44:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure with openssl raised since bump to
> version 1.3.3 in commit 163509a8e0d558e6339c5489f072dfe805e0cc34:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/10.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(rec_layer_d1.o): in function `DTLS_RECORD_LAYER_new':
> rec_layer_d1.c:(.text+0x124): undefined reference to `CRYPTO_malloc'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/75ad8515916dfa056b17c97fdd95c7eb4d83a304
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Move pkg-config call in htpdate.mk following upstream feedback:
>    https://github.com/twekkel/htpdate/pull/17

I'm a bit surprised by your feedback to upstream's reaction. Indeed, it
would have been possible in the Makefile to make use of pkg-config if
it's available, and if not fallback to just using -lssl. Preserve the
existing behavior, doesn't make pkg-config mandatory, but allows people
like use to make use of pkg-config.

Anyway, I've applied your patch as-is. And it made me wonder why
host-pkgconf was already part of the package dependencies?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
