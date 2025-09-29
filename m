Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643F0CAC5B0
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 20:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2164F60BCD;
	Mon, 29 Sep 2025 20:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBRagKwIe32H; Mon, 29 Sep 2025 20:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 427C360BE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 427C360BE9;
	Mon, 29 Sep 2025 20:11:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF30D111
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 20:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C59E24064A
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 20:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCEWsxHvu29b for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 20:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE200405DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE200405DC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE200405DC
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 20:11:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E877920039C;
 Mon, 29 Sep 2025 22:11:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Sep 2025 22:11:34 +0200
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 22:11:34 +0200
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250724102514.2188530-1-hayashi.kunihiko@socionext.com>
References: <20250724102514.2188530-1-hayashi.kunihiko@socionext.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a54e14e44f07026de8c1b50b8c613d5a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759176696;
 bh=nMARRonqKc8b5pOuwMUnypJ1ySFatDwJp0qBzGIk+Ao=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kfpJxJhfb3jyd481xHW+ecg29LCp5KuAIYcXzfzHVfWmXQdZUYGgV5FdUJlL58/7n
 k3UiiWHzPTSw/JqPvBxDcJB1PIv89+vVKaMTS8yTYlepKGpbHU6ahhoGnQR9yzbu6u
 abDiTEImChWIiKtuEuOLsXBgYqdhDWBD0kyiaWCm+bs42bF7YB93/NrwTUBuAH2ig3
 RZOxk2Zy2dj0f0I3DwTJnS9IfrMsEE/vad1wlaaqKZC4KDzBc5itsc0TjWGzEoeJ0O
 qR6Dag3Q8JLqpx/lKtixvvqPqnI2E45qokxhN7iD1dPyOhijp5MxLgYS2gY1r8ZV3u
 +7xVnlDnM+zAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kfpJxJhf
Subject: Re: [Buildroot] [PATCH] package/qemu: add zstd support
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

On 24/07/2025 12:25, Kunihiko Hayashi wrote:
> Add optional zstd compression type support for QEMU.
> 
> In order to a file compressed with zstd on host to be applied to
> target QEMU, zstd on both host and target should be enabled.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
