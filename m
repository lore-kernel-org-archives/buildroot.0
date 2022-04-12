Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7061C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E7A5610C1;
	Tue, 12 Apr 2022 19:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZymvqbHNz1R; Tue, 12 Apr 2022 19:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 432BB610B9;
	Tue, 12 Apr 2022 19:55:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21CA81BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123A982F2D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0RYGRaFoSUyW for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:55:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1ADCC82F20
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 19:55:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7133:9439:48a3:ea79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 817E413F80A;
 Tue, 12 Apr 2022 21:55:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649793312;
 bh=SHbtS1yP1RsT7o+Z+GwySftiRa40uvxgr+kmqzYa0Tk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PXt+W/tiwIx5g79u5HOkJlzQEIQY41J8hF6H3EKGv7mFiSwyXZ32M26WO2wpw9QIp
 qFXoFyFOEiA+KKhbXh2XM9+4sfKprUOxRl7e3NUKcTycgkFUv3JxKd/KYwhljAjRGG
 ru5J9REEb/aYi7Rh7IZDaeQjRzMFkFTgDPuLSPau8AHn5oQI+p1XHzxaanOqCW8Nvy
 MkrAH8bTqyU36K2JBSPyegoYE4JyNN++NszkqXs+1b7LkVoxcY3FaYXJUf3J/qhXEm
 3ZdS6UpgseLPvR37XWVSEDJnuJA3AHdCDXJ3h0bzDWEjfTbI/wm4b6jGf9kO8cNV3n
 dSkW8jybgzARQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 12 Apr 2022 21:55:10 +0200
Date: Tue, 12 Apr 2022 21:55:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220412195510.GH4029883@scaer>
References: <20220412180213.2709733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412180213.2709733-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/mc: bump to version 4.8.28
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA0LTEyIDIwOjAyICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL21jL21jLmhhc2ggfCA0ICsrLS0KPiAg
cGFja2FnZS9tYy9tYy5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tYy9tYy5oYXNo
IGIvcGFja2FnZS9tYy9tYy5oYXNoCj4gaW5kZXggNjQwMGY2NGI5Li5iMDM4MTQ3NGYgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9tYy9tYy5oYXNoCj4gKysrIGIvcGFja2FnZS9tYy9tYy5oYXNoCj4g
QEAgLTEsNCArMSw0IEBACj4gLSMgSGFzaCBmcm9tIGh0dHA6Ly9mdHAubWlkbmlnaHQtY29tbWFu
ZGVyLm9yZy9tYy00LjguMjcuc2hhMjU2Cj4gLXNoYTI1NiAgMzFiZTU5MjI1ZmZhOTkyMDgxNmU5
YThiM2JlMGFiMjI1YTE2ZDE5ZTRmYWY0Njg5MGYyNWJkZmZhMDJhNGZmNCAgbWMtNC44LjI3LnRh
ci54ego+ICsjIEhhc2ggZnJvbSBodHRwOi8vZnRwLm1pZG5pZ2h0LWNvbW1hbmRlci5vcmcvbWMt
NC44LjI4LnNoYTI1Ngo+ICtzaGEyNTYgIGU5OTRkOWJlOWE3MTcyZTlhYzRhNGFkNjIxMDc5MjFm
NmFhMzEyZTY2OGIwNTZkZmU1YjhiY2ViYmFmNTM4MDMgIG1jLTQuOC4yOC50YXIueHoKPiAgIyBz
aGEyNTYgbG9jYWxseSBjb21wdXRlZDoKPiAgc2hhMjU2ICA1NTc2YmJlYzc2Mjk2ZTFjOGUwODFm
NzAzN2ViZDAxYmRhZGEzODg2MzVmNThkODQ0YTJmMjBkMzdiYmU0Mjg0ICBDT1BZSU5HCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbWMvbWMubWsgYi9wYWNrYWdlL21jL21jLm1rCj4gaW5kZXggNjc4
ZDY4N2JjLi5hYzEyYzIxNzMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tYy9tYy5tawo+ICsrKyBi
L3BhY2thZ2UvbWMvbWMubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICAKPiAtTUNfVkVSU0lPTiA9IDQuOC4yNwo+ICtNQ19WRVJTSU9OID0gNC44
LjI4Cj4gIE1DX1NPVVJDRSA9IG1jLSQoTUNfVkVSU0lPTikudGFyLnh6Cj4gIE1DX1NJVEUgPSBo
dHRwOi8vZnRwLm1pZG5pZ2h0LWNvbW1hbmRlci5vcmcKPiAgTUNfTElDRU5TRSA9IEdQTC0zLjAr
Cj4gLS0gCj4gMi4zMi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
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
