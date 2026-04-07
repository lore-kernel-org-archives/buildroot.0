Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45080FF512E
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 17:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E852840C32;
	Tue,  7 Apr 2026 17:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tnxg4zglT2fg; Tue,  7 Apr 2026 17:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B9CB4060A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775583340;
	bh=NXSbmno/eve/fQ9u/qNnI29ek6h8i6hH4QXThokyDFc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JbQE14snMwtZJZF7P7t/jt8aM5TzSXwNpBME3/2Gz8EcDK7z8qJomiVmRzn4ZzNGP
	 iS5esgjOMZb7+8RZYEefJpMtiAiz7qdAjcfO5AkUIm6mYsuGG4Y7mTrTBTwDncEP/H
	 Uwcob/aabM1XTMKJXEKnpjNsCqP0Lgf5JRcubShymDmogRKpZvVKHk0+ZEVu1rfwQT
	 pNO9hKS3Wwi6tE9TW4CpjBooLT7uHFsRL61byHBKc4l/++qnDtz8DkcXcyYP2myyQ5
	 TGuF/pWUZ04lFv8NKtrEiplTVKJ5f28ZWKNfzj1MSFTEnRCh47VytKE9sGIAoD6EcD
	 R+MTCzJMOHwyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B9CB4060A;
	Tue,  7 Apr 2026 17:35:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D54237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACA7E406A3
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4boArvGGjnoj for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 17:35:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2D4B401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2D4B401C2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2D4B401C2
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:35:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B36A46013A;
 Tue,  7 Apr 2026 19:35:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Apr 2026 19:35:33 +0200
MIME-Version: 1.0
Date: Tue, 07 Apr 2026 19:35:33 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260407070401.322480-1-dario.binacchi@amarulasolutions.com>
References: <20260407070401.322480-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <50c55fb34581f4d1eebd51af3d183b7b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775583335;
 bh=L4/ZWW8qGY3v6Nw9BFJZRNtl1oncR9GGAFPJA1ax8rs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UE2RVkNxj8lwUVT8gGcV0v5m0oqvFcBc2m63mNqQFsn4mZtgI5mWKfWQuhOfZctdb
 3e5154KgglmkQiOiqDoq6k/tRlFXj3Sm0hI3aTctlih8g1kwfyQmI1FVM61CstA66f
 qp+aSELHXauwG/fYtjyWN87SmGYHH8YUJmLOJgS+SMutL7M5Pnbg0v7Bptqanm+faQ
 fBGKoxKblUjFns7/8Do0lOhjcnb1Ox+mlvIFOO3lq8A37ty+OVd1zO7FgcxrlSHLjy
 fjJVm3BvuCVWfSP1ii1wf2mACPkwwjJyhFENZgJsOfiso4YB0YLByp5lf8UkbiAnBE
 XSb/isCBaArzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UE2RVkNx
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2026.04
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

On 07/04/2026 09:04, Dario Binacchi wrote:
> Release announcement:
> https://lists.denx.de/pipermail/u-boot/2026-April/614160.html
> 
> Changelog:
> https://github.com/u-boot/u-boot/compare/v2026.01...v2026.04
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
