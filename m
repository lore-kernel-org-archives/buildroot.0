Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24914C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 22:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A3BC6135B;
	Mon,  6 Jun 2022 22:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPTnkepFmjl4; Mon,  6 Jun 2022 22:57:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CA2A61359;
	Mon,  6 Jun 2022 22:57:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC0101BF37F
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 22:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4B93415ED
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 22:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3FXynHaj8Uc for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 22:57:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AC21415D4
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 22:57:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u3so21725351wrg.3
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 15:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=No+GIjYDKpk6f7+lPdqpXiQCSxclz7rw6/yctEw82tI=;
 b=XcpigYVnxtIdfQRmd2PPTYOyIX7sAywCmJH7ByzNxnypcgFFaTnxzUe/Ry4IZxWq5U
 ARtNGxULE9HTNHaXM6EqLqPqzvfgj4fmogOo6nFU2nNzNqYlvR/mowl0VjIDn4lJl1FP
 u6XklgpVjZDt0u0eBoxPOFYN2OnCrvhzAeOfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=No+GIjYDKpk6f7+lPdqpXiQCSxclz7rw6/yctEw82tI=;
 b=S6j+wwCcRhSXecZWJBifjObHmGNeeuDlY4MwApVMxww5oa48BoeaSyxtYavFzEsOuM
 jOR7fBt/Qhgv65QtxyQa07FXadupYoOd0q5bkMEj1w7XrWxXrufCuwxWves6/LkynIX1
 5lgKuupPdGurqB6XPF5Fe9mskTMI3vbHrSvapaByG0ujxpLJMobFhuiJdLJhscbWUumi
 31DDhYULp2Gg9SfGMh67seEXhgX1mRKd3Zmg1+STcihFCgUbzIxT8I6ZryiC7L/I/Vhz
 l4q3h2WWBJG6jNZkAwD4INYV0BOWLzZgUCVQUzFm8DBOjgJCT3h4Mig8ZtlKQyx7GtV0
 glvw==
X-Gm-Message-State: AOAM530fYBx1PUilUiAyyfpSWGZihqGtnCkLsh3kj1tpnZ0qZr0l0dIa
 wVDJIxVIfiKELsu+JXwySKqwD+jn2nDkJOMMw3dYnb8U
X-Google-Smtp-Source: ABdhPJwUKD31r6bUk+V6N6WnoGpF2Qjjpnb0BejiqqPFCzR8AgaJpyCSuBym60maEzh3168hPA67QW9WLKS1jLXrrak=
X-Received: by 2002:a5d:6510:0:b0:216:f04d:3c50 with SMTP id
 x16-20020a5d6510000000b00216f04d3c50mr12086302wru.628.1654556270288; Mon, 06
 Jun 2022 15:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220606135756.2264709-1-clg@kaod.org>
In-Reply-To: <20220606135756.2264709-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jun 2022 22:57:37 +0000
Message-ID: <CACPK8Xe=3ifKNZxs5GSaHtgYONPy-_w9m8_cSkR3Rya2KkZS7Q@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/aspeed_ast2600evb: new
 defconfig
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCA2IEp1biAyMDIyIGF0IDEzOjU4LCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qu
b3JnPiB3cm90ZToKPgo+IFRoZSBrZXJuZWwgaXMgZnJvbSB1cHN0cmVhbSBhbmQgVS1Cb290IGlz
IGZyb20gdGhlIE9wZW5CTUMgYnJhbmNoCj4gd2hlcmUgbW9zdCBvZiBkZXZlbG9wbWVudCBpcyBk
b25lLiBNYWlubGluZSBkb2Vzbid0IGhhdmUgdGhlIHJlcXVpcmVkCj4gc3VwcG9ydCBmb3IgSFcu
Cj4KPiBUaGUgbWFpbiByZXN1bHRpbmcgZmlsZSBmcm9tIHRoZSBidWlsZCBpcyBhIGZsYXNoIGlt
YWdlLiBUaGUgcGFydGl0aW9uCj4gbGF5b3V0IG1hdGNoZXMgdGhlIE9wZW5CTUMgb25lIGZvciA2
NE0gY2hpcHMuIEl0IG1ha2VzIGl0IGVhc2llciB0bwo+IHVwZGF0ZSB0aGUgZGlmZmVyZW50IHBh
cnRpdGlvbnMgZnJvbSBMaW51eC4gSW50ZXJtZWRpYXRlIGZpbGVzIGNhbiBiZQo+IHVzZWQgdG8g
Ym9vdCBmcm9tIFUtYm9vdCBvdmVyIHRoZSBuZXR3b3JrIG9yIHRvIGJvb3QgUUVNVSB1c2luZwo+
IC1rZXJuZWwvLWluaXRyZC8tZHRiLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0
ZXIgPGNsZ0BrYW9kLm9yZz4KPiAtLS0KPgo+ICBDaGFuZ2VzIGluIHYyOgo+Cj4gIC0gQWRkIEpv
ZWwgdG8gdGhlIGxpc3Qgb2YgZGV2ZWxvcGVycwo+ICAtIFJlbW92ZWQgdW51c2VkIENPTkZJRyBm
cm9tIGxpbnV4LmZyYWdtZW50IGJ1dCBhZGRlZAo+ICAgIENPTkZJR19JMkNfU0xBVkVfRUVQUk9N
IHdoaWNoIGlzIHVzZWZ1bCBmb3IgdGVzdHMKPiAgLSBtaW5vciBjbGVhbnVwcyBpbiByZWFkbWUu
dHh0Cj4KPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysK
PiAgYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL2dlbmltYWdlLmNmZyAgIHwgNDAgKysrKysrKysr
KysrKwo+ICBib2FyZC9hc3BlZWQvYXN0MjYwMC1ldmIvbGludXguZnJhZ21lbnQgfCAgMSArCj4g
IGJvYXJkL2FzcGVlZC9hc3QyNjAwLWV2Yi9yZWFkbWUudHh0ICAgICB8IDgwICsrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgYm9hcmQvYXNwZWVkL2NvbW1vbi9pbWFnZS5pdHMudGVtcGxhdGUg
IHwgNTYgKysrKysrKysrKysrKysrKysKPiAgYm9hcmQvYXNwZWVkL2NvbW1vbi9wb3N0LWltYWdl
LnNoICAgICAgIHwgMjcgKysrKysrKysrCj4gIGNvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVm
Y29uZmlnICAgICB8IDU2ICsrKysrKysrKysrKysrKysrCj4gIDcgZmlsZXMgY2hhbmdlZCwgMjY0
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2FzcGVlZC9hc3QyNjAw
LWV2Yi9nZW5pbWFnZS5jZmcKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2FzcGVlZC9hc3Qy
NjAwLWV2Yi9saW51eC5mcmFnbWVudAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvYXNwZWVk
L2FzdDI2MDAtZXZiL3JlYWRtZS50eHQKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2FzcGVl
ZC9jb21tb24vaW1hZ2UuaXRzLnRlbXBsYXRlCj4gIGNyZWF0ZSBtb2RlIDEwMDc1NSBib2FyZC9h
c3BlZWQvY29tbW9uL3Bvc3QtaW1hZ2Uuc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3Mv
YXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnCj4KPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBi
L0RFVkVMT1BFUlMKPiBpbmRleCA3MWNjM2RhNmQ3MGIuLjNhN2Y2N2FlZTIzMCAxMDA2NDQKPiAt
LS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC01MDEsOCArNTAxLDEwIEBA
IEY6IHBhY2thZ2Uvem5jLwo+ICBOOiAgICAgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9y
Zz4KPiAgRjogICAgIGJvYXJkL3FlbXUvcHBjLWJhbWJvby8KPiAgRjogICAgIGJvYXJkL3FlbXUv
cHBjNjRsZS1wb3dlcm52OC9yZWFkbWUudHh0Cj4gK0Y6ICAgICBib2FyZC9hc3BlZWQvCj4gIEY6
ICAgICBjb25maWdzL3FlbXVfcHBjX2JhbWJvb19kZWZjb25maWcKPiAgRjogICAgIGNvbmZpZ3Mv
cWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZpZwo+ICtGOiAgICAgY29uZmlncy9hc3BlZWQq
Cj4KPiAgTjogICAgIENoYXJsZXMgSGFyZGluIDxja2hhcmRpbkBnbWFpbC5jb20+Cj4gIEY6ICAg
ICBwYWNrYWdlL2Fsc2EtcGx1Z2lucy8KPiBAQCAtMTQ1MSw2ICsxNDUzLDggQEAgRjogICAgICAg
IGJvYXJkL3FlbXUvcHBjNjRsZS1wc2VyaWVzLwo+ICBGOiAgICAgY29uZmlncy9xZW11X3BwYzY0
bGVfcHNlcmllc19kZWZjb25maWcKPiAgRjogICAgIGJvYXJkL3FlbXUvcHBjLW1hYzk5Lwo+ICBG
OiAgICAgY29uZmlncy9xZW11X3BwY19tYWM5OV9kZWZjb25maWcKPiArRjogICAgIGJvYXJkL2Fz
cGVlZC8KPiArRjogICAgIGNvbmZpZ3MvYXNwZWVkKgo+Cj4gIE46ICAgICBKb2hhbiBEZXJ5Y2tl
IDxqb2hhbmRlcnlja2VAZ21haWwuY29tPgo+ICBGOiAgICAgcGFja2FnZS9weXRob24tbGliY29u
ZmlnLwo+IGRpZmYgLS1naXQgYS9ib2FyZC9hc3BlZWQvYXN0MjYwMC1ldmIvZ2VuaW1hZ2UuY2Zn
IGIvYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL2dlbmltYWdlLmNmZwo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi41NjkzMmQ0Nzg3NTYKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL2dlbmltYWdlLmNmZwo+IEBAIC0wLDAg
KzEsNDAgQEAKPiArIwo+ICsjIFRoaXMgY29uZmlnIHJlcHJvZHVjZXMgdGhlIE9wZW5CTUMgZmxh
c2ggbGF5b3V0IGRlZmluZWQgaW4gTGludXggOgo+ICsjCj4gKyMgICAgYXJjaC9hcm0vYm9vdC9k
dHMvb3BlbmJtYy1mbGFzaC1sYXlvdXQtNjQuZHRzaQo+ICsjCj4gKyMgYW5kIGluY2x1ZGVkIGJ5
IGFzcGVlZC1hc3QyNjAwLWV2Yi5kdHMKPiArIwo+ICtmbGFzaCBub3ItNjRNLTI1NiB7Cj4gKyAg
ICAgICBwZWJzaXplID0gNEsKPiArICAgICAgIG51bXBlYnMgPSAxNksKPiArICAgICAgIG1pbmlt
dW0taW8tdW5pdC1zaXplID0gMjU2Cj4gK30KPiArCj4gK2ltYWdlIGZsYXNoLmltZyB7Cj4gKyAg
ICAgICBmbGFzaCB7Cj4gKyAgICAgICB9Cj4gKyAgICAgICBmbGFzaHR5cGUgPSAibm9yLTY0TS0y
NTYiCj4gKwo+ICsgICAgICAgcGFydGl0aW9uIHVib290IHsKPiArICAgICAgICAgICAgICAgaW1h
Z2UgPSAidS1ib290LmJpbiIKPiArICAgICAgICAgICAgICAgc2l6ZSA9IDg5NksKPiArICAgICAg
IH0KPiArCj4gKyAgICAgICBwYXJ0aXRpb24gdWJvb3RlbnYgewo+ICsgICAgICAgICAgICAgICAv
KiBUT0RPICovCj4gKyAgICAgICAgICAgICAgIG9mZnNldCA9IDg5NksKPiArICAgICAgICAgICAg
ICAgc2l6ZSA9IDEyOEsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBwYXJ0aXRpb24gZml0aW1h
Z2Ugewo+ICsgICAgICAgICAgICAgICBpbWFnZSA9ICJpbWFnZS5pdGIiCj4gKyAgICAgICAgICAg
ICAgIG9mZnNldCA9IDFNCj4gKyAgICAgICAgICAgICAgIHNpemUgPSA5TQo+ICsgICAgICAgfQo+
ICsKPiArICAgICAgIHBhcnRpdGlvbiBzcGFyZSB7CgpJdCBvY2N1cmVkIHRvIG1lIHRoYXQgd2Ug
Y291bGQgcHV0IHRoZSByb290ZnMgaGVyZSBpbnN0ZWFkLCB3aGljaAp3b3VsZCB0ZXN0IHRoZSBm
aWxlc3lzdGVtIGdlbmVyYXRpb24gaW5zdGVhZCBvZiBpbml0cmQuIFNvbWV0aGluZyB0bwp0aGlu
ayBhYm91dCBmb3IgdGhlIGZ1dHVyZSBwZXJoYXBzLgoKPiArICAgICAgICAgICAgICAgb2Zmc2V0
ID0gMTBNCj4gKyAgICAgICAgICAgICAgIHNpemUgPSA1NE0KPiArICAgICAgIH0KPiArfQo+IGRp
ZmYgLS1naXQgYS9ib2FyZC9hc3BlZWQvYXN0MjYwMC1ldmIvbGludXguZnJhZ21lbnQgYi9ib2Fy
ZC9hc3BlZWQvYXN0MjYwMC1ldmIvbGludXguZnJhZ21lbnQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uOGRkNDYwODcwNzk5Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL2JvYXJkL2FzcGVlZC9hc3QyNjAwLWV2Yi9saW51eC5mcmFnbWVudAo+IEBAIC0wLDAgKzEg
QEAKPiArQ09ORklHX0kyQ19TTEFWRV9FRVBST009eQoKSSdsbCB0YWtlIGEgcGF0Y2ggdG8gcHV0
IHRoYXQgaW4gdGhlIHVwc3RyZWFtIGRlZmNvbmZpZyBpZiB5b3Ugd2FudC4KClRoaXMgbG9va3Mg
Z29vZCB0byBnbyBpbiBhcyBpdCBpcyBmcm9tIGFuIGFzcGVlZC9rZXJuZWwvdS1ib290IHBlcnNw
ZWN0aXZlLgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+CgpDaGVl
cnMsCgpKb2VsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
