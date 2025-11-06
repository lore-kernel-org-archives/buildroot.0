Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A101FCCFA13
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 19:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 394F2840D2;
	Thu,  6 Nov 2025 19:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8b5ao0xKE2iK; Thu,  6 Nov 2025 19:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5168D84358
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5168D84358;
	Thu,  6 Nov 2025 19:35:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B64293E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38BC183BE0
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fq4dz75dUZ9n for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 19:35:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B4A683D03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B4A683D03
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B4A683D03
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:35:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0FBA15FF88;
 Thu,  6 Nov 2025 20:35:16 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 06 Nov 2025 20:35:16 +0100
MIME-Version: 1.0
Date: Thu, 06 Nov 2025 20:35:16 +0100
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Cc: buildroot@buildroot.org, tim609@andestech.com, vjardin@free.fr
In-Reply-To: <20251106100754.1863177-2-ycliang@andestech.com>
References: <20251106100754.1863177-1-ycliang@andestech.com>
 <20251106100754.1863177-2-ycliang@andestech.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7b02e18bacc19254fcb658b1dee9f0ee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762457720;
 bh=m4JIUgLs57nbhxNrh7Y7b+DRXkExuPOp/bihFOnAHQo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=thS/jL9Hk1gab71ibjDiIFwknAVXx0vedSChDzXFEedV7F8AkvDJtirwWp8cs+UxY
 eeka8glSNrGZCU2rSNw/Enwsd4Vq9hgS5ZHduZA9SuSOphatV6M9waWuJpo/T9b3Jd
 JdNDrjcpGXwWR3HMYj8qvrciX88T4Z04UVsFnW8XkU3lENO/l7A8lIW3wn/AvM4WFP
 agCpOn3NRO2y2cGqguc2Uf/JNMsOiJhhmr5AOGpYu7sNWwi9qyg3RKrGpVpOXQ7EYw
 ze+BIf6IoWfrx9HWAvjm19FXPLh1mOjjVaB2o8x95JEZqlC8aeCSp26LNCiYwSi8sT
 lG7Gt8KM5arjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=thS/jL9H
Subject: Re: [Buildroot] [PATCH v2 1/5] configs/andes_ae350_45_defconfig:
 Fix linux tarball source
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

On 06/11/2025 11:07, Leo Yu-Chi Liang via buildroot wrote:
> Use tag instead of branch to download the linux source,
> and add proper hash files.
> 
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>

I applied this series to master, thanks.
For info, I made few minor fixups. See:
https://gitlab.com/buildroot.org/buildroot/-/commits/10bf2e6629827e338947c189e88ef5bf32ec4dda

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
