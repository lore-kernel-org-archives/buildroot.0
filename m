Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A63E937E3
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 13:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7810261638;
	Sun, 12 Apr 2026 13:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQAQx3Rk972V; Sun, 12 Apr 2026 13:41:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 566D161636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776001296;
	bh=+TAUlk75u6QRFaGOjXFH2TBnd00oWqV/LLjup9v33BU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pmOZkNJRgleDgU+oVo0W13kENPcYC+Gvgj1IR8UQEW4Fte2oSVUFDGQEFWe/rrtb3
	 N3zywT+xUVrLPTmP9IjJd0rIadAOYeQbYFG0IanDb/QgQpFyuuYCj1yvArI7aCQUgE
	 frbZPVJKv44oMpy7zjmOMLi+7pQrDBhC6Q+8A3zVUDq1CPN09IddeDPXisx30p2jaD
	 DhUxV0nyha7SbbfB+O1yT2x9cmak5W2+VPVb93uF6GWg9XEMOiFrb/LNLGYam4OYfH
	 GM+tlQOQTzI90AkWJGBMjdPCIM67LwGFCWz8LDkc76ScklIxY66a45UJ2IkZJQxrGX
	 j5uDZSF6UqyYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 566D161636;
	Sun, 12 Apr 2026 13:41:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47554283
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 13:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 393248446F
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 13:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h41kOKcUCO4l for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 13:41:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51B388446E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B388446E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51B388446E
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 13:41:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EDD8B13F89C;
 Sun, 12 Apr 2026 15:41:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 15:41:30 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 15:41:30 +0200
To: Gary Bisson <bisson.gary@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260410-nitrogentoolchain-v1-1-deeeb6d014d5@gmail.com>
References: <20260410-nitrogentoolchain-v1-1-deeeb6d014d5@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <2160a688ff475226a7aad20c52420b06@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776001292;
 bh=9DBiQxawjIp1x7FUw8Zq6Xdlqvyyp5A7pqAc3W0o/2c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B11T/hEq+affSCebHFgC+1ozXUQ//Q/HGmAoisMu82x4wexylAcshM/V1YFfB5snO
 uCvWGN8Qb1GQt/V3GISLV4dItMryHt5Rcok8r6WL/GWUZFQSaiH8IKD/JEGZjqGtXn
 lbYi9OsWy6h3KS1aswZ8rei/ZPHeWtB6f8kyMUi1Eu3kCxYwotLSlC729NVZ5w+uck
 iQ589o0RLBwsr2AQ6IbSfIkfTTbTokN/HPKx3HgWEDsoKswaWlbaYKpQvlrMICvy4U
 DOy2bELz+K+BtXMR+aSwNIK1NhnFVqbqsYIg7wUybJxqnyQj1m5d+oUQdNIIuF40qo
 wijjYGvnW+RNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B11T/hEq
Subject: Re: [Buildroot] [PATCH] configs/nitrogen*: switch to bootlin
 toolchain
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

On 10/04/2026 10:08, Gary Bisson wrote:
> As recommended by Julien[1].
> 
> [1] 
> https://lists.buildroot.org/pipermail/buildroot/2026-April/800059.html
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
