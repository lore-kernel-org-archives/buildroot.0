Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597E9C54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 19:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA8D80639;
	Tue, 27 May 2025 19:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2plJJDLrZjVg; Tue, 27 May 2025 19:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4598E80691
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4598E80691;
	Tue, 27 May 2025 19:00:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BC4C19F
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DC7E40621
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DW_jL5Y3g5zU for <buildroot@buildroot.org>;
 Tue, 27 May 2025 19:00:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61E46405F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61E46405F4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61E46405F4
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:00:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C7096B00565;
 Tue, 27 May 2025 21:00:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 27 May 2025 21:00:41 +0200
MIME-Version: 1.0
Date: Tue, 27 May 2025 21:00:41 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250527184730.344752-1-kadambini.nema@gmail.com>
References: <20250527184730.344752-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b45ca32381f740be710b3d393e90b514@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748372442;
 bh=wSQg0siuDm0NUk6GDLXX4/65PlvlE5F+O9YidTVk0Zk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HfOv7YLp5aHhlFSGGRGHgvDLJbY6Wq1wCEm7/vbgbkrzOpJ16uzKPojybV/6cOo3N
 ZVMEwi0PYx05Oy2wyygl9152HZXDQNmO10GKVDSvZoZ+FXB2fTco0WL+AGJ2gYHDc7
 vbv2awZ2QFb1oTUIsvDPOuf+sfETvyvccv2TqATOt6VRlc4P8GZTvz7HFHnfrMsirk
 X8r8sJh5z73P50TXsVHJ3uRNPrKLyEiSJtvIO9rNsHhOSxiPfOL4akdih7fDNu5bh5
 3fQ0n2Ukprvf7bXjVUAZCIk51ua+PNZ3qp1uyKJ7JhMUSrw2LfXZKTeNfcfL3PLc45
 998gS1JLeRPGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HfOv7YLp
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.15
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

On 27/05/2025 20:47, Kadambini Nema wrote:
> Release notes:
> https://github.com/strace/strace/releases/tag/v6.15
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
