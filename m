Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1F8C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 21:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50887409EA;
	Sat, 14 Jan 2023 21:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50887409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfaU76dAuQtZ; Sat, 14 Jan 2023 21:56:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15CDA415C9;
	Sat, 14 Jan 2023 21:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15CDA415C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF8E1BF3C2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE47B81E75
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE47B81E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuA88Df9DPv2 for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 21:56:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC1F781E68
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC1F781E68
 for <buildroot@busybox.net>; Sat, 14 Jan 2023 21:56:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 78B6A5FF67;
 Sat, 14 Jan 2023 22:56:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Jan 2023 22:56:37 +0100
Date: Sat, 14 Jan 2023 22:56:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230114215637.GF199036@scaer>
References: <20230114194657.2192-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230114194657.2192-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673733399;
 bh=GRpIc4Kg/SPsIOLBx1/OIOOi/ZoK0aIthh7oKDEtQnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W2Qcuwswign0umGMe0KIWMm7kCWc1kRtDi2ja7XKoF91DSXFSKIqZA+PEIXhlpOuT
 R8hYXnIPGDcovHwxBsPMss/vFWGmFDQWf1FlruMC0/J4Sr/mUVcqoeBK7v0w0zZQnZ
 EnMO/5CQXUBLIKgE5HlEyeAlZxzj88m9rTpbUH6GpLhtv0qhCZa7T0oTyeHQ0SEwxL
 YjUE5sW3D0gUQTQ6aBlaz+hf60p4ydb9v/8jDJVEXn32vCqBqikL5ZsOwOl/EEjxKn
 I0FVMSfZZdKwl0bKcJsouaS6lvcketSRTqkU42KZR09A6+/81+Sl7TtmwIqtYBa41A
 umn/mslfR8D5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W2Qcuwsw
Subject: Re: [Buildroot] [PATCH] package/lua: add options for coercion
 between number and string
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTAxLTE0IDIwOjQ2ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IG5vdGU6IG5vdCBhdmFpbGFibGUgd2l0aCBMdWEgNS4xCgpPSywg
c28gSSB0aGluayB0aGlzIG1lYW5zIGEgYml0IG1vcmUgZXhwbGFuYXRpb25zLgoKRmlyc3QsIGl0
IHNob3VsZCBiZSBtZW50aW9uZWQgdGhhdCBjb2VyY2lvbiBkZWZhdWx0cyB0byAneScgZm9yIGVs
Z2FjeQpyZWFzb246IHVubGVzcyB0b2xkIG5vdCB0bywgdGhlIGJ1aWxkc3lzdGVtIGZvciBsdWEg
ZW5hYmxlcyBjb2VyY2lvbi4KClRoZW4sIGl0IHdvdWxkIGJlIG5pY2UgdG8gZXhwbGFpbiB3aHkg
b25lIG1pZ2h0IHdhbnQvbmVlZCB0byBkaXNhYmxlCmNvZXJjaW9uLgoKRmluYWxseSwgSSdkIGxp
a2UgdG8gcmVhZCBob3cgcGFja2FnZXMgbWF5IGJlIGltcGFjdGVkIGJ5IHN1Y2ggb3B0aW9ucy4K
Rm9yIGV4YW1wbGUsIGNvdWxkIHRoZXJlIGJlIHBhY2thZ2VzIHRoYXQgZXhwbGljaXRseSBleHBl
Y3QgY29lcmNpb24/CkhvdyB3b3VsZCB0aGV5IGJlaGF2ZSB3aXRob3V0IGNvZXJjaW9uPyBDb252
ZXJzZWx5LCBhcmUgdGhlcmUgcGFja2FnZXMKdGhhdCBleHBsaWNpdGx5IHdhbnQgbm8gY29lcmNp
b24/CgpJJ3ZlIHJlYWQgYSBiaXQgYWJvdXQgaXQgaW4gdGhlIG1hbnVhbCBbMF0sIGFuZCB0aGUg
b25seSBuaXQgdGhhdCBzZWVtcwpyZWxldmFudCB3YXMgIlRoZXNlIGNvZXJjaW9ucyBleGlzdCBt
YWlubHkgZm9yIGNvbXBhdGliaWxpdHkgYW5kIG1heSBiZQpyZW1vdmVkIGluIGZ1dHVyZSB2ZXJz
aW9ucyBvZiB0aGUgbGFuZ3VhZ2UiLiBTdGlsbCwgdGhpcyBkb2VzIG5vdApleHBsYWluIHdoeSB3
ZSBuZWVkIHRoYXQgaSBCdWlsZHJvb3QuCgpDb3VsZCB5b3UgcmVzcGluIHdpdGggYSBiZXR0ZXIg
Y29tbWl0IGxvZywgcGxlYXNlPwoKWzBdIGh0dHBzOi8vd3d3Lmx1YS5vcmcvbWFudWFsLzUuNC9t
YW51YWwuaHRtbCMzLjQuMwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gU2lnbmVkLW9mZi1i
eTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Cj4gLS0tCj4gIHBh
Y2thZ2UvbHVhL0NvbmZpZy5pbiB8IDEyICsrKysrKysrKysrKwo+ICBwYWNrYWdlL2x1YS9sdWEu
bWsgICAgfCAgOCArKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWEvQ29uZmlnLmluIGIvcGFja2FnZS9sdWEvQ29u
ZmlnLmluCj4gaW5kZXggMzA5ZGQ2ZWVjLi45MDMwMzFlNTAgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9sdWEvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9sdWEvQ29uZmlnLmluCj4gQEAgLTQxLDYg
KzQxLDE4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MVUFfMzJCSVRTCj4gIAkgIGRlZmF1bHQgNjQg
Yml0IHR5cGUuIFRoaXMgb3B0aW9uIGlzIHBhcnRpY3VsYXJseSBhdHRyYWN0aXZlCj4gIAkgIGZv
ciBzbWFsbCBtYWNoaW5lcyBhbmQgZW1iZWRkZWQgc3lzdGVtcy4KPiAgCj4gK2NvbmZpZyBCUjJf
UEFDS0FHRV9MVUFfQ1ZUX04yUwo+ICsJYm9vbCAiYXV0b21hdGljIGNvZXJjaW9uIGZyb20gbnVt
YmVyIHRvIHN0cmluZyIKPiArCWRlZmF1bHQgeQo+ICsJaGVscAo+ICsJICBTZWUgTFVBX05PQ1ZU
TjJTIGluIGx1YWNvbmYuaAo+ICsKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xVQV9DVlRfUzJOCj4g
Kwlib29sICJhdXRvbWF0aWMgY29lcmNpb24gZnJvbSBzdHJpbmcgdG8gbnVtYmVyIgo+ICsJZGVm
YXVsdCB5Cj4gKwloZWxwCj4gKwkgIFNlZSBMVUFfTk9DVlRTMk4gaW4gbHVhY29uZi5oCj4gKwo+
ICBlbmRpZgo+ICAKPiAgY2hvaWNlCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhL2x1YS5tayBi
L3BhY2thZ2UvbHVhL2x1YS5tawo+IGluZGV4IDAxYjU1NGViNi4uMTYwODZlN2JmIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvbHVhL2x1YS5tawo+ICsrKyBiL3BhY2thZ2UvbHVhL2x1YS5tawo+IEBA
IC0zMSw2ICszMSwxNCBAQCBlbHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTFVBXzVfMykseSkKPiAg
TFVBX0NGTEFHUyArPSAtRExVQV9DT01QQVRfNV8yCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJS
Ml9QQUNLQUdFX0xVQV9DVlRfTjJTKSwpCj4gK0xVQV9DRkxBR1MgKz0gLURMVUFfTk9DVlROMlMK
PiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTFVBX0NWVF9TMk4pLCkKPiArTFVB
X0NGTEFHUyArPSAtRExVQV9OT0NWVFMyTgo+ICtlbmRpZgo+ICsKPiAgaWZlcSAoJChCUjJfU1RB
VElDX0xJQlMpLHkpCj4gIExVQV9CVUlMRE1PREUgPSBzdGF0aWMKPiAgZWxzZQo+IC0tIAo+IDIu
MzcuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
