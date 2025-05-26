Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4396C5AD49
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 19:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BAEA80D13;
	Mon, 26 May 2025 19:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PatAG0jVNC_y; Mon, 26 May 2025 19:43:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5B8580D00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B8580D00;
	Mon, 26 May 2025 19:43:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0611A19D
 for <buildroot@buildroot.org>; Mon, 26 May 2025 19:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03093400E7
 for <buildroot@buildroot.org>; Mon, 26 May 2025 19:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNrKY-uT4OeB for <buildroot@buildroot.org>;
 Mon, 26 May 2025 19:43:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39B384006C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39B384006C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39B384006C
 for <buildroot@buildroot.org>; Mon, 26 May 2025 19:43:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 19D8E5FFBA;
 Mon, 26 May 2025 21:43:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 May 2025 21:43:30 +0200
MIME-Version: 1.0
Date: Mon, 26 May 2025 21:43:30 +0200
From: Julien Olivain <ju.o@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20250523135434.925125-2-buildroot@heine.tech>
References: <20250523135434.925125-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.10
Message-ID: <39782ebbeb5f08e4601472fd382cc22d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748288612;
 bh=HsP13DPSzpcbspBn9mPKpdkZ1LTSUnJx+8+vKBQdzAw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FFS/qLF6RAVTrCjeA3jQyka8LFBici+58/ZrUPtEfx+uyPVTyOFXRsbMbBSPO/sMq
 YjgZWvmD08IjGmTnxXmX9qwidhtadmtu5854KGDhcHw1Zs+GxaoWzah9jEMMEwBtgB
 sX/KWicvdCKFgeODm+Gq2FrU9h0Rgctpca6ndHrumfuHMkarx/iwB6h00SUeG47ZFH
 3HPyMoc7SgGk0m2rPzZp/xPfYOLg1iATsdpy1VdG10JMqlE0yGlI/7WUAzcuryVE5c
 ki88KxOsJTIsPCBRNT0JP10TQhjwJdcKozla5TNfMjcmApn92R8V+EqFlCn4+TPX+f
 V+dzUxiNauJRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FFS/qLF6
Subject: Re: [Buildroot] [PATCH] package/sqlitecpp: bump to version 3.3.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/05/2025 15:54, Michael Nosthoff via buildroot wrote:
> - fixes a build issue with gcc-15
> - license hash updated due to year change
> 
> Release Notes: 
> https://github.com/SRombauts/SQLiteCpp/releases/tag/3.3.3

Applied to next, thanks.
For info, I added your missing "Signed-off-by:" tag. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/ae61cc15d92068ab5b56a0ee53518498cec04d6f

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
