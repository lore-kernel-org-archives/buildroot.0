Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FB5D1951B
	for <buildroot@archiver.kernel.org>; Mon, 26 Jan 2026 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CC3860E33;
	Mon, 26 Jan 2026 21:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtmeauXiW2oC; Mon, 26 Jan 2026 21:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39E3860E21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769461453;
	bh=L6B0Aj7GS7a+TlYU+tQubSXs/Sb0nSwDJ2c9lkCUNik=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XP04VfAq/zHsWtQEUaZzKg/HpDsq/8orVtSrwhifYjzeUOtibO6RZmKYkAg77jKg0
	 b/KRtF0fhZLIUcOkm/lAFrHGuzdUQsPXi9G3QTykLFKdudDsV0tjxn1yNK9hJ9jnVs
	 FO97EqOZiECiw5+jaPEflVO+ufYpOgFsl1P/NYuNEJgE76/6jJBDyh5zhggaEFvuaz
	 1/ZX/7zzzzD76jNeRsnywfs6Bn8rZ7gpqKWTEwmKfXMZaCN6UF5MbgM6Y3ERbmGHig
	 F+K+pRUc893bm6psnAJo8Ohi3OZudYa7d0SLBXOURLYgEgkD6tBBKai9CEaSWhk3/W
	 0FPkOyh0UenOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39E3860E21;
	Mon, 26 Jan 2026 21:04:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4201633A
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 21:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2428D40ACC
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 21:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfXO3sP1TT8d for <buildroot@buildroot.org>;
 Mon, 26 Jan 2026 21:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C289640AC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C289640AC2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C289640AC2
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 21:04:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 673A713F86E;
 Mon, 26 Jan 2026 22:04:04 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 Jan 2026 22:04:04 +0100
MIME-Version: 1.0
Date: Mon, 26 Jan 2026 22:04:04 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260126194730.2835281-1-dario.binacchi@amarulasolutions.com>
References: <20260126194730.2835281-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <e3f4ed59f6bdebfcf3ee0f63a9d6460d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769461446;
 bh=Y1tB7zaOrBLeAt7P1UF27pFb8yFbbJShetQQGLSsfgs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R7Gb+UFV+Br4OfoJf6j9IBOX/dVf0qlebdMLA/fsY9HUII0lpKdln5XOYNNCsQZaS
 tHALICiCwIHsqGW3wCaX1yCG+Oj2+Wy7JvsfT/fuHj8QrROXGKHF18sfMpCZdiVquJ
 BBSyYZbCMVIp1ymxndlyUmJuiX/MP4JXsoc2O1MDHrlqu8Bz1kTif+F5qptA9dRAJL
 /p16JLXoiiwekbSe5OcOsbTrJKe03kmbKk8sbaJUCdog0Au1Wb05e63r9F/MSGij8k
 z4VlRVCQCiXT2nn51AtQI0mHfXn+KT/vGwbJxu9u3Bt6g0mMOPQ9svZ0fn/7iWGQf0
 dVX8iMk2tD9bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=R7Gb+UFV
Subject: Re: [Buildroot] [PATCH 1/1] package/less: bump to version 691
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

On 26/01/2026 20:47, Dario Binacchi wrote:
> For change log, see:
> https://www.greenwoodsoftware.com/less/news.691.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
