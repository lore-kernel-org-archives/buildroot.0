Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FFCC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 16:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5EEF8105C;
	Sun,  1 Jun 2025 16:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trXhun3aDl5P; Sun,  1 Jun 2025 16:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 218B6810E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 218B6810E9;
	Sun,  1 Jun 2025 16:02:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 111FF1F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02FD78101D
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKVd3pCh8PHl for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 16:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31239810E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31239810E9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31239810E9
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:02:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9D4B813F8B5;
 Sun,  1 Jun 2025 18:02:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Jun 2025 18:02:32 +0200
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 18:02:32 +0200
From: Julien Olivain <ju.o@free.fr>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Horatiu Vultur <horatiu.vultur@microchip.com>
In-Reply-To: <20250601133219.4675-1-fl@n621.de>
References: <20250601133219.4675-1-fl@n621.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <ae232d17d841c8c19a885a36636d5fc7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748793755;
 bh=ATpsfj4j2d+kdB2Kui1h9reCjQ93+eOOnVyX4yzx7GY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t719kJ9XNiaMJ/llmd0RFJJ7Fti0RIaf8WncJGPMi2szKqGADGg3IRK+1QIHPQD1i
 p2/R36n6tycpTS5tbWKFuyXbwqth8HmNREjEfv/OkPVi6hMRMHZkjZ2HglhdPJmn/N
 wXVwJauHpyVmweR8+ubPjofRZwVUcHet3/kK00rUI7y4eST0T4fTdwK1WZodx4gyYm
 WzYIAFP75SN76PsyYHBzn0cHyFaiLd6wN1olokKOjw8HwItckh0SW3EmUL5ZU7sVYj
 kygoie7UCnpEkUY0ZcvUAstEmayvRrzCs2sFV4Hg6pvx//Uy2FIHqh3lE2i23Gh2kR
 68pyHQcI0LuVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=t719kJ9X
Subject: Re: [Buildroot] [PATCH 1/1] package/easyframes: fix CMake 4.0
 compatibility
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

On 01/06/2025 15:32, Florian Larysch wrote:
> Import the cmake_minimum_required bump from the upstream master branch.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/3fe/3fe0973cad67641d880c460a1fef859443e8a10b
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
