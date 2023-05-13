Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0BEC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11C92614AB;
	Sat, 13 May 2023 19:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11C92614AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkwB887P6AiX; Sat, 13 May 2023 19:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1980660A94;
	Sat, 13 May 2023 19:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1980660A94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA1911BF5B4
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2CEF4023B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2CEF4023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ybTQ0NXXeneQ for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:49:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE2674016F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE2674016F
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:49:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D55B019F73D;
 Sat, 13 May 2023 21:49:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 21:49:46 +0200
Date: Sat, 13 May 2023 21:49:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20230513194946.GE2582048@scaer>
References: <20230420144537.2660650-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230420144537.2660650-1-raphael.melotte@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684007390;
 bh=SWJmjAFAKDbEfO4qa6kqBLHTnyM9wr5c6y/xwIcx9AU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ClDhlzLenIN5+yCXRuFoR692AH4vyPpngzwb2zyC5DS7dc9l+B7e3FaIST8DLstNd
 ZRMMcnqKiwZ3J6ITa9losv8IEIhTdkSck0YxzUJ5EGZEBnZVYd5cj7q98UtiSA3KiL
 U6aJ16qijv4zacDwxxt9rM5RCIzs7psDOEpKFJN5njHW22ie1t+0TVbWXcXYm2Mw8/
 pO0FhjVdrwFADuW1IiLCN6us5ijeT5Y+u9/HlaDo+MYTYe0SHe3WReyVl2XSqkJ+5H
 YM/3tkIqr8EddJ0YP29SuuH5PosizXtu8jEs7TKY8BrOwIv5EI2C7SFYABe0fljsBP
 fjr5+z9IFdaYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ClDhlzLe
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymupdf: add missing
 host swig dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFwaGHDq2wsIEFsbCwKCk9uIDIwMjMtMDQtMjAgMTY6NDUgKzAyMDAsIFJhcGhhw6tsIE3DqWxv
dHRlIHNwYWtlIHRodXNseToKPiBJdCBhcHBlYXJzIHRoYXQgcHl0aG9uLXB5bXVwZGYgbmVlZHMg
c3dpZyB3aGVuIGJ1aWxkaW5nIHNpbmNlIG11cGRmCj4gd2FzIGJ1bXBlZCB0byAxLjE4LjAgaW4g
Y29tbWl0Cj4gZjAwZGE3MTRhMjBhNzgyNmRkYTY3ZDY2ZjJhNmI2ZWY4NThlZjNlMy4gVGhpcyB3
YXMgbm90IG5vdGljZWQgYmVmb3JlCj4gYmVjYXVzZSB3aGVuIGJ1aWxkaW5nIG9uIGEgbWFjaGlu
ZSB3aGVyZSBzd2lnIGlzIGFscmVhZHkgYXZhaWxhYmxlCj4gb3V0c2lkZSBidWlsZHJvb3QsIGl0
IGlzIHVzZWQgYW5kIHRoZSBidWlsZCBzdWNjZWVkcy4KPiAKPiBUaGlzIGZpeGVzIHRoZSBmb2xs
b3dpbmcgYnVpbGQgZmFpbHVyZToKPiAKPiBzd2lnZ2luZyBmaXR6L2ZpdHouaSB0byBmaXR6L2Zp
dHpfd3JhcC5jCj4gc3dpZyAtcHl0aG9uIC13NTA5IC1vIGZpdHovZml0el93cmFwLmMgZml0ei9m
aXR6LmkKPiBlcnJvcjogY29tbWFuZCAnc3dpZycgZmFpbGVkOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5Cj4gbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI5MzoKPiAvaG9tZS9i
dWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEvYnVpbGQvcHl0aG9uLXB5bXVw
ZGYtMS4yMS4xLy5zdGFtcF9idWlsdF0KPiBFcnJvciAxCj4gCj4gRml4ZXM6Cj4gLSBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9jNjg5YTM4NWQ5ODRiODdiNjNmM2YyZmYz
MDMzODA0OTc3NGIxYmYyCj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy9jZjI2OGQzNjMxMzMwYTgyODhmYjhhZDJhZjAwOWFiYjdmMWNhNmIwCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBw
YWNrYWdlL3B5dGhvbi1weW11cGRmL0NvbmZpZy5pbiAgICAgICAgIHwgMSArCj4gIHBhY2thZ2Uv
cHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tcHltdXBkZi9Db25m
aWcuaW4KPiBpbmRleCBiM2Y5NTY1MjM4Li5lY2FhNTQ5NmI1IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9weXRob24tcHltdXBk
Zi9Db25maWcuaW4KPiBAQCAtNCw2ICs0LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9Q
WU1VUERGCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NZTkNfNCAjIG11cGRmIC0+
IGhhcmZidXp6Cj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOSAj
IG11cGRmIC0+IGhhcmZidXp6Cj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1hPUkc3Cj4gKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9TV0lHCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRlJFRVRZ
UEUKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NVVBERgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1pM
SUIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcHltdXBkZi9weXRob24tcHltdXBkZi5t
ayBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsKPiBpbmRleCA3MDQ0
OGU4ZDkwLi4wM2ZjOGJjNGZiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYv
cHl0aG9uLXB5bXVwZGYubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1w
eW11cGRmLm1rCj4gQEAgLTEyLDcgKzEyLDcgQEAgUFlUSE9OX1BZTVVQREZfU0VUVVBfVFlQRSA9
IHNldHVwdG9vbHMKPiAgUFlUSE9OX1BZTVVQREZfTElDRU5TRSA9IEFHUEwtMy4wKwo+ICBQWVRI
T05fUFlNVVBERl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICAjIE5vIGxpY2Vuc2UgZmlsZSBp
bmNsdWRlZCBpbiBwaXAsIGJ1dCBpdCdzIHByZXNlbnQgb24gZ2l0aHViCj4gLVBZVEhPTl9QWU1V
UERGX0RFUEVOREVOQ0lFUyA9IGZyZWV0eXBlIG11cGRmIHpsaWIKPiArUFlUSE9OX1BZTVVQREZf
REVQRU5ERU5DSUVTID0gZnJlZXR5cGUgaG9zdC1zd2lnIG11cGRmIHpsaWIKPiAgCj4gIFBZVEhP
Tl9QWU1VUERGX0VOViA9IENGTEFHUz0iLUkkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZS9tdXBk
ZiAtSSQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlL2ZyZWV0eXBlMiIKPiAgCj4gLS0gCj4gMi4z
Ny4zCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAou
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMt
YS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5
LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
