Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7279A606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 16:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BpDaY1SD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A3680843;
	Sun, 22 Nov 2026 16:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHsWv-lK8bJv; Sun, 22 Nov 2026 16:03:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0370B806FC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795363399;
	b=cu+QqISgQSuecWoR5D+rg7ABMnley8coYYb5RmHyeZTjflShaynvgen5am/cmC7k74pQ
	 a2ncU5hIncHD0UyNv95OlbBpqYiTCiC5ebxBy5M7hGPVLJbZdXg2Td/1iYyNZQQp62cWM
	 +36sPwDQT+xU0VZ+I58sMLz5zPnGxP8TCwOpHZPQwnsZT7DD7kq84wgBzeZyhPoYp0HX5
	 g2i5/nd4Nza0vwX3ZxfjN4BKQ0ccc1fb3oSxDRF/6NpnSqfXRBN8fHBc6VVrQ6hkI04b6
	 rZcrUcQBwySBJ1n/7Gk1gql0zY1JxHlNFUPgrh8400proCCLPzAoz1aV4mtvo/+e+dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795363399;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=uaf5PgyEAj9VrJ9K8IcxdAg+0VM1OH2UomyuFHVIJkQ=;
	b=V/74xoutBtwdbUggMgyENAl/D+eBDaVvDFatpOvCNSEmYXjoNMXjujUsa8IR3+1tWd6w
	 9OvcA0vhR8GlhvoqrWHNe5yYjSEEZxQjLS+nCNGF/Os/i80ts8FWzpwnqlfxLcvxtKJkY
	 7gY9P0HcviOpGKZRmmDujWBEWVHNOsjzOVhUu+g7Pefuzb1ZUk1zA+qtW9hfDcjpgl9bx
	 ZP3kTqbT3w/z+7Zetaki1LTa5c8Hv2JdGmG+vUOm1jjaJTMV9Kpa1L0ucJF7TQvp4rhyK
	 l2ZQz/tOCFY1/rXw6T22kx+db9PshxK5/+9J99hrynMG+i4LDayo03ncqhQZk7ZiUCQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795363399;
	bh=uaf5PgyEAj9VrJ9K8IcxdAg+0VM1OH2UomyuFHVIJkQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BpDaY1SDP1FLJ5/MAfFKfq+tcExUg7GdOurak2LObaaY3T8o8NLBwA5CIwi8mPO5d
	 lvQ19eY8SEi8xQZ5Tsaqj67smpsJvg0GyCnb1RT0XgyQJTcvOrN4sS4oFCGdEJhqKR
	 kYBS+ZDedjgjjxf33rN8si5ZWM3uTyP19gyl+LMxDsmAGD88vDWWtIKKURHmIfD/IY
	 83FA6qHwhiwx5D+i3dFQ3efZHUxyxuZLgGRTPDO3qz5ABL2nOnl8q6aNSoClaJk2Lt
	 dU2eEXjhJW1yvoWjj9ejrMSxyX2tynDp0IPF3+ifeIqkJ3NoTBBzIZFeJtLw6fIuxI
	 NbQgCcrWdaSaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0370B806FC;
	Sun, 22 Nov 2026 16:03:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B8522B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 16:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFFED400B3
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 16:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pK7wRbrmHxDT for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 16:03:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D34FF400FF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D34FF400FF
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 16:03:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F254FB0053D;
 Sun, 22 Nov 2026 17:03:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 22 Nov 2026 17:03:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 17:03:08 +0100
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org, Gary Bisson <bisson.gary@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Refik Tuzakli
 <tuzakli.refik@gmail.com>
In-Reply-To: <20261118-add-mali-imx-package-v1-1-49e2a3c645dd@armadeus.com>
References: <20261118-add-mali-imx-package-v1-1-49e2a3c645dd@armadeus.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <37b7620accd7d59cbf57cedf3dfd21f0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/freescale-imx/mali-imx: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTgvMTEvMjAyNiAxMjo0OCwgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4gVGhpcyBw
YWNrYWdlIHByb3ZpZGVzIHRoZSB1c2Vyc3BhY2UgbGlicmFyaWVzIGFuZCBmaXJtd2FyZSBuZWVk
ZWQgdG8gCj4gdXNlCj4gdGhlIE1hbGkgR1BVIHByZXNlbnQgb24gdGhlIGkuTVg5NSBTb0MuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5z
a2lAYXJtYWRldXMuY29tPgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
