Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6E5C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E301160801;
	Tue, 15 Apr 2025 19:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYPufuZIvtMj; Tue, 15 Apr 2025 19:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28FC360BCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28FC360BCD;
	Tue, 15 Apr 2025 19:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EE5C109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E39282241
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwrDD5Rd4O4q for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:56:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81474835CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81474835CF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81474835CF
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BAC815FFC0;
 Tue, 15 Apr 2025 21:56:11 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 21:56:11 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 21:56:11 +0200
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250415192901.3370859-1-yann.morin.1998@free.fr>
References: <20250415192901.3370859-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <0e73ff6016b3368b8417be52bf42ea99@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744746973;
 bh=v6sk3zznXDVVULfqbpWCQ7FA8x9Iv0SweC69Rw/QdIU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tvO4lMnSL2W9H3qg9HnUGOLT3JemBCZK9+l/BiJWq4fRiz9TQV9fp6KT04V20W6El
 zlzf7n4z1RObnSkCPrAvEkAtk3lWfX3l+4Mxrs04I/8K4x3b4Q0zNL4UyX1j1k/d7n
 IcGnw8MhnxZIuDhy6IPkyevYeFqTzFg5emv38/S5DBj2eA4YwGK76Dt8Gv2WPXX8HE
 JwqFQLF1qIZhbfWeaV8OiGsGJd8no3No408aaRVCXcOv+o/c+g3uVFiKyAz8daE6iz
 lpXSD6GcPacZaOxX2V+R5ENMiu4NJ3snQFmB4BXqTgZsPl4j3HqFNOt1aN/HKb5rGh
 qHvq5CngSC/Lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tvO4lMnS
Subject: Re: [Buildroot] [PATCH] package/vim: extend comment about vi symlink
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

On 15/04/2025 21:29, Yann E. MORIN wrote:
> The current comment is not very helpful; extend it to be more explicit.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
