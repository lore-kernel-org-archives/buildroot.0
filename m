Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11041C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 17:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 841B9411B7;
	Fri,  4 Jul 2025 17:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7IdlG3i6dnc; Fri,  4 Jul 2025 17:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C34AE411C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C34AE411C7;
	Fri,  4 Jul 2025 17:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 406F812E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26E3940891
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bm577inZQ8Lr for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 17:29:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60BA940896
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60BA940896
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60BA940896
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:29:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2EDF278051B;
 Fri,  4 Jul 2025 19:29:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 19:29:27 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 19:29:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250704165437.3687660-1-bernd@kuhls.net>
References: <20250704165437.3687660-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8e348a965d1cf55c58c147c25ed6771c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751650168;
 bh=hoQ4tj49kQdqYU6StHxDu9M00JjdUGgrQxiE4/WfjZk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l5eYVm+z8ppHFGkXWBJFo7R6OgV1nCW7MbkJgLP1NIRaSOxB7TbCO0qIuJWYWhVCX
 lJjod9iOVG53HdFa1ctoBf3wWp0kdwbh4wo1aJ7B8n2Gt+I6Wg94D28Ee1/elRnq5S
 NbiGbH+e8VQQGtEOCSvGVKmkRPYjj1VUoEqzAUHmgCdDhFOp+Z0cM+3eQpdqrmtLDV
 xFwgsywYyTCY6WbRLAgmLKs5YMiCaqRqLVXU/fetJ5Xa+4NMqcAjI9X+Nh81lJNZrw
 IB7Ti4+EMs6ZJC1H4V8bJQui710VzH2RXZRTwkniSSP+GKuA4eImU3Ua40nonKSXY4
 uJ/JnxNXQ+PFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l5eYVm+z
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.5.1
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

On 04/07/2025 18:54, Bernd Kuhls wrote:
> Fixes CVE-2025-4575:
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
