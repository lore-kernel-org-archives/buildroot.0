Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDEDC8303F
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 22:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F9A6F5EB;
	Mon, 25 Aug 2025 22:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id is5zHfvO315m; Mon, 25 Aug 2025 22:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E146F5ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E146F5ED;
	Mon, 25 Aug 2025 22:36:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 341DDCD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30FE542BCD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INaEtS-M4kDx for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 22:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 523A540C90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 523A540C90
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 523A540C90
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:36:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 49B8E78035B;
 Tue, 26 Aug 2025 00:36:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Aug 2025 00:36:41 +0200
MIME-Version: 1.0
Date: Tue, 26 Aug 2025 00:36:41 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20250713125146.831278-1-dario.binacchi@amarulasolutions.com>
References: <20250713125146.831278-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b1c28b63db1b2a986e64974acb18f1a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756161406;
 bh=DZM+UalBcAGnvoWAVnViauDXZBZJd9CAJ6F5wwVJ8xA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RQqB6rBNY5ODVBHZRZaCuX7GEfej1vCEbfiEcSNAWw9EWrACTyyOToJDJ8wbNBGXV
 shs5k2ntMGlqtViRDKthJKtKrCWLs6xmMrquclDdBe9FK3CNRMKo2NebFeoLzAwJE8
 GHdxP2yai/o1JOlL+54TOOzea6pJxgoXSU8YZnuYjTT4eKMOWA5AR56YiWFJANHEht
 LzDXYzw4WBRxh7+OSV0o4gZYwlwNEs3iNlqwm/i7M2Sp0392BFxl2yDpFxMO5rPB17
 aRBTntBK4Q3ZOl3YKt4xTJ02zngwL1GswoFfwnGuBdegO1y72m7d3BkSMnYmftaQZW
 Ul0rQl8B1za+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RQqB6rBN
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32mp1*_dk*: bump Linux to
 6.12.36 and U-Boot to 2025.07
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

On 13/07/2025 14:51, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.36 and U-Boot to
> version 2025.07 for
> 
> - stm32mp135f_dk_defconfig
> - stm32mp157a_dk1_defconfig
> - stm32mp157c_dk2_defconfig
> 
> The new version of U-Boot with commit [1] enabled OF_UPSTREAM flag for
> STM32MP15 platforms. This required properly updating the DEVICE_TREE
> parameter to pass to U-Boot in order to successfully complete the 
> build.
> 
> Tested on STM32MP157C-DK2 Discovery Board.
> 
> [1] 
> https://gitlab.com/u-boot/u-boot/-/commit/35f90f76f45b186251cd5da0b6f057e0382fb7db
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
