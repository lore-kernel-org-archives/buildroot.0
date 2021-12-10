Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D77C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 20:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAE7B42754;
	Fri, 10 Dec 2021 20:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSADVjTx6jUv; Fri, 10 Dec 2021 20:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4087842752;
	Fri, 10 Dec 2021 20:07:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 049A81BF28E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 20:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E713B42752
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 20:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1X5tpcMXKRi for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 20:07:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCD4D42751
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 20:07:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ad31:90cb:f019:b3ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C9949B00535;
 Fri, 10 Dec 2021 21:07:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639166824;
 bh=ntUD3OzJlH0CIzt/0ku30kUOxnIO+tPAlgLWx3ZT+I0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J2x8woWq7oAdoi1grbXrYdYFmyJDP+ycMp6jr/1c+JeI4A3ncyGRnM5WFRarFdKwF
 xfpqnnTZ0kpbTowuEnLSlgWiOAgrECNGR/D3vwct1VzVA+c7jOUtzVIc6OKfSqZu43
 UZXDIfh/MuwJ8nlSxHdXxu+W39cW6gpf6zUYuNnM6kxpGeuM9Zb6y944jZ8yaugTMO
 RmOh80lsvyDpYK/bHAclnVvU9ZLzzeFW694Z2o21DBpq+Bc1W++Ms1BTmJsveK/DUf
 qT6BrS8qDUJzF3f60SGrb9k1w+QE6iXMqDfbBBRqlX3mT+sBdSL8hwumdMcxOiYXLV
 CCSzjoGZTgC1g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Dec 2021 21:07:02 +0100
Date: Fri, 10 Dec 2021 21:07:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20211210200702.GK2603@scaer>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-3-jose.pekkarinen@unikie.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210141209.1812043-3-jose.pekkarinen@unikie.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/7] package/bmx7: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9zw6ksIEFsbCwKCk9uIDIwMjEtMTItMTAgMTY6MTIgKzAyMDAsIEpvc8OpIFBla2thcmluZW4g
c3Bha2UgdGh1c2x5Ogo+IFRoaXMgcGF0Y2ggd2lsbCBwcm92aWRlIGFuIGluaXRpYWwgcGFja2Fn
ZQo+IGZvciBibXg3IHByb2plY3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5l
biA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+ClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9ibXg3L0NvbmZpZy5pbiBiL3BhY2thZ2UvYm14Ny9Db25maWcuaW4KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjNjMTNjMDQ3ZTkKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvcGFja2FnZS9ibXg3L0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTYgQEAKPiAr
Y29uZmlnIEJSMl9QQUNLQUdFX0JNWDcKPiArCWJvb2wgImJteDciCj4gKwlkZXBlbmRzIG9uICFC
UjJfU1RBVElDX0xJQlMgIyBkbG9wZW4oKQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1pMSUIKPiAr
CXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJaTElCCgpZb3UgY2FuJ3Qgc2VsZWN0IEJSMl9QQUNLQUdF
X0xJQlpMSUIsIGJlY2F1c2UgaXQgaXMgYW4gZW50cnkgb2YgYQpjaG9pY2UuCgpJZiB5b3VyIHBh
Y2thZ2UgY2FuIHdvcmsgd2l0aCBhbnkgemxpYiwgdGhlbiBzZWxlY3RpbmcgQlIyX1BBQ0tBR0Vf
WkxJQgphcyB5b3UgZGlkIGlzIGVub3VnaC4gQnV0IGlmIHlvdXIgcGFja2FnZSByZWFsbHkgcmVx
dWlyZSB0aGUgb3JpZ2luYWwKemxpYiwgdGhlbiB5b3UgbXVzdCBkZXBlbmQgb24gQlIyX1BBQ0tB
R0VfTElCWkxJQiAoYW5kIG5vdCBzZWxlY3QKQlIyX1BBQ0tBR0VfWkxJQikuCgpbLS1TTklQLS1d
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYm14Ny9ibXg3Lm1rIGIvcGFja2FnZS9ibXg3L2JteDcu
bWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjU4YjAwNDRhZWMK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9ibXg3L2JteDcubWsKPiBAQCAtMCwwICsx
LDIzIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBibXg3Cj4gKyMKPiAr
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0JNWDdfVkVSU0lPTiA9IHY3LjEuMQo+ICtC
TVg3X1NPVVJDRSA9ICQoQk1YN19WRVJTSU9OKS50YXIuZ3oKPiArQk1YN19TSVRFID0gaHR0cHM6
Ly9naXRodWIuY29tL2JteC1yb3V0aW5nL2JteDcvYXJjaGl2ZS9yZWZzL3RhZ3MKPiArQk1YN19M
SUNFTlNFID0gR1BMLTIKPiArQk1YN19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICtCTVg3X0RF
UEVOREVOQ0lFUyA9IHpsaWIgbWJlZHRscyB3aXJlbGVzc190b29scwo+ICsKPiArZGVmaW5lIEJN
WDdfQlVJTERfQ01EUwo+ICsJKGNkICQoQEQpOyBcCj4gKwkkKFRBUkdFVF9NQUtFX0VOVikgJChN
QUtFKSAtQyAkKEBEKS8kKGQpL3NyYyBDQz0iJChUQVJHRVRfQ0MpIikKCkFnYWluLCBubyBuZWVk
IGZvciB0aGUgZW5jbG9zaW5nIHBhcmVudGhlc2VzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4K
Cj4gK2VuZGVmCj4gKwo+ICtkZWZpbmUgQk1YN19JTlNUQUxMX1RBUkdFVF9DTURTCj4gKwkkKElO
U1RBTEwpIC1tIDA3NTUgLUQgJChARCkvc3JjL2JteDcgJChUQVJHRVRfRElSKS91c3IvYmluL2Jt
eDcKPiArZW5kZWYKPiArCj4gKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCj4gLS0gCj4gMi4z
MC4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
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
