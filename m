Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017F9CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 19:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CAC083F9A;
	Wed,  1 Oct 2025 19:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0p-1R2xgDsra; Wed,  1 Oct 2025 19:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7213583F96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7213583F96;
	Wed,  1 Oct 2025 19:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25BDC93B
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1767883F95
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTMI3IKot31L for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 19:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA68683F96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA68683F96
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA68683F96
 for <buildroot@busybox.net>; Wed,  1 Oct 2025 19:12:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CEF1D60136;
 Wed,  1 Oct 2025 21:12:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 01 Oct 2025 21:12:20 +0200
MIME-Version: 1.0
Date: Wed, 01 Oct 2025 21:12:20 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251001143714.981725-1-francois.perrad@gadz.org>
References: <20251001143714.981725-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <04e92df05f5c71c3c921adc2936c45ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759345942;
 bh=ZWKM54UYQB1ICLgF6d4WkXgxCbgyDpDfWNw6kdBDAk8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LgXtX/qKUffVsuAZ5xiXptHgtYFU2tq1DLUP5Xpni8wezTlEfNW7hG3S6TtS4+3Wq
 HZ40futhq+UVoWe5d+l07AThzs/NOu9dy9/U7LIsgVtFwX6pKePIirE5o4qCen2w/p
 oaSIjSUP6TvhhWOTKDi5+gWLE9xTFn3A36ikz4d3yoq4P/bY+1aQdRztjAhlGATPBK
 b4jK+Iq1N3VFwnHjZmQoaMvBscQcQF2zht8WOGeIXsctjDi2xfb6jLwTkwsqVeGfi8
 q7NwR43tu1MxuU+vHE7p5SIruseI8K4QXNoMsIeB48Uqhy5Tqxl/3mBYZzb3Y60W8P
 4/dGRma9uvZlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LgXtX/qK
Subject: Re: [Buildroot] [PATCH] package/luaossl: bump to version 20250929
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

On 01/10/2025 16:37, Francois Perrad via buildroot wrote:
> diff LICENSE:
> -    2015-2019  Daurnimator <quae@daurnimator.com>
> +    2015-2025  Daurnimator <quae@daurnimator.com>
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
