Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8515C71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 20:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B02483A93;
	Tue, 17 Jun 2025 20:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lBp8goMbtBK; Tue, 17 Jun 2025 20:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0165983A94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0165983A94;
	Tue, 17 Jun 2025 20:00:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 491E6D94
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 208404051A
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mxrpLshDzZ1 for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 20:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33076416F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33076416F2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33076416F2
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:00:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BAC2460128;
 Tue, 17 Jun 2025 21:59:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:59:57 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:59:57 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250609105507.1137728-1-m.niestroj@grinn-global.com>
References: <20250609105507.1137728-1-m.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <0d46e3a7e77965bbebebc9279a16b1e1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750190400;
 bh=SDjGYmPyY2NW2LYpiUE6FzttN1sa+kMeHMvGvbAcX9M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BuwSqpFGIgBZzbLpWet+uBBsWLRkbPhf20m/X5pkjl+Xn9+ERYRN4hUfIdaIchB9B
 khhZPrYdmNRi5LIAogpqPMYON4xT6oiwtJlfafk9+kAJLjx3VNUYxQyTXTsnWpi9v0
 BEVUqQI3SODRfwwLICrggiGNLNNbxAJc9RkEDiLetds46G+xtk8euKman4dLmA4H57
 Hxr6XHFN66/O9yMieHum8lJdrAHGJ4uom37qlZSJzU5ykEAcUzV7vTo0smO6biBo5l
 wGfWeNJBoAqcqHBcj5F+PUn4GNqXEYcz0zUEBixhCgNprFttOvsdVigIbEbq+AhzRE
 bKW68cJak5qSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BuwSqpFG
Subject: Re: [Buildroot] [PATCH] package/python-dbus-fast: bump to 2.44.1
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

On 09/06/2025 12:55, Marcin Niestroj wrote:
> See [1] for changelog.
> 
> [1] 
> https://github.com/Bluetooth-Devices/dbus-fast/blob/v2.44.1/CHANGELOG.md
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
