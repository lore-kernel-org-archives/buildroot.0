Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2DDCAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 16:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D860D40685;
	Sun, 28 Sep 2025 16:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3ZS2nFPWbFm; Sun, 28 Sep 2025 16:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BE9E4067F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE9E4067F;
	Sun, 28 Sep 2025 16:39:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA1ED197
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 16:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B9F84067F
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 16:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWcTmOLIrYBR for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 16:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D38F44067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D38F44067A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D38F44067A
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 16:39:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4819713F86A;
 Sun, 28 Sep 2025 18:39:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 18:39:05 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 18:39:05 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250928144210.4094868-1-neal.frager@amd.com>
References: <20250928144210.4094868-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <55d25a02934ed91724945eb4911eb7b7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759077555;
 bh=Zc8oipvQKb4z0SyyNLjwGPOSp9+72bBnuLX3WWLYDs4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QivH57b3CqFnbJ05H1q3lAsFHOnjOsU4wW6JxOiBfJrZ1xOTBywFGEDTUe5RyGGd/
 Q1wcKf/HKN6CfsBTls6qL7YiWv0+aDHjylMBW2e8Erv4CCYa7z1Pw9PHaA1rv9rhMU
 itdGrh0qzqg3Ehgnec5sYpx0x5liNdBBrMynaa32fvhi69oicXTMh3nLcyPKVmmJMi
 U8aGOGKtp2jGS3EoKGAAI3nW/JA2VS8kS1r6fFY1qP7DdeEnM/x6tQt9XhKf/zNKSy
 ecZNFWuXBko2EgqZwlbARySg3ZvfeUubewmlOr4cKZ42mb4g7Kjk7xUb2zYqtfkwhQ
 0w0/aRDxvaoAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QivH57b3
Subject: Re: [Buildroot] [PATCH v1 1/1] board/xilinx: migrate board web
 links to amd.com
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

On 28/09/2025 16:42, Neal Frager via buildroot wrote:
> As the xilinx.com website will soon be going away, migrate all xilinx 
> board
> web links from xilinx.com to amd.com.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
