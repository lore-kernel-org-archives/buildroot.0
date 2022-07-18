Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EEEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 21:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FE23832AA;
	Mon, 18 Jul 2022 21:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE23832AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s43xWLYV1Gn4; Mon, 18 Jul 2022 21:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7325283281;
	Mon, 18 Jul 2022 21:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7325283281
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58E831BF3C1
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 21:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4234A83281
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 21:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4234A83281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvPBPC9mOqgW for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 21:35:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6703483268
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6703483268
 for <buildroot@busybox.net>; Mon, 18 Jul 2022 21:35:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5d47:1bcb:9db:ce0f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 327DA13F880;
 Mon, 18 Jul 2022 23:35:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Jul 2022 23:35:12 +0200
Date: Mon, 18 Jul 2022 23:35:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220718213512.GG2249625@scaer>
References: <20220718110555.3244059-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718110555.3244059-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658180115;
 bh=Ker6/Uu2Z2rKlSAFjNHGrPUAaOF5cZSK7h+QN6eMSw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YoH+z6wJtZFBu97ex4dpt8ieYF2JZ+XW2/Zj5cczQ+Wv1FkRMM3J3oDNaNfrXfDJK
 oqnaNGt0JauSgLI4KzrYnCzL8NeGxC2h8iRL33mUf4DziRUic0JeEYiu/1z97OVlZ+
 FEBcSuAmUh5d5bzvgz+zjQXgw6QpWhIk/crZS3ARDDA/3E355ELzpTw6HXcYzYwjnT
 SwdIswSHQP7eAyMFE/RlFze+IRGs+fBN7jpLzkAs1m71APh7ICfR9zChJE/sEE3YOP
 +B7aP0ywAeO0xzk+aIL6ohaVT1iE7wlQObtUdPBnYmmbJT25Twg8Slaa8wxCLgK9M0
 AmFFKzVtF5aRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YoH+z6wJ
Subject: Re: [Buildroot] [PATCH] package/luaossl: bump to version 20220711
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA3LTE4IDEzOjA1ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkhvd2V2ZXIs
IG5pdDogeW91ciBGcm9tIGhlYWRlciAoaS5lLiB5b3VyIGdpdCBhdXRob3IpIGRvZXMgbm90IG1h
dGNoCnlvdXIgU29CIGxpbmUuIFRoZXkgc2hvdWxkIGJlIHRoZSBzYW1lLgoKSSBub3RpY2VkIGFm
dGVyIEkgcHVzaGVkLCBzbyB0b28gbGF0ZSBmb3IgdGhpcyB0aW1lLi4uCgpSZWdhcmRzLApZYW5u
IEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9sdWFvc3NsL2x1YW9zc2wuaGFzaCB8IDQgKyst
LQo+ICBwYWNrYWdlL2x1YW9zc2wvbHVhb3NzbC5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9sdWFvc3NsL2x1YW9zc2wuaGFzaCBiL3BhY2thZ2UvbHVhb3NzbC9sdWFvc3NsLmhhc2gK
PiBpbmRleCBjOGZhNzk0MmUuLjE4NTI3ZDk5YSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1YW9z
c2wvbHVhb3NzbC5oYXNoCj4gKysrIGIvcGFja2FnZS9sdWFvc3NsL2x1YW9zc2wuaGFzaAo+IEBA
IC0xLDMgKzEsMyBAQAo+ICAjIGNvbXB1dGVkIGJ5IGx1YXJvY2tzL2J1aWxkcm9vdAo+IC1zaGEy
NTYgZWE2ZDYyNGU1NTc5MzllMzBiOTMzNTVkZDFkYzExNDY1ZTgxYWEzOGE1NTQyYWIzYzA0YjQ4
NjA4YWMzY2Q3OCAgbHVhb3NzbC0yMDIwMDcwOS0wLnNyYy5yb2NrCj4gLXNoYTI1NiA3YmQ1ODVm
YmEzYWU1Mjk0M2UwOTE1ZTRjOGNhMDQ5YWNkZTlmMWU1Y2VhMTAxZWY2YjI5NDQyN2M4ZjBlZTdk
ICBsdWFvc3NsLXJlbC0yMDIwMDcwOS9MSUNFTlNFCj4gK3NoYTI1NiBkNzExYzg2ZjQzM2RlZjkw
ZjYzY2I2NzQ3ZmUwYmViYWFjNjA0Yjg2OGRlNmE5YTM1ZTRkYTJiYjRlMDk2N2JlICBsdWFvc3Ns
LTIwMjIwNzExLTAuc3JjLnJvY2sKPiArc2hhMjU2IDdiZDU4NWZiYTNhZTUyOTQzZTA5MTVlNGM4
Y2EwNDlhY2RlOWYxZTVjZWExMDFlZjZiMjk0NDI3YzhmMGVlN2QgIGx1YW9zc2wtcmVsLTIwMjIw
NzExL0xJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWFvc3NsL2x1YW9zc2wubWsgYi9w
YWNrYWdlL2x1YW9zc2wvbHVhb3NzbC5tawo+IGluZGV4IGQyNDFiY2U4NS4uYTYyODNhNTIwIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVhb3NzbC9sdWFvc3NsLm1rCj4gKysrIGIvcGFja2FnZS9s
dWFvc3NsL2x1YW9zc2wubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICAKPiAtTFVBT1NTTF9WRVJTSU9OX1VQU1RSRUFNID0gMjAyMDA3MDkKPiAr
TFVBT1NTTF9WRVJTSU9OX1VQU1RSRUFNID0gMjAyMjA3MTEKPiAgTFVBT1NTTF9WRVJTSU9OID0g
JChMVUFPU1NMX1ZFUlNJT05fVVBTVFJFQU0pLTAKPiAgTFVBT1NTTF9TVUJESVIgPSBsdWFvc3Ns
LXJlbC0kKExVQU9TU0xfVkVSU0lPTl9VUFNUUkVBTSkKPiAgTFVBT1NTTF9MSUNFTlNFID0gTUlU
Cj4gLS0gCj4gMi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
