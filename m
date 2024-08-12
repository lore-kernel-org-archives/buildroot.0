Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785F1C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 18:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E613040015;
	Mon, 12 Aug 2024 18:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsEWkcbwV8Hx; Mon, 12 Aug 2024 18:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7825A401EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7825A401EB;
	Mon, 12 Aug 2024 18:53:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCC031BF5AA
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 18:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9006403E5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 18:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-bo6uTFJ9s1 for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 18:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.1.11;
 helo=008.lax.mailroute.net; envelope-from=wdouglass@carnegierobotics.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88BDF403CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88BDF403CB
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88BDF403CB
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 18:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4WjNvC543kzH9C1;
 Mon, 12 Aug 2024 18:53:11 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id nAcc2X3utOuT; Mon, 12 Aug 2024 18:53:08 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 008.lax.mailroute.net (Postfix) with ESMTPS id 4WjNv82F7xzH9C2;
 Mon, 12 Aug 2024 18:53:08 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 12 Aug 2024 14:53:07 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Mon, 12 Aug 2024 14:53:07 -0400
To: Max Filippov <jcmvbkbc@gmail.com>
Thread-Topic: [PATCH 1/2] Revert "package/chicken: move literals into text
 section for xtensa architecture"
Thread-Index: AQHa64GH0FQ3+1747020UiHbWcpwt7Ij1V6AgABhrQCAAAa7AA==
Date: Mon, 12 Aug 2024 18:53:06 +0000
Message-ID: <6807cb54-c342-4501-abd8-fe6eed9bbb59@carnegierobotics.com>
References: <20240811000029.1956409-1-jcmvbkbc@gmail.com>
 <20240811000029.1956409-2-jcmvbkbc@gmail.com>
 <e9b57e78-0ecc-449c-97bc-16ccb1ddab6d@carnegierobotics.com>
 <CAMo8Bf+Mw6nUKJaD5SVe9qgcBrHHfN-39A2bNR05xyUhPRi7Yg@mail.gmail.com>
In-Reply-To: <CAMo8Bf+Mw6nUKJaD5SVe9qgcBrHHfN-39A2bNR05xyUhPRi7Yg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-originating-ip: [10.1.80.121]
Content-ID: <7CF2CFA5B198944DAC4FBFAE8692A735@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1723488788; x=1726080789;
 bh=KGP7oTAMN7E4BvJ2g+jF+Q6NZWSwAJdaWz7PT518DxU=; b=30UIOi1R6I08
 Cz419kyo5eYHTArpS8xokMfbQP4gfhNTcmjK9zdZvW9WP4xE6jtNl0etQkJx36jc
 j6K0uz4y7CdpfLLX5SB0pVqOLOrrvGD6rWNHwqrCkW9gMtFzcR196biQ+HVWUfni
 O0HCgwlN5QQo+Z1SeosNzup0MUmN0t574570/KXI42ZCJbNXWIilzY7upGwOAdLb
 E6B/1GXl2vN3q7pQOHxdeNNgJ0qRx9mmYNLEGkntkiMCA0ZJ9Ym/tn1aJXPfvzOB
 vuaJDWRXl9qlS5/2SA5TEdSALVUjeK6tp/DMHMWiprka1XUMg01pdzWywExUw/Gm
 GXRTDYBKfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=carnegierobotics.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=30UIOi1R
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/chicken: move literals
 into text section for xtensa architecture"
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
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOC8xMi8yNCAxNDoyOSwgTWF4IEZpbGlwcG92IHdyb3RlOg0KPiBDQVVUSU9OOiBUaGlzIGVt
YWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBz
ZW5kZXIuDQo+DQo+DQo+IE9uIE1vbiwgQXVnIDEyLCAyMDI0IGF0IDU6MznigK9BTSBXb29keSBE
b3VnbGFzcw0KPiA8d2RvdWdsYXNzQGNhcm5lZ2llcm9ib3RpY3MuY29tPiB3cm90ZToNCj4+IE9u
IDgvMTAvMjQgMjA6MDAsIE1heCBGaWxpcHBvdiB3cm90ZToNCj4+PiBDQVVUSU9OOiBUaGlzIGVt
YWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBz
ZW5kZXIuDQo+Pj4NCj4+Pg0KPj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgODZlNTFmZDVmZTI4MTBi
YmY4MzNiNDhjNDkxNGRjZDJkZTAxYmRiZS4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXggRmlsaXBw
b3YgPGpjbXZia2JjQGdtYWlsLmNvbT4NCj4+PiAtLS0NCj4+PiAgICAuLi4vMDAwMS14dGVuc2Et
dGV4dC1zZWN0aW9uLWxpdGVyYWxzLnBhdGNoICAgfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+
Pj4gICAgcGFja2FnZS9jaGlja2VuL2NoaWNrZW4ubWsgICAgICAgICAgICAgICAgICAgIHwgMTQg
KystLS0tLS0tDQo+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQyIGRl
bGV0aW9ucygtKQ0KPj4+ICAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2NoaWNrZW4vMDAw
MS14dGVuc2EtdGV4dC1zZWN0aW9uLWxpdGVyYWxzLnBhdGNoDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9jaGlja2VuLzAwMDEteHRlbnNhLXRleHQtc2VjdGlvbi1saXRlcmFscy5wYXRj
aCBiL3BhY2thZ2UvY2hpY2tlbi8wMDAxLXh0ZW5zYS10ZXh0LXNlY3Rpb24tbGl0ZXJhbHMucGF0
Y2gNCj4+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4+PiBpbmRleCBiOTNhYWY5ZTIxOGQu
LjAwMDAwMDAwMDAwMA0KPj4+IC0tLSBhL3BhY2thZ2UvY2hpY2tlbi8wMDAxLXh0ZW5zYS10ZXh0
LXNlY3Rpb24tbGl0ZXJhbHMucGF0Y2gNCj4+PiArKysgL2Rldi9udWxsDQo+Pj4gQEAgLTEsMzAg
KzAsMCBAQA0KPj4+IC1Gcm9tIGU4ZDE3N2Y0ZDRlMWM2YmM0MTc4N2VhMTYyMWUzMjNmZjRhZDQ5
M2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQo+Pj4gLUZyb206IFdvb2Ryb3cgRG91Z2xhc3Mg
PHdkb3VnbGFzc0BjYXJuZWdpZXJvYm90aWNzLmNvbT4NCj4+PiAtRGF0ZTogTW9uLCAyMiBKdWwg
MjAyNCAwODo1MDozNyAtMDQwMA0KPj4+IC1TdWJqZWN0OiBbUEFUQ0hdIE1vdmUgbGl0ZXJhbHMg
aW50byB0ZXh0IHNlY3Rpb24gZm9yIHh0ZW5zYSBhcmNoaXRlY3R1cmUNCj4+PiAtDQo+Pj4gLVVw
c3RyZWFtOiBodHRwczovL2J1Z3MuY2FsbC1jYy5vcmcvdGlja2V0LzE4NDANCj4+PiAtU2lnbmVk
LW9mZi1ieTogV29vZHJvdyBEb3VnbGFzcyA8d2RvdWdsYXNzQGNhcm5lZ2llcm9ib3RpY3MuY29t
Pg0KPj4+IC0tLS0NCj4+PiAtIE1ha2VmaWxlLmxpbnV4IHwgNSArKysrKw0KPj4+IC0gMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPj4+IC0NCj4+PiAtZGlmZiAtLWdpdCBhL01ha2Vm
aWxlLmxpbnV4IGIvTWFrZWZpbGUubGludXgNCj4+PiAtaW5kZXggYjYyOGNkYTQuLmU5N2MyYjk0
IDEwMDY0NA0KPj4+IC0tLS0gYS9NYWtlZmlsZS5saW51eA0KPj4+IC0rKysgYi9NYWtlZmlsZS5s
aW51eA0KPj4+IC1AQCAtNTIsNiArNTIsMTEgQEAgVVNFU19TT05BTUUgPSB5ZXMNCj4+PiAtDQo+
Pj4gLSAjIGFyY2hpdGVjdHVyZXMNCj4+PiAtDQo+Pj4gLStpZmVxICgkKEFSQ0gpLHh0ZW5zYSkN
Cj4+PiAtK0NfQ09NUElMRVJfT1BUSU9OUyArPSAtbXRleHQtc2VjdGlvbi1saXRlcmFscw0KPj4+
IC0rTElOS0VSX09QVElPTlMgKz0gLW10ZXh0LXNlY3Rpb24tbGl0ZXJhbHMNCj4+PiAtK2VuZGlm
DQo+Pj4gLSsNCj4+PiAtIGlmZXEgKCQoQVJDSCkseDMyKQ0KPj4+IC0gQ19DT01QSUxFUl9PUFRJ
T05TICs9IC1teDMyDQo+Pj4gLSBMSU5LRVJfT1BUSU9OUyArPSAtbXgzMg0KPj4+IC0tLQ0KPj4+
IC0yLjM5LjINCj4+PiAtDQo+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2hpY2tlbi9jaGlja2Vu
Lm1rIGIvcGFja2FnZS9jaGlja2VuL2NoaWNrZW4ubWsNCj4+PiBpbmRleCAwNTIwMjgwMTM0YWIu
LjI2NjdmNzgyM2Q4YSAxMDA2NDQNCj4+PiAtLS0gYS9wYWNrYWdlL2NoaWNrZW4vY2hpY2tlbi5t
aw0KPj4+ICsrKyBiL3BhY2thZ2UvY2hpY2tlbi9jaGlja2VuLm1rDQo+Pj4gQEAgLTExLDE5ICsx
MSw5IEBAIENISUNLRU5fTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UNCj4+PiAgICBDSElDS0VOX0NQ
RV9JRF9WRU5ET1IgPSBjYWxsLWNjDQo+Pj4gICAgQ0hJQ0tFTl9JTlNUQUxMX1NUQUdJTkcgPSBZ
RVMNCj4+Pg0KPj4+IC0jIENoaWNrZW4gb25seSB1c2VzIHRoZSAiYXJjaCIgdmFyaWFibGUgZm9y
IHNvbWUgc3BlY2lhbC1jYXNlIGNvbXBpbGUNCj4+PiAtIyBhcmd1bWVudHMgSWYgaXQncyBlbXB0
eSwgaXQgdHJpZXMgdG8gZGV0ZWN0IHRoZSBhcmNoIGhvc3QgRmlsdGVyIG91dA0KPj4+IC0jIHZh
bHVlcyB0aGF0IGhhdmUgYW4gZWZmZWN0LCBvciBwYXNzICJ1bnVzZWQiIGhlcmUNCj4+PiAtaWZl
cSAoJChOT1JNQUxJWkVEX0FSQ0gpLHg4Nl82NCkNCj4+PiAtQ0hJQ0tFTl9BUkNIID0geDg2LTY0
DQo+PiBjaGFuZ2luZyB0aGUgc3BlbGxpbmcgdG8gYHg4Ni02NGAgaGVyZSBpcyBhIGdvb2QgaWRl
YSBpIHRoaW5rLCBiZWNhdXNlDQo+PiBjaGlja2VuIGRvZXMgYWRkIHNvbWUgZmxhZ3MuIE90aGVy
IHRoZW4gdGhhdCwgaSBhZ3JlZSB0aGF0IHRoZQ0KPj4gQ19DT01QSUxFUl9PUFRJTUlaQVRJT05f
T1BUSU9OUyBhcHByb2FjaCBpcyBiZXR0ZXIgaGVyZQ0KPiBJIGJlbGlldmUgdGhhdCBpdCBzaG91
bGQgYmUgZG9uZSBpbiBhIHNlcGFyYXRlIGNoYW5nZSBhcyBpdCBoYXMNCj4gbm90aGluZyB0byBk
byB3aXRoIHRoZSB0b3BpYyBvZiAnbW92ZSBsaXRlcmFscyBpbnRvIHRleHQgc2VjdGlvbiBmb3IN
Cj4geHRlbnNhIGFyY2hpdGVjdHVyZScuDQo+DQo+IC0tDQo+IFRoYW5rcy4NCj4gLS0gTWF4DQoN
ClNvcnJ5LCB0aGlzIGVtYWlsIHdhcyBzZW50IGJ5IG1pc3Rha2UgLS0gdGhlIGBnaXQgc2VuZC1l
bWFpbGAgd29ya2Zsb3cgDQppcyB2ZXJ5IG5ldyBmb3IgbWUuDQoNCg0KLVdvb2R5IERvdWdsYXNz
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
