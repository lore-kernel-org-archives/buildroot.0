Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC52C71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 20:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10C0E6090B;
	Mon, 16 Jun 2025 20:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxTzUwuMdBgB; Mon, 16 Jun 2025 20:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B34A60902
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B34A60902;
	Mon, 16 Jun 2025 20:39:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04DA6151
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF152811EF
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXNd0d7arNXZ for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 20:39:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 032AB811D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 032AB811D9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 032AB811D9
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:39:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 23EDD13F8A2;
 Mon, 16 Jun 2025 22:39:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Jun 2025 22:39:29 +0200
MIME-Version: 1.0
Date: Mon, 16 Jun 2025 22:39:29 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250616101112.12339-1-buildroot@bubu1.eu>
References: <20250616101112.12339-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <048ac7160c9afa1e1154a1cdcb698148@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750106372;
 bh=g4WH5nL+6NTkGIq2BUAT7Fr0Qo5LeIE7jcKNr0rM03o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MejUgozft3GMhnfdQ2nZdPxSTb/dHNBRd1JjPc6wnnz8sZZJ+L4BqaMTD4W76Kyjw
 d9/dncJQqkH/QHd1hmMNy3nJl8u1AnbcdbfYkPU0c4OnwQWgR3KZK0yObo2TB+Utwg
 7ZQo0jzjjBQ1jIu+jhEefyaRfhgaCB3AjXvDFvsubwpfbS2tWRC6e67VQnV2LpOBkf
 16DbO8wyKlUx4ae+8YVea4pafViOGXXNiquKAshxAbwzzgLwsBq5yakiqIQqVhSu1k
 ZD/uEXvRExZKh0MXG+J5nv2zcEmKOk/vrM+pUREPsPTUpGX6JZSEuqbVZnjeSM6mjQ
 kVZKVV1b2V1aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MejUgozf
Subject: Re: [Buildroot] [PATCH] package/python-pydantic: bump to 2.11.7
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

On 16/06/2025 12:11, Marcus Hoffmann via buildroot wrote:
> Changelog: https://docs.pydantic.dev/latest/changelog/#v2117-2025-06-14
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
