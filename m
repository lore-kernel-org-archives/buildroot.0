Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13290C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 21:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B824241D85;
	Sat, 20 Jan 2024 21:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B824241D85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1h-bvVgFidt; Sat, 20 Jan 2024 21:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 018CE41D6E;
	Sat, 20 Jan 2024 21:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 018CE41D6E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4311BF346
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0090C41D6E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0090C41D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ZDK4IQbMvTW for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 21:56:28 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03A6D41C1B
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 21:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03A6D41C1B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2270013F88D;
 Sat, 20 Jan 2024 22:56:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 22:56:23 +0100
Date: Sat, 20 Jan 2024 22:56:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZaxBhznBIS8hkxDE@landeda>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
 <20240117225049.28443-10-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117225049.28443-10-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705787786;
 bh=YN3Q0/SdX1uyZZQ/NmsiGTwSWv6yml509a7cBwNsJXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VHS9ruUHeP4GiHa9maKbSztk+zDjqoQoEKlXTrG5vQ7wDlz9QifMzFsPuCoQxoE7r
 LHMTCqy6zkyVnx9ZLvGe5//483h20obC8Lpo4Wqr5/RsjvIJRmOZh0rgJDOr1LCck3
 61mWvE8FajVUvf2v4dwf6bCmmTWWnGctvp1PFONIsBW/GxJBGRoKkuikdQu5ldbGFm
 uMV0kDnlnUhJ/vfHNXzmFecuLLboVk9ZT7WmSWNs69HUbf7L7ZZjKp5c5UqiMYTJD8
 8pp9H7ztrOuLoakOkTpEG9qaXgfc2KC9xz4N2+wlqH+OapKqNXhhDbmhnCRHPaIIIt
 RniKqrZUH1wUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VHS9ruUH
Subject: Re: [Buildroot] [PATCH v3 09/10] package/flutter-gallery: fix build
 options
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

QURhbSwgQWxsLAoKT24gMjAyNC0wMS0xNyAxNTo1MCAtMDcwMCwgQWRhbSBEdXNrZXR0IHNwYWtl
IHRodXNseToKPiBBcyB0aGUgZmx1dHRlci1nYWxsZXJ5IHBhY2thZ2UgaXMgYSByZWZlcmVuY2Ug
cGFja2FnZSBmb3IgdXNlcnMgd2lzaGluZyB0byB1c2UKPiBGbHV0dGVyIGZvciB0aGVpciBVWCB3
aXRoIEJ1aWxkcm9vdCwgdGhpcyBwYWNrYWdlIG11c3QgaGF2ZSB0aGUgY29ycmVjdCBidWlsZAo+
IG9wdGlvbnMuIEluZGVlZCwgdGhpcyBwYWNrYWdlIGN1cnJlbnRseSBzdGFydHMgYW5kIHJ1bnMs
IGJ1dCBvbmx5IGJlY2F1c2Ugb2YKPiB0aGUgMDAwMS1yZW1vdmUtR2V0U3RvcmFnZS5wYXRjaC4g
VGhyb3VnaCB0ZXN0aW5nLCBmbHV0dGVyLWdhbGxlcnkgZmFpbHMgdG8KPiBydW4gZHVyaW5nIHRo
ZSBmb2xsb3dpbmcgc2NlbmFyaW86Cj4gICAtIFRoZSB4ZGctdXNlci1kaXJzIHBhY2thZ2UgaXMg
cG9ydGVkIGFuZCBwcmVzZW50Lgo+ICAgLSBmbHV0dGVyLWdhbGxlcnkgZGVwZW5kcyBvbiB4ZGct
dXNlci1kaXJzLgo+ICAgLSBUaGUgMDAwMS1yZW1vdmUtR2V0U3RvcmFnZS5wYXRjaCBmaWxlIGlz
IHJlbW92ZWQuCj4gCj4gQWZ0ZXIgZXh0ZW5zaXZlIHRlc3RpbmcgYW5kIGNvbXBhcmluZyB0aGUg
Y3VycmVudCBidWlsZCBhcmd1bWVudHMgYWdhaW5zdCB3aGF0Cj4gdGhlIG1ldGEtZmx1dHRlciBy
ZXBvc2l0b3J5IGZvciBZb2N0byBwYXNzZXMgdG8gYWxsIG9mIHRoZSBhcHBsaWNhdGlvbnMgdGhh
dAo+IGluaGVyaXQgZmx1dHRlci1hcHAsIGl0IGlzIGNsZWFyIHRoYXQgaGFuZGxpbmcgdGhlIGRh
cnRfcGx1Z2luX3JlZ2lzdHJhbnQuZGFydAo+IGZpbGUgaXMgbWlzc2luZyBmcm9tIHRoZSBkYXJ0
IGFyZ3VtZW50cyBpbiB0aGUgZmx1dHRlci1nYWxsZXJ5IGJ1aWxkIHN0ZXAuClstLVNOSVAtLV0K
CkdyZWF0IGNvbW1pdCBsb2chIFRoaXMgaXMgZXhhY3RseSB0aGUga2luZCBvZiBjb21taXQgbG9n
IHRoYXQgZ2l2ZXMKY29uZmlkZW5jZSBpbiB0aGUgcGF0Y2gsIGFzIGl0IGRlbW9uc3RyYXRlcyB0
aGF0IHRoZSB0b3BpYyBoYXMgYmVlbgpyZXNlYXJjaGVkLCBhbmQgdGhlIHNvbHV0aW9uIGlzIGV4
cGxhaW5lZCwgYW5kIHRoZSBkcmF3YmFja3MgaWRlbnRpZmllZAphbmQganVzdGlmaWVkLgoKSSBk
aWQgbm90IHVuZGVyc3RhbmQgYWxsIHRoZSBkZXRhaWxzIG9mIGl0LCBidXQgdGhlIGNvbW1pdCBs
b2cgcmVhbGx5CmhlbHBlZCBtZSBqdXN0IGFwcGx5IHRoZSBjb21taXQgd2lodG91dCB0b28gbXVj
aCB0aG91Z2h0LgoKVGhhbmsgeW91ISDwn5GNCgo+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRHVza2V0
dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICBwYWNrYWdlL2Zs
dXR0ZXItZ2FsbGVyeS9mbHV0dGVyLWdhbGxlcnkubWsgfCA5ICsrKysrKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2ZsdXR0ZXItZ2FsbGVyeS9mbHV0dGVyLWdhbGxlcnkubWsgYi9wYWNrYWdlL2Zs
dXR0ZXItZ2FsbGVyeS9mbHV0dGVyLWdhbGxlcnkubWsKPiBpbmRleCA1MGRkZDlmZmJhLi5lMjNk
YzM5OWRhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZmx1dHRlci1nYWxsZXJ5L2ZsdXR0ZXItZ2Fs
bGVyeS5tawo+ICsrKyBiL3BhY2thZ2UvZmx1dHRlci1nYWxsZXJ5L2ZsdXR0ZXItZ2FsbGVyeS5t
awo+IEBAIC0yNCwxMCArMjQsMTUgQEAgZW5kZWYKPiAgCj4gIGRlZmluZSBGTFVUVEVSX0dBTExF
UllfQlVJTERfQ01EUwo+ICAJY2QgJChARCkgJiYgXAo+IC0JCUZMVVRURVJfUlVOVElNRV9NT0RF
Uz0kKEZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERSkgXAoKQXMgd2UgZGlzY3VzZCBvbiBJUkMs
IGRyb3BwaW5nIEZMVVRURVJfUlVOVElNRV9NT0RFUyBpcyB1bnJlbGF0ZWQgdG8KdGhpcyBjaGFu
Z2UsIGFuZCBhbHRob3VnaCBGTFVUVEVSX1JVTlRJTUVfTU9ERVMgaXMgdG90YWxseSB1c2VsZXNz
IGhlcmUsCmRyb3BwaW5nIGl0IHNob3VsZCBiZSBwYXJ0IG9mIGFub3RoZXIgY2xlYW51cC4KCkFw
cGxpZWQgdG8gbWFzdGVyIHdpdGggRkxVVFRFUl9SVU5USU1FX01PREVTIHJlc3RvcmVkLCB0aGFu
a3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtCQkkKEhPU1RfRkxVVFRFUl9TREtfQklO
X0RBUlRfQklOKSBwYWNrYWdlOmdhbGxlcnkvbWFpbi5kYXJ0ICYmIFwKPiArCQkkKEhPU1RfRkxV
VFRFUl9TREtfQklOX0RBUlRfQklOKSBcCj4gKwkJCS1EZmx1dHRlci5kYXJ0X3BsdWdpbl9yZWdp
c3RyYW50PWZpbGU6Ly8kKEBEKS8uZGFydF90b29sL2ZsdXR0ZXJfYnVpbGQvZGFydF9wbHVnaW5f
cmVnaXN0cmFudC5kYXJ0IFwKPiArCQkJLS1zb3VyY2UgZmlsZTovLyQoQEQpLy5kYXJ0X3Rvb2wv
Zmx1dHRlcl9idWlsZC9kYXJ0X3BsdWdpbl9yZWdpc3RyYW50LmRhcnQgXAo+ICsJCQktLXNvdXJj
ZSBwYWNrYWdlOmZsdXR0ZXIvc3JjL2RhcnRfcGx1Z2luX3JlZ2lzdHJhbnQuZGFydCBcCj4gKwkJ
CS0tbmF0aXZlLWFzc2V0cyAkKEBEKS8uZGFydF90b29sL2ZsdXR0ZXJfYnVpbGQvKi9uYXRpdmVf
YXNzZXRzLnlhbWwgXAo+ICsJCQlwYWNrYWdlOmdhbGxlcnkvbWFpbi5kYXJ0ICYmIFwKPiAgCQkk
KEhPU1RfRkxVVFRFUl9TREtfQklOX0VOVikgJChGTFVUVEVSX0VOR0lORV9HRU5fU05BUFNIT1Qp
IFwKPiAgCQkJLS1kZXRlcm1pbmlzdGljIFwKPiArCQkJLS1vYmZ1c2NhdGUgXAo+ICAJCQktLXNu
YXBzaG90X2tpbmQ9YXBwLWFvdC1lbGYgXAo+ICAJCQktLWVsZj1saWJhcHAuc28gXAo+ICAJCQku
ZGFydF90b29sL2ZsdXR0ZXJfYnVpbGQvKi9hcHAuZGlsbAo+IC0tIAo+IDIuNDMuMAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwg
QVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBT
b2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAg
IHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAg
ICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
