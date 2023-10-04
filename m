Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117A4E7B5E5
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 10:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F21E80E7A;
	Wed,  4 Oct 2023 10:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F21E80E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jvw6Ld03HhD; Wed,  4 Oct 2023 10:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFC5182EB4;
	Wed,  4 Oct 2023 10:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFC5182EB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF09E1BF860
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 10:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93A31417CF
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 10:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93A31417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8QJARIf3J8-X for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 10:08:49 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C30A417A1
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 10:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C30A417A1
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id EF8305C92D9;
 Wed,  4 Oct 2023 12:08:46 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 04 Oct 2023 12:08:46 +0200
From: Stefan Agner <stefan@agner.ch>
To: Christian Stewart <christian@aperture.us>
In-Reply-To: <CA+h8R2oDvy4+8=BWcWCbVPe4+50dKsrS28EnuXEUh734Kn3m6w@mail.gmail.com>
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
 <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
 <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
 <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
 <23f2b3bd59cb6d860ea52b566eacfdb8@agner.ch>
 <CA+h8R2o9eAVZBrzU1E8wbh_eoQfhWv+0JsH11_N4hrkPKqKCXg@mail.gmail.com>
 <eb94fb2be140a706ce4797df9cb56d63@agner.ch> <87r0mgay0o.fsf@48ers.dk>
 <CA+h8R2p24q9AZRvkwacX3oOzuS2T7ZAENm7yNKj70Rfe0xuF0Q@mail.gmail.com>
 <c614a21b7b4b92432b86c44985840266@agner.ch>
 <CA+h8R2oDvy4+8=BWcWCbVPe4+50dKsrS28EnuXEUh734Kn3m6w@mail.gmail.com>
Message-ID: <d244c148974986c918fd9c6e81dd5fed@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1696414127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3we09FyWb2qM/yOYoGPEeRTap4OIrQ2VmxCF0ClXasE=;
 b=WtxCUyifrxNLNRjzJoMCEmBjsQ0Qopw3Eu2OxGaINN9nxCecyt9RLShsaynIcxNy0DXdAB
 FYHt/IJNiNRtRR75P2mfk21DYbfomXrrQ3WpXWAhaKaedoA3tOp0xTONAmRPABCpXso4IY
 1mo/tbV4/9EFvPLkSYmUI+GpgedpoFU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=WtxCUyif
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAyMy0xMC0wNCAxMjowNCwgQ2hyaXN0aWFuIFN0ZXdhcnQgd3JvdGU6Cgo+IFN0ZWZhbiwK
PiAKPiBPbiBXZWQsIE9jdCA0LCAyMDIzLCAyOjU5IEFNIFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFn
bmVyLmNoPiB3cm90ZTogCj4gCj4+IE9uIDIwMjMtMTAtMDIgMjA6MjgsIENocmlzdGlhbiBTdGV3
YXJ0IHdyb3RlOgo+Pj4gSGkgUGV0ZXIsCj4+PiAKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jb250
YWluZXJkL2NvbnRhaW5lcmQvaXNzdWVzLzkxMzkjaXNzdWVjb21tZW50LTE3MzY0Nzc1MzQKPj4+
IAo+Pj4gT24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMTowM+KAr0FNIFBldGVyIEtvcnNnYWFyZCA8
cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4+Pj4gSWYgY3JpIGlzIG9ubHkgbmVlZGVkIGZv
ciB3aGVuIGNvbnRhaW5lcmQgaXMgdXNlZCB3aXRoIGt1YmVybmV0ZXMsIHRoZW4KPj4+PiBwZXJo
YXBzIHdlIHNob3VsZCBkaXNhYmxlIGl0IGJ5IGRlZmF1bHQgc28gb3RoZXIgcGVvcGxlIGRvbid0
IG5lZWQgdG8KPj4+PiBkZWJ1ZyB0aGUgc2FtZSBpc3N1ZS4KPj4+IAo+Pj4gSSB0aGluayB3ZSBj
YW4gc2FmZWx5IGRpc2FibGUgY3JpIG9uIHRoZSBkZWZhdWx0IGNvbmZpZy4KPj4gCj4+IEF0IHRo
YXQgcG9pbnQgd2UgY2FuIGFsc28gcGFzcyB0aGUgbm9fY3JpIGJ1aWxkIHRhZy4KPj4gCj4+IEkn
bGwgY3JlYXRlIGEgUFIgdG8gZG8ganVzdCB0aGF0Lgo+IAo+IE1heWJlIG1ha2UgaXQgYSBhZGp1
c3RhYmxlIGNvbmZpZyBvcHRpb24sIHNpbmNlIEkgZGVmaW5pdGVseSB3YW50IHRvIHVzZSBrdWJl
cm5ldGVzICsgY3JpIHcvIGNvbnRhaW5lcmQgaW4gYnVpbGRyb290LiAKCk9rLCBJJ2xsIG1ha2Ug
YSBjb25maWcgZm9yIHRoYXQuCgpUaGF0IHNhaWQsIEkgd291bGQgbm90IGRpc2FibGUgaXQgdmlh
IGNvbmZpZyBpbiB0aGF0IGNhc2UgYXMgSSB3b3VsZApleHBlY3Qgc29tZW9uZSB3aG8gb3B0cyB0
byBidWlsZCBDUkkgd2lsbCBtYWtlIHN1cmUgdGhhdCB0aGUKcHJlcmVxdWlzaXRlcyAoc3VjaCBh
cyB3cml0YWJsZSAvZXRjIGFzIGl0IHNlZW1zKSBhcmUgdGFrZW4gY2FyZSBvZi4KCi0tClN0ZWZh
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
