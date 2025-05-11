Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727B0C3ABC5
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 11:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E57560BC7;
	Sun, 11 May 2025 11:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Btt17d_5Gx4A; Sun, 11 May 2025 11:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 499CD60B5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 499CD60B5A;
	Sun, 11 May 2025 11:51:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB2FA150
 for <buildroot@buildroot.org>; Sun, 11 May 2025 11:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B126480C95
 for <buildroot@buildroot.org>; Sun, 11 May 2025 11:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQh6p6aNp8bQ for <buildroot@buildroot.org>;
 Sun, 11 May 2025 11:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DF0880D06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF0880D06
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DF0880D06
 for <buildroot@buildroot.org>; Sun, 11 May 2025 11:51:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B3DEF13F861;
 Sun, 11 May 2025 13:51:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 11 May 2025 13:51:35 +0200
MIME-Version: 1.0
Date: Sun, 11 May 2025 13:51:35 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250511110305.476463-1-bernd@kuhls.net>
References: <20250511110305.476463-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <3e463daf7b61b60fb6e5df9557d7db2b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746964297;
 bh=j6iP801DWXJLBZMwlqsxPW3F5kg4iX29XgOryaZE8JQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=so2X5VhNNBd/Qkw3f1y0GSqeOmLyQxhIpcw6K/svWFNUgiiTBKVZg3lj4uvOffN6y
 7B0rah8c6Kwqlp+Pi1WpApDtZDPPb80hd5bz7uK0EuGfquN1KE0wOHbFW275Zrdxvx
 UdE9WXFdilE4Z8kJt1I9dm9QVVzUeeBy63jRkGi+yubbbbF8SQU7JV6zqAL5DSbX+G
 p3XY5T4UuV89x+7UsARKrcrURZgDhvqXNZccLPkZ8qW/g4HB62CrV/cXXLjwIRGSEj
 7ZifyN23gvM4YKiAIEUqGG2BO9iGiL9Vzo9r5CONTikRGblLXjHuTxo/hkCYLifshw
 s4eyVgeXQUCTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=so2X5VhN
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-headers: drop 6.13.x
 option
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

On 11/05/2025 13:03, Bernd Kuhls wrote:
> The 6.13.x series is now EOL upstream, so drop the linux-headers
> option and add legacy handling for it.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
