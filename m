Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06533CF9C7E
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 18:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A00498194C;
	Thu, 20 Nov 2025 18:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgSix6mUM2xk; Thu, 20 Nov 2025 18:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 600BF81EB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 600BF81EB5;
	Thu, 20 Nov 2025 18:41:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27F8C117
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 18:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19E3E81BF5
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 18:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-DMPcDZftlh for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 18:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB0B68194C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB0B68194C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB0B68194C
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 18:41:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 679F3780389;
 Thu, 20 Nov 2025 19:41:13 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Nov 2025 19:41:13 +0100
MIME-Version: 1.0
Date: Thu, 20 Nov 2025 19:41:13 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20251119225032.4183326-1-pkerbrat@free.fr>
References: <20251119225032.4183326-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <522844bd5923d0f4a0e37e1dfbb58e11@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763664074;
 bh=Owe9rh+LVqdT874Gb17PKkX5/v3WS29mruvDU2c7Gf8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K0O546QeMLidAxxRQoNT5dmi7ILu6h2utjHJ5MiGqpZoXa27TEY9tSkqmHlKOHqMy
 ZC3Ert1+Eh/AZxDkzcyraj0cHz3j4QlDwAqnYOat2B5d7Ks3CBjF7mmES/O0oMnN6i
 atKMiNwSCNvfm9Khub4kvK8KLZ4wZR0ZpKNHoWM6m25bNzyWdDJW//xIg5FEHtEade
 hgB/L46xR4hMAsGz6VW010OH/aI5z9yIo6tCq2hAbzIujrfutThEozNQykqe55S0mX
 8aVq79E1ypf8HffVkUVMTEcshoFFlm/4uH8G7aqoy+Rqy/Kr0IRiJcGI8rEVwCDQ+O
 1+RflB3Bsbu9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=K0O546Qe
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v60.0
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

On 19/11/2025 23:50, Pierre-Yves Kerbrat via buildroot wrote:
> For change log since v58.0, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v59.0
> https://github.com/linux-rdma/rdma-core/releases/tag/v60.0
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
