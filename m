Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2E0CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD5E606C9;
	Mon,  1 Jun 2026 19:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQKCe-FZrWha; Mon,  1 Jun 2026 19:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73A38606C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780342506;
	bh=JUm/yQZ8xmjJOC694H/n14tvj4+/tis1XkTjVZhUJ/k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xxb1yKx0tYyisZxUQHBCBhSVmCvg8x6WwqYWaj43HV2Wj1cM3ZblNShL/f9+XNoRs
	 AxP0sodbqn65vQ9IyrjH/WQZuZnDDFSBxEc410VLtRXVjMkTwF5PB6FS7c37ZSxP93
	 9aeOkSydWe1APnc9yFXZvAjLQcESKxEApwLsdif+9wuZ8D075bvOryNRlxPF8+CkvB
	 +RrScZ56B0HcZAztxbW1drSSGVJgxfFun/ZnDeAzRneTlftcUGy+bBp4cisC5PIrMf
	 mc/dPczSyYEBjuH8TUz7iJwY1+Pjx3BvyjqLAOfuxDLcs5JNAVCsnQSArUzjWg8xRt
	 D7RFalcUsfbag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73A38606C2;
	Mon,  1 Jun 2026 19:35:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E56CDF5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB69B400E3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mm5s-Fl_b4dX for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3078F4012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3078F4012D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3078F4012D
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:35:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DCB0FB97C39F; Mon,  1 Jun 2026 21:34:59 +0200 (CEST)
Message-ID: <261fe0fb-9c4c-4ff8-a980-119f1c8c6151@rnout.be>
Date: Mon, 1 Jun 2026 21:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260506184057.665854-1-bernd@kuhls.net>
 <1f4c78fe-9df2-4703-a17e-17584fd170b2@rnout.be>
 <0e1776fd-adc4-4ab8-9ca2-826d8f3b03e8@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <0e1776fd-adc4-4ab8-9ca2-826d8f3b03e8@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780342500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=U/rLIE6a8ZFZv2X7oy8KokuJWFSoU95Ku+jBklS83lQ=;
 b=jOilQo/RdYBHLUsfsNrxV037LdtiQVae0J7ewc2DyoNlwHwXYkPKk9cQshbTvnqv1/0ZGE
 xvJ4x31wZuteO3oLaey7w51zkcX0rBv7I6ALiF/NtZ6XEKejC2WoBYYIt1pnoT0spKcRlu
 d/3kNI0qzUl2pE+5B0ODFVnixPZjjSyqB0toda0zzQD0iwahRPLk3QOzv5Va5c4eX00j7F
 OEUSLpnSMS+hkPV+lWn8oAeZdTPpbPvI9tkT3Rw3Fpip105+X08BSMA3/PFKJGiMfKSeaE
 gQRANy5M+ksz8DhMBOhuVMMpH3Ro4ryVBc8crYONijKh+SUQWdHYifsblvUXMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jOilQo/R
Subject: Re: [Buildroot] [PATCH 00/12] Add libudev-zero as provider for
 libudev
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAzMC8wNS8yMDI2IDIyOjI0LCBGaW9uYSBLbHV0ZSB3cm90ZToKPiBBbSAyOS4wNS4yNiB1
bSAxNTozOCBzY2hyaWViIEFybm91dCBWYW5kZWNhcHBlbGxlIHZpYSBidWlsZHJvb3Q6Cj4+Cj4+
Cj4+IE9uIDA2LzA1LzIwMjYgMjA6NDAsIEJlcm5kIEt1aGxzIHdyb3RlOgo+Pj4gSGksCj4+Pgo+
Pj4gdGhpcyBpcyBhIG5ldyB0cnkgdG8gZ2V0IHBhY2thZ2VzIHdoaWNoIG5lZWQgbGlidWRldiwg
YnV0IG5vdCBhIGZ1bGwKPj4+IHVkZXYtZGFlbW9uLCB3b3JraW5nIG9uIHN5c3RlbXMgdGhhdCB1
c2UKPj4+IEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX1NUQVRJQz15Lgo+Pj4KPj4+IEEgY291
cGxlIG9mIHllYXJzIGFnbyBhIHBhdGNoIHNlcmllcyBzcGxpdHRpbmcgdGhlIGV1ZGV2IHBhY2th
Z2UgaW50byBhCj4+PiBub24tZGFlbW9uL3dpdGgtZGFlbW9uIHZlcnNpb24gZW5kZWQgdXAgaW50
byBhIGRpc2N1c3Npb24gYWJvdXQgc3BhY2UKPj4+IHNhdmluZyBhbmQgY29tcGxleGl0eToKPj4+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjMtQXVn
dXN0LzczNTYxNi5odG1sCj4+Pgo+Pj4gVGhpcyBuZXcgc2VyaWVzIHN0aWxsIGludHJvZHVjZXMg
YSBuZXcgdmlydHVhbCBwYWNrYWdlLCBsaWJ1ZGV2LCB3aXRoCj4+PiBldWRldiBhbmQgc3lzdGVt
ZCBhcyBwb3NzaWJsZSBwcm92aWRlcnMgYnV0IG90aGVyd2lzZSBrZWVwcyB0aGVzZQo+Pj4gcGFj
a2FnZXMgdW50b3VjaGVkLgo+Pj4KPj4+IFRoZSB0aGlyZCBwcm92aWRlciBpcyB0aGUgbmV3IHBh
Y2thZ2UgbGlidWRldi16ZXJvIHdoaWNoIGlzIGEgZGFlbW9ubGVzcwo+Pj4gcmVwbGFjZW1lbnQg
Zm9yIGxpYnVkZXYuCj4+Pgo+Pj4gUnVuLXRpbWUgdGVzdGVkIGtvZGkgd2l0aCBsaWJjZWMgYW5k
IGludGVsX2dwdV90b3AuCj4+Pgo+Pj4gUmVnYXJkcywgQmVybmQKPj4KPj4gwqDCoFNlcmllcyBh
cHBsaWVkIHRvIG5leHQsIHRoYW5rcyEKPj4KPj4+IEFkZGl0aW9uYWwgbm90ZTogZXVkZXYgc2Vl
bXMgdW5tYWludGFpbmVkIHVwc3RyZWFtOgo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2V1ZGV2LXBy
b2plY3QvZXVkZXYvaXNzdWVzLzI5NiNpc3N1ZWNvbW1lbnQtMzY1MTQ0MjgwMgo+Pgo+PiDCoMKg
V2l0aCBsaWJ1ZGV2LXplcm8gdGhlcmUgaXMgbGVzcyBhbmQgbGVzcyByZWFzb24gdG8gaGF2ZSBl
dWRldi4gT1RPSCBhcyBsb25nIAo+PiBhcyBpdCB3b3Jrcywgd2UgY2FuIGtlZXAgaXQuCj4gCj4g
VW5mb3J0dW5hdGVseSBub3QgZXZlcnl0aGluZyB3b3JrcyB3aXRoIGxpYnVkZXYtemVybywgdGhl
cmUncyBsaXN0IGluIHRoZSAKPiByZWFkbWU6IGh0dHBzOi8vZ2l0aHViLmNvbS9pbGxpbGl0aS9s
aWJ1ZGV2LXplcm8vI3doYXQtZG9lc250LXdvcmsKPiBOZXR3b3JrTWFuYWdlciBpcyB0aGUgaXRl
bSBJIHBlcnNvbmFsbHkgY2FyZSBhYm91dCwgb3RoZXJ3aXNlIEkgcHJvYmFibHkgCj4gd291bGQn
dmUgdGVzdGVkIGxpYnVkZXYtemVyby4gOy0pCj4gCj4gSWYgZXVkZXYgaXMgY2F1c2luZyB0cm91
YmxlIChvciBzb21lb25lJ3MgbWlzc2luZyBuZXdlciB1ZGV2IGZlYXR1cmVzKSB3ZSBzaG91bGQg
Cj4gcHJvYmFibHkgbG9vayBhdCBhZGRpbmcgYSBwYWNrYWdlIGZvciBzeXN0ZW1kLXVkZXYgd2l0
aG91dCBzeXN0ZW1kLCB3aGljaCBpcyAKPiB3aGF0IEdlbnRvbyBoYXMgYmVlbiByZWNvbW1lbmRp
bmcgZm9yIGEgd2hpbGUuCgogIEkgdGhpbmsgdGhlIHVzZSBjYXNlIGlzIHNsaWdodGx5IGRpZmZl
cmVudC4gc3lzdGVtZC11ZGV2IHByb3ZpZGVzIGFuIGFjdHVhbCAKdWRldiBkYWVtb24sIHdoaWxl
IGxpYnVkZXYtemVybyBqdXN0IHByb3ZpZGVzIHRoZSBsaWJyYXJ5LiBTbyB3aXRoIHN5c3RlbWQt
dWRldiAKeW91IHN0aWxsIGhhdmUgc29tZXRoaW5nIHJlYWN0aW5nIHRvIGhvdHBsdWcgZXZlbnRz
LCB3aGljaCBzb21lIHBlb3BsZSBtYXkgbm90IAp3YW50IGF0IGFsbC4KCiAgT2YgY291cnNlLCB5
b3UgY2FuIGp1c3QgZGVsZXRlIHRoZSBkYWVtb24gaW4gcG9zdC1idWlsZC4KCiAgUmVnYXJkcywK
ICBBcm5vdXQKCj4gCj4gQmVzdCByZWdhcmRzLAo+IEZpb25hCj4gCj4+IMKgwqBSZWdhcmRzLAo+
PiDCoMKgQXJub3V0Cj4+Cj4+Pgo+Pj4gQmVybmQgS3VobHMgKDgpOgo+Pj4gwqDCoCBwYWNrYWdl
L2xpYnVkZXYtemVybzogbmV3IHBhY2thZ2UKPj4+IMKgwqAgcGFja2FnZS9saWJ1ZGV2LXplcm86
IHByb3ZpZGVzIGxpYnVkZXYKPj4+IMKgwqAgcGFja2FnZS9ldWRldjogcHJvdmlkZXMgbGlidWRl
dgo+Pj4gwqDCoCBwYWNrYWdlL2xpYnY0bDogb3B0aW9uYWxseSB1c2UgbGlidWRldgo+Pj4gwqDC
oCBwYWNrYWdlL2xpYmNlYzogb3B0aW9uYWxseSB1c2UgbGlidWRldgo+Pj4gwqDCoCBwYWNrYWdl
L2lndC1ncHUtdG9vbHM6IG9ubHkgbmVlZHMgbGlidWRldiwgbm90IHVkZXYgZGFlbW9uCj4+PiDC
oMKgIHBhY2thZ2Uva29kaTogb25seSBuZWVkcyBsaWJ1ZGV2LCBub3QgdWRldiBkYWVtb24KPj4+
IMKgwqAgcGFja2FnZS9tZXNhM2Q6IGFkZCBvcHRpb25hbCBkZXBlbmRlbmN5IHRvIGxpYnVkZXYK
Pj4+Cj4+PiBZYW5uIEUuIE1PUklOICg0KToKPj4+IMKgwqAgcGFja2FnZS9saWJ1ZGV2OiBuZXcg
dmlydHVhbCBwYWNrYWdlCj4+PiDCoMKgIHBhY2thZ2Uvc3lzdGVtZDogcHJvdmlkZXMgbGlidWRl
dgo+Pj4gwqDCoCBwYWNrYWdlL3F0NWJhc2U6IG9wdGlvbmFsbHkgdXNlIGxpYnVkZXYKPj4+IMKg
wqAgcGFja2FnZS9saWJpbnB1dDogb25seSBuZWVkcyBsaWJ1ZGV2LCBub3QgdWRldiBkYWVtb24K
Pj4+Cj4+PiDCoCBERVZFTE9QRVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+IMKgIHBhY2th
Z2UvQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMiArCj4+PiDCoCBwYWNrYWdlL2V1ZGV2L0NvbmZpZy5pbsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKwo+Pj4gwqAg
cGFja2FnZS9ldWRldi9ldWRldi5ta8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+Pj4gwqAgcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL0NvbmZp
Zy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNiArLQo+Pj4gwqAgcGFja2Fn
ZS9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMubWvCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICst
Cj4+PiDCoCBwYWNrYWdlL2tvZGkvQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2ICstCj4+PiDCoCBwYWNrYWdlL2tvZGkva29kaS5t
a8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
IDQgKy0KPj4+IMKgIHBhY2thZ2UvbGliY2VjL2xpYmNlYy5ta8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4+PiDCoCBwYWNrYWdlL2xpYmlucHV0
L0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYg
Ky0KPj4+IMKgIHBhY2thZ2UvbGliaW5wdXQvbGliaW5wdXQubWvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPj4+IMKgIC4uLjAxLUF2b2lkYWJsZS1PT00tb24t
c21hbGwtc3lzdGVtcy02Mi5wYXRjaCB8IDE3NiArKysrKysrKysrKysrKysrKysKPj4+IMKgIHBh
Y2thZ2UvbGlidWRldi16ZXJvL0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMTggKysKPj4+IMKgIHBhY2thZ2UvbGlidWRldi16ZXJvL2xpYnVkZXYtemVyby5oYXNo
wqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArCj4+PiDCoCBwYWNrYWdlL2xpYnVkZXYtemVyby9saWJ1
ZGV2LXplcm8ubWvCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDI5ICsrKwo+Pj4gwqAgcGFja2FnZS9s
aWJ1ZGV2L0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgNiArCj4+PiDCoCBwYWNrYWdlL2xpYnVkZXYvbGlidWRldi5ta8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgKwo+Pj4gwqAgcGFja2FnZS9saWJ2NGwv
bGlidjRsLm1rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
IDQgKy0KPj4+IMKgIHBhY2thZ2UvbWVzYTNkL21lc2EzZC5ta8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICsKPj4+IMKgIHBhY2thZ2UvcXQ1L3F0NWJh
c2UvcXQ1YmFzZS5ta8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4+
PiDCoCBwYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCA0ICsKPj4+IMKgIHBhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1r
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+Pj4gwqAg
MjIgZmlsZXMgY2hhbmdlZCwgMjc1IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+Pj4g
wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlidWRldi16ZXJvLzAwMDEtQXZvaWRhYmxl
LU9PTS1vbi1zbWFsbC0gCj4+PiBzeXN0ZW1zLTYyLnBhdGNoCj4+PiDCoCBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9saWJ1ZGV2LXplcm8vQ29uZmlnLmluCj4+PiDCoCBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9saWJ1ZGV2LXplcm8vbGlidWRldi16ZXJvLmhhc2gKPj4+IMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnVkZXYtemVyby9saWJ1ZGV2LXplcm8ubWsKPj4+IMKg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnVkZXYvQ29uZmlnLmluCj4+PiDCoCBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJ1ZGV2L2xpYnVkZXYubWsKPj4+Cj4+Cj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
