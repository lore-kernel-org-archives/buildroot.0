Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828E1C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3620880C3B;
	Wed, 16 Apr 2025 21:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWpHFDW3bMid; Wed, 16 Apr 2025 21:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1354C8301D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1354C8301D;
	Wed, 16 Apr 2025 21:32:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03D3F159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E94E660D4E
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mu2PbD2Ba1at for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:32:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 841F56F6CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 841F56F6CA
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 841F56F6CA
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:32:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 93DC11C0083; Wed, 16 Apr 2025 23:32:38 +0200 (CEST)
Message-ID: <1fc0110b-0e83-4e8f-a25b-efaf5022d509@rnout.be>
Date: Wed, 16 Apr 2025 23:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20250409122713.2711739-1-buildroot@bubu1.eu>
Content-Language: en-GB
In-Reply-To: <20250409122713.2711739-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Hw6Hth1412AAxc5Vlt6lbco++5CSrD+nSvBwIkBjRvI=;
 b=RjDMD5IskdIJQteOVnCge2dnNbGZ5vp7NN2/dIYVgX93MV9o+4GPcZauu7cMV1inhrFdvs
 m5UN9eTgTCil9kE6PnKG8jv0P00igkfNwI8ilKqzWDuSqAZPfuQw8VuJ3j5q81WOvUHLVs
 Gq27UhQF90EZmon9lQZfb1m+H1E7biXQU3aXboTbr4GvP0Rkhv6z7JZvK5JDfiYkO3Q/mD
 0/ot+HxnD2MMdK3tG++CnyGFysG7WSrHFgSxcA5//pyZT1JMa5suyaiVmvM+cBkj6fHojg
 e9oGN2B0zK6CaA3cAAI9iCDQ7QZOVFb5k7iPEMYAt0T/eJxqE7WPYWci2i+UjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/libndp: security bump to version 1.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA5LzA0LzIwMjUgMTQ6MjcsIE1hcmN1cyBIb2ZmbWFubiB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IEZyb206IE1hcmN1cyBIb2ZmbWFubiA8bWFyY3VzLmhvZmZtYW5uQG90aGVybW8uZGU+Cj4K
PiBGaXhlczogQ1ZFLTIwMjQtNTU2NCBbMV1bMl0KPgo+IFsxXSBodHRwczovL3d3dy5jdmUub3Jn
L0NWRVJlY29yZD9pZD1DVkUtMjAyNC01NTY0Cj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9qcGly
a28vbGlibmRwL2NvbW1pdC8wNWU0YmE3YjBkMTI2ZWVhNGMwNDM4N2RjZjQwNTk2MDU5ZWUyNGFm
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4K
CiDCoEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQK
Cj4gLS0tCj4gICBwYWNrYWdlL2xpYm5kcC9saWJuZHAuaGFzaCB8IDIgKy0KPiAgIHBhY2thZ2Uv
bGlibmRwL2xpYm5kcC5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJuZHAvbGli
bmRwLmhhc2ggYi9wYWNrYWdlL2xpYm5kcC9saWJuZHAuaGFzaAo+IGluZGV4IDM4OWUwYmE1ZmMu
LmVlMmI3NTg5MTkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJuZHAvbGlibmRwLmhhc2gKPiAr
KysgYi9wYWNrYWdlL2xpYm5kcC9saWJuZHAuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBM
b2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICBjM2VhNzZlMjUzZGVmODk4Njk2NTE2ODZhODI3
ZGE3NWI1Njg5NmZlOTRmYWJkODdkOGMxNGIxZDQ1ODhmZDA1ICBsaWJuZHAtMS44LnRhci5nego+
ICtzaGEyNTYgIGU1NjRmNTkxNGE2YjFiNzk5YzNhZmE2NGMyNTg4MjRhODAxYzFiNzlhMjllMmZl
NjUyNWI2ODIyNDljNjUyNjEgIGxpYm5kcC0xLjkudGFyLmd6Cj4gICBzaGEyNTYgIGRjNjI2NTIw
ZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEg
IENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJuZHAvbGlibmRwLm1rIGIvcGFja2Fn
ZS9saWJuZHAvbGlibmRwLm1rCj4gaW5kZXggZGIxZGU3YjgxYy4uMzAyODE2MjdhZiAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2xpYm5kcC9saWJuZHAubWsKPiArKysgYi9wYWNrYWdlL2xpYm5kcC9s
aWJuZHAubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4gICAKPiAtTElCTkRQX1ZFUlNJT04gPSAxLjgKPiArTElCTkRQX1ZFUlNJT04gPSAxLjkK
PiAgIExJQk5EUF9TSVRFID0gJChjYWxsIGdpdGh1YixqcGlya28sbGlibmRwLHYkKExJQk5EUF9W
RVJTSU9OKSkKPiAgIExJQk5EUF9MSUNFTlNFID0gTEdQTC0yLjErCj4gICBMSUJORFBfTElDRU5T
RV9GSUxFUyA9IENPUFlJTkcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
