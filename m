Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094AAC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA4C76076C;
	Wed, 16 Apr 2025 21:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuHxPcrsZ90Q; Wed, 16 Apr 2025 21:29:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A334960F4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A334960F4E;
	Wed, 16 Apr 2025 21:29:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B77D711B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A892A8486F
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzTGj8HOyWBD for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:29:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0152847EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0152847EB
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0152847EB
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:29:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C04971C00C0; Wed, 16 Apr 2025 23:29:34 +0200 (CEST)
Message-ID: <ef5e3a5b-1556-4f7f-8026-ee68c33d4204@rnout.be>
Date: Wed, 16 Apr 2025 23:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20250406213130.3623145-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20250406213130.3623145-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838974; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=du0EctYJbmK0fM7xFDd/XMwzU6spb1BBUZeVbR1ifYE=;
 b=bEskqspQUHIk+qwFnCgRugK7TkaV/0uQQ4E9oEE4P3H8sEneoXuwt2TJ7tFR9Rmh8jXRp/
 6A+JKa/BCHdEk6h+vB6R+9y3rdmXavPFy+kD2VTHqGg0p5cB03q09CPaJ9bYlv7U6s89Wn
 oosTh4HznoIiXGxRgxUrNztTv25cRDhDH8+Q5vbnvp89o7UdpocXajj8rK9nE3CAbYEWYH
 GIgAgNJBLDHwN0P/CYCOrVRtagFrtULxsTgggVGF4Zyq3w1h6aSNrv+1lvK/PF9WF4MZcx
 JhN33BxsFMvSjfkcOvKwAL6fK8OO+HJ6k51hBXuafzg7PlM9Dxzbyit9UYfoew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump to version
 2025-04-06
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

Ck9uIDA2LzA0LzIwMjUgMjM6MzEsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IFRoaXMgdmVyc2lv
biBidWlsZHMgdXAgdG8gTGludXggdmVyc2lvbiA2LjEzLgo+Cj4gRml4ZXM6Cj4gaHR0cDovL2F1
dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZTcxL2U3MWE1YjQ2YWZmZTU5NDhjMTZhMGM4
MzUzNGQ4ZjU2ZjY5YjZlOTEvCj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxp
by5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CgogwqBBcHBsaWVkIHRvwqAyMDI1LjAy
LngsIDIwMjQuMTEueCBhbmQgMjAyNC4wMi54LCB0aGFua3MuCgogwqBJdCBvbmx5IGhhcyBidWls
ZCBmaXhlcy4KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL21hbGkt
ZHJpdmVyL21hbGktZHJpdmVyLmhhc2ggfCAyICstCj4gICBwYWNrYWdlL21hbGktZHJpdmVyL21h
bGktZHJpdmVyLm1rICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21hbGktZHJpdmVyL21h
bGktZHJpdmVyLmhhc2ggYi9wYWNrYWdlL21hbGktZHJpdmVyL21hbGktZHJpdmVyLmhhc2gKPiBp
bmRleCBkZGRlNTZiNTVjLi5iYzQwNmUyNzBmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWFsaS1k
cml2ZXIvbWFsaS1kcml2ZXIuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbWFsaS1kcml2ZXIvbWFsaS1k
cml2ZXIuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAt
c2hhMjU2ICAzMTExNzU3YTQxMWJhMjE2YTRiOGUzZDg4YzI5ZWIzYmUzMTgyYTdmMGQ1ZjhiOWNm
ZTEwZjg1ZWM2NjkzYmM5ICBtYWxpLWRyaXZlci1kNDBjNTdkODFjOWNmNGJjNmZlZmVhZjQ3MTUz
ZmRlOGVlZDE5ZWYyLnRhci5nego+ICtzaGEyNTYgIGMxYTlhZDVkZmEwZDRiNzk3OGExYTZkZDAy
ZDdlYWJkNGJjNjVlN2Q2YTA2ZWRhNzQ5Y2FlNzIwNzQ5YTc0MWMgIG1hbGktZHJpdmVyLTRmNTI4
MmIzMDVjYjA5NTZmZTI0ODVjOWU5ZGFiMDAyMWQ1NTM4ZjYudGFyLmd6Cj4gICBzaGEyNTYgIDgx
NzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4
ODA2NDMgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tYWxpLWRyaXZlci9tYWxpLWRy
aXZlci5tayBiL3BhY2thZ2UvbWFsaS1kcml2ZXIvbWFsaS1kcml2ZXIubWsKPiBpbmRleCBmYTVh
OGQ5NGQ5Li5jY2I1NmRlODFmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWFsaS1kcml2ZXIvbWFs
aS1kcml2ZXIubWsKPiArKysgYi9wYWNrYWdlL21hbGktZHJpdmVyL21hbGktZHJpdmVyLm1rCj4g
QEAgLTQsNyArNCw3IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4g
LU1BTElfRFJJVkVSX1ZFUlNJT04gPSBkNDBjNTdkODFjOWNmNGJjNmZlZmVhZjQ3MTUzZmRlOGVl
ZDE5ZWYyCj4gK01BTElfRFJJVkVSX1ZFUlNJT04gPSA0ZjUyODJiMzA1Y2IwOTU2ZmUyNDg1Yzll
OWRhYjAwMjFkNTUzOGY2Cj4gICBNQUxJX0RSSVZFUl9TSVRFID0gJChjYWxsIGdpdGh1Yixib290
bGluLG1hbGktZHJpdmVyLCQoTUFMSV9EUklWRVJfVkVSU0lPTikpCj4gICBNQUxJX0RSSVZFUl9E
RVBFTkRFTkNJRVMgPSBsaW51eAo+ICAgTUFMSV9EUklWRVJfTElDRU5TRSA9IEdQTC0yLjAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
