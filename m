Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F312CCFA13
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 11:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5EEB811EF;
	Sat,  8 Nov 2025 11:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSo2M4DFnzrE; Sat,  8 Nov 2025 11:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A9A2811DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A9A2811DD;
	Sat,  8 Nov 2025 11:14:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 076F32B8
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 11:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3D1E407B4
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 11:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuKeR_RL7hOp for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 11:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DAC340805
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DAC340805
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DAC340805
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 11:14:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B576D6012D;
 Sat,  8 Nov 2025 12:13:59 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Nov 2025 12:13:59 +0100
MIME-Version: 1.0
Date: Sat, 08 Nov 2025 12:13:59 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Kory Maincent <kory.maincent@bootlin.com>
In-Reply-To: <20251107120844.582160-1-fiona.klute@gmx.de>
References: <20251107120844.582160-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <41c0b0993629efcf11988f0f4e34699e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762600443;
 bh=+ISCwRVtju17a1ckrFIoa1gwK2lljaeZ6/rI5+jUmoQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qn0dGedLAe6EaTz9edwwt4w6BxpUtgvNHwKDWGkOQal3T2L3wmnkLXGUc+FMr3TLq
 myJIktTv2dsysYDSuW5BXtv3VJ8zRZIi+eZH8XgH5sUIEDNy/HG8fCVqymM5W4cPYh
 rAy74VE8oSEsS6KKgcW9lWFlMB+ZoKlMEmLNk9qB+QRaCslYiWfoNRP6OgLoryEvqI
 haqef9LUKj2IRC1Nycytj7sTXndhnQjXzmGdrUpXusrs3yGuTU4KwWdLhqmYnmMu+J
 Y1R7FFPn4X0YmJAo5FK0s4ylJWGysRwykxg1L+hF0kYtitq77lXer9PGqSCJKQLDJL
 FVayEKX0ac3RA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qn0dGedL
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: enable all hash
 algorithms if FIT support is enabled
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

Hi Fiona,

On 07/11/2025 13:08, Fiona Klute via buildroot wrote:
> This allows using any of the hash algorithms supported by U-Boot for
> checksum (hash-N) nodes when building a FIT image, instead of only
> SHA-1 or SHA-256.
> 
> Fixes: 14a0169714cd5c35be40faadc066412f144bc1a6 "package/uboot-tools:
> Bump to version 2025.10"
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

I applied this patch to master, thanks.

I probably missed those hash and checksum algos because we only have
sha1 and sha256 in the Buildroot defconfigs.
See the output of "git grep -F 'algo = ' board/".

Thomas recently extended the testing infra to cover host packages.
So maybe we could add a small test checking that this set of enabled
algos are working.  See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/9468f1c099221461abaf5ab152788e692119b8dd
https://gitlab.com/buildroot.org/buildroot/-/commit/bf4e1ec19f7714b03243afaa29b15f8b29ba8fea

We could also do the same for the target package.  What do you think?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
