Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFFACAC592
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 20:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6217D605E7;
	Mon, 22 Sep 2025 20:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJn3Hq3pkiyf; Mon, 22 Sep 2025 20:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE9C6605EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE9C6605EB;
	Mon, 22 Sep 2025 20:22:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D9891F1
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F0938058B
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfL08Zp9w0QJ for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 20:22:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90F478057A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F478057A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90F478057A
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:22:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6857F5FFB4;
 Mon, 22 Sep 2025 22:22:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Sep 2025 22:22:31 +0200
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 22:22:31 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20250922195902.3873493-1-peter@korsgaard.com>
References: <20250922195902.3873493-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2477ae313dc76713eddec4770c0fb4ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758572554;
 bh=Ae8qvBIEa9E6RS8YpkigKc1LQsJWyXkEddDnh5Ghud4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tcKar0EI0cZXVk69O0BP3Q8lIubayZQejSMJZ38rz46JtL0+3n5wT4mKnjkqEWZtP
 HUGfPnppdn6CPXe5B8nb/K2BPI+Zecv3emi7ZIoD4K0RzespzsvYl5lPOzVxvGPsUm
 I0uzaDK5QAw97WGRk6MQWherNJaHrsS2FkPxqLTs2Qv8aPPdK26KxFBTseK52UzYOh
 SYkkjSUHg/JOkxzdDU7lk34PlFOEvll1aYVTMvaVN3cWFEOTJyscrsZA3oIFCTTcr8
 7zGap+jFx0a9C5+T5X7cAv905Ra0jelxa773MMoBbYtb8pB2nuidLjbKzgEE8jfPrB
 7v/1vp5KNpeCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tcKar0EI
Subject: Re: [Buildroot] [PATCH] package/openjpeg: bump version to 2.5.4
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

On 22/09/2025 21:59, Peter Korsgaard wrote:
> And drop now included security patch. For details, see:
> 
> https://github.com/uclouvain/openjpeg/releases/tag/v2.5.4
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
