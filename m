Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF8BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 14:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1710D81826;
	Mon,  3 Oct 2022 14:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1710D81826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqhY4IYob5D8; Mon,  3 Oct 2022 14:03:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF93B82C18;
	Mon,  3 Oct 2022 14:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF93B82C18
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FAB31BF3A8
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 14:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 430E8605AE
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 14:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 430E8605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIaM0wbNrKBR for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 14:03:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C290F600CC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C290F600CC
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 14:03:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 293E3JCL016360;
 Mon, 3 Oct 2022 09:03:19 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 293E3JKu007959
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Oct 2022 09:03:19 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 3 Oct
 2022 09:03:18 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2507.006; Mon, 3 Oct 2022 09:03:18 -0500
To: Romain Naour <romain.naour@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v5 3/3] board/ti/am64x_sk: add new board
Thread-Index: AQHYz47Yen8DzC2xbEO0TlZ/NCghwa36MHcAgAKQ71A=
Date: Mon, 3 Oct 2022 14:03:18 +0000
Message-ID: <5cf5ee81dedc4bbcbd56ecebb59257f5@ti.com>
References: <20220923205543.1518798-1-gadiyar@ti.com>
 <20220923205543.1518798-4-gadiyar@ti.com>
 <393a285a-1795-f992-8606-0c6e514992fd@gmail.com>
In-Reply-To: <393a285a-1795-f992-8606-0c6e514992fd@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.24.246]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1664805799;
 bh=41JDVXr1QXI4y0ZkNPhk3OHYPTr66J9duXOq8FtPhfM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=O0ZtCXXrTGCCpVqe8+XaWILPx/5F3a8u7itZGS5IjAe73fsW87yNmOt1KTuc5PFYL
 /atZpiYCTGcHE54AnlFwYbrBma3lz5sdjZ4Nt7waxbWwuOIeunSUIJEmSKTjrr7Z2v
 rw4eIMWOj17adfeVEuNSUjvjkVEUS76lNuf4CJr0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=O0ZtCXXr
Subject: Re: [Buildroot] [PATCH v5 3/3] board/ti/am64x_sk: add new board
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
From: "Gadiyar, Anand via buildroot" <buildroot@buildroot.org>
Reply-To: "Gadiyar, Anand" <gadiyar@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Xuanhao Shi <x-shi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PiBGcm9tOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+DQo+IA0KPiBIZWxs
byBBbmFuZCwNCj4gDQo+IExlIDIzLzA5LzIwMjIgw6AgMjI6NTUsIEFuYW5kIEdhZGl5YXIgYSDD
qWNyaXTCoDoNCj4gPiBGcm9tOiBYdWFuaGFvIFNoaSA8eC1zaGlAdGkuY29tPg0KPiA+DQo+ID4g
QWRkcyBzdXBwb3J0IGZvciB0aSdzIGFtNjR4X3NrIGJvYXJkLg0KPiA+IEFkZHMgdGhlIGNvbmZp
Z3MgZm9yIGdlbmVyYXRpbmcgb3V0cHV0IHNkY2FyZCBpbWFnZS4NCj4gPiBBZGRzIHRoZSBkZWZj
b25maWdzIGZvciBhbTY0eF9zay4NCj4gPg0KPiA+IFRoZSBBTTY0eF9zayBib2FyZCBpcyBkZXNp
Z25lZCBmb3IgdGhlIEFNNjQyIFNvQyB3aXRoDQo+ID4gdHdvIEFSTSBDb3J0ZXgtQTUzIGFuZCBm
b3VyIEFSTSBDb3J0ZXgtUjUuIEl0IGFsc28NCj4gPiBzdXBwb3J0cyBSSiA0NSBFdGhlcm5ldCwg
V2ktRmksIGFuZCBCbHVldG9vdGguDQo+ID4NCj4gPiBNb3JlIGluZm9ybWF0aW9uIGFib3V0IHRo
ZSBib2FyZCBjYW4gYmUgZm91bmQgYXQ6DQo+ID4gaHR0cHM6Ly93d3cudGkuY29tL3Rvb2wvU0st
QU02NA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmFuZCBHYWRpeWFyIDxnYWRpeWFyQHRpLmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVl
cmluZy5jb20+DQo+ID4gLS0tDQo+ID4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICB8
ICA0ICsrKw0KPiA+ICBib2FyZC90aS9hbTY0eF9zay9nZW5pbWFnZS5jZmcgfCAyNyArKysrKysr
KysrKysrKysrKysrDQo+ID4gIGJvYXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQgICB8IDQ5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgY29uZmlncy9hbTY0eF9za19k
ZWZjb25maWcgICAgIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICA0
IGZpbGVzIGNoYW5nZWQsIDEyNSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBib2FyZC90aS9hbTY0eF9zay9nZW5pbWFnZS5jZmcNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGJvYXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNv
bmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVS
UyBiL0RFVkVMT1BFUlMNCj4gPiBpbmRleCA4MWYwOTVmNzk5Li4xMjE5NTIzNjljIDEwMDY0NA0K
PiA+IC0tLSBhL0RFVkVMT1BFUlMNCj4gPiArKysgYi9ERVZFTE9QRVJTDQo+ID4gQEAgLTEyOSw4
ICsxMjksMTAgQEAgRjoJcGFja2FnZS9saWJ4bWxycGMvDQo+ID4gIEY6CXBhY2thZ2UvcHl0aG9u
LWRvY29wdC8NCj4gPg0KPiA+ICBOOglBbmFuZCBHYWRpeWFyIDxnYWRpeWFyQHRpLmNvbT4NCj4g
PiArRjoJYm9hcmQvdGkvYW02NHhfc2svDQo+ID4gIEY6CWJvb3QvdGktazMtaW1hZ2UtZ2VuLw0K
PiA+ICBGOglib290L3RpLWszLXI1LWxvYWRlci8NCj4gPiArRjoJY29uZmlncy9hbTY0eF9za19k
ZWZjb25maWcNCj4gPg0KPiA+ICBOOglBbmRyw6kgWndpbmcgPG5lcnZAZGF3bmNyb3cuZGU+DQo+
ID4gIEY6CXBhY2thZ2UvbGlia3JiNS8NCj4gPiBAQCAtMzA2OCw4ICszMDcwLDEwIEBAIE46CVdv
amNpZWNoIE5pemnFhHNraSA8bml6aWFrQHNwb3gub3JnPg0KPiA+ICBGOglwYWNrYWdlL2Z3dXAv
DQo+ID4NCj4gPiAgTjoJWHVhbmhhbyBTaGkgPFgxNTAwMDE3N0BnbWFpbC5jb20+DQo+ID4gK0Y6
CWJvYXJkL3RpL2FtNjR4X3NrLw0KPiA+ICBGOglib290L3RpLWszLWltYWdlLWdlbi8NCj4gPiAg
RjoJYm9vdC90aS1rMy1yNS1sb2FkZXIvDQo+ID4gK0Y6CWNvbmZpZ3MvYW02NHhfc2tfZGVmY29u
ZmlnDQo+ID4NCj4gPiAgTjoJWWFpciBCZW4gQXZyYWhhbSA8eWFpcmJhQHByb3Rvbm1haWwuY29t
Pg0KPiA+ICBGOglwYWNrYWdlL2Nhc3luYy8NCj4gPiBkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02
NHhfc2svZ2VuaW1hZ2UuY2ZnIGIvYm9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2UuY2ZnDQo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwLi4yNjMwNGZlOThmDQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2JvYXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNm
Zw0KPiA+IEBAIC0wLDAgKzEsMjcgQEANCj4gPiAraW1hZ2UgYm9vdC52ZmF0IHsNCj4gPiArCXZm
YXQgew0KPiA+ICsJCWZpbGVzID0gew0KPiA+ICsJCQkidGlib290My5iaW4iLA0KPiA+ICsJCQki
dGlzcGwuYmluIiwNCj4gPiArCQkJInUtYm9vdC5pbWciLA0KPiA+ICsJCX0NCj4gPiArCX0NCj4g
PiArDQo+ID4gKwlzaXplID0gMTZNDQo+ID4gK30NCj4gPiArDQo+ID4gK2ltYWdlIHNkY2FyZC5p
bWcgew0KPiA+ICsJaGRpbWFnZSB7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcGFydGl0aW9uIHUt
Ym9vdCB7DQo+ID4gKwkJcGFydGl0aW9uLXR5cGUgPSAweEMNCj4gPiArCQlib290YWJsZSA9ICJ0
cnVlIg0KPiA+ICsJCWltYWdlID0gImJvb3QudmZhdCINCj4gPiArCX0NCj4gPiArDQo+ID4gKwlw
YXJ0aXRpb24gcm9vdGZzIHsNCj4gPiArCQlwYXJ0aXRpb24tdHlwZSA9IDB4ODMNCj4gPiArCQlp
bWFnZSA9ICJyb290ZnMuZXh0NCINCj4gPiArCX0NCj4gPiArfQ0KPiA+IGRpZmYgLS1naXQgYS9i
b2FyZC90aS9hbTY0eF9zay9yZWFkbWUudHh0IGIvYm9hcmQvdGkvYW02NHhfc2svcmVhZG1lLnR4
dA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uODA5NmZj
YjJkNA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9ib2FyZC90aS9hbTY0eF9zay9yZWFk
bWUudHh0DQo+ID4gQEAgLTAsMCArMSw0OSBAQA0KPiA+ICtUZXhhcyBJbnN0dW1lbnRzIEFNNjR4
IFNLIFRlc3QgYW5kIERldmVsb3BtZW50IEJvYXJkDQo+ID4gKw0KPiA+ICtEZXNjcmlwdGlvbg0K
PiA+ICs9PT09PT09PT09PQ0KPiA+ICsNCj4gPiArVGhlc2UgY29uZmlndXJhdGlvbnMgd2lsbCBi
dWlsZCBhIGNvbXBsZXRlIGltYWdlIGFuZA0KPiA+ICtkZXZpY2UgdHJlZSBibG9icyBmb3IgdGhl
IHRoZSBUSSBBTTY0eF9zayBib2FyZC4NCj4gPiArDQo+ID4gK0hvdyB0byBidWlsZCBpdA0KPiA+
ICs9PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gK1NlbGVjdCB0aGUgZGVmYXVsdCBjb25maWd1
cmF0aW9uIGZvciB0aGUgdGFyZ2V0Og0KPiA+ICskIG1ha2UgYW02NHhfc2tfZGVmY29uZmlnDQo+
ID4gKw0KPiA+ICtPcHRpb25hbDogbW9kaWZ5IHRoZSBjb25maWd1cmF0aW9uOg0KPiA+ICskIG1h
a2UgbWVudWNvbmZpZw0KPiA+ICsNCj4gPiArQnVpbGQ6DQo+ID4gKyQgbWFrZQ0KPiA+ICsNCj4g
PiArUmVzdWx0IG9mIHRoZSBidWlsZDoNCj4gPiArPT09PT09PT09PT09PT09PT09PQ0KPiA+ICtv
dXRwdXQvaW1hZ2VzLw0KPiA+ICsrLS0gc29jDQo+ID4gKystLSB0aS1jb25uZWN0aXZpdHkNCj4g
PiArKy0tIGJsMzEuYmluDQo+ID4gKystLSBib290LnZmYXQNCj4gPiArKy0tIEltYWdlDQo+ID4g
KystLSBrMy1hbTY0Mi1zay5kdGINCj4gPiArKy0tIHI1LXUtYm9vdC1zcGwuYmluDQo+ID4gKyst
LSByb290ZnMuZXh0Mg0KPiA+ICsrLS0gcm9vdGZzLmV4dDQNCj4gPiArKy0tIHJvb3Rmcy50YXIN
Cj4gPiArKy0tIHNkY2FyZC5pbWcNCj4gPiArKy0tIHRlZS5iaW4NCj4gPiArKy0tIHRlZS1oZWFk
ZXJfdjIuYmluDQo+ID4gKystLSB0ZWUtcGFnZWFibGVfdjIuYmluDQo+ID4gKystLSB0ZWUtcGFn
ZXJfdjIuYmluDQo+ID4gKystLSB0aWJvb3QzLmJpbg0KPiA+ICsrLS0gdGlzcGwuYmluDQo+ID4g
KystLSB1LWJvb3QuaW1nDQo+ID4gKw0KPiA+ICtUbyBjb3B5IHRoZSBpbWFnZSBmaWxlIHRvIHRo
ZSBzZGNhcmQgdXNlIGRkOg0KPiA+ICskIGRkIGlmPW91dHB1dC9pbWFnZXMvc2RjYXJkLmltZyBv
Zj0vZGV2L3NkWA0KPiA+ICsNCj4gPiArSW5zZXJ0IHRoZSBTRGNhcmQgaW50byB0aGUgQU02NHhf
c2sgYm9hcmQsIGFuZCBwb3dlciBpdCB1cCB3aXRoDQo+ID4gK2EgVVNCIFR5cGUtQyBjb25uZWN0
b3IuIFRoZSBzeXN0ZW0gc2hvdWxkIGNvbWUgdXAuIFlvdSBjYW4gdXNlDQo+ID4gK2EgbWljcm8t
VVNCIHRvIGNvbm5lY3QgdG8gdGhlIGNvbm5lY3RvciBsYWJsZWQgTUFJTl9VQVJUMCB0bw0KPiA+
ICtjb21tdW5pY2F0ZSB3aXRoIHRoZSBib2FyZC4NCj4gPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9h
bTY0eF9za19kZWZjb25maWcgYi9jb25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZw0KPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMWQzN2I0MTFiMw0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi9jb25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZw0KPiA+IEBA
IC0wLDAgKzEsNDUgQEANCj4gPiArQlIyX2FhcmNoNjQ9eQ0KPiA+ICtCUjJfUk9PVEZTX1BPU1Rf
SU1BR0VfU0NSSVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giDQo+ID4gK0JSMl9ST09U
RlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2UuY2ZnIg0K
PiA+ICtCUjJfTElOVVhfS0VSTkVMPXkNCj4gPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVS
U0lPTj15DQo+ID4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTki
DQo+ID4gK0JSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQ0KPiA+ICtC
UjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkNCj4gPiArQlIyX0xJTlVYX0tFUk5FTF9JTlRS
RUVfRFRTX05BTUU9InRpL2szLWFtNjQyLXNrIg0KPiA+ICtCUjJfTElOVVhfS0VSTkVMX0lOU1RB
TExfVEFSR0VUPXkNCj4gPiArQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkU9eQ0KPiA+ICtCUjJf
UEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9USV9XTDE4WFg9eQ0KPiA+ICtCUjJfVEFSR0VUX1JPT1RG
U19FWFQyPXkNCj4gPiArQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkNCj4gPiArQlIyX1RBUkdF
VF9ST09URlNfRVhUMl9TSVpFPSIxMjBNIg0KPiA+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJ
Uk1XQVJFPXkNCj4gPiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVS
U0lPTj15DQo+ID4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJ
T05fVkFMVUU9InYyLjcuMCINCj4gPiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9Q
TEFURk9STT0iazMiDQo+ID4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfVEFSR0VU
X0JPQVJEPSJsaXRlIg0KPiA+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzJf
T1BURUU9eQ0KPiA+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0FERElUSU9OQUxf
VkFSSUFCTEVTPSJTUEQ9b3B0ZWVkIg0KPiA+ICtCUjJfVEFSR0VUX09QVEVFX09TPXkNCj4gPiAr
QlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZPXkNCj4gPiArQlIy
X1RBUkdFVF9PUFRFRV9PU19QTEFURk9STT0iazMiDQo+ID4gK0JSMl9UQVJHRVRfVElfSzNfSU1B
R0VfR0VOPXkNCj4gPiArQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU09DPSJhbTY0eCINCj4g
PiArQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fQ09ORklHPSJldm0iDQo+ID4gK0JSMl9UQVJH
RVRfVElfSzNfUjVfTE9BREVSX0JPQVJEPSJhbTY0eF9ldm0iDQo+ID4gK0JSMl9UQVJHRVRfVUJP
T1Q9eQ0KPiA+ICtCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkNCj4gPiAr
QlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTj15DQo+ID4gK0JSMl9UQVJHRVRfVUJPT1Rf
Q1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjIuMTAtcmMxIg0KPiANCj4gU2FtZSBjb21tZW50IGFz
IGZvciBwYXRjaCAxLzMsIHVzZSBhIHJlbGVhc2UgdmVyc2lvbiBpZiBwb3NzaWJsZS4NCj4gDQo+
IEkgaGF2ZSB0aGUgc2stdGRhNHZtIGV2YWx1YXRpb24gYm9hcmQuIEknbGwgdHJ5IHRvIGRvIGEg
cnVudGltZSB0ZXN0Lg0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3IGNvbW1lbnRzIFJvbWFp
biENCg0KV2lsbCBjaGFuZ2UgdGhpcyAtIEknbGwgdHJ5IGFuZCByZXN1Ym1pdCBpbiBhIGZldyBk
YXlzIGFmdGVyIDIwMjIuMTAgaXMgdGFnZ2VkLg0KMjAyMi4wNyBzaG91bGQgd29yayBhcyB3ZWxs
LCBidXQgSSBoYXZlbid0IGJ1aWx0IGl0LiBJcyBpdCBiZXR0ZXIgdG8gaGF2ZSB0aGUNCm9sZGVy
IHZlcnNpb24gaGVyZSBvciB0aGUgbmV3ZXIgb25lPw0KDQpUaGUgU0stVERBNFZNIGJvYXJkIGlz
IGZvciBhIGRpZmZlcmVudCBUSSBwcm9jZXNzb3IsIHNvIHRoZSBpbWFnZSBpcyBub3QNCmxpa2Vs
eSB0byB3b3JrIGZvciB5b3UuIEknZCBsb3ZlIHRvIHN1Ym1pdCBhIHBhdGNoIGFkZGluZyBzdXBw
b3J0IGZvciB0aGF0DQpib2FyZCBhcyB3ZWxsLCBidXQgSSBuZWVkIHRvIGNoZWNrIGlmIHRoZXJl
IGFyZSBvdGhlciBkZXBlbmRlbmNpZXMgKGxpa2UNCnRoZSBvbmUgb24gZmlybXdhcmUgdGhhdCB3
ZSByYW4gaW50byBmb3IgdGhlIEFNNjJ4KS4gV2Ugd2VyZSBob3BpbmcgdG8NCmdldCB0aGUgQU02
NHggU0sgc3VwcG9ydGVkIGZpcnN0IGFzIGEgYmFzZWxpbmUuDQoNCkJlc3QgUmVnYXJkcywNCkFu
YW5kDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
