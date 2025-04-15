Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E64C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 17:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A92360BCD;
	Tue, 15 Apr 2025 17:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6I-PaikILtS; Tue, 15 Apr 2025 17:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC82261123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC82261123;
	Tue, 15 Apr 2025 17:24:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C9A0200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D58C81EF7
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xF6c7LPnSzT for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 17:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BE0981373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BE0981373
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BE0981373
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:24:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0BCBD19F740;
 Tue, 15 Apr 2025 19:24:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 19:24:36 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 19:24:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: Lance Fredrickson <lancethepants@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Dimitrios
 Siganos <dimitris@siganos.org>
In-Reply-To: <20250415140519.1939298-1-lancethepants@gmail.com>
References: <20250415140519.1939298-1-lancethepants@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <8c9805dd971c74363a047c19b6ba4b42@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744737880;
 bh=H/rL86K2gA9gNUNXJCZvf5+kQbMuymI96kKwdHAmszI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H9rE+y0wbiRsb3cxUFkkIVkgAwllyvUY9CqPClNn0kb46YHr61U5nXDZBlEhq8Asq
 7Emr5QBq2/ewoO7C877VZSRjQKaqTRu9hB9AynIW+/2pa7it9xPFUg/L3LnMQff+Nl
 AbCamIFcXrUwY7mDhRzl68cl6uPWhc8ZMatbJnXcy+F1x3yja2La5+Cp31X61CJxk3
 NgCfKbvVZcoStxhgzknR1WG5GI7GVtJuXraLQPqwqHNiwYhJiHM2M4655pNKHPvQZI
 cLDXU/7pMHYOZ2h52hS0RXmjPwDwr3CvRlF5nvUX+2QGDvvQQG2EiufuRc5HLS6uKy
 rxx1lLbFzVQmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=H9rE+y0w
Subject: Re: [Buildroot] [PATCH] package/wireless-regdb: bump version to
 2025.02.20
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

On 15/04/2025 16:05, Lance Fredrickson wrote:
> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> See release announce:
> https://lists.infradead.org/pipermail/wireless-regdb/2025-February/001686.html
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
