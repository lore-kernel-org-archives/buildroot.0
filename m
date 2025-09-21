Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6E4CAC5A8
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 22:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48C2240A35;
	Sun, 21 Sep 2025 22:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_w02YXtsDJw; Sun, 21 Sep 2025 22:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F92406C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F92406C1;
	Sun, 21 Sep 2025 22:21:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2AB21C0
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 22:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D905C842DE
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 22:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cx4311RZYj5A for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 22:21:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9681F842DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9681F842DB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9681F842DB
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 22:21:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 591E320039E;
 Mon, 22 Sep 2025 00:20:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Sep 2025 00:20:55 +0200
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 00:20:55 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, "Alvaro G . M" <alvaro.gamez@hazent.com>
In-Reply-To: <20250914210811.489994-1-yegorslists@googlemail.com>
References: <20250914210811.489994-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d313b82572869f2fc564122cba28828b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758493257;
 bh=1W5I/K6itDXNfvl7p5BJKnkqFMaPO28QAmG+HgEfM/w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n1pJpFkaWbT6VpK0fzLP6JpS5vMHscNh5y8vAuyw0PGl82C6PWIpaD3RU9fZfSBf/
 HJroM+/28Oy37fki/4h7a0w86hHID9SMqc/36nVicBzyAp7XdQlPiFA0MpbeluFd6U
 V3UBfSz1FJ4GxS5txYcvTk+4Fcydje6RJ5frkXOWA5jEHR8cBm07hJG53BZHL4NwAi
 hfZO0vtbaE/CBLriJbRrKoh72MSA7DAU1EgDoH4KYx9vLnJpP2u4SPdq1/8BVLn1KL
 swm3MXhKDI2EztaszEFt9qJyhVJclVbiOnmAkiUWSGJafEUkIREA3AO2zHYMo2QvIo
 c+P6fY+PBGRMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=n1pJpFka
Subject: Re: [Buildroot] [PATCH] package/libxmlrpc: add BR2_USE_MMU
 dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/09/2025 23:08, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Build fails with:
> server.c: In function 'ServerDaemonize':
> server.c:1590:13: error: implicit declaration of function 'fork'
> [-Wimplicit-function-declaration]
>  1590 |     switch (fork()) {
>       |             ^~~~
> 
> Hence, add BR2_USE_MMU to avoid building with toolchains without MMU
> support.
> 
> Fixes:
> https://autobuild.buildroot.org/results/10464159f2a9ff41ea0921a45ce12ecd0fa50ae7/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
