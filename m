Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4489C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 10:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75C3E606AA;
	Sat, 22 Aug 2026 10:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGBuFRqByzGC; Sat, 22 Aug 2026 10:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787396338;
	bh=sGzT/o6ulLQ32G3fGXFGN9/wlCubwCwE54im6hHKKWA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L9QWnJSDFrc/5UNAl93Glfdqa2N+BhZv7zfLmH33stcT33H/3dDcvMj0wh9jzF2gO
	 dqo2CHz26k+IkoZFyRwKwgaujBVioNEysyIgcdJQn4Nnmj3AH16Sht0xI4kp+m+Awh
	 xA6alyij/fY+M0RMP8/F3By1UqZVHkGVxufsGUgMJyk5IlDVUA7qcblNQL7jKpjLX2
	 1zI7SUG0GYp7gvzn+W2QstsJ0nPzL3WG5Nyk+rXQ9OjAoBKtGtCdP1kGi1eWgX9nmR
	 3gqYGxb1cAvVbKPmsTZgCvcvgIHZwQ+KI9DijizWe0YLC9O//baGCa0IEaRP4oHo7X
	 WsI3HilHtdSAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5256606B6;
	Sat, 22 Aug 2026 10:58:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 087A039E
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE91980E1B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxRiYo9rSlHA for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 10:58:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DECB980E0A
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:58:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C5AA9B0055A;
 Sat, 22 Aug 2026 12:58:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 12:58:52 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 12:58:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260819201944.330108-1-giulio.benetti@benettiengineering.com>
References: <20260819201944.330108-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <f883f3b91abddd33b1ca9fdb97f14c3f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/bind: bump version to 9.20.27
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

On 19/08/2026 22:19, Giulio Benetti wrote:
> https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/notes.html#notes-for-bind-9-20-27
> https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/changelog.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
