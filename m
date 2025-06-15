Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5D6C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 20:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37B396058B;
	Sun, 15 Jun 2025 20:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKVGxfeaKmwT; Sun, 15 Jun 2025 20:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A3CF605FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A3CF605FA;
	Sun, 15 Jun 2025 20:52:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CAEB4151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1928401EC
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjWK5kb41qMG for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 20:52:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E989E401E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E989E401E9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E989E401E9
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:52:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EF85A13F854;
 Sun, 15 Jun 2025 22:52:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 22:52:52 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 22:52:52 +0200
From: Julien Olivain <ju.o@free.fr>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20250611060058.3003917-1-yegorslists@googlemail.com>
References: <20250611060058.3003917-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e405f6affdb73755f9db58e7c3b2cdc5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750020774;
 bh=2c5Kdmx16S2pSRNFHxihY/Lc4Ply2Wuv/Y/qIh0BRhg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uA6b2GOq2z3k7wEaPxNa6hwaGZtPN37LFPiVELB5CD9TC2nJY0ozN9+hujgIbwkrM
 pzllik8J5rekFCuZ5sGUXJOX1bMFbe/H8xQwrMck5clyLE7SRUPXsOPBv7UTZCdBVq
 sXU9EIhlqrcfM16/QZP5WaieOG+hRJG0So88ih2mMg4ly5Ec335FyuxYkMOoA81C+Z
 1O9uQOKgeUOxHO8vLyVEuHkAw/QPg8cyH1aTotRABGC+xTRomL/c06RtL72/axqX7H
 IUiz7DKIMmJIXkrnkJ7LWPDuUA0BhpHGZSp8ZOxiywIlM1L7g9AbyJigYO8JcrN5ZH
 rKfSyaeSWgIzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uA6b2GOq
Subject: Re: [Buildroot] [PATCH] package/cannelloni: bump to version 2.0.0
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

On 11/06/2025 08:00, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> For change log, see:
> 
> https://github.com/mguentner/cannelloni/releases/tag/v2.0.0
> 
> Bump GCC to at least GCC 8 due to the C++20 requirement.
> 
> Add TCP protocol to the package's description.
> 
> Fixes:
> https://autobuild.buildroot.org/results/87d5ab39a84c51f340875ae365d4f39439e81645/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
