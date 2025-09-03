Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971F0CA1010
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 21:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51845849EE;
	Wed,  3 Sep 2025 21:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZpP97QaDcfR; Wed,  3 Sep 2025 21:53:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8949A849F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8949A849F1;
	Wed,  3 Sep 2025 21:53:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9866F106
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89BD341A78
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlJlGKTT37X0 for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 21:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C669E41A4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C669E41A4A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C669E41A4A
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:53:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E4411B00548;
 Wed,  3 Sep 2025 23:53:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Sep 2025 23:53:21 +0200
MIME-Version: 1.0
Date: Wed, 03 Sep 2025 23:53:21 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250902210408.668877-1-dario.binacchi@amarulasolutions.com>
References: <20250902210408.668877-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4951001e1a8a54223a04253e8ad1754a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756936404;
 bh=Nw39Z8I52tmfWbAd6ia88lcRgpWcvNU3KUm5Jtm0orY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G/L1HeEM6RjrtMBCViUJYH2qIdiOc5nF52mB+VsuhSR0mPh3t37RRUwXIA+aFI5Qp
 aXsW5++kHNiD4/Rv78xGrRVQQnM4DyMPBu2N7GEzFf3mqH0WVY7PGlT8+qKmYDIkpX
 FFCTdBCCcjARQphCoRwUbMrIy4eqmTVe+ndZJlLmWV/drAG3mM8Eb92QnCGmRc0C2O
 luCj1cqW8yPNkc7i7X+NiJWt8gYPXDzPySkUPpjRJn3CVVcmOR/zVASJzH1jyeEMcv
 HVgqMSQQ46ytDUxKkbal2R883dhLhYamsiOwnMtVhXPE7UFuE9DE41Vw7g1D8EtzNJ
 fPHgOiVy3zfvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G/L1HeEM
Subject: Re: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.1
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

On 02/09/2025 23:04, Dario Binacchi wrote:
> The LICENSE sha256 changed because of a date update (2023 -> 2024),
> not due to any substantive license modification.
> 
> Release notes:
> https://github.com/pocketpy/pocketpy/releases/tag/v2.1.1
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
