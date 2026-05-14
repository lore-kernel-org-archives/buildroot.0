Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B542FCD4851
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 13:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 184C060E84;
	Thu, 14 May 2026 13:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L40bLoORYejF; Thu, 14 May 2026 13:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C146960E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778765146;
	bh=7X17kO8ShiABTo4WBE5lnY/jkIuab6LCsznDhSKqh9U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D02K91lGPTwWcyYpQCCnXBgKaB3FRwtWZCW08zV1XNoQ6RZ1Lz+7Gly0JPGeB884j
	 2JCwUI5zuzxM9oAbazUkOhiNUjHWqnAv3VAeogRSPw7M8cfLxbMLDHLjUXOUuiKaMz
	 JVWTlnOC6czbZMqMd0ryhxQ/2tZcpcHfWAfx+zOrczC08fcGYI4atnyuX6a2y7pHFX
	 pXNCsce1dxH/vWBMR6hS4URC1lei9/Nc8EkoJqE42IFrZW61n6Mcwr7rzDnW0447ac
	 nZ8gPcn5CuV/05cekJLBhdehMXqiUoMHjrdDiUJznAoQe0XWe9Hoq6DhOB9YnGhhZw
	 6LL03n8TLLUyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C146960E7E;
	Thu, 14 May 2026 13:25:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB6137F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A16C40B1C
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eh9DY_AURhQR for <buildroot@buildroot.org>;
 Thu, 14 May 2026 13:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A9F040B1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A9F040B1A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A9F040B1A
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:25:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 19AC719F576;
 Thu, 14 May 2026 15:25:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 14 May 2026 15:25:41 +0200
MIME-Version: 1.0
Date: Thu, 14 May 2026 15:25:41 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <441966d3d0bc463bbfd7f6981177435c566d9602.1778560640.git.yann.morin@orange.com>
References: <441966d3d0bc463bbfd7f6981177435c566d9602.1778560640.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <42e43a2f2fcbf6c9141a74592fae5b46@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778765142;
 bh=2f0UD08P/MTqkZqdx7ZAdHal3VQ7hEgokqkuToOW0qU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PJgq7HoFXfCkpItAiiqXKnzkwFwFoGBbZillzsJVWiVsM6IAJO5FJMOCa6ZXwFXKP
 uRnQ2D8KX3LXFlhvZ91HotjEbkYliaPBtgv7g6JHNOtvrmYc0dpi7HoiHTS0zp2+F0
 gwy3o6YEmJzN9Ml7kCZrPIohN6kFI7D8/eJe9vz/f4if3AOAoFriLgUHZiQtcWhyz8
 wdaAWicU79DSd+WCokHV0WgFjY+x7WDNqqD1xqU5lvi8K0yEg0ab7EGvuuG8KYYbft
 d1OW2ZrcmY93T/juk8fxpkln9uQGEnrVMVHMEOGTMY+ZYW4dJ+zDSfPAuTpGCM8Jdr
 AAa2Gs/uUYzPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PJgq7HoF
Subject: Re: [Buildroot] [PATCH] package/skopeo: bump to version 1.22.2
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

On 12/05/2026 06:37, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
