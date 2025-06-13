Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB75C71136
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 21:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118BD405DA;
	Fri, 13 Jun 2025 21:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cyf4r5PulFx3; Fri, 13 Jun 2025 21:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6320B409DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6320B409DB;
	Fri, 13 Jun 2025 21:16:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5501151
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB1AF844CC
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYL-lXmE5giZ for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 21:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13E74844AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13E74844AF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13E74844AF
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:16:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B90EF2003C6;
 Fri, 13 Jun 2025 23:16:10 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Jun 2025 23:16:10 +0200
MIME-Version: 1.0
Date: Fri, 13 Jun 2025 23:16:10 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250612171818.3476876-1-bernd@kuhls.net>
References: <20250612171818.3476876-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <ec8f4fc7f14dc9feca798d5a3838fa59@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749849372;
 bh=4UtFxoCGwJs1tUj0h6Vd5V9RYiGtkyxlR+RgM3GWJKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZQloQeSqRd2kmXD56kiEr3pK8pZsEWye4w3Urm4lXNlpcMkiOvtPZQwyBtlV7rJWR
 y4ZrxHJX306iep9eGKHYx9Ri24EoEcDVSsE4teq7wATvgmlQjKffGj+zvaXFjaJm/m
 BewAoqYMXaMyLn0HRhgHmmwpKY0lCKnCK88flwh8t0JoBMgWi0po2pWsUXIpeGbMgX
 5i4g+D6z2dh2uFTcB3jF87Nc4DGXMdOfyOIDqc6QN1Z0VcyV4jhKSM8VjenSmhEOKu
 wNOmPC+dzeSoJYVn7uSHrcudvAtYqIeElnDn7qGCLwvi3NEJUqsIxhc+LfO+wu/S93
 SOK+9SauRMPqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZQloQeSq
Subject: Re: [Buildroot] [PATCH v7 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.3
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTIvMDYvMjAyNSAxOToxOCwgQmVybmQgS3VobHMgd3JvdGU6Cj4gRnJvbTogQWxleCBCZW5u
w6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVu
bsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhs
cyA8YmVybmRAa3VobHMubmV0PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
