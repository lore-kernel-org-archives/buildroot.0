Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FC3CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 10:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9635C81FDA;
	Mon, 25 Sep 2023 10:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9635C81FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07_ZNKMOAxjr; Mon, 25 Sep 2023 10:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFF3381FCF;
	Mon, 25 Sep 2023 10:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFF3381FCF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE3AC1BF2F8
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 10:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A721D60FDA
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 10:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A721D60FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e_bmBs3lR_V for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 10:08:58 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2422A60FD0
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 10:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2422A60FD0
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 591255C18FC;
 Mon, 25 Sep 2023 12:08:53 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 25 Sep 2023 12:08:53 +0200
From: Stefan Agner <stefan@agner.ch>
To: Christian Stewart <christian@aperture.us>
In-Reply-To: <CA+h8R2o9eAVZBrzU1E8wbh_eoQfhWv+0JsH11_N4hrkPKqKCXg@mail.gmail.com>
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
 <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
 <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
 <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
 <23f2b3bd59cb6d860ea52b566eacfdb8@agner.ch>
 <CA+h8R2o9eAVZBrzU1E8wbh_eoQfhWv+0JsH11_N4hrkPKqKCXg@mail.gmail.com>
Message-ID: <eb94fb2be140a706ce4797df9cb56d63@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1695636533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Qs1HoSEPQ5yR85hm/3LX2cfW1vtrLypvGrlk5NvUV4=;
 b=ZEska7+zG/LM6ZZckEQBHXdNpQyYsPJJbSiS8mdUXh8zgWi2kIXX6x5MSc1wcG/S42MZD8
 gSFDGRu/aWlg0V5D+ZJuxXZ7aXkz5h2cTKapjg5663HENhhngnw4CWxwHXn6gFyj7dZx0C
 GWGLWi8FdHrEhZZqBtGeFuI9zhKIikY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=ZEska7+z
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

SGkgQ2hyaXN0aWFuLAoKRmluYWxseSBjYW1lIGFyb3VuZCBsb29raW5nIGludG8gdGhpcyBhIGJp
dCBtb3JlIGNsb3NlbHkuIEl0IHNlZW1zIHRoYXQKY29udGFpbmVyZCBqdXN0IGRpZG4ndCBzZW5k
IHRoZSBzZCBub3RpZmljYXRpb24gUkVBRFk9MS4KCkl0IHNlZW1zIHRoYXQgdGhlIHByb2JsZW0g
aXMgY2F1c2VkIGJ5IHRoZSBDUkkgcGx1Zy1pbi4gVGhlIHBsdWctaW4KcmVwb3J0cyB0aGUgZm9s
bG93aW5nIGVycm9yOgp0aW1lPSIyMDIzLTA5LTI0VDIxOjQzOjIwLjk1ODUwOTAyN1oiIGxldmVs
PXdhcm5pbmcgbXNnPSJmYWlsZWQgdG8gbG9hZApwbHVnaW4gaW8uY29udGFpbmVyZC5ncnBjLnYx
LmNyaSIgZXJyb3I9ImZhaWxlZCB0byBjcmVhdGUgQ1JJIHNlcnZpY2U6CmZhaWxlZCB0byBjcmVh
dGUgY25pIGNvbmYgbW9uaXRvciBmb3IgZGVmYXVsdDogZmFpbGVkIHRvIGNyZWF0ZSB0aGUKcGFy
ZW50IG9mIHRoZSBjbmkgY29uZiBkaXI9L2V0Yy9jbmk6IG1rZGlyIC9ldGMvY25pOiByZWFkLW9u
bHkKCldlIGFyZSBydW5uaW5nIGNvbnRhaW5lcmQgb24gYSByZWFkLW9ubHkgc3F1YXNoZnMuIEkg
Z3Vlc3MgdGhpcyBleHBsYWlucwphbHNvIHdoeSB5b3UgaGF2ZW4ndCBzZWVuIHRoaXMgaXNzdWUu
CgpBZnRlciBkaXNhYmxpbmcgdGhlIHBsdWctaW4gdmlhIC9ldGMvY29udGFpbmVyZC9jb25maWcu
dG9tbApkaXNhYmxlZF9wbHVnaW5zID0gWyAiY3JpIiBdLCB0aGUgaXNzdWUgZGlzYXBwZWFyZWQg
KGNvbnRhaW5lcmQgc2VydmljZQpzdGFydHMgdXAgY29ycmVjdGx5IGFuZCBwcmludHMgdGhlIG1l
c3NhZ2UgImNvbnRhaW5lcmQgc3VjY2Vzc2Z1bGx5CmJvb3RlZCBpbiAuLi5zIgoKQ2hlY2tpbmcg
dGhlIGNoYW5nZWxvZyBvZiB2MS42LjIyIGJyaW5ncyB1cCB0aGlzIGNoYW5nZToKaHR0cHM6Ly9n
aXRodWIuY29tL2NvbnRhaW5lcmQvY29udGFpbmVyZC9wdWxsLzg4MjYKClRoZSBlcnJvciBhYm92
ZSB3YXMgYWxyZWFkeSBwcmVzZW50IGJlZm9yZSwgc28gSSBkaWRuJ3QgZ2l2ZSBpdCBtdWNoCmF0
dGVudGlvbi4gQnV0IEkgZ3Vlc3MgdGhlIGNoYW5nZSB0byB1c2UgYXRvbWljZmlsZSByZWFsbHkg
Y2hhbmdlZCB0aGUKYmVoYXZpb3IgYW5kIG5vdyBzZWVtcyB0byBjYXVzZSB0aGUgaGFuZyBvbiBz
dGFydHVwLgoKSW4gYW55IGNhc2UsIGZyb20gbXkgcG9pbnQgb2Ygdmlldywgbm90aGluZyB3aGlj
aCBuZWVkcyB0byBiZSBhZGRyZXNzZWQKaW4gQnVpbGRyb290LgoKQmVzdCByZWdhcmRzLApTdGVm
YW4KCgpPbiAyMDIzLTA5LTE1IDIzOjQ4LCBDaHJpc3RpYW4gU3Rld2FydCB3cm90ZToKPiBIaSBT
dGVmYW4sCj4gCj4gRGlkIHlvdSBmaW5kIGEgc29sdXRpb24gdG8gdGhpcz8gSnVzdCBmb2xsb3dp
bmcgdXAuCj4gCj4gT24gVGh1LCBTZXAgNywgMjAyMyBhdCAxMToyMeKAr1BNIFN0ZWZhbiBBZ25l
ciA8c3RlZmFuQGFnbmVyLmNoPiB3cm90ZToKPj4gPiBJIGhhdGUgdG8gc2F5ICJ3b3JrcyBvbiBt
eSBtYWNoaW5lLCIgYnV0IHdpdGggYm90aCB2ZXJzaW9ucyBvbiBhYXJjaDY0IGl0IHdvcmtzIGZv
ciBtZS4KPj4gPgo+PiA+IE1heWJlIHRoZSBmaWxlc3lzdGVtIHlvdSBhcmUgdXNpbmcgaXMgZGlm
ZmVyZW50PyBJJ20gdXNpbmcgZXh0NC4gT3IgaXMgdGhlIGtlcm5lbCBjb25maWcgbm90IHNldCB1
cCBxdWl0ZSByaWdodD8gTWF5YmUgb2xkIGtlcm5lbD8KPj4KPj4gVGhlIHJvb3QgZmlsZSBzeXN0
ZW0gaXMgYSBzcXVhc2hmcywgYnV0IHRoZSBkYXRhIGlzIHN0b3JlZCBvbiBleHQ0Lgo+Pgo+PiBX
ZSBhcmUgdXNpbmcgdGhlIGxhdGVzdCB2YW5pbGxhIExpbnV4IGtlcm5lbCA2LjEuNTIuCj4+Cj4+
IEl0IHNlZW1zIHRvIGhhbmcgaGVyZToKPj4gV0FSTlsyMDIzLTA5LTA4VDA2OjE3OjM4LjUxNTIx
ODY5MVpdIHdhaXRpbmcgZm9yIHJlc3BvbnNlIGZyb20gYm9sdGRiCj4+IG9wZW4gICAgICAgICBw
bHVnaW49Ym9sdAo+Pgo+PiBGcm9tIHdoYXQgSSBjYW4gdGVsbCBpdCdzIHNvbWUgSVBDIG1lY2hh
bmlzbSBvciBzaW1pbGFyIHdoaWNoIGlzCj4+IGhhbmdpbmcuCj4+Cj4+IEkgY2FuIGFsc28gcmVw
cm9kdWNlIGl0IG9uIHg4Ni02NC4gSSBndWVzcyBpdCBtdXN0IGJlIHVuaXF1ZSB0byBvdXIKPj4g
b3BlcmF0aW5nIHN5c3RlbSBjb25maWd1cmF0aW9uIGluIHNvbWUgd2F5Li4uCj4gCj4gQmVzdCwK
PiBDaHJpc3RpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
