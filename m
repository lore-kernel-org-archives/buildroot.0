Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DDBC282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 22:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BEF821F2;
	Fri, 28 Feb 2025 22:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVAduQEC76em; Fri, 28 Feb 2025 22:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40B878474F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40B878474F;
	Fri, 28 Feb 2025 22:05:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 143F91CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3032B88DA2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 21:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uELzH5_0ooOl for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 21:36:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15271889A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15271889A9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15271889A9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 21:33:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4E29819F57B;
 Fri, 28 Feb 2025 22:33:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Feb 2025 22:33:02 +0100
MIME-Version: 1.0
Date: Fri, 28 Feb 2025 22:33:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Alexander Egorenkov <egorenar-dev@posteo.net>, Bernd Kuhls
 <bernd@kuhls.net>, Laurent Vivier <laurent@vivier.eu>, "Wojciech M.
 Zabolotny" <wzab01@gmail.com>, Francis Laniel <flaniel@linux.microsoft.com>,
 James Hilliard <james.hilliard1@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Qais Yousef <qais.yousef@arm.com>
In-Reply-To: <20250217140332.310347-1-alex.bennee@linaro.org>
References: <20250217140332.310347-1-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <ed7712eeb34eba7e7998a724b4dafb36@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740778393;
 bh=2e15hVoGP96E1SQTKrrr5ZSiaGmrNKkCLrI21oHHuiU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DWbESljT4vQ+GkwqMxm7oT/yjW+03PNFzpoWFzVj7TMsJRTSwtN+7KT97j/fYTX0X
 ck8/KZ0zkjnGLGmhudvlEimsiEQdnnaZs3l2f+D9Cr9HECahS+YmfiEw5/vDquopPC
 V9Pxd+MQc8ClBXIrZAxpp8IWYZ5vgkYKdAeRbd2BqvjmU7lEJWZeWHLw5jpmvZaTMo
 cUixWB2I4+mq9mQHbJ+aI6OPnshPtRR2b9kgsN81hqA2YZClVwP5VjduDevZCDZjdv
 fupHddv3JevVBPaQi7/RS5Ks7UwpR4+1N3vK0s4Y80iGa8kAWGnZzAAV1+wp7Pd7xd
 9dMxYHwP0rXXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DWbESljT
Subject: Re: [Buildroot] [PATCH v2] package/elfutils: ensure we have 5.0
 kernel headers for aarch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleCwKClRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4KCldoaWxlIHRlc3RpbmcgdGhpcyBwYXRj
aCwgaXQgc2VlbXMgdGhlIGlzc3VlIGFsc28gaGFwcGVuIHdpdGgKQlIyX2FhcmNoNjRfYmUuIFNv
IHRoZSBjb25kaXRpb24gbmVlZHMgdG8gYmUgc2xpZ2h0bHkgcmVmaW5lZC4KU2VlIGJlbG93LgoK
T24gMTcvMDIvMjAyNSAxNTowMywgQWxleCBCZW5uw6llIHdyb3RlOgo+IFNpbmNlIEJ1aWxkcm9v
dCBjb21taXQgWzFdICJwYWNrYWdlL2VsZnV0aWxzOiBidW1wIHRvIHZlcnNpb24gMC4xOTIiCj4g
ZWxmdXRpbHMgZmFpbHMgdG8gYnVpbGQgb24gQWFyY2g2NCB3aXRoIHRvb2xjaGFpbiBpbmNsdWRp
bmcgS2VybmVsIAo+IG9sZGVyCj4gdGhhbiB2ZXJzaW9uIDUuMC4gRXJyb3Igc2hvd3M6Cj4gCj4g
ICAgIGFhcmNoNjRfaW5pdHJlZy5jOiBJbiBmdW5jdGlvbiAnYWFyY2g2NF9zZXRfaW5pdGlhbF9y
ZWdpc3RlcnNfdGlkJzoKPiAgICAgYWFyY2g2NF9pbml0cmVnLmM6NjE6MjQ6IGVycm9yOiBzdG9y
YWdlIHNpemUgb2YgJ3BhY19tYXNrJyBpc24ndAo+ICAgICBrbm93bgo+ICAgICAgICA2MSB8ICAg
c3RydWN0IHVzZXJfcGFjX21hc2sgcGFjX21hc2s7Cj4gICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fgo+IAo+IGVsZnV0aWxzIDAuMTkyIGludHJvZHVjZWQgYSBBYXJj
aDY0IHBvaW50ZXIgYXV0aGVudGljYXRpb24gc3VwcG9ydCBpbgo+IHVwc3RyZWFtIGNvbW1pdCBb
Ml0uCj4gCj4gRm9yIHJlZmVyZW5jZSwgdGhlIHVzZXJfcGFjX21hc2sgc3RydWN0dXJlIHdhcyBp
bnRyb2R1Y2VkIGluIEtlcm5lbAo+IHVwc3RyZWFtIGNvbW1pdCBbM10sIGluY2x1ZGVkIGluIEtl
cm5lbCB2NS4wLgo+IAo+IEZpeGVzOgo+IC0gZS5nIAo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvcmVzdWx0cy81MTU2OTAxYTczYmU1MmNlOGZmYmYxMDcyOWU2ODUyNDk5YTMwMGJl
Lwo+IC0gNC82IG9mIHRoZSBmYWlsdXJlcyBoZXJlOiAKPiBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnLz9yZWFzb249ZWxmdXRpbHMtMC4xOTImYXJjaD1hYXJjaDY0Cj4gCj4gWzFdIAo+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC81ZWI3
MzQ3NjZiMjRkZTVmY2U2ZTU4Njg5N2NkNDgyN2Y4ODU1NDQyCj4gWzJdIAo+IGh0dHBzOi8vc291
cmNld2FyZS5vcmcvZ2l0Lz9wPWVsZnV0aWxzLmdpdDthPWNvbW1pdGRpZmY7aD02NGUzYjQ1MWFk
MmNlYzhkNDU2NjFiMTgxNmUzZDJkYzQ0MzFmM2NhCj4gWzNdIAo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9p
ZD1lYzZlODIyZDFhMjJkMGVlZjFkMWZhMjYwZGZmNzUxZGJhOWE0MjU4Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKWy4uLl0KCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZWxmdXRpbHMvQ29uZmlnLmluIGIvcGFja2FnZS9lbGZ1dGlscy9D
b25maWcuaW4KPiBpbmRleCBjMzU1MDQ4YzZkLi5mZjQzNzA0ZTVkIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvZWxmdXRpbHMvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9lbGZ1dGlscy9Db25maWcu
aW4KPiBAQCAtMSwxMiArMSwxNCBAQAo+IC1jb21tZW50ICJlbGZ1dGlscyBuZWVkcyBhIHRvb2xj
aGFpbiB3LyB3Y2hhciwgZHluYW1pYyBsaWJyYXJ5LCAKPiB0aHJlYWRzIgo+ICtjb21tZW50ICJl
bGZ1dGlscyBuZWVkcyBhIHRvb2xjaGFpbiB3LyB3Y2hhciwgZHluYW1pYyBsaWJyYXJ5LCAKPiB0
aHJlYWRzLCAoa2VybmVsIGhlYWRlcnMgPj0gNS4wIGZvciBBQXJjaDY0KSIKPiAgCWRlcGVuZHMg
b24gIUJSMl9VU0VfV0NIQVIgfHwgQlIyX1NUQVRJQ19MSUJTIFwKPiAtCQl8fCAhQlIyX1RPT0xD
SEFJTl9IQVNfVEhSRUFEUwo+ICsJCXx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIFwKPiAr
CQl8fCAoIUJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF81XzAgJiYgQlIyX2FhcmNoNjQp
CgpIZXJlIHRoZSBjb25kaXRpb24gbmVlZCB0byBiZSB1cGRhdGVkIHRvOgoJCXx8ICghQlIyX1RP
T0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfMCAmJiAoQlIyX2FhcmNoNjQgfHwgCkJSMl9hYXJj
aDY0X2JlKSkKCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9FTEZVVElMUwo+ICAJYm9vbCAiZWxmdXRp
bHMiCj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIKPiAgCWRlcGVuZHMgb24gIUJSMl9TVEFU
SUNfTElCUwo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCj4gKwlkZXBl
bmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF81XzAgfHwgIUJSMl9hYXJjaDY0
ICMgCj4gdXNlcl9wYWNfbWFzawoKSGVyZSwgdGhlIGNvbmRpdGlvbiBzaG91bGQgYmU6CgogICAg
IGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfMCB8fCAoIUJSMl9h
YXJjaDY0ICYmIAohQlIyX2FhcmNoNjRfYmUpICMgdXNlcl9wYWNfbWFzawoKU2luY2UgdGhpcyBt
YWtlcyB0aGUgY29uZGl0aW9uIGEgYml0IG1vcmUgY29tcGxleCwgcHJvcGFnYXRpbmcgaXQKZXZl
cnl3aGVyZSBtaWdodCBkZWdyYWRlIGEgYml0IHRoZSByZWFkYWJpbGl0eS4gTWF5YmUgd2UgY291
bGQgY29udGFpbgp0aGlzIGNvbXBsZXhpdHkgaW4gYSBLY29uZmlnIGhpZGRlbiBzeW1ib2wgc3Vj
aCBhczoKCmNvbmZpZyBCUjJfUEFDS0FHRV9FTEZVVElMU19LRVJORUxfU1VQUE9SVFMKICAgICBi
b29sCiAgICAgZGVmYXVsdCB5CiAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hFQURFUlNf
QVRfTEVBU1RfNV8wIHx8ICghQlIyX2FhcmNoNjQgJiYgCiFCUjJfYWFyY2g2NF9iZSkgIyB1c2Vy
X3BhY19tYXNrCgphbmQgcHJvcGFnYXRlIGluIHBhY2thZ2VzIHVzaW5nIGVsZnV0aWxzOgoKICAg
ICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0VMRlVUSUxTX0tFUk5FTF9TVVBQT1JUUyAjIGVsZnV0
aWxzCgpXaGF0IGRvIHlvdSB0aGluaz8KCkFsc28sIHRoaXMgcGF0Y2ggYnJlYWtzIHRoZSBiY2Mg
cnVudGltZSB0ZXN0ICh3aGljaCBzZWxlY3RzIGVsZnV0aWxzKSwKYmVjYXVzZSB0aGUgdGVzdCBp
cyBBYXJjaDY0IGFuZCB1c2VzIHRoZSBBcm0gZXh0ZXJuYWwgdG9vbGNoYWluIHdoaWNoCmhhcyBr
ZXJuZWwgaGVhZGVycyBhdCB2NC4yMC4gWW91IGNhbiByZXByb2R1Y2UgdGhlIGlzc3VlIHdpdGg6
Cgp1dGlscy9kb2NrZXItcnVuIHN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAogICAgIC1kIGRs
IC1vIG91dHB1dF9mb2xkZXIgXAogICAgIHRlc3RzLnBhY2thZ2UudGVzdF9iY2MKClNvIHRoaXMg
Y29tbWl0IHNob3VsZCBhbHNvIGZpeCB0aGlzIHRlc3QuIE1heWJlIHRoaXMgY291bGQgYmUKZG9u
ZSBieSBzd2l0Y2hpbmcgdGhlIGV4dGVybmFsIHRvb2xjaGFpbiB0byBhIEJ1aWxkcm9vdAoiYmxl
ZWRpbmctZWRnZSIgd2hpY2ggc2hvdWxkIGhhdmUgS2VybmVsIGhlYWRlcnMgdjUuMTUuCgpUaGlz
IGNhbiBiZSBkb25lIGJ5IGFkZGluZzoKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkK
aGVyZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8y
MDI1LjAyLXJjMS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2JjYy5weT9yZWZf
dHlwZT10YWdzI0wxOQoKQ291bGQgeW91IHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBhZGRyZXNzaW5n
IHRoaXMgYWFyY2g2NF9iZSBhbmQgYmNjCnRlc3QgaXNzdWUgcGxlYXNlPwoKQmVzdCByZWdhcmRz
LAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
