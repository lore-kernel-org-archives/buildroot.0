Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00295C369D1
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99B9581EE0;
	Tue, 22 Apr 2025 19:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyVlj9QBwoTX; Tue, 22 Apr 2025 19:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3B5081F58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3B5081F58;
	Tue, 22 Apr 2025 19:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8E7419F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA7F740F50
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqeWr7EePHgu for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2691840259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2691840259
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2691840259
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:01:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 40846B00539;
 Tue, 22 Apr 2025 21:01:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Apr 2025 21:01:30 +0200
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 21:01:30 +0200
From: Julien Olivain <ju.o@free.fr>
To: Joseph Zikusooka <josephzik@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <CAPWx8vvq0BgguhEfUnLt7-qm2kqTU4VCKjb7i2L+sXG9HbeOMQ@mail.gmail.com>
References: <CAPWx8vsoJUt8YMJG1aUqFRK1=yizNbgjVjGL1Q1+9ygjJGnZLA@mail.gmail.com>
 <dfe20dbb0429ce970599a992005b9ffa@free.fr>
 <CAPWx8vtcjfVZJLydqyUAJ_8WbOHkrfJm2DG-qS5TO+msfa4uBQ@mail.gmail.com>
 <e07d34b22ea6c85e2d50249f1b06ccd9@free.fr>
 <CAPWx8vtHtH0iCM4yUEnjA+J6oqirBGmwGYTg_VMHsex95iHOrQ@mail.gmail.com>
 <CAPWx8vvq0BgguhEfUnLt7-qm2kqTU4VCKjb7i2L+sXG9HbeOMQ@mail.gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <4388bcfc65382d2dd98db25748b6965a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745348491;
 bh=7QPS2hhBAbeXGRgaJ8rAY/rBdHcETbAenq0RP4NLfhE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nwd5xg97et4hdO+lrGaLAJlHPiML5gjHtzbqh7i4gChjsV5e1TISe6AMeUvVvwkAn
 fx0Y2j9MCP6SrKhvlvUFRECPts9Ge8kbyVDHgY4hGzlw3a/jBdPSo8z7d2nXXOWaU3
 eWUFh4R8DVpjqL1r/ZdCe8A4m1DJDvQ6v4gFSKoZxDlDqcLKX2sY5JYa7GIIwC+NQU
 vvwMxvRUruCUY5ixHIL1+JdLjcql4mYKrfR+6hnYEz6DughosNsdh4v5LbxAdPI5Vc
 ZJ0kzBqX9Kv/FsfV1wHi6sX9ao7x5V7Pmo6P/9uksdTQIx1i3sNmvdAO2s4KP6ijbc
 Gu46FGviBe3Gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nwd5xg97
Subject: Re: [Buildroot] host-m4 build on Fedora 42 fails
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

SGkgSm9zZXBoLAoKT24gMjEvMDQvMjAyNSAyMTowMiwgSm9zZXBoIFppa3Vzb29rYSB3cm90ZToK
PiBJIHRoaW5rIEkgcnVzaGVkIHRoZSBwcmV2aW91cyBwYXRjaCAtIGhlcmXigJlzIHRoZSBjb3Jy
ZWN0ZWQgdmVyc2lvbi4KPiAKPiAKPiAtLS0gYS9wYWNrYWdlL200L200Lm1rICAgIDIwMjUtMDQt
MDMgMTM6NTk6MjcuMjI0MjU0MzM4ICswMzAwCj4gKysrIGIvcGFja2FnZS9tNC9tNC5tayAgICAg
MjAyNS0wNC0yMSAyMTo0MTo0NS41ODk3MTczMDIgKzAzMDAKPiBAQCAtMTAsNCArMTAsNiBAQAo+
ICBNNF9MSUNFTlNFID0gR1BMLTMuMCsKPiAgTTRfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAK
PiArSE9TVF9NNF9DT05GX0VOViA9IENGTEFHUz0iJChIT1NUX0NGTEFHUykgLXN0ZD1nbnUxNyIK
PiArCj4gICQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UpKQo+IAo+IE9uIE1vbiwgQXBy
IDIxLCAyMDI1IGF0IDk6MjHigK9QTSBKb3NlcGggWmlrdXNvb2thIDxqb3NlcGh6aWtAZ21haWwu
Y29tPiAKPiB3cm90ZToKPj4gCj4+IEhpIEp1bGllbiwKPj4gCj4+IFRoYW5rcywgdGhhdCBzb2x2
ZWQgdGhlIHByb2JsZW0hIEkgbmVlZGVkIHRvIHJ1biAibWFrZSBkaXN0Y2xlYW4iCj4+IGJlZm9y
ZSBidWlsZGluZyB3aXRoIHRoZSB1cGRhdGVkIG00Lm1rIGZpbGUuIFdoaWxlIHdlIHdhaXQgZm9y
IGEgbmV3Cj4+IG00IHJlbGVhc2UgZnJvbSB1cHN0cmVhbSwgSeKAmW0gc2hhcmluZyB0aGUgcGF0
Y2ggdGhhdCB3b3JrZWQgZm9yIG1lIGluCj4+IGNhc2UgYW55b25lIGVsc2UgZW5jb3VudGVycyB0
aGlzIGlzc3VlLgoKVGhhbmsgeW91IGZvciB0aGUgY29uZmlybWF0aW9uLiBDb3VsZCB5b3Ugc2Vu
ZCBhIG5ldyB1cGRhdGVkIHBhdGNoCndpdGggdGhpcyBmaXgsIHBsZWFzZT8KCkJlc3QgcmVnYXJk
cywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
