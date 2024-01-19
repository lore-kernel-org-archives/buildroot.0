Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DDAC4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 20:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B03C42DC2;
	Fri, 19 Jan 2024 20:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B03C42DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uz8zfT-TSz37; Fri, 19 Jan 2024 20:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCBEA42D53;
	Fri, 19 Jan 2024 20:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCBEA42D53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 386A61BF239
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 20:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FCA140181
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 20:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FCA140181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wW-4f6ayDCKb for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 20:25:02 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6183B40042
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 20:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6183B40042
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 285AA13F88D;
 Fri, 19 Jan 2024 21:24:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 19 Jan 2024 21:24:54 +0100
Date: Fri, 19 Jan 2024 21:24:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <ZaralvfR-l5QW00p@landeda>
References: <20231211155951.4079886-1-gael.portay@rtone.fr>
 <20231211155951.4079886-2-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211155951.4079886-2-gael.portay@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705695900;
 bh=aHYfITh6GcTR+61Eq2Kjqa6Q7CYirY/0C3VjQNRUJyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BAEhlKMRcRmZpKEVP9qMjgpgc7NqAnC68SY6fmLHjA9BR3Oj5nLSOGrpn0M89cbQq
 RZvtPxemWVkeic9citvUZoMbYMsbSXD0Jc1bYkZc7NBmTMMrNYm3wKU9cWqgKloIuV
 ptPg5hyRpMSvyOWp4Zqx1t9B6QvQAZzDKskkd38A6RpE8bCj6fxVxq5QZmheyrDy7P
 3WBCjN2Vc6nQVk0mwW0l+OkVghzOzOM6y0/Y6Y1m6PFjPLPOHg0wh9ZBXsE5jkgVtT
 Ltwee85CXIhn8dmhFrN7PCbOOb4Ufh3n0Q7YbfNOQyoZlids2WShMT3PLiCkVMBbyo
 9riTg3w8426PA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BAEhlKMR
Subject: Re: [Buildroot] [PATCH v2 1/2] arch: add support 16k page size on
 ARM64
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
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2HDq2wsIEFsbCwKCk9uIDIwMjMtMTItMTEgMTY6NTkgKzAxMDAsIEdhw6tsIFBPUlRBWSBzcGFr
ZSB0aHVzbHk6Cj4gVGhlIEJDTTI3MTIgb2YgdGhlIFJhc3BiZXJyeVBpIDUgc3VwcG9ydHMgZm9y
IDE2S0IgcGFnZSBzaXplLgo+IAo+IFRoaXMgYWRkcyBzdXBwb3J0IGZvciAxNiBLQiBvbiBBUk02
NC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZy
PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+
IC0tLQo+ICBhcmNoL0NvbmZpZy5pbi5hcm0gfCA0ICsrKysKPiAgYXJjaC9hcmNoLm1rICAgICAg
IHwgMiArLQo+ICBsaW51eC9saW51eC5tayAgICAgfCA0ICsrKysKPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9D
b25maWcuaW4uYXJtIGIvYXJjaC9Db25maWcuaW4uYXJtCj4gaW5kZXggNzg2MjFlMzIxYy4uYjQ0
YTE2NGUwMyAxMDA2NDQKPiAtLS0gYS9hcmNoL0NvbmZpZy5pbi5hcm0KPiArKysgYi9hcmNoL0Nv
bmZpZy5pbi5hcm0KPiBAQCAtNzgxLDYgKzc4MSw5IEBAIGNob2ljZQo+ICBjb25maWcgQlIyX0FS
TTY0X1BBR0VfU0laRV80Swo+ICAJYm9vbCAiNEtCIgo+ICAKPiArY29uZmlnIEJSMl9BUk02NF9Q
QUdFX1NJWkVfMTZLCj4gKwlib29sICIxNktCIgo+ICsKPiAgY29uZmlnIEJSMl9BUk02NF9QQUdF
X1NJWkVfNjRLCj4gIAlib29sICI2NEtCIgo+ICAKPiBAQCAtNzg5LDYgKzc5Miw3IEBAIGVuZGNo
b2ljZQo+ICBjb25maWcgQlIyX0FSTTY0X1BBR0VfU0laRQo+ICAJc3RyaW5nCj4gIAlkZWZhdWx0
ICI0SyIgaWYgQlIyX0FSTTY0X1BBR0VfU0laRV80Swo+ICsJZGVmYXVsdCAiMTZLIiBpZiBCUjJf
QVJNNjRfUEFHRV9TSVpFXzE2Swo+ICAJZGVmYXVsdCAiNjRLIiBpZiBCUjJfQVJNNjRfUEFHRV9T
SVpFXzY0Swo+ICAKPiAgY29uZmlnIEJSMl9BUkNICj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjaC5t
ayBiL2FyY2gvYXJjaC5tawo+IGluZGV4IDJlNzM3YjkyYWMuLjQxNzRkMzNkZjUgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcmNoLm1rCj4gKysrIGIvYXJjaC9hcmNoLm1rCj4gQEAgLTIzLDcgKzIzLDcg
QEAgaWZlcSAoJChCUjJfQVJDX1BBR0VfU0laRV80SykkKEJSMl9BUk02NF9QQUdFX1NJWkVfNEsp
LHkpCj4gIEFSQ0hfVE9PTENIQUlOX1dSQVBQRVJfT1BUUyArPSAtV2wsLXosbWF4LXBhZ2Utc2l6
ZT00MDk2IC1XbCwteixjb21tb24tcGFnZS1zaXplPTQwOTYKPiAgZWxzZSBpZmVxICgkKEJSMl9B
UkNfUEFHRV9TSVpFXzhLKSx5KQo+ICBBUkNIX1RPT0xDSEFJTl9XUkFQUEVSX09QVFMgKz0gLVds
LC16LG1heC1wYWdlLXNpemU9ODE5MiAtV2wsLXosY29tbW9uLXBhZ2Utc2l6ZT04MTkyCj4gLWVs
c2UgaWZlcSAoJChCUjJfQVJDX1BBR0VfU0laRV8xNkspLHkpCj4gK2Vsc2UgaWZlcSAoJChCUjJf
QVJDX1BBR0VfU0laRV8xNkspJChCUjJfQVJNNjRfUEFHRV9TSVpFXzE2SykseSkKPiAgQVJDSF9U
T09MQ0hBSU5fV1JBUFBFUl9PUFRTICs9IC1XbCwteixtYXgtcGFnZS1zaXplPTE2Mzg0IC1XbCwt
eixjb21tb24tcGFnZS1zaXplPTE2Mzg0Cj4gIGVsc2UgaWZlcSAoJChCUjJfQVJNNjRfUEFHRV9T
SVpFXzY0SykseSkKPiAgQVJDSF9UT09MQ0hBSU5fV1JBUFBFUl9PUFRTICs9IC1XbCwteixtYXgt
cGFnZS1zaXplPTY1NTM2IC1XbCwteixjb21tb24tcGFnZS1zaXplPTY1NTM2Cj4gZGlmZiAtLWdp
dCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKPiBpbmRleCAxZGI1YzYwNDZkLi41
M2UyYWQ2ZDQ4IDEwMDY0NAo+IC0tLSBhL2xpbnV4L2xpbnV4Lm1rCj4gKysrIGIvbGludXgvbGlu
dXgubWsKPiBAQCAtNDExLDYgKzQxMSwxMCBAQCBkZWZpbmUgTElOVVhfS0NPTkZJR19GSVhVUF9D
TURTCj4gIAkJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQVJNNjRfNEtfUEFHRVMp
Cj4gIAkJJChjYWxsIEtDT05GSUdfRElTQUJMRV9PUFQsQ09ORklHX0FSTTY0XzE2S19QQUdFUykK
PiAgCQkkKGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxDT05GSUdfQVJNNjRfNjRLX1BBR0VTKSkK
PiArCSQoaWYgJChCUjJfQVJNNjRfUEFHRV9TSVpFXzE2SyksCj4gKwkJJChjYWxsIEtDT05GSUdf
RElTQUJMRV9PUFQsQ09ORklHX0FSTTY0XzRLX1BBR0VTKQo+ICsJCSQoY2FsbCBLQ09ORklHX0VO
QUJMRV9PUFQsQ09ORklHX0FSTTY0XzE2S19QQUdFUykKPiArCQkkKGNhbGwgS0NPTkZJR19ESVNB
QkxFX09QVCxDT05GSUdfQVJNNjRfNjRLX1BBR0VTKSkKPiAgCSQoaWYgJChCUjJfQVJNNjRfUEFH
RV9TSVpFXzY0SyksCj4gIAkJJChjYWxsIEtDT05GSUdfRElTQUJMRV9PUFQsQ09ORklHX0FSTTY0
XzRLX1BBR0VTKQo+ICAJCSQoY2FsbCBLQ09ORklHX0RJU0FCTEVfT1BULENPTkZJR19BUk02NF8x
NktfUEFHRVMpCj4gLS0gCj4gMi40My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwg
ICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
