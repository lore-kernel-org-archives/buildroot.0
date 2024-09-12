Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C559EED611
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 15:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4E0C41083;
	Thu, 12 Sep 2024 15:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHLge1Bly7TL; Thu, 12 Sep 2024 15:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6212E4105D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6212E4105D;
	Thu, 12 Sep 2024 15:08:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5AFB1BF3AD
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 15:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A172F60786
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 15:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeFfVWYbdiRk for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 15:08:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14B92606A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B92606A6
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14B92606A6
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 15:08:21 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B181E353664E; Thu, 12 Sep 2024 17:08:17 +0200 (CEST)
Date: Thu, 12 Sep 2024 17:08:17 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZuMD4asCM8pq3KRe@waldemar-brodkorb.de>
References: <ZuFeS3LE0/MttrzN@waldemar-brodkorb.de>
 <93c0a59a-f9b7-4dfb-92cc-d381f6aae6e5@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93c0a59a-f9b7-4dfb-92cc-d381f6aae6e5@smile.fr>
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726153697; bh=DlOz4K2JiZKB0XLdTpD6URYmhiGtpZOBwMO2ScDkyVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uau26qAewAEHA1yd5WTk3WpshbSmKClxzU0hDRLUiXNhSLJZwmELXn/SRqzs6Zor5
 ecqnARkiDn/uMCZBWM07e8KpDrIhqjRTcGIm/+6Gm5Y7m+Bv+hHRV3Vly2js4cahrI
 D9B34NjR+7K1pu8NYOgY695RGrzKRTbkDmBjSF4vmiSxGuydoMqHlhID07OANEwGMA
 UVBiYSj9WxkVQTASxF8DVKymvIsUkf++JfGvU011ZvvVY5z30c89pMtyaiMbEDz/HR
 WRM70KLquMyVFScvQSP9K61c8ocnTsYfIJhTkKoe2oPyYKBX0SnCjdlQDc4o6zn5Tx
 PPMOeDCv2cwbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Uau26qAe
Subject: Re: [Buildroot] [PATCH] package/qemu: update to 9.1.0
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

SGkgUm9tYWluLApSb21haW4gTmFvdXIgd3JvdGUsCgo+IEhlbGxvIFdhbGRlbWFyLAo+IAo+IExl
IDExLzA5LzIwMjQgw6AgMTE6MDksIFdhbGRlbWFyIEJyb2Rrb3JiIGEgw6ljcml0wqA6Cj4gPiBT
ZWUgaGVyZSBmb3IgY2hhbmdlczoKPiA+IGh0dHBzOi8vd2lraS5xZW11Lm9yZy9DaGFuZ2VMb2cv
OS4xCj4gPiAKPiA+IFRoZSBzdXBwb3J0IGZvciB0aGUgbmlvczIgYXJjaGl0ZWN0dXJlIGdvdCBy
ZW1vdmVkLgo+IAo+IFdlIG5lZWQgdG8gcmVtb3ZlIGhvc3QtcWVtdSBmcm9tIHRoZSBxZW11X25p
b3MyXzEwbTUwX2RlZmNvbmZpZyBvciBzaW1wbHkgcmVtb3ZlCj4gdGhpcyBkZWZjb25maWcgc2lu
Y2UgdGhlIHFlbXUgc3VwcG9ydCBpcyBnb25lLgoKU2hvdWxkIHRoZSByZW1vdmFsIG9mIHRoZSBk
ZWZjb25maWcgYmUgaW4gdGhlIHNhbWUgcGF0Y2g/Cgo+IEFib3V0IHFlbXUgcGFja2FnZSwgaXQg
c2VlbXMgdGhhdCB0aGUgcWVtdV9hYXJjaDY0X3Nic2FfZGVmY29uZmlnIGRvZXNuJ3QgYm9vdAo+
IGFueW1vcmUgWzFdIHNpbmNlIHRoZSBxZW11IHZlcnNpb24gYnVtcCA5LjAgWzJdLgo+IAo+IFsx
XQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnM/bmFt
ZT1xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcrCj4gCj4gWzJdCj4gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzEwM2E1NTAyOGM3NWRhY2UzMTI0
NzBiYTA1YTE5Nzg4NmM2YjYxMDAKPiAKPiBJdCBzZWVtcyB0aGlzIGRlZmNvbmZpZyBuZWVkcyBh
biBBVEYvRURLMiB1cGRhdGUgdG8gYm9vdCB3aXRoIHFlbXUgPj0gOS4wLgo+IAo+IENhbiB5b3Ug
aGF2ZSBhIGxvb2s/CgpJIHRyaWVkIEFURiB2Mi4xMCwgYnV0IHRoYXQgbWFrZSBubyBkaWZmZXJl
bmNlLgpJIGFtIHRyeWluZyBFREsgbm93LgoKYmVzdCByZWdhcmRzCiBXYWxkZW1hcgogCj4gQmVz
dCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYWxkZW1h
ciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9xZW11L0Nv
bmZpZy5pbiAgICAgIHwgNSAtLS0tLQo+ID4gIHBhY2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdCB8
IDEgLQo+ID4gIHBhY2thZ2UvcWVtdS9xZW11Lmhhc2ggICAgICB8IDIgKy0KPiA+ICBwYWNrYWdl
L3FlbXUvcWVtdS5tayAgICAgICAgfCAyICstCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Fl
bXUvQ29uZmlnLmluIGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbgo+ID4gaW5kZXggNjA4ZTRkNDI5
ZC4uMmQxNWFiMWVhOSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcWVtdS9Db25maWcuaW4KPiA+
ICsrKyBiL3BhY2thZ2UvcWVtdS9Db25maWcuaW4KPiA+IEBAIC0yNTIsMTEgKzI1Miw2IEBAIGNv
bmZpZyBCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9NSVBTTjMyRUwKPiA+ICAJaGVscAo+ID4gIAkg
IE1JUFMgTjMyIGFyY2hpdGVjdHVyZSwgbGl0dGxlLWVuZGlhbi4KPiA+ICAKPiA+IC1jb25maWcg
QlIyX1BBQ0tBR0VfUUVNVV9UQVJHRVRfTklPUzIKPiA+IC0JYm9vbCAibmlvczIiCj4gPiAtCWhl
bHAKPiA+IC0JICBOaW9zIElJIGFyY2hpdGVjdHVyZS4KPiA+IC0KPiA+ICBjb25maWcgQlIyX1BB
Q0tBR0VfUUVNVV9UQVJHRVRfT1IxSwo+ID4gIAlib29sICJvcjFrIgo+ID4gIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfUUVNVV9GRFQgaWYgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0KPiA+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmlu
Lmhvc3QKPiA+IGluZGV4IDhkZDBjN2QxMWIuLjRkYjExNDQ5MGEgMTAwNjQ0Cj4gPiAtLS0gYS9w
YWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QKPiA+ICsrKyBiL3BhY2thZ2UvcWVtdS9Db25maWcu
aW4uaG9zdAo+ID4gQEAgLTksNyArOSw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX1FFTVVf
QVJDSF9TVVBQT1JUUwo+ID4gIAlkZWZhdWx0IHkgaWYgQlIyX21pY3JvYmxhemViZQo+ID4gIAlk
ZWZhdWx0IHkgaWYgQlIyX21pcHMKPiA+ICAJZGVmYXVsdCB5IGlmIEJSMl9taXBzZWwKPiA+IC0J
ZGVmYXVsdCB5IGlmIEJSMl9uaW9zMgo+ID4gIAlkZWZhdWx0IHkgaWYgQlIyX29yMWsKPiA+ICAJ
ZGVmYXVsdCB5IGlmIEJSMl9wb3dlcnBjCj4gPiAgCWRlZmF1bHQgeSBpZiBCUjJfcG93ZXJwYzY0
Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUuaGFzaCBiL3BhY2thZ2UvcWVtdS9x
ZW11Lmhhc2gKPiA+IGluZGV4IDQxOWRkMGQxYjMuLjE2OWZlMDUwNjggMTAwNjQ0Cj4gPiAtLS0g
YS9wYWNrYWdlL3FlbXUvcWVtdS5oYXNoCj4gPiArKysgYi9wYWNrYWdlL3FlbXUvcWVtdS5oYXNo
Cj4gPiBAQCAtMSw0ICsxLDQgQEAKPiA+ICAjIExvY2FsbHkgY29tcHV0ZWQsIHRhcmJhbGwgdmVy
aWZpZWQgd2l0aCBHUEcgc2lnbmF0dXJlCj4gPiAtc2hhMjU2ICBhOGMzZjU5NmFlY2U5NmRhM2Iw
MGNhZmI3NGJhYWZhMGQxNDUxNWVhZmI4ZWQxZWUzZjdmNWMyZDBlYmYwMmI2ICBxZW11LTkuMC4y
LnRhci54ego+ID4gK3NoYTI1NiAgODE2YjcwMjJhOGJhN2MyYWMzMGUyZTBjZjk3M2U4MjZmNmJj
Yzg1MDUzMzk2MDMyMTJjNWVkZThlOTRkNzgzNCAgcWVtdS05LjEuMC50YXIueHoKPiA+ICBzaGEy
NTYgIDZmMDRhZTgzNjRkMDA3OWExOTJiMTQ2MzVmNGIxZGEyOTRjZTE4NzI0YzAzNGMzOWE2YTQx
ZDFiMDlkZjYxMDAgIENPUFlJTkcKPiA+ICBzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYz
ZWU0MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIENPUFlJTkcuTElCCj4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUubWsgYi9wYWNrYWdlL3FlbXUvcWVtdS5t
awo+ID4gaW5kZXggMTZjZmYxM2QxOC4uZTlmNjUyMGQ4OSAxMDA2NDQKPiA+IC0tLSBhL3BhY2th
Z2UvcWVtdS9xZW11Lm1rCj4gPiArKysgYi9wYWNrYWdlL3FlbXUvcWVtdS5tawo+ID4gQEAgLTYs
NyArNiw3IEBACj4gPiAgCj4gPiAgIyBXaGVuIHVwZGF0aW5nIHRoZSB2ZXJzaW9uLCBjaGVjayB3
aGV0aGVyIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCB0YXJnZXRzCj4gPiAgIyBuZWVkcyB0byBiZSB1
cGRhdGVkLgo+ID4gLVFFTVVfVkVSU0lPTiA9IDkuMC4yCj4gPiArUUVNVV9WRVJTSU9OID0gOS4x
LjAKPiA+ICBRRU1VX1NPVVJDRSA9IHFlbXUtJChRRU1VX1ZFUlNJT04pLnRhci54ego+ID4gIFFF
TVVfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcKPiA+ICBRRU1VX1NFTElOVVhfTU9E
VUxFUyA9IHFlbXUgdmlydAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
