Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ED0C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 21:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96124606C5;
	Sat,  8 Feb 2025 21:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kU3Txj74r-tz; Sat,  8 Feb 2025 21:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAA36606D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAA36606D7;
	Sat,  8 Feb 2025 21:42:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0064F6C
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 21:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D886141497
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 21:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2Flkygp7lJd for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 21:42:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11E1741354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11E1741354
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11E1741354
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 21:42:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B46C32003AE;
 Sat,  8 Feb 2025 22:42:08 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:56562])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Feb 2025 22:42:08 +0100
MIME-Version: 1.0
Date: Sat, 08 Feb 2025 22:42:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250206173328.1446767-1-james.hilliard1@gmail.com>
References: <20250206173328.1446767-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a6c88f01212af70a2162613bcaa1437f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739050930;
 bh=nWjr6g4xmfmMB0PTKmJpI+Q+2+yBsm1Ta5S17GPmac4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X0B+lMfqbIjzGhIgm7gxurbX8C6oGKzcM9hHSp8WwT5cTcOuKgqaS2lO1RMbODWyD
 gv9U2nVcujIaRSozntVwPrZxAfn3d71oJg8GyIkezpJJ1ODwASF6wLElBV7OG4ElKX
 xTTV6S1d/tUjr37xmFUPVadpGsG8wQjXN6rQIIdNx5OSuHkWdY8bxv7HLM460K0cL/
 rQyh0yoB72UmZVpSOulhli8NYpcRWN4/heht9HHQEFiMv97k5LF9uEXdvy4gwYr+uK
 6MGm+j6Bt3r0CUZKYPGB9BnOdI9E+0eIhO1GxCmhlpHEt6oX/wIryTYrYMRGhuEG6b
 Net9SLVbZwczg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X0B+lMfq
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: fix build on hosts with
 newer glibc
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

T24gMDYvMDIvMjAyNSAxODozMywgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gQWRkIGEgcGF0Y2gg
Zml4aW5nIGJ1aWxkcyBvbiBuZXdlciBnbGliYyB2ZXJzaW9ucy4KPiAKPiBGaXhlczoKPiAuLi9s
aW51eC11c2VyL3N5c2NhbGwuYzozNjI6ODogZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiDigJhzdHJ1
Y3QgCj4gc2NoZWRfYXR0cuKAmQo+ICAgMzYyIHwgc3RydWN0IHNjaGVkX2F0dHIgewo+ICAgICAg
IHwgICAgICAgIF5+fn5+fn5+fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Vzci9pbmNsdWRl
L2JpdHMvc2NoZWQuaDo2MywKPiAgICAgICAgICAgICAgICAgIGZyb20gL3Vzci9pbmNsdWRlL3Nj
aGVkLmg6NDMsCj4gICAgICAgICAgICAgICAgICBmcm9tIC91c3IvaW5jbHVkZS9wdGhyZWFkLmg6
MjIsCj4gICAgICAgICAgICAgICAgICBmcm9tIAo+IC9ob21lL2J1aWxkcm9vdC9idWlsZHJvb3Qv
b3V0cHV0L3Blci1wYWNrYWdlL2hvc3QtcWVtdS9ob3N0L2luY2x1ZGUvZ2xpYi0yLjAvZ2xpYi9k
ZXByZWNhdGVkL2d0aHJlYWQuaDoxMjYsCj4gICAgICAgICAgICAgICAgICBmcm9tIAo+IC9ob21l
L2J1aWxkcm9vdC9idWlsZHJvb3Qvb3V0cHV0L3Blci1wYWNrYWdlL2hvc3QtcWVtdS9ob3N0L2lu
Y2x1ZGUvZ2xpYi0yLjAvZ2xpYi5oOjExNSwKPiAgICAgICAgICAgICAgICAgIGZyb20gCj4gL2hv
bWUvYnVpbGRyb290L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1xZW11LTkuMi4wL2luY2x1
ZGUvZ2xpYi1jb21wYXQuaDozMiwKPiAgICAgICAgICAgICAgICAgIGZyb20gCj4gL2hvbWUvYnVp
bGRyb290L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1xZW11LTkuMi4wL2luY2x1ZGUvcWVt
dS9vc2RlcC5oOjE2MSwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi4vbGludXgtdXNlci9zeXNj
YWxsLmM6MjA6Cj4gL3Vzci9pbmNsdWRlL2xpbnV4L3NjaGVkL3R5cGVzLmg6OTg6ODogbm90ZTog
b3JpZ2luYWxseSBkZWZpbmVkIGhlcmUKPiAgICA5OCB8IHN0cnVjdCBzY2hlZF9hdHRyIHsKPiAg
ICAgICB8ICAgICAgICBefn5+fn5+fn5+Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlh
cmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtz
LgpJIHNsaWdodGx5IHJld29yZGVkIHRoZSBjb21taXQgbG9nIHRvIGFkZCBtb3JlIGluZm9ybWF0
aW9uIGFuZCBsaW5rcy4KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
