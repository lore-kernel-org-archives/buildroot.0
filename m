Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04A0C77B70
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 15:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 441F961135;
	Sat, 15 Apr 2023 15:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 441F961135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMWe071YRXj8; Sat, 15 Apr 2023 15:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CB866110B;
	Sat, 15 Apr 2023 15:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CB866110B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 484551BF35D
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 15:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2156A400D3
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 15:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2156A400D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aogmb5fesq6D for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 15:16:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2847B400D2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2847B400D2
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 15:16:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CAD315FF95;
 Sat, 15 Apr 2023 17:16:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 17:16:33 +0200
Date: Sat, 15 Apr 2023 17:16:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Ott <stefan@ott.net>, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20230415151633.GM2819@scaer>
References: <20230412222640.109345-1-stefan@ott.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412222640.109345-1-stefan@ott.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681571798;
 bh=7re+4yuvfEKNnbwdnlPGT+pHXnWBgKdvU45nOgVrJHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cbe7cevUNCHTmtMDu03ZhzEDv81Z/+LE9fqARULiABo9x5+0s5OO/tI2gayH1QEIr
 rvQ3t8DXHV8/5s4CBJdcX1kvkTyeFO3OI1BTykRS2CfMvPoMLCDox5f5RVk52vL6O7
 jYaaQMvoPNfQWD96yTAWBLO1tSNzX9b+pUpYDV1BqUSn1MWRX/XrP7xQeAuHxyoHUh
 61wGBYE9fHe/fV8friNziZX2DL5RocvFROJevcj60iR2dfXv5SCDP7SwnmiPNazEbI
 HxpqsVpdWofqAetwYrBmWRsgBlWcEdmehwRgYFBsxjvyayUWcJih2Spdpi0l6G8XE4
 k1q1bOJn91J8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cbe7cevU
Subject: Re: [Buildroot] [PATCH 1/1] package/libgtk3: Remove atk-bridge from
 .pc file
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U3RlZmFuLCBBbGwsCgpBZHJpw6FuLCBxdWVzdGlvbiBiZWxvdyBhbHNvIGZvciB5b3UuIDstKQoK
T24gMjAyMy0wNC0xMyAwMDoyNiArMDIwMCwgU3RlZmFuIE90dCB2aWEgYnVpbGRyb290IHNwYWtl
IHRodXNseToKPiBUaGUgZGVwZW5kZW5jeSBpcyBzdXBwb3NlZCB0byBiZSBvcHRpb25hbCBidXQg
aXQgYWx3YXlzIGVuZHMgdXAgaW4gdGhlCj4gLnBjIGZpbGUuIFRoaXMgbGVhZHMgdG8gaXNzdWVz
IHdoZW4gYnVpbGRpbmcgcGFja2FnZXMgdGhhdCBkZXBlbmQgb24KPiBsaWJndGszIGFuZCBhcmUg
dW5hYmxlIHRvIGZpbmQgYXRrLWJyaWRnZToKPiAKPiA+IG91dHB1dC9idWlsZC9nY3ItMy40MC4w
L21lc29uLmJ1aWxkOjU3OjI6IEVSUk9SOiBEZXBlbmRlbmN5IGxvb2t1cCBmb3IgZ3RrKy0zLjAg
d2l0aCBtZXRob2QgJ3BrZ2NvbmZpZycgZmFpbGVkOiBDb3VsZCBub3QgZ2VuZXJhdGUgY2FyZ3Mg
Zm9yIGd0aystMy4wOgo+ID4gUGFja2FnZSBhdGstYnJpZGdlLTIuMCB3YXMgbm90IGZvdW5kIGlu
IHRoZSBwa2ctY29uZmlnIHNlYXJjaCBwYXRoLgo+ID4gUGVyaGFwcyB5b3Ugc2hvdWxkIGFkZCB0
aGUgZGlyZWN0b3J5IGNvbnRhaW5pbmcgYGF0ay1icmlkZ2UtMi4wLnBjJwo+ID4gdG8gdGhlIFBL
R19DT05GSUdfUEFUSCBlbnZpcm9ubWVudCB2YXJpYWJsZQo+ID4gUGFja2FnZSAnYXRrLWJyaWRn
ZS0yLjAnLCByZXF1aXJlZCBieSAnZ3RrKy0zLjAnLCBub3QgZm91bmQKPiAKPiBUaGlzIGNoYW5n
ZSBtb2RpZmllcyB0aGUgb3JpZ2luYWwgcGF0Y2ggc28gdGhhdCB0aGUgZGVwZW5kZW5jeSBpcyBv
bmx5Cj4gYWRkZWQgdG8gdGhlIC5wYyBmaWxlIGlmIGF0ay1icmlkZ2UgaXMgcHJlc2VudC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gT3R0IDxzdGVmYW5Ab3R0Lm5ldD4KPiAtLS0KPiAgcGFj
a2FnZS9saWJndGszLzAwMDEtZGlzYWJsZS1hdGstYnJpZGdlLnBhdGNoIHwgMTEgKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9saWJndGszLzAwMDEtZGlzYWJsZS1hdGstYnJpZGdlLnBhdGNoIGIvcGFja2FnZS9s
aWJndGszLzAwMDEtZGlzYWJsZS1hdGstYnJpZGdlLnBhdGNoCj4gaW5kZXggZjNlOWJmZjJiYS4u
ODEyN2I5NzI1MyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmd0azMvMDAwMS1kaXNhYmxlLWF0
ay1icmlkZ2UucGF0Y2gKPiArKysgYi9wYWNrYWdlL2xpYmd0azMvMDAwMS1kaXNhYmxlLWF0ay1i
cmlkZ2UucGF0Y2gKClNpbmNlIHlvdSBhcmUgbW9kaWZ5aW5nIHRoYXQgcGF0Y2gsIHlvdSBuZWVk
IHRvIGFkZCB5b3VyIFNvQiBsaW5lIHRvIGl0CnRvbywgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5l
cyBvZjoKCiAgICBTaWduZWQtb2ZmLWJ5OiBIYWRyaWVuIEJvdXR0ZXZpbGxlIDxoYWRyaWVuLmJv
dXR0ZXZpbGxlQGdtYWlsLmNvbT4KICAgIFtzdGVmYW5Ab3R0Lm5ldDogY29uZGl0aW9uYWxseSBh
ZGQgaXQgdG8gLnBjXQogICAgU2lnbmVkLW9mZi1ieTogWW91CgpJIGNhbid0IGFkZCBhIHNvYiBv
biB5b3VyIGJlaGFsZiwgc28gY291bGQgeW91IHBsZWFzZSByZXNwaW4/CgpUbyBiZSBub3RlZCwg
YnV0IHRoYXQgaXMgdG90YWxseSBvcnRob2dvbmFsIHRvIHRoaXMgcGF0Y2ggb2YgeW91cnM6IHRo
ZQpjb21taXQgbG9nIGZvciB0aGUgcGF0Y2ggbWVudGlvbnMgdGhhdCBhdGstYnJpZGdlIHJlcXVp
cmVzIGF0LXNwaTItY29yZQphbmQgYXQtc3BpMi1hdGssIHdoaWNoIHdlcmUgbm90IHBhY2thZ2Vk
IGluIEJ1aWxkcm9vdCBiYWNrIGluIHRoZSB0aW1lLgoKSG93ZXZlciwgd2Ugbm93IGhhdmUgYm90
aC4gU286IHNob3VsZCB3ZSBkcm9wIHRoaXMgcGF0Y2gsIGFuZCBhZGQgdGhlCmRlcGVuZGVuY3kg
b250byBhdC1zcGkyLWF0ayAoYW5kIHRodXMgYXQtc3BpMi1jb3JlKSwgbm93PwoKUmVnYXJkcywK
WWFubiBFLiBNT1JJTi4KCj4gQEAgLTM5LDMgKzM5LDE0IEBAIFNpZ25lZC1vZmYtYnk6IEhhZHJp
ZW4gQm91dHRldmlsbGUgPGhhZHJpZW4uYm91dHRldmlsbGVAZ21haWwuY29tPgo+ICAgCj4gICAg
IGJhY2tlbmRfaW1tb2R1bGVzICs9IFsneGltJ10KPiAgIAo+ICtAQCAtNTg4LDcgKzU4OCw5IEBA
Cj4gKyAgICAgeDExX3BrZ3MgKz0gWyd4ZGFtYWdlJ10KPiArICAgZW5kaWYKPiArCj4gKy0gIGF0
a19wa2dzICs9IFsnYXRrLWJyaWRnZS0yLjAnXQo+ICsrICBpZiBhdGticmlkZ2VfZGVwLmZvdW5k
KCkKPiArKyAgICBhdGtfcGtncyArPSBbJ2F0ay1icmlkZ2UtMi4wJ10KPiArKyAgZW5kaWYKPiAr
Cj4gKyAgIGNkYXRhLnNldCgnSEFWRV9YREFNQUdFJywgeGRhbWFnZV9kZXAuZm91bmQoKSA/IDEg
OiBmYWxzZSkKPiArICAgY2RhdGEuc2V0KCdIQVZFX1hDVVJTT1InLCB4Y3Vyc29yX2RlcC5mb3Vu
ZCgpID8gMSA6IGZhbHNlKQo+IC0tIAo+IDIuNDAuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFu
biBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJp
Y3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIg
fCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0
MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUg
aXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRN
TCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
