Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA885C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 15:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABFB860A8A;
	Sun,  3 Aug 2025 15:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4EbvFN9xKqx; Sun,  3 Aug 2025 15:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B7560D9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B7560D9E;
	Sun,  3 Aug 2025 15:36:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09786233
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED42A60D9E
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rPy6pXD0ly8 for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 15:36:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3252C60A8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3252C60A8A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3252C60A8A
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:36:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 092D96012D;
 Sun,  3 Aug 2025 17:36:25 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Aug 2025 17:36:25 +0200
MIME-Version: 1.0
Date: Sun, 03 Aug 2025 17:36:25 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250803133846.2762327-1-thomas.perale@mind.be>
References: <20250803133846.2762327-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <17d0d2d70f418f74902ed7f87a55d3bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754235388;
 bh=R8GGqh1UYSQeaCwclzIKgulKfi3qmONPGOVF35PSEw0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QLg36skuP0t0D1hLwBZy+DabB79NZYEB+axT9EJhadDSprDcRRGJ/Ij5K4+hN4ePK
 VuLeRva6+1lP/CDUzhTB3DjnixgmoyMK4CD87XRhj1L6fUQBg8x5BJqOPEUciF21OJ
 PUMl5BTx3rqyI2e7UW2SjNHt8nrIMeH6i2TzcQ17YERVaJXEyE9Cru5V34ug1FBt2A
 E+HZRdnmuWO/ngXH4VGwcvU7UO+2cJhJvjU555pSm9D6Ix8rw8n8FmD03U6e8+e0ul
 Ltc/yIgApF61MJL5ypgd9wi8i8zUkZfBZsW2Mm9/tpIZEIdqH23HiYtu+GUDHyFaGB
 f3ObFZrfvcbog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QLg36sku
Subject: Re: [Buildroot] [PATCH] package/sqlite: ignore CVE-2025-3277
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

On 03/08/2025 15:38, Thomas Perale via buildroot wrote:
> The CVE-2025-3277 as been marked as a duplicate of CVE-2025-29087 by 
> the
> debian security tracker [1].
> 
> The CVE-2025-29087 has already been fixed in commit [2] so this patch
> adds CVE-2025-3277 to the ignored CVEs.
> 
> [1] https://security-tracker.debian.org/tracker/CVE-2025-3277
> [2] 835b5659ea package/sqlite: add patch to fix CVE-2025-29087
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
