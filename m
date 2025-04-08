Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480FCC369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 17:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF6CC61156;
	Tue,  8 Apr 2025 17:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NctqP73PM0aU; Tue,  8 Apr 2025 17:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 198D460DF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 198D460DF1;
	Tue,  8 Apr 2025 17:27:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B354DD6
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4B7540182
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dy_iBo1fv-hO for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 17:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D69DD40639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D69DD40639
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D69DD40639
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:27:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C0C7EB00579;
 Tue,  8 Apr 2025 19:27:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Apr 2025 19:27:19 +0200
MIME-Version: 1.0
Date: Tue, 08 Apr 2025 19:27:19 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250408072500.1771475-1-dario.binacchi@amarulasolutions.com>
References: <20250408072500.1771475-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <84b434df4fe8a31dfe676a19ca7122d3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744133242;
 bh=FgV7OQtjefArVEprHdE7OKn3nyTWCOsenm3f6+D4Goc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jVLonxFTlmmpoAn1/SdD2GTjK8l09bC27boYzPOG+OrFQX6mtbIANkQyMO00JOPow
 GmHHJIMLVIF1CawGHuWblZiO2sZZ5Ll4HciQpWoKDQQY+QVWHWRXLvRChM7NXhYlC5
 3TbQxHjwzwzHB0+HYe6hL6mK1/yYYihE0SBAE8amrg9Ra5LE3H78+q+x2ZcktOK0YB
 cYJOPpDcVkt/CaDSpdT0LVeRPbkGfp9TOkdLZbxkhYRWAO/53Ot8UxEImcwpSQ2Hmg
 d6zMyAD/HHmkFrJohbc56M6nbLm0G6Kn0OM7H5YeEqYRdPJucpLC+wuLbQJJGg/sZA
 XWJipGHmGNZXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jVLonxFT
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2025.04
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

On 08/04/2025 09:25, Dario Binacchi wrote:
> Release announcement:
> https://lists.denx.de/pipermail/u-boot/2025-April/586033.html
> 
> Changelog:
> https://github.com/u-boot/u-boot/compare/v2025.01...v2025.04
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
