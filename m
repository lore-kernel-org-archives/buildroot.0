Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF6BC433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 929C283ED6;
	Sat,  1 Oct 2022 16:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 929C283ED6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xC6rYPZfybID; Sat,  1 Oct 2022 16:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCFC7833B7;
	Sat,  1 Oct 2022 16:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCFC7833B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92F381BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E64E60F3C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E64E60F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHEp0qcJlOxy for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:16:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 161D860EA0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 161D860EA0
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:16:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1D10778036C;
 Sat,  1 Oct 2022 18:16:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 18:16:37 +0200
Date: Sat, 1 Oct 2022 18:16:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
Message-ID: <20221001161637.GC30794@scaer>
References: <20220930141350.15305-1-vincent.stehle@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220930141350.15305-1-vincent.stehle@arm.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664641000;
 bh=CvoTbu/TVnr/w3d14tTGF5L/YqfqI0k1oK8kIkAyDbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k6s/NKZHkzlC7CJWrSnEbCybnQQ8737Hnz4VKM7mqpPR2YDxaTAKcXudtJxgXm+wK
 jo2c1i+t4ZCq2/TBKqqXaFS4UIBPdbg9D6wQDAdPvXFrfEXf5uJ8Sur+eFZeDGx4+p
 zAYqtuWYDup4P60Eqtj4jIP0Z5spTgUVEu9cKZ016WaJoOZjzavEyVGmB750O4Eh/Y
 l3GxvjAsZFL7uJrrdmQmd/Pm9jofqEByA8mLznSKkw1+ok7XTxKcq0Yy5Tgj0acqzg
 X9MzJH7vczqzSSgVAPWRTPATdyxPYH/SS0nbBdLzResOw0caYSegCmITJTrlDi+Hm8
 4VNGF5V8Yfshw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k6s/NKZH
Subject: Re: [Buildroot] [PATCH] package/fwts: enable for arm
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

VmluY2VudCwgQWxsLAoKT24gMjAyMi0wOS0zMCAxNjoxMyArMDIwMCwgVmluY2VudCBTdGVobMOp
IHNwYWtlIHRodXNseToKPiBUaGUgRldUUyBhcHBsaWNhdGlvbiBhbmQgaXRzIGFzc29jaWF0ZWQg
a2VybmVsIG1vZHVsZXMgZG8gYnVpbGQgb24gYXJtOwo+IGVuYWJsZSBpdC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IEVy
aWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvZnd0cy9D
b25maWcuaW4gfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9md3RzL0NvbmZpZy5pbiBiL3Bh
Y2thZ2UvZnd0cy9Db25maWcuaW4KPiBpbmRleCBhYzlhMmUzOTA5OC4uNmJlMWFjYWM0ZWQgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9md3RzL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvZnd0cy9D
b25maWcuaW4KPiBAQCAtMSw2ICsxLDYgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0ZXVFMKPiAg
CWJvb2wgImZ3dHMiCj4gLQlkZXBlbmRzIG9uIEJSMl9pMzg2IHx8IEJSMl94ODZfNjQgfHwgQlIy
X2FhcmNoNjQKPiArCWRlcGVuZHMgb24gQlIyX2kzODYgfHwgQlIyX3g4Nl82NCB8fCBCUjJfYWFy
Y2g2NCB8fCBCUjJfYXJtCgpJJ3ZlIGludHJvZHVjZSBCUjJfUEFDS0FHRV9GV1RTX0FSQ0hfU1VQ
UE9SVFMsIGxpa2Ugd2UgZG8gaW4gb3RoZXIKcGFja2FnZXMgd2hlbiB0aGUgbGlzdCBvZiBzdXBw
b3J0ZWQgYXJjaGl0ZWN0dXJlcyBncm93cyBhIGJpdCB0b28gbXVjaCwKbGlrZSBoZXJlLgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICAJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJCU0RfQVJDSF9TVVBQT1JUUyAjIGxpYmJzZAo+ICAJZGVw
ZW5kcyBvbiBCUjJfVVNFX01NVSAjIGxpYmdsaWIyCj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NI
QVIgIyBsaWJnbGliMiwgbGliYnNkCj4gQEAgLTMzLDcgKzMzLDcgQEAgY29tbWVudCAiZWZpX3J1
bnRpbWUgbW9kdWxlIG5lZWRzIGEgTGludXgga2VybmVsIHRvIGJlIGJ1aWx0Igo+ICBlbmRpZgo+
ICAKPiAgY29tbWVudCAiZnd0cyBuZWVkcyBhIGdsaWJjIHRvb2xjaGFpbiB3LyB3Y2hhciwgdGhy
ZWFkcywgZHluYW1pYyBsaWJyYXJ5Igo+IC0JZGVwZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJfeDg2
XzY0IHx8IEJSMl9hYXJjaDY0Cj4gKwlkZXBlbmRzIG9uIEJSMl9pMzg2IHx8IEJSMl94ODZfNjQg
fHwgQlIyX2FhcmNoNjQgfHwgQlIyX2FybQo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJC
U0RfQVJDSF9TVVBQT1JUUyAjIGxpYmJzZAo+ICAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ICAJ
ZGVwZW5kcyBvbiAhQlIyX1VTRV9XQ0hBUiB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8
fCBcCj4gLS0gCj4gMi4zNS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8
IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFj
eTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlH
TiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0t
LS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0
dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAg
IHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
