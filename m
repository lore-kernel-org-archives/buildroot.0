Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C7FC47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 08:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84C1D60776;
	Sun, 14 Jan 2024 08:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84C1D60776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCKYergvQqPi; Sun, 14 Jan 2024 08:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0CEB605B0;
	Sun, 14 Jan 2024 08:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0CEB605B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BB561BF578
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 301AC40607
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 301AC40607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-gA7hGXTfvF for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 08:48:11 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41B2B40159
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 08:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41B2B40159
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5A95013F899;
 Sun, 14 Jan 2024 09:48:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 09:48:05 +0100
Date: Sun, 14 Jan 2024 09:48:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Message-ID: <ZaOfxdmjb6kYO2-j@landeda>
References: <20240102145029.242682-1-sairon@sairon.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102145029.242682-1-sairon@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705222088;
 bh=/QB4CY0aZb1J2MtcN/HBYz4z9uiB6GS6iReLrNyw6II=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CxFa0Qj2ndV4lR5IGC/0yeD5fpOf84z7tKQpOp+S8taD83CdaYGv654IRAxzjgvTO
 89dokZl+VeUkeZx7KSmE32mgVWJQviAAxmg4dldk1uyIY5sTUcp+OD5iFp7MxHz8NV
 L95JRaJ2kruAtXVrpLt6JHpowDUyGReCWPAfOgcbNsfDylfNvkhWNRIp9gjAjYpkCh
 R7XrZk3/E+4wo2HNyzJrRA1o3i7CBhmNolyTuOVm+ia8qJJEGR2fZkVYzx1s7wkg/7
 fY83bl3bt2oIUZAag2XtOMH4aLiTqeLFlodNfF43jDRZJozghdbg4p/zuKSZRgZnsG
 A+Io4kz85sq5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CxFa0Qj2
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-firmware: add rtw89
 firmware files
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFuLCBBbGwsCgpPbiAyMDI0LTAxLTAyIDE1OjUwICswMTAwLCBKYW4gxIxlcm3DoWsgc3Bha2Ug
dGh1c2x5Ogo+IEFkZCBmaWxlcyBmb3IgcnR3ODkgZHJpdmVyIGFuZCBleHRlbmQgaGVscCB0ZXh0
IGZvciBydHc4OCBvcHRpb24gYSBiaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6Fr
IDxzYWlyb25Ac2Fpcm9uLmN6PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5p
biAgICAgICAgIHwgOCArKysrKysrLQo+ICBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZp
cm13YXJlLm1rIHwgNyArKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJl
L0NvbmZpZy5pbiBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluCj4gaW5kZXggNWJl
ZmU1MDEyMi4uMTIyMWE4MDk4NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJl
L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluCj4gQEAg
LTQyMiw3ICs0MjIsMTMgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1JUTF9S
VFc4OAo+ICAJYm9vbCAiUmVhbHRlayBydHc4OCIKPiAgCWhlbHAKPiAgCSAgRmlybXdhcmUgaW1h
Z2VzIHN1cHBvcnRlZCBieSBSZWFsdGVrJ3Mgd2lyZWxlc3MKPiAtCSAgZHJpdmVyIHJ0dzg4Lgo+
ICsJICBkcml2ZXIgcnR3ODggKDgwMi4xMW4vYWMgY2hpcHNldHMpLgo+ICsKPiArY29uZmlnIEJS
Ml9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1JUTF9SVFc4OQo+ICsJYm9vbCAiUmVhbHRlayBydHc4
OSIKPiArCWhlbHAKPiArCSAgRmlybXdhcmUgaW1hZ2VzIHN1cHBvcnRlZCBieSBSZWFsdGVrJ3Mg
d2lyZWxlc3MKPiArCSAgZHJpdmVyIHJ0dzg5ICg4MDIuMTFheCBjaGlwc2V0cykuCj4gIAo+ICBj
b25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfUkVEUElORV9SUzkxMTMKPiAgCWJvb2wg
IlJlZHBpbmUgcnM5MTEzIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xp
bnV4LWZpcm13YXJlLm1rIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5t
awo+IGluZGV4IDk2OTA1ZGQ5MDkuLmQwNjFjOWY0MDIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9s
aW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawo+ICsrKyBiL3BhY2thZ2UvbGludXgtZmly
bXdhcmUvbGludXgtZmlybXdhcmUubWsKPiBAQCAtMTcxLDYgKzE3MSwxMyBAQCBMSU5VWF9GSVJN
V0FSRV9GSUxFUyArPSBcCj4gIExJTlVYX0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJ
Q0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQKPiAgZW5kaWYKPiAgCj4gKyMgcnR3ODkKPiAraWZl
cSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9SVExfUlRXODkpLHkpCj4gK0xJTlVYX0ZJ
Uk1XQVJFX0ZJTEVTICs9IFwKPiArCXJ0dzg5L3J0dyouYmluCj4gK0xJTlVYX0ZJUk1XQVJFX0FM
TF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQKPiArZW5kaWYK
PiArCj4gICMgYXIzMDExCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfQVIz
MDExKSx5KQo+ICBMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBhdGgzay0xLmZ3Cj4gLS0gCj4gMi4z
NC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
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
