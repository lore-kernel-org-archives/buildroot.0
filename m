Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2313BC8303F
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 22:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA456F5E2;
	Mon, 25 Aug 2025 22:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGT-E1Buw6D2; Mon, 25 Aug 2025 22:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CB4E6F5ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB4E6F5ED;
	Mon, 25 Aug 2025 22:35:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1273B0B
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2BEE6F5ED
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hqx1t0aRnpmm for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 22:35:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3744C6F5E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3744C6F5E2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3744C6F5E2
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:35:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D7D87B00539;
 Tue, 26 Aug 2025 00:35:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Aug 2025 00:35:28 +0200
MIME-Version: 1.0
Date: Tue, 26 Aug 2025 00:35:28 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20250712151706.1816792-1-dario.binacchi@amarulasolutions.com>
References: <20250712151706.1816792-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <0db69c0321a0d9fdc295e993fd184264@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756161332;
 bh=u0fYOjoMe33Pl5mg5ANJk9bEGyWV0vqKvxyO8KY/RYw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VV4c1U3HgC9NTUgUqyTwPT0S/wvaWuaaEMekjxOPS3UYvPEB3w6hkw6GfI+gLYh/T
 OVBlV2RoBLPUMhqlctmC4W+n7vfzy5eyOInZx5R7rXvqDSm8RlZbVUP3Qq+i0M+vKK
 IVbUG6pOO6p/vaeGZqqJCm9xAixDVoP1QjfmMiEm7dkyi3qPKDvS2Zi4HtaU2Br8Il
 Ij8MTG8Ra5ZBI5x0BCjdfSEB/rjy4LZnSz518xLTv750s5dP/DRRtrEjNdx+zgjH3Y
 odxBiAsmULs0+esX7EbSg43VBbMOWK0SCqGd775kb0AtQ6QDFHxirhrI5yAUiLWi7B
 0QZOwm3hN5//A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VV4c1U3H
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.186
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

On 12/07/2025 17:17, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.186 and, for the SD
> configuration, also updates U-Boot to version 2025.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
