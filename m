Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA301C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 15:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9691D40E84;
	Sun,  3 Aug 2025 15:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4UZuNr81IGh; Sun,  3 Aug 2025 15:05:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BABF240F0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BABF240F0B;
	Sun,  3 Aug 2025 15:05:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A7D1A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6765240F35
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2IilCBdgGlG for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 15:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7771B40C4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7771B40C4C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7771B40C4C
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:05:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8E3A92003CE;
 Sun,  3 Aug 2025 17:05:49 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Aug 2025 17:05:49 +0200
MIME-Version: 1.0
Date: Sun, 03 Aug 2025 17:05:49 +0200
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20250801-fix_libspdm-v1-1-48138baca30b@bootlin.com>
References: <20250801-fix_libspdm-v1-1-48138baca30b@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <15c103a036a9ae248fb9444057ed7733@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754233553;
 bh=Jn86JH5BqvcK8/uTCSzXRXQxCLBEwVwhRsQx2PsK1yM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SrHbyTu46zf1qYyytkP78S172ABezQCiBKHmalPJ4u12sst5YemCDBBZGUxBdVOji
 ZXXEZ9nucDwOiVMGq2czF2BaDjA9nfvGA+sC+LsFtN/Qs6yPK1SptBXRpI7jCUBMp9
 Hp1TeiesbS30cE6LqSAygEDzh2UVfx3cN4gL2BOrrMMV+hhrk7tdPX/qUR3CaFroxv
 bAKXZOMM14qyloySKCpF0rKoKBAus8VlD1Vk6TPFcjZopGF1Ou1AR9uf/z4KpMpIfc
 UD0Q623k4Kkwh5KwkdAbef1dOYY9x5zlexiuFjEJ01gFM//ivSBMF0zFQZJ8owSGaG
 PdQGmJeFHzQHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SrHbyTu4
Subject: Re: [Buildroot] [PATCH] package/libspdm: bump version to 3.8.0
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

On 01/08/2025 11:59, Thomas Bonnefille via buildroot wrote:
> Following the upgrade of libopenssl to version 3.5.0 [1], the build
> process for libspdm encountered issues due to the new openssl API.
> It requires some modifications in the asn1.h file of libspdm.
> This build error was addressed by a specific commit [2] in libspdm.
> 
> As Buildroot 2025.02 isn't impacted, this commit bumps libspdm to the
> latest libspdm version to fix the build error.
> 
> [1]: 9868ca6e
> [2]: 88797f83:Backport API introduced in openssl 3.5.0
> 
> Fixes : 
> https://autobuild.buildroot.org/results/87b/87b8805975ef132a58c40e622e2e023199f6ee2a/build-end.log
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Applied to master, thanks.

For info, I also fixed the LICENSE.md hash.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
