Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB39DEE57CB
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 06:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57B7C82B34;
	Fri,  8 Sep 2023 06:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57B7C82B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGqfL1ks_ZKW; Fri,  8 Sep 2023 06:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8CD082B1A;
	Fri,  8 Sep 2023 06:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8CD082B1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 236071BF397
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 06:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE484417D3
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 06:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE484417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5I6Vv5vaCCW for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 06:21:01 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D01A6417D1
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 06:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D01A6417D1
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id EFBFD5C01CB;
 Fri,  8 Sep 2023 08:20:56 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 08 Sep 2023 08:20:56 +0200
From: Stefan Agner <stefan@agner.ch>
To: Christian Stewart <christian@aperture.us>
In-Reply-To: <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
 <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
 <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
 <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
Message-ID: <23f2b3bd59cb6d860ea52b566eacfdb8@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1694154057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGL7rMFlyMsBaJ5471dSz5RQfVL4v41ENO+hlZZAQMw=;
 b=tYu2oWunzkM0ELh7J90VarE/qcSbU70vzyj+WHOVrW8k86eQ2VL8JlPJiKUhhRo8gfHXdi
 M/LuyygqF/QFmxO0Exgqa7PU1bABubcYNrEEU5pIKPuezsY5Um88DOCAAKqEDc8rNz8DRL
 dmhG0bMo6VVDw0c7vWcP0kioN6MoTvQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=tYu2oWun
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

T24gMjAyMy0wOS0wOCAwNDowMywgQ2hyaXN0aWFuIFN0ZXdhcnQgd3JvdGU6Cgo+IEhpIFN0ZWZh
biwKPiAKPiBPbiBUaHUsIFNlcCA3LCAyMDIzLCA0OjUxIFBNIFN0ZWZhbiBBZ25lciA8c3RlZmFu
QGFnbmVyLmNoPiB3cm90ZTogCj4gCj4+IE9uIDggU2VwdGVtYmVyIDIwMjMgMDE6Mjg6MzYgQ0VT
VCwgQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4+PiBI
aSBTdGVmYW4sCj4+PiAKPj4+IE9uIFRodSwgU2VwIDcsIDIwMjMgYXQgNDoyM+KAr1BNIFN0ZWZh
biBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPiB3cm90ZToKPj4+PiAKPj4+PiBIaSBDaHJpc3RpYW4s
Cj4+Pj4gCj4+Pj4gSXQgc2VlbXMgdGhhdCB0aGlzIHZlcnNpb24gaGFuZ3MgYXQgc3RhcnR1cCwg
YXQgbGVhc3Qgd2hlbiBidWlsdCB3aXRoCj4+Pj4gQnVpbGRyb290IDIwMjMuMDIuNC4KPj4+IAo+
Pj4gSSBhbSBydW5uaW5nIDEuNy54IG9uIG15IHN5c3RlbXMgc28gSSBjYW4ndCBjb25maXJtIHRo
aXMgY3VycmVudGx5Lgo+PiAKPj4gSSd2ZSBqdXN0IHRlc3RlZCAxLjcuMyBhcyB3ZWxsLCBpdCBz
aG93cyB0aGUgc2FtZSBiZWhhdmlvciBoZXJlLiBJJ2xsIG5lZWQgdG8gZG8gbW9yZSB0ZXN0aW5n
LiBJZGVhbGx5IEkgbGlrZSB0byBzZWUgYSBzdGFjayB0cmFjZSAodmlhIHNpZ25hbCBvciBkZWJ1
Z2dlciksIGJ1dCBub3Qgc3VyZSBob3cgdG8gYXJjaGl2ZSB0aGlzIHdpdGggQnVpbGRyb290IGFu
ZCBnb2xhbmcuCj4+IAo+PiBUaGlzIGlzIG9uIGFhcmNoNjQgcGxhdGZvcm1zLgo+IAo+IEkgaGF0
ZSB0byBzYXkgIndvcmtzIG9uIG15IG1hY2hpbmUsIiBidXQgd2l0aCBib3RoIHZlcnNpb25zIG9u
IGFhcmNoNjQgaXQgd29ya3MgZm9yIG1lLiAgCj4gCj4gTWF5YmUgdGhlIGZpbGVzeXN0ZW0geW91
IGFyZSB1c2luZyBpcyBkaWZmZXJlbnQ/IEknbSB1c2luZyBleHQ0LiBPciBpcyB0aGUga2VybmVs
IGNvbmZpZyBub3Qgc2V0IHVwIHF1aXRlIHJpZ2h0PyBNYXliZSBvbGQga2VybmVsPyAgCgpUaGUg
cm9vdCBmaWxlIHN5c3RlbSBpcyBhIHNxdWFzaGZzLCBidXQgdGhlIGRhdGEgaXMgc3RvcmVkIG9u
IGV4dDQuCgpXZSBhcmUgdXNpbmcgdGhlIGxhdGVzdCB2YW5pbGxhIExpbnV4IGtlcm5lbCA2LjEu
NTIuCgpJdCBzZWVtcyB0byBoYW5nIGhlcmU6CldBUk5bMjAyMy0wOS0wOFQwNjoxNzozOC41MTUy
MTg2OTFaXSB3YWl0aW5nIGZvciByZXNwb25zZSBmcm9tIGJvbHRkYgpvcGVuICAgICAgICAgcGx1
Z2luPWJvbHQKCkZyb20gd2hhdCBJIGNhbiB0ZWxsIGl0J3Mgc29tZSBJUEMgbWVjaGFuaXNtIG9y
IHNpbWlsYXIgd2hpY2ggaXMKaGFuZ2luZy4KCkkgY2FuIGFsc28gcmVwcm9kdWNlIGl0IG9uIHg4
Ni02NC4gSSBndWVzcyBpdCBtdXN0IGJlIHVuaXF1ZSB0byBvdXIKb3BlcmF0aW5nIHN5c3RlbSBj
b25maWd1cmF0aW9uIGluIHNvbWUgd2F5Li4uCgotLQpTdGVmYW4KCj4gCj4gQmVzdCwgCj4gQ2hy
aXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
