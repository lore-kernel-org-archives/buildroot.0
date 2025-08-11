Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B167CA0ECD
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F15A4141A;
	Mon, 11 Aug 2025 15:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5OGQskISsBi; Mon, 11 Aug 2025 15:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F8A14138E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F8A14138E;
	Mon, 11 Aug 2025 15:52:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E151154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FD3B4129C
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLvVweNFMjdM for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CB19412F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CB19412F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CB19412F1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:52:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E060713F8A9;
 Mon, 11 Aug 2025 17:52:19 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 11 Aug 2025 17:52:19 +0200
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 17:52:19 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250811153256.34170-1-dario.binacchi@amarulasolutions.com>
References: <20250811153256.34170-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4fa608fe66e31825cafd5e38854f924f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754927542;
 bh=eHPrJdwKPegh/caK/gqzCeKwpN873K0oRRGhJCCDzT4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=th6sVkVw0iGt1to9upxpPz9Dts6x3KjDHcEol3f21Q0Uz/TMM6Fg5XiSMr5vWY7Y5
 3Zae6rxzY+LxX6Mp10UT7blY1xcVbzUDb34KYM8n+pQiUdyK7x7btzW+v1VC5K2Edm
 FQP58c/BRb9g7CETErdFgdrC0g2wsRqBLGwfLAUOX2na0lsROxV1XSZNpZlo1SnSXD
 ohlGBHCNu+ANLr+CwCRcyBy5fB5jvo205bA5d7mrVJVDy8461/mzDmPomiONF50E9D
 E3W3VHEP0B9Nc7PNph3ViFN6G1zj/4IiYFBUYR6Oe6f5FqBQAf1N9V8Yhq7h8qQ44K
 dnMw2+LJaVRHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=th6sVkVw
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.220
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

On 11/08/2025 17:32, Dario Binacchi wrote:
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.220
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
