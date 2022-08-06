Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96E5C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F30460F8D;
	Sat,  6 Aug 2022 22:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F30460F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlrV2McVcW8d; Sat,  6 Aug 2022 22:46:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A32B60F6E;
	Sat,  6 Aug 2022 22:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A32B60F6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 655531BF580
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CF0060F6E
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF0060F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qY8993Ysl-c8 for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:46:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30E18607C0
Received: from smtpcmd03120.aruba.it (smtpcmd03120.aruba.it [62.149.158.120])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30E18607C0
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:46:36 +0000 (UTC)
Received: from [192.168.8.155] ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KSZ1oyNNi5XbvKSZ1oQo6V; Sun, 07 Aug 2022 00:46:36 +0200
Message-ID: <bd7951cb-20cd-ed82-90c1-5eb6cf6af3e7@benettiengineering.com>
Date: Sun, 7 Aug 2022 00:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Stefano Cottafavi <stefano.cottafavi@gmail.com>
References: <CAPn86JAvLDjLZYGTvCeJDD45o7Erro2aM8wYzRO73OWW3ehfVw@mail.gmail.com>
 <575D4695-1A46-4431-90F2-63212188CDD1@benettiengineering.com>
 <CAPn86JC8tsPtbGZ=W1V5sgf70UsaFOtLWKwhdChxBg-k2RZVDA@mail.gmail.com>
 <8aafffc2-748f-becd-cac3-da7a3fad44be@benettiengineering.com>
In-Reply-To: <8aafffc2-748f-becd-cac3-da7a3fad44be@benettiengineering.com>
X-CMAE-Envelope: MS4xfDVlXkqULD7JOe/G73V9ngTkjbu6+/OHZjxYehcUlSFm5T8P0dxVzObpZDPm0CFQcaneQ5nemGouK5YIRZ1DbNM5+Ftpu4lxxwaxuXceQpQbyWCVsWri
 UEp38A4ZxENachzcmZWPbziu3/P0g0VTRYKAj17VFNXBUZgWOgfMUWz/noafIEQw4EaIxQ4kECLiPL0TNwo6iRa/0B03eUwAFZ8ERlks5pUHeQNxApvaKaNT
 ZTHTiQfipWPLHHK3sBtfgw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659825996; bh=odQi2LlBghdlVjbOLkvaBVX0k+aG2MKEU8g4duEAUp0=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=YzVft223pnQMLd2dr2PIIVd81d30aGxn6Y8kJ4Wq4u5Dz8kYH7J4vUpppH0Jb+ZlM
 XXxf97A6dyD6zuKaVR2J0o3Qli/w5ALnZ8YVlNFAIp37ox1iU4BYO8s5omcXZtmZfa
 dV8yrs3pO9VvDIO6+3JzwNWVOYVAZyvcxicA59hHtPflFWOcaa6eFzEpgN7xpkr2IG
 aEV6c9Hwa6EILHoyx10BEMYnnxUWKFU48TdEI36rT/63jGEAp8WHi46SIMVTYs90wp
 lvQvCT/ItSaw84pAgsCF4vVLqL9q+pMqNsRrohVm5+iBotcyfaHOZ7D38UR6nPORpf
 bD4/mZPGKKvcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YzVft223
Subject: Re: [Buildroot] OpenCV modules headers not in the SDK
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlZmFubywKCk9uIDA2LzA4LzIyIDIzOjU0LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBT
dWJqZWN0Ogo+IFJlOiBbQnVpbGRyb290XSBPcGVuQ1YgbW9kdWxlcyBoZWFkZXJzIG5vdCBpbiB0
aGUgU0RLCj4gRnJvbToKPiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVu
Z2luZWVyaW5nLmNvbT4KPiBEYXRlOgo+IDA2LzA4LzIyLCAyMzo1NAo+IAo+IFRvOgo+IFN0ZWZh
bm8gQ290dGFmYXZpIDxzdGVmYW5vLmNvdHRhZmF2aUBnbWFpbC5jb20+Cj4gQ0M6Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiAKPiAKPiBIaSBTdGVmYW5vLAo+IAo+IE9uIDA2LzA4LzIyIDIw
OjE1LCBTdGVmYW5vIENvdHRhZmF2aSB3cm90ZToKPj4gSGkgR2l1bGlvLAo+PiB0aGFua3MgZm9y
IHRoZSBxdWljayByZXBseS4gSGVyZSdzIHRoZSBkZWZjb25maWcgCj4+IGh0dHBzOi8vcGFzdGVi
aW4uY29tL1hzaDVkNEhHIDxodHRwczovL3Bhc3RlYmluLmNvbS9Yc2g1ZDRIRz4KPj4gRm9yIHRo
ZSBzYWtlIG9mIGNvbXBsZXRlbmVzcyBJIGRpZG4ndCByZW1vdmUgYW55IG9mIHRoZSBsaW5lcywg
YnV0IAo+PiBzb21lIGFyZSBzcGVjaWZpYyB0byBteSBvdXQtb2YtdHJlZSBmb2xkZXIgYW5kIG92
ZXJsYXlzLCBzbyB5b3UgbWlnaHQgCj4+IHdhbnQgdG8gZ2V0IHJpZCBvZiB0aG9zZS4KPj4KPj4g
SSdtIGN1cnJlbnRseSBidWlsZGluZyB0aGUgMjAyMi4wNS4xIHRhZyB3aXRoIFNIQSAKPj4gMmUz
OTk4OTNiNGY2MGYxZTEwMzIyOGRmNmU0NDM5ZDRlNGFjM2RkNQo+IAo+IFRoYW5rIHlvdS4gSSdt
IGJ1aWxkaW5nIGl0IHJpZ2h0IG5vdy4gVGhlIHBhY2thZ2Ugb3BlbmN2NC5tayBsb29rcwo+IGNv
cnJlY3QgYmVjYXVzZSBpdCBkb2VzIGhhdmUgT1BFTkNWNF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMs
IGFuZCB0aGF0Cj4gc2hvdWxkIGluc3RhbGwgdGhlIGhlYWRlciBmaWxlcy4gSWYgdGhlcmUgaXMg
YSBidWcgaXQgY291bGQgYmUgaW5zaWRlCj4gb3BlbmN2NCBjbWFrZSBpdHNlbGYuCj4gCj4gQnkg
dGhlIHdheSwgSSBndWVzcyB0aGUgcHJvYmxlbSB5b3UncmUgZXhwZXJpZW5jZSBpcyB0aGF0IHlv
dSBhZnRlcgo+IGJ1aWxkaW5nIHRoZSBCdWlsZHJvb3QncyBkZWZjb25maWcgeW91IHRyeSB0byBi
dWlsZCBhbm90aGVyIGFwcGxpY2F0aW9uCj4gKGkuZS4gYSBxdDUgYXBwbGljYXRpb24pIHRoYXQg
cmVxdWlyZXMgb3BlbmN2NCBhbmQgaXQgY2FuJ3QgZmluZCB0aGUKPiBoZWFkZXJzLCByaWdodD8K
CkkndmUgYnVpbHQgYW5kIEkgY2FuIGZpbmQgdGhlIGhlYWRlcnMoLmhwcCkgZmlsZXMgdW5kZXI6
Cm91dHB1dC9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2lu
Y2x1ZGUvb3BlbmN2NC9vcGVuY3YyCmFjY29yZGluZyB0bzoKaHR0cHM6Ly9kb2NzLm9wZW5jdi5v
cmcvNC54L2V4YW1wbGVzLmh0bWwKd2hlcmUgYWxsIGV4YW1wbGVzIGluY2x1ZGUgZGlyZWN0bHk6
CiNpbmNsdWRlICJvcGVuY3YyL3NoYXBlLmhwcCIKLi4uCgpDYW4geW91IGRvdWJsZSBjaGVjayBp
ZiBmaWxlcyBhcmUgdGhlcmU/CgpJZiB5b3UgY2FuIGZpbmQgdGhlbSB0aGVuIGl0IGNvdWxkIGJl
IGEgcHJvYmxlbSB3aXRoIHlvdXIgYXBwbGljYXRpb24KaW5jbHVkZSBwYXRoIHdoZXJlIHlvdSBz
aG91bGQgZXhwbGljdGx5IGFkZCAKIm91dHB1dC9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtZ251
ZWFiaWhmL3N5c3Jvb3QvdXNyL2luY2x1ZGUvb3BlbmN2NCIgCnRvIC1JIHNlYXJjaCBwYXRoLiBJ
biBRdDUsCnRoYXQgSSBzdXNwZWN0IHlvdSdyZSB1c2luZywgYWRkIElOQ0xVREVQQVRIIHRvIC5w
cm8gZmlsZSBhbmQgcmUtcnVuCnFtYWtlIGFuZCB0aGVuIHJlYnVpbGQuCgpMZXQgbWUga25vdyBp
ZiB0aGlzIGZpeGVzIHRoZSBwcm9ibGVtcy4KCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0
dGkKQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gQmVzdCByZWdhcmRzCj4gLS0gCj4gR2l1bGlv
IEJlbmV0dGkKPiBCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwo+IAo+PiBMb29raW5nIGZvcndhcmQg
dG8geW91ciBpbnNpZ2h0cy4KPj4KPj4gQmVzdAo+PiBTdGVmYW5vCj4+Cj4+IE9uIFNhdCwgQXVn
IDYsIDIwMjIgYXQgNzo0MyBQTSBHaXVsaW8gQmVuZXR0aSAKPj4gPGdpdWxpby5iZW5ldHRpQGJl
bmV0dGllbmdpbmVlcmluZy5jb20gCj4+IDxtYWlsdG86Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVu
Z2luZWVyaW5nLmNvbT4+IHdyb3RlOgo+Pgo+PiDCoMKgwqAgSGkgU3RlZmFubywKPj4KPj4+IMKg
wqDCoCBJbCBnaW9ybm8gNiBhZ28gMjAyMiwgYWxsZSBvcmUgMTk6MjksIFN0ZWZhbm8gQ290dGFm
YXZpCj4+PiDCoMKgwqAgPHN0ZWZhbm8uY290dGFmYXZpQGdtYWlsLmNvbSA8bWFpbHRvOnN0ZWZh
bm8uY290dGFmYXZpQGdtYWlsLmNvbT4+Cj4+PiDCoMKgwqAgaGEgc2NyaXR0bzoKPj4+Cj4+PiDC
oMKgwqAg77u/Cj4+PiDCoMKgwqAgSGkgYWxsLAo+Pj4gwqDCoMKgIEkndmUgc3VjY2Vzc2Z1bGx5
IGJ1aWx0IEJ1aWxkcm9vdCAyMDIyLjA1IGZvciB0aGUgUmFzcGJlcnJ5IFBpNAo+Pj4gwqDCoMKg
IGFkZGluZyBzdXBwb3J0IGZvciBRdDUgYW5kIE9wZW5DViAoaW5jbHVkaW5nIG9iamRldGVjdCBt
b2R1bGUKPj4+IMKgwqDCoCBhbW9uZ3N0IGZldyBvdGhlcikuCj4+PiDCoMKgwqAgSSd2ZSBhbHNv
IG1hbmFnZWQgdG8gZ2VuZXJhdGXCoHRoZSBTREsgZm9yIHN1Y2ggYSBidWlsZCBob3dldmVyIEkK
Pj4+IMKgwqDCoCBjYW4ndCBmaW5kIHRoZSBoZWFkZXIgZmlsZXMgb2YgdGhvc2UgT3BlbkNWIG1v
ZHVsZXMgYW55d2hlcmUgaW4KPj4+IMKgwqDCoCB0aGUgU0RLLgo+Pj4KPj4+IMKgwqDCoCBJcyB0
aGlzIGV4cGVjdGVkIG9yIGEgYnVnPwo+Pgo+PiDCoMKgwqAgSXQgbG9va3MgbGlrZSBhIGJ1Zy4g
Q2FuIHlvdSBwbGVhc2UgcGFzdGViaW4geW91ciBzcGVjaWZpYyBkZWZjb25maWc/Cj4+Cj4+IMKg
wqDCoCBZb3UgY2FuIG9idGFpbiBpdCBtb3ZpbmcgdG8geW91ciBvdXRwdXQgZm9sZGVyIGFuZCDC
oGlzc3Vpbmc6Cj4+IMKgwqDCoCAkIG1ha2Ugc2F2ZWRlY29uZmlnCj4+IMKgwqDCoCB0aGVuIHlv
dSBvYnRhaW4gYSBmaWxlIGNhbGxlZCBkZWZjb25maWcgc28gY29weSBhbmQgcGFzdGUgaXQgb24K
Pj4gwqDCoMKgIHBhc3RlYmluIGFuZCBwcm92aWRlIGhlcmUKPj4gwqDCoMKgIHRoZSBsaW5rIHRv
IHRoZSBwYXN0ZWJpbiBhbmQgYWxzbyB0aGUgU0hBMSBjb21taXQgb2YgeW91ciBCdWlsZHJvb3QK
Pj4gwqDCoMKgIGdpdCBvciB0aGUgc3BlY2lmaWMgdmVyc2lvbi4KPj4KPj4gwqDCoMKgIFRoaXMg
d2F5IHdlIGNhbiBoZWxwIHlvdS4KPj4KPj4gwqDCoMKgIEJlc3QgcmVnYXJkcwo+PiDCoMKgwqAg
4oCUCj4+IMKgwqDCoCBHaXVsaW8gQmVuZXR0aQo+PiDCoMKgwqAgQ0VPL0NUT0BCZW5ldHRpIEVu
Z2luZWVyaW5nIHNhcwo+Pgo+Pj4KPj4+IMKgwqDCoCBDaGVlcnMsCj4+PiDCoMKgwqAgU3RlZmFu
bwo+Pj4gwqDCoMKgIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+PiDCoMKgwqAgYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcgPG1haWx0bzpidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4KPj4+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Pj4gPGh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdD4KPj4KPj4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
