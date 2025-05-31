Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D887C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 11:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1582C60771;
	Sat, 31 May 2025 11:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkZn-LOpyLc7; Sat, 31 May 2025 11:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 612B860786
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 612B860786;
	Sat, 31 May 2025 11:24:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71D3A235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 11:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 587A860771
 for <buildroot@buildroot.org>; Sat, 31 May 2025 11:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zl03uJ0ZF8oT for <buildroot@buildroot.org>;
 Sat, 31 May 2025 11:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DCDD6073B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DCDD6073B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DCDD6073B
 for <buildroot@buildroot.org>; Sat, 31 May 2025 11:24:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B4AC4780389;
 Sat, 31 May 2025 13:24:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 31 May 2025 13:24:14 +0200
MIME-Version: 1.0
Date: Sat, 31 May 2025 13:24:14 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250530222919.594540-1-kadambini.nema@gmail.com>
References: <20250530222919.594540-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <84d74bf0f9267172a517f42dfb2d1b67@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748690657;
 bh=JcdchbX5WWwuITyHFh/bX0fS9w0X7RUzdtY6A8v5pbU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OCtwmGSg587lEFzexEkbyPwCZM9wFZlHq1uvi75eEYSyKZTr3FCHxVUv4dw3+BH4w
 hxaFF8tcQukZDMvNvwDecnDRs9YTO1J3WQ3tpj7cgb2vdXi2lTs4M751Irpmun8pyB
 wf/3EE4n6exZhDiIZoBP4PGSh80JH5p0F/uz8FEW4gnrYxN1DX9adsyOFHEawEOOYI
 1m5YADAzUOA7S4qcVbgfpnGUQj+8X94mVzL/fU2k7vU9ruP0p/BceDobT6+d6oj5Zy
 6XqIjcA3c8ARH5xMhNDP3O2xHqs2mKllOp+IzJ561K3BXQqn1kICRt6i7Wir2jCWC+
 hh59gicLmB6Hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OCtwmGSg
Subject: Re: [Buildroot] [PATCH 1/1] package/tree: bump to version 2.2.1
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

On 31/05/2025 00:29, Kadambini Nema wrote:
> Changelog:
> https://github.com/Old-Man-Programmer/tree/blob/2.2.1/CHANGES
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
