Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD57109449D
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 22:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D08A41B98;
	Sat, 21 Mar 2026 22:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDF52m0PB-9t; Sat, 21 Mar 2026 22:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FD141BA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774131056;
	bh=/GoIZqPfm3rIpFWUiGGvVUkLsM3m7D3sTtZXvc+9tCc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XJri3zt6xhLi1hZBc8kiMgux/cby59hF2QRhBSrqlUQsYthNuTjyFhjI2ozs+t4x2
	 JYFki2MWTDmQEtU5nOqn1WzCzvIhmKb1q3g0f6EFGRwX6le4/2YAG7H8utOGNQ/ga8
	 Z3zVTEbXNnM6GgTmHKX4jGPaaewZAp+Jg7SsynVDa5EiTtqtpX3K+B7f9rRM4yInDH
	 qmE/pI1c1dvsC58uNPYufNO+/NRU77xN0IEcN0YkzCijdYzBLHHkh2hGVJNNW6p7QA
	 nxkH4fdDzqxaEmN2n7UhMZ03Z5OLQ7jSCZxKw54a91DcTrzTQwiaMgGNZVYXgaaR1F
	 oOAy+Wxo7TpxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73FD141BA8;
	Sat, 21 Mar 2026 22:10:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 221A0265
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 22:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 132DD40153
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 22:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzLR5MXVFXpJ for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 22:10:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CD95400B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CD95400B7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CD95400B7
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 22:10:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 53A7820039E;
 Sat, 21 Mar 2026 23:10:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 21 Mar 2026 23:10:49 +0100
MIME-Version: 1.0
Date: Sat, 21 Mar 2026 23:10:49 +0100
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260314061837.9425-2-br025@umbiko.net>
References: <20260314061837.9425-1-br025@umbiko.net>
 <20260314061837.9425-2-br025@umbiko.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <179bbf23e44578c0b8a8446d685c5c1a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774131050;
 bh=OpMkvdYPaz49deriTVzb5ph7pByIiRQXQNfKW6PK3Ws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J1Sgbiu/XPpxkn4dfjjwHkiTmfNlsPKua/Wl4mu2GUlOkhZe4J5MDZPxq7TnKUvLV
 lHLkAr5ffvY15yNtJ3LezwUq34t2B1noPb5s+WxhNJP3KSkiq/V1g1QAhTBKUJZ4pd
 6nTeHsVU+V5aq61ZVDyLp000Nti9DDNBY9Q+3NPp/SxPQnrOKEOrFvwaXEP2UbPfd0
 7atLRQJ8xs8U2uOBoPWjlTGjpV+B+uSwqJpmNU6Ps6Wd8MwDJ7nb7scPRxJaCZtjUe
 wFTGlOwlFY/CetM82lq88tlzjBOYm7QsW6aSPttFYuQfozB8WHBaNnrS09xou/SS8r
 ULiCCmjZJOeLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J1Sgbiu/
Subject: Re: [Buildroot] [PATCH 1/3] package/mpd: enforce tcp for options
 using http
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

On 14/03/2026 07:18, Andreas Ziegler wrote:
> Prevent disabling of TCP if some option is selected that uses HTTP.
> 
> Fixes:
> https://autobuild.buildroot.org/results/59b0be79b1ca1469477e7634205f3eaaebef7d5f
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
