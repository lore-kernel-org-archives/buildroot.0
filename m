Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92965C5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 19:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F13080C80;
	Mon, 24 Aug 2026 19:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgfGZ4WkDX8G; Mon, 24 Aug 2026 19:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787598945;
	bh=YbWeR4WigM9tyBfjmpGpJ+7I70IEP/LZI97Yp+xn0H8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g7nfpE6gczWDzuH9WeI8fp6FloqePJnYICht8v9gYBwIObqkr5MMuYc7gaY5L33Sd
	 R3fK4OtirBY0ENlwzkaQuR6Sfbf1Ztry/r2Nmt0MTRilwTSAf/m/kq2JWx4URBrawQ
	 fmi7Hddqc3wg+J6ix0EJkuQRBN44ohLK1WnZlTT6e/y4l5Apgp3chYmPSES6AFiWsN
	 KFaICU4xtJcFlCxCHpOEEbYobFozhUNDbRhbCoTUzHhm1VYEaFrJzEb2xfrcjgtsyb
	 cRNV2U13vE1eqwagT03udbQt2HWZhTKJo69VYrgy8vwcuy8aRgtv3EuQ+80UDIkOIX
	 qnsOdP2rDfMgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48AA980C70;
	Mon, 24 Aug 2026 19:15:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECDEE2FD
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DACB280C6C
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dV81G_a2yukJ for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 19:15:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B858A80C70
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:15:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 558B84E4139F
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:15:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0535D5FFC1;
 Mon, 24 Aug 2026 19:15:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F232811C79B25; 
 Mon, 24 Aug 2026 21:15:33 +0200 (CEST)
Date: Mon, 24 Aug 2026 21:15:32 +0200
To: Adam Ford <aford173@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aoyYRRW01AayvSyp@windsurf>
References: <20260716133001.2147463-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260716133001.2147463-1-aford173@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libxml-parser-perl: add
 host-libxcrypt dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, Jul 16, 2026 at 08:30:01AM -0500, Adam Ford wrote:
> host-libxml-parser-perl compiles XS modules against the system perl
> headers, which #include <crypt.h>. On build hosts without libcrypt-dev
> installed, the build fails:
> 
>     .../CORE/reentr.h:126:16: fatal error: crypt.h: No such file or directory
> 
> Declaring host-libxcrypt ensures crypt.h is present in the per-package
> host sysroot before the build.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks a lot, applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
