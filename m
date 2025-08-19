Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D65CA0EE4
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 03:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F2B380DE2;
	Tue, 19 Aug 2025 03:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwvTCdsuiFSv; Tue, 19 Aug 2025 03:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9CD480DF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9CD480DF6;
	Tue, 19 Aug 2025 03:25:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF51AE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1584400CB
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFxeWf3LNAgk for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 03:25:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4E2440098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E2440098
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4E2440098
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:25:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id ED16113F879;
 Tue, 19 Aug 2025 05:25:22 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Aug 2025 05:25:22 +0200
MIME-Version: 1.0
Date: Tue, 19 Aug 2025 05:25:22 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Alexey Brodkin <alexey.brodkin@synopsys.com>
In-Reply-To: <20250817133532.1211976-1-fancp2007@gmail.com>
References: <20250817133532.1211976-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <70ca4823abb12ccc12909afab0760a0b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755573925;
 bh=dqwiH6k9cp75ggv3AEWj0BZwxt7lt+J9o7dUQH0quDQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MwQDP2AZasubkWBE0Ol6dZP5ycUfYJwDWDqOHUbRmR2I2wHjSnshxzGW2wMEbWcp7
 7GLcNBjdFgjSRM9XEVTvD6Vcjz2OQd97+tPsHU2uYN7ffS1CJqXTUl4uMEYXgyuSYR
 kGXy/1K99+kW2nnGU9f1BLxAhe0hptkuOQmF6GBcCCDE2b5MLflcSb/dbMAxmTSH/w
 1Q2nO1pLhH2lWp2EeDEAhlJx/GggTD1OBd8DZBQOJJtC412HFqoR+okns1dzmQoutT
 Uq2nXwwwty6M3Jfs0VCIJ1mVYgY9ppW77qazvJAye2+8jlyHBloP13KW81LhdhTE40
 pc6673JW0/1Lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MwQDP2AZ
Subject: Re: [Buildroot] [PATCH] configs/cubieboard2: bump Linux to 6.12.42
 and U-Boot to 2025.07
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

On 17/08/2025 15:35, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
