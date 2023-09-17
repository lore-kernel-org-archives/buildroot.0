Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDB8CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 08:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A01D161070;
	Sun, 17 Sep 2023 08:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A01D161070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Tse3e5uq8c5; Sun, 17 Sep 2023 08:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C71F16102D;
	Sun, 17 Sep 2023 08:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C71F16102D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF8A21BF4DA
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 08:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B41B081E6F
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 08:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B41B081E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aurGcfdQJTi5 for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 08:33:48 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F65581B0A
 for <buildroot@busybox.net>; Sun, 17 Sep 2023 08:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F65581B0A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1F685B00572;
 Sun, 17 Sep 2023 10:33:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 10:33:42 +0200
Date: Sun, 17 Sep 2023 10:33:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230917083342.GK415981@scaer>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
 <20230916154351.2747233-6-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916154351.2747233-6-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694939625;
 bh=xTv5vBC5XjGdDHgkRXkXSv+MWjEcFJWgqWGr4r6dxOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fWpc9Lf+NgVCNLzVRZsqrtGnNZQUE0ULO7nu5sq3q+CLKhkCslPfQQse7ssc4PKEi
 vo0Sg334auOrKUf6hRFduzP3SFu3QHXp8MNx4Z6Ljska/JOIAy6X7ZvfQq30WPU5YP
 hknuYg9cIMDMBxjfgaOD7q8UfCGOD+9PB4VJois8TtTpS1PliFqhYPD9KhPeePTvn2
 cK85n/DIempNawcZvdU6mv4CpC7/ZXZZSfngXiAg9+C1cwUjEj7pW/GzOyje5RohRS
 M6zF+OKoOo7RVhnGaIXfLLZBXLVF9VxJ0SNKyLjV/GuyR7DOVWwAoo6mt/WBeOATeH
 56MBK2EnYtm3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fWpc9Lf+
Subject: Re: [Buildroot] [PATCH 06/16] package/perl-http-date: bump to
 version 6.06
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA5LTE2IDE3OjQzICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IExJQ0VOU0U6IHVwZGF0ZSBjb3B5cmlnaHQgZGF0ZXMgJiByZWZv
cm1hdGVkIEFydGlzdGljIExpY2Vuc2UgcGFydAo+IHNlZSBodHRwczovL21ldGFjcGFuLm9yZy9y
ZWxlYXNlL09BTERFUlMvSFRUUC1EYXRlLTYuMDUvZGlmZi9PQUxERVJTL0hUVFAtRGF0ZS02LjA2
I0xJQ0VOU0UKClRoaXMgc2RpZmYgKGFnYWluc3QgYmFja3dhcmRzLi4uKSBzaG93cyBtb3JlIHRo
YW4gYSBzaW1wbGUgcmVmb3JtYXR0aW5nOgppdCBhbHNvIGFkZHMgdGhlIGNsYXVzIDgsIGFib3V0
IGFnZ3JlZ2F0aW9uLiBTbyB0aGUgbGljZW5zaW5nIHRlcm1zIGhhdmUKY2hhbmdlZC4KClNQRFgg
a25vd3MgdGhpcyBuZXcgbGljZW5zZSBhcyAiQXJ0aXN0aWMgTGljZW5zZSAxLjAgdy9jbGF1c2Ug
OCI6CiAgICBodHRwczovL3NwZHgub3JnL2xpY2Vuc2VzL0FydGlzdGljLTEuMC1jbDguaHRtbAoK
U28sIGRvIHdlIHduYXQgdG8gZGlmZmVyZW50aWF0ZSB0aGF0IGluIEJ1aWxkcm9vdCwgb3IgZG8g
d2UgYWNjZXB0IHRoYXQKIkFydGlzdGljIiBtZWFucyBhbnkgb2YgdGhlIEFydGlzdGljIGZhbWls
eSBvZiBsaWNlbnNlcz8KCkkgd291bGQgcHJlZmVyIHRoYXQgd2UgZG8gZGlmZmVyZW50aWF0ZS4K
ClNvLCB0aGVyZSB3YXMgdG9vIG11Y2ggZGVsdGEgaW4gdGhpcyBzZXJpZXMsIEkgZGlkIG5vdCBh
cHBseSBhbnkgb2YgaXQsCmRlc3BpdGUgbXkgc2F5aW5nIHNvIGZvciB0aGUgZmlyc3QgdHdvIHBh
dGNoZXMuCgpDYW4geW91IGZpeCBhbGwgdGhlIGRpZmZzIFVSTFMgc28gdGhleSBhcmUgZm9yd2Fy
ZCwgbW9yZSBjbG9zZWx5IHJldmlldwp0aGUgbGljZW5zaW5nIHRlcm1zIGNoYW5nZXMsIGFuZCBy
ZXN1Ym1pdCBhIGZpeGVkIHNlcmllcywgcGxlYXNlPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4K
Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5v
cmc+Cj4gLS0tCj4gIHBhY2thZ2UvcGVybC1odHRwLWRhdGUvcGVybC1odHRwLWRhdGUuaGFzaCB8
IDggKysrKy0tLS0KPiAgcGFja2FnZS9wZXJsLWh0dHAtZGF0ZS9wZXJsLWh0dHAtZGF0ZS5tayAg
IHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wZXJsLWh0dHAtZGF0ZS9wZXJsLWh0dHAtZGF0
ZS5oYXNoIGIvcGFja2FnZS9wZXJsLWh0dHAtZGF0ZS9wZXJsLWh0dHAtZGF0ZS5oYXNoCj4gaW5k
ZXggYjI3ODQyMzAwLi5hNmY3NzAxODIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wZXJsLWh0dHAt
ZGF0ZS9wZXJsLWh0dHAtZGF0ZS5oYXNoCj4gKysrIGIvcGFja2FnZS9wZXJsLWh0dHAtZGF0ZS9w
ZXJsLWh0dHAtZGF0ZS5oYXNoCj4gQEAgLTEsNiArMSw2IEBACj4gLSMgcmV0cmlldmVkIGJ5IHNj
YW5jcGFuIGZyb20gaHR0cDovL2NwYW4ubWV0YWNwYW4ub3JnLwo+IC1tZDUgIDJlY2JiM2FlZGY2
YWVmMDYyNjA1MTkxODEzY2EzMDI3ICBIVFRQLURhdGUtNi4wNS50YXIuZ3oKPiAtc2hhMjU2ICAz
NjVkNjI5NGRmYmQzN2ViYzUxZGVmOGI2NWI4MWViNzliMzkzNGVjYmM5NWEyZWMyZDRkODI3ZWZl
NmE5MjJiICBIVFRQLURhdGUtNi4wNS50YXIuZ3oKPiArIyByZXRyaWV2ZWQgYnkgc2NhbmNwYW4g
ZnJvbSBodHRwczovL2NwYW4ubWV0YWNwYW4ub3JnLwo+ICttZDUgIDYwNDYyMzU5YmZlYjFlNmQx
NDYwMjUwOGNmZDA3ODg1ICBIVFRQLURhdGUtNi4wNi50YXIuZ3oKPiArc2hhMjU2ICA3YjY4NTE5
MWM2YWNjM2U3NzNkMWZjMDJjOTVlZTFmOWZhZTk0Zjc3NzgzMTc1ZjVlNzhjMTgxY2M5MmQyYjUy
ICBIVFRQLURhdGUtNi4wNi50YXIuZ3oKPiAgCj4gICMgY29tcHV0ZWQgYnkgc2NhbmNwYW4KPiAt
c2hhMjU2ICAzMDViNzFjNGQyZmQ2MzgwNTg1Njg5YzVmMWM2MjA3MzdhMzZhMzE4Y2UwZjljNzcy
YmFkY2UwZmUyOTNhNDRlICBMSUNFTlNFCj4gK3NoYTI1NiAgNjE4NmE3OWEzMDVhMGU2MmM1MDg3
Zjk3MzdiNGY2NmZhNTc5M2ZhMWIzOTZkYTAxMjZlM2M4NzIyYzQ2MDI0NSAgTElDRU5TRQo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3BlcmwtaHR0cC1kYXRlL3BlcmwtaHR0cC1kYXRlLm1rIGIvcGFj
a2FnZS9wZXJsLWh0dHAtZGF0ZS9wZXJsLWh0dHAtZGF0ZS5tawo+IGluZGV4IDQzNTgzYmUzMC4u
MWU0NmYxNDE0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGVybC1odHRwLWRhdGUvcGVybC1odHRw
LWRhdGUubWsKPiArKysgYi9wYWNrYWdlL3BlcmwtaHR0cC1kYXRlL3BlcmwtaHR0cC1kYXRlLm1r
Cj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4g
LVBFUkxfSFRUUF9EQVRFX1ZFUlNJT04gPSA2LjA1Cj4gK1BFUkxfSFRUUF9EQVRFX1ZFUlNJT04g
PSA2LjA2Cj4gIFBFUkxfSFRUUF9EQVRFX1NPVVJDRSA9IEhUVFAtRGF0ZS0kKFBFUkxfSFRUUF9E
QVRFX1ZFUlNJT04pLnRhci5nego+ICBQRVJMX0hUVFBfREFURV9TSVRFID0gJChCUjJfQ1BBTl9N
SVJST1IpL2F1dGhvcnMvaWQvTy9PQS9PQUxERVJTCj4gIFBFUkxfSFRUUF9EQVRFX0xJQ0VOU0Ug
PSBBcnRpc3RpYyBvciBHUEwtMS4wKwo+IC0tIAo+IDIuMzkuMgo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
