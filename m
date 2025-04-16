Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B6C369BA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 17:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DBDC83443;
	Wed, 16 Apr 2025 17:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CM2VTKL2y-XY; Wed, 16 Apr 2025 17:23:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD12F82AC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD12F82AC3;
	Wed, 16 Apr 2025 17:23:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B905B6B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F30E82E4C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRoLPI_EMi7E for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 17:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD5A782AC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD5A782AC3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD5A782AC3
 for <buildroot@busybox.net>; Wed, 16 Apr 2025 17:23:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 79EDA78032A;
 Wed, 16 Apr 2025 19:23:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 16 Apr 2025 19:23:28 +0200
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 19:23:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250416063732.469526-1-francois.perrad@gadz.org>
References: <20250416063732.469526-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <77962bb4ef0ceffefb7933758d6aed61@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744824209;
 bh=VKd7OUsxa+5fwC0SqSkvjreZprXjYgR/XsNErNTduvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZBuB5HYwVaskcSEv08nANGiKcLeXvN0UtNw5J16pBOtFh9LagLrrFUFAUyzyhOndZ
 6+1BVJgHJzsbfY28uQ4yYs1nssbv/BdIJcjeo2CTHR8fde2nf50kM9lQGlBTYBo/f8
 ALce5Pux6SVcZwpVxOa2D450fch9AI90D6LgfAXzNdXaA/oB9WijGeyNlMekJH99d1
 UHzm4KL0aPFFisNo0jEr+xP/5HTVNpRdb5UGafL8aJkA5Sov+FlCDfWsWhfeF9WIK1
 LbEmB5UYWTKfVc1u4/HriuF7cyviI3HX6BvSKe+F0OTEgb6kiGw0Rhw3TU/fSfZK8X
 jUwgf/MeFnDLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZBuB5HYw
Subject: Re: [Buildroot] [PATCH] package/lua-periphery: bump to version 2.4.3
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

On 16/04/2025 08:37, Francois Perrad via buildroot wrote:
> diff LICENSE:
>     - Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev
>     + Copyright (c) 2014-2025 vsergeev / Ivan (Vanya) A. Sergeev
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
