Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E029BC19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 21:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A1A440D9F;
	Wed,  5 Mar 2025 21:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrDg1fceET9H; Wed,  5 Mar 2025 21:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 731C240DA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 731C240DA7;
	Wed,  5 Mar 2025 21:03:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C7BF95F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 990BE40D9F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLVF2y-d39ix for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 21:03:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9C9B40DA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C9B40DA7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9C9B40DA7
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:03:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id F1CBF780395;
 Wed,  5 Mar 2025 22:03:16 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Mar 2025 22:03:16 +0100
MIME-Version: 1.0
Date: Wed, 05 Mar 2025 22:03:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250301164215.623958-1-festevam@gmail.com>
References: <20250301164215.623958-1-festevam@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e456c8d24554d07c9bd07b8debb71ac6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741208598;
 bh=B0VWwjws3OFTbEWk60k0s3xZG0BilfQL1mpfGY0PKP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VFpjFz09lG9O2kAr4jHAdVmjziUhCoTvEcd++BljTtuRQLeKiIZaxnl1c/zHIK1rS
 hujo1aTQn1r9/WuMyZLFNIq5hCBXI4rBvmig1yf2VEign5Rmh4EApbPOXQKrhiVs11
 ZHKVnUjBv79eAcZmClM+ga2lVYeYr7BxroXvQQtceHJqeMmv/tJhwA15xGuxUO0ruN
 fCr6bLx2NWNj73Z/00GvbfnCiOPkUlitUKg8HJpU5Rp6GMAxnasSWeqrFwEeeAGiao
 E/7xTPt0jnxE4i7l4DmdgNiw82P9OQVBkjnO6Ls3oAM03SxYghNrk76VdmGKXIPTCJ
 NG6BoZiWSjC7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VFpjFz09
Subject: Re: [Buildroot] [PATCH] package/freescale-imx: Forbid DDR selection
 for i.MX93
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

On 01/03/2025 17:42, Fabio Estevam wrote:
> The DRAM controller on the i.MX93 does not support DDR3 nor DDR4 
> memories.
> 
> Forbid the selection of DDR3 and DDR4 firmwares on the i.MX93 case.
> 
> Fixes: 1ec956130d6f ("package/freescale-imx: Allow firmware 
> installation on i.MX93")
> Reported-by: Sebastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to master, thanks.

I also mentioned i.MX91 in the commit log.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
