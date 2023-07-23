Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CF9C001DC
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D43541571;
	Sun, 23 Jul 2023 10:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D43541571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p1EDz_oQhZwp; Sun, 23 Jul 2023 10:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8370C41365;
	Sun, 23 Jul 2023 10:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8370C41365
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F14D1BF5EA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAEAF41365
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAEAF41365
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9eGH8A7vvLH for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:11:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 944B5410E7
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 944B5410E7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CC19E0005;
 Sun, 23 Jul 2023 10:11:07 +0000 (UTC)
Date: Sun, 23 Jul 2023 12:11:05 +0200
To: Tianrui Wei via buildroot <buildroot@buildroot.org>
Message-ID: <20230723121105.27362fcb@windsurf>
In-Reply-To: <20230609174647.3097344-1-tianrui@tianruiwei.com>
References: <20230609174647.3097344-1-tianrui@tianruiwei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690107067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9IUy2511rJ5MYQ2R9Dlfph4fvpi6xKHtYRZLVtQNcs4=;
 b=NjHeB620BgrbRPRBYUt4HhPxFD46boFmyv8d9N38/C4j8g3fSonYDUB19vJICDwhS6EhQM
 zndKrjykGk5gMb1qE1Ac4YfDFO6XMlPq8x6wWR93Gl4LE2UM+WtjGMTicHYrQIORI3f37m
 Tic4da5/r5tT2wtfYNLQPSFlLi6M+Z4FJe6EK3iTNMVsq+/fQxTYdMKQhupCqFU3fNkxq0
 PBedodQEwyzLyRzlpeSuvqqaktYHZc+5M6tARdK7g4/o7d0nRmmQsag/hHRFH2uafR86fe
 MA8uBc2/Tm9hDp4jCaKhoQec0x0jBNGv4if9A0T9bPBgvK+K2FDx1xgF92eb5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NjHeB620
Subject: Re: [Buildroot] [PATCH] arch/config: Enable RISC-V Toolchain with
 Vector Extension
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
Cc: Tianrui Wei <tianrui@tianruiwei.com>, Mark Corbin <mark@dibsco.co.uk>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Tianrui,

On Fri,  9 Jun 2023 17:46:42 +0000
Tianrui Wei via buildroot <buildroot@buildroot.org> wrote:

> This commits adds support for building a RISC-V toolchain with the
> vector extension.
> 
> Signed-off-by: Tianrui Wei <tianrui@tianruiwei.com>
> ---
>  arch/Config.in.riscv | 8 ++++++++
>  arch/arch.mk.riscv   | 3 +++
>  2 files changed, 11 insertions(+)

I've applied to master, after adding a "select
BR2_ARCH_NEEDS_GCC_AT_LEAST_12" which was missing, to ensure that only
gcc >= 12.x can be selected when vector extension is enabled, since
support for this was only added in gcc 12.x.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
