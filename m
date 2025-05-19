Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445A6C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00DC482CEC;
	Mon, 19 May 2025 16:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4AWXhnGYeiZ; Mon, 19 May 2025 16:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C45782CC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C45782CC7;
	Mon, 19 May 2025 16:59:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09BC6D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06ECE82CC7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwLIkRAxXfZl for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55C6682A17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55C6682A17
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55C6682A17
 for <buildroot@busybox.net>; Mon, 19 May 2025 16:59:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DE18E2003DE;
 Mon, 19 May 2025 18:59:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 May 2025 18:59:44 +0200
MIME-Version: 1.0
Date: Mon, 19 May 2025 18:59:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250519062642.2054597-1-francois.perrad@gadz.org>
References: <20250519062642.2054597-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <6ad2380cc0915559fa92d9b0cad0c59d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747673986;
 bh=JKmuud5ywdWs+D9G9eKMifkKpH8XAWBqw/bQ6chAV94=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kgcn7bDHD/wIvw5sriVJokQNFpYuXXZ6GBEcPLdbYGYrBANEKmggBcoSU5LoVz8+B
 olC/3DXbIxzde/ianizOVRRbPhTPsRb770vz5oUsN68PmAP8yGVAAPxfmQMHG4s+cQ
 EdE+uAjuQHllK+8kO74xgGNomIrAEk6rOCZzSv8n3a5SW9vekQp6S7wo5fH0yq/zia
 +a0X/D8bN9Jiy5qzsmz9XIUHq1Qnbly/1cbVdBBLG+fEXoXMGe39tK0uJE+f5KAymx
 sAz0MpZqr/jPnXYjQ3jNPea991C1UacR7H4yhQ/uGBbmRM0NyCTQDtREwS6UJeRI7W
 cJdO+sD3BvlbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Kgcn7bDH
Subject: Re: [Buildroot] [PATCH] package/luaposix: bump to version 36.3
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

On 19/05/2025 08:26, Francois Perrad via buildroot wrote:
> diff LICENSE:
>     -Copyright (C) 2006-2023 luaposix authors
>     +Copyright (C) 2006-2025 luaposix authors
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
