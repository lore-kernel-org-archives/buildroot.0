Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA56C0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 07:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D15AC40949;
	Tue, 15 Aug 2023 07:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D15AC40949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJJKH4RWS06s; Tue, 15 Aug 2023 07:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6A7040A47;
	Tue, 15 Aug 2023 07:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6A7040A47
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6FBA1BF34F
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 07:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E74C40A47
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 07:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E74C40A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CXIHYc9Fee5 for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 07:31:07 +0000 (UTC)
X-Greylist: delayed 576 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 15 Aug 2023 07:31:07 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7280A40949
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7280A40949
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 07:31:07 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37F7LUiE046322;
 Tue, 15 Aug 2023 02:21:30 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37F7LUwN013042
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Aug 2023 02:21:30 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Aug 2023 02:21:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Aug 2023 02:21:30 -0500
Received: from dasso (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37F7LUkH124769;
 Tue, 15 Aug 2023 02:21:30 -0500
Date: Tue, 15 Aug 2023 02:21:30 -0500
To: =?utf-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>, Bryce Johnson
 <bryce@redpinelabs.com>
Message-ID: <20230815072130.4sibvsh3wuql46xc@dasso>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-6-dannenberg@ti.com>
 <CAAE6iEVZSojnPcJxyM_o=jqi7huc_ymN00hyzLp0gkxNcUfEWA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAE6iEVZSojnPcJxyM_o=jqi7huc_ymN00hyzLp0gkxNcUfEWA@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1692084090;
 bh=hQJfvryFaHEF1wHggWfAbErOC5q0tdnTd7e4mjphUPg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=kxLIKqdubCcVu1UpG5R8iBRID3nslOd6kdE2Y5BCFKWpgnW6SAThr7AHrlwH3+7uB
 5ahAIZhJWLFXPJCi33OTXA4ih7moqrLKF1hjDQodEyxAZVJrlYA9ffhnnikQeyJN5I
 XP36fugXpgJ7zWczOoB6OCSwvU/fy/r+UQUWf6ww=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=kxLIKqdu
Subject: Re: [Buildroot] [PATCH v9 05/11] board/ti/am62x_sk: add new board
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLAp0aGFua3MgZm9yIHRoZSBmZWVkYmFjay4gQ29tbWVudCBpbmxpbmVkLi4uCgpP
biBTdW4sIEp1biAyNSwgMjAyMyBhdCAwNzo0Mjo0N0FNICswMjAwLCBGcmFuw6dvaXMgUGVycmFk
IHdyb3RlOgo+IExlIGpldS4gMjIganVpbiAyMDIzIMOgIDE4OjA3LCBBbmRyZWFzIERhbm5lbmJl
cmcgdmlhIGJ1aWxkcm9vdCA8Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IGEgw6ljcml0IDoK
PiAKPiA+IEZyb206IFh1YW5oYW8gU2hpIDx4LXNoaUB0aS5jb20+Cj4gPgo+ID4gQWRkcyBzdXBw
b3J0IGZvciBUSSdzIFNLLUFNNjIgYm9hcmQgYnkgaW50cm9kdWNpbmcgdGhlCj4gPiBhbTYyeF9z
a19kZWZjb25maWcgZmlsZSBhbmQgcmVsYXRlZCBzdXBwb3J0IGZpbGVzLgo+ID4KPiA+IE1vcmUg
aW5mb3JtYXRpb24gYWJvdXQgdGhlIGJvYXJkIGNhbiBiZSBmb3VuZCBhdDoKPiA+IGh0dHBzOi8v
d3d3LnRpLmNvbS90b29sL1NLLUFNNjIKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBYdWFuaGFvIFNo
aSA8eC1zaGlAdGkuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBEYW5uZW5iZXJnIDxk
YW5uZW5iZXJnQHRpLmNvbT4KPiA+IC0tLQo+ID4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAg
ICAgICB8ICA0ICsrKwo+ID4gIGJvYXJkL3RpL2FtNjJ4X3NrL2dlbmltYWdlLmNmZyB8IDI3ICsr
KysrKysrKysrKysrKysrKysrCj4gPiAgYm9hcmQvdGkvYW02Mnhfc2svcmVhZG1lLnR4dCAgIHwg
MjYgKysrKysrKysrKysrKysrKysrKysKPiA+ICBjb25maWdzL2FtNjJ4X3NrX2RlZmNvbmZpZyAg
ICAgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgNCBmaWxlcyBj
aGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC90
aS9hbTYyeF9zay9nZW5pbWFnZS5jZmcKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvdGkv
YW02Mnhfc2svcmVhZG1lLnR4dAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2FtNjJ4
X3NrX2RlZmNvbmZpZwo+ID4KPiA+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVS
Uwo+ID4gaW5kZXggYTRkNzI5OTgzYi4uOGNlOTAzYjI5NCAxMDA2NDQKPiA+IC0tLSBhL0RFVkVM
T1BFUlMKPiA+ICsrKyBiL0RFVkVMT1BFUlMKPiA+IEBAIC0xMjksOSArMTI5LDExIEBAIEY6IHBh
Y2thZ2UvbGlieG1scnBjLwo+ID4gIEY6ICAgICBwYWNrYWdlL3B5dGhvbi1kb2NvcHQvCj4gPgo+
ID4gIE46ICAgICBBbmFuZCBHYWRpeWFyIDxnYWRpeWFyQHRpLmNvbT4KPiA+ICtGOiAgICAgYm9h
cmQvdGkvYW02Mnhfc2svCj4gPiAgRjogICAgIGJvYXJkL3RpL2FtNjR4X3NrLwo+ID4gIEY6ICAg
ICBib290L3RpLWszLWltYWdlLWdlbi8KPiA+ICBGOiAgICAgYm9vdC90aS1rMy1yNS1sb2FkZXIv
Cj4gPiArRjogICAgIGNvbmZpZ3MvYW02Mnhfc2tfZGVmY29uZmlnCj4gPiAgRjogICAgIGNvbmZp
Z3MvYW02NHhfc2tfZGVmY29uZmlnCj4gPgo+ID4gIE46ICAgICBBbmRyw6kgWndpbmcgPG5lcnZA
ZGF3bmNyb3cuZGU+Cj4gPiBAQCAtMzAyMyw5ICszMDI1LDExIEBAIE46ICAgICAgIFdvamNpZWNo
IE5pemnFhHNraSA8bml6aWFrQHNwb3gub3JnPgo+ID4gIEY6ICAgICBwYWNrYWdlL2Z3dXAvCj4g
Pgo+ID4gIE46ICAgICBYdWFuaGFvIFNoaSA8WDE1MDAwMTc3QGdtYWlsLmNvbT4KPiA+ICtGOiAg
ICAgYm9hcmQvdGkvYW02Mnhfc2svCj4gPiAgRjogICAgIGJvYXJkL3RpL2FtNjR4X3NrLwo+ID4g
IEY6ICAgICBib290L3RpLWszLWltYWdlLWdlbi8KPiA+ICBGOiAgICAgYm9vdC90aS1rMy1yNS1s
b2FkZXIvCj4gPiArRjogICAgIGNvbmZpZ3MvYW02Mnhfc2tfZGVmY29uZmlnCj4gPiAgRjogICAg
IGNvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCj4gPgo+ID4gIE46ICAgICBZYWlyIEJlbiBBdnJh
aGFtIDx5YWlyYmFAcHJvdG9ubWFpbC5jb20+Cj4gPiBkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02
Mnhfc2svZ2VuaW1hZ2UuY2ZnCj4gPiBiL2JvYXJkL3RpL2FtNjJ4X3NrL2dlbmltYWdlLmNmZwo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLjI2MzA0ZmU5OGYK
PiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2JvYXJkL3RpL2FtNjJ4X3NrL2dlbmltYWdlLmNm
Zwo+ID4gQEAgLTAsMCArMSwyNyBAQAo+ID4gK2ltYWdlIGJvb3QudmZhdCB7Cj4gPiArICAgICAg
IHZmYXQgewo+ID4gKyAgICAgICAgICAgICAgIGZpbGVzID0gewo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgInRpYm9vdDMuYmluIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICJ0aXNw
bC5iaW4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgInUtYm9vdC5pbWciLAo+ID4gKyAg
ICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICBzaXplID0gMTZN
Cj4gPiArfQo+ID4gKwo+ID4gK2ltYWdlIHNkY2FyZC5pbWcgewo+ID4gKyAgICAgICBoZGltYWdl
IHsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICBwYXJ0aXRpb24gdS1ib290IHsKPiA+
ICsgICAgICAgICAgICAgICBwYXJ0aXRpb24tdHlwZSA9IDB4Qwo+ID4gKyAgICAgICAgICAgICAg
IGJvb3RhYmxlID0gInRydWUiCj4gPiArICAgICAgICAgICAgICAgaW1hZ2UgPSAiYm9vdC52ZmF0
Igo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiArICAgICAgIHBhcnRpdGlvbiByb290ZnMgewo+ID4g
KyAgICAgICAgICAgICAgIHBhcnRpdGlvbi10eXBlID0gMHg4Mwo+ID4gKyAgICAgICAgICAgICAg
IGltYWdlID0gInJvb3Rmcy5leHQ0Igo+ID4gKyAgICAgICB9Cj4gPiArfQo+ID4gZGlmZiAtLWdp
dCBhL2JvYXJkL3RpL2FtNjJ4X3NrL3JlYWRtZS50eHQgYi9ib2FyZC90aS9hbTYyeF9zay9yZWFk
bWUudHh0Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uY2Ni
YjI0ODk2Ygo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYm9hcmQvdGkvYW02Mnhfc2svcmVh
ZG1lLnR4dAo+ID4gQEAgLTAsMCArMSwyNiBAQAo+ID4gK1RleGFzIEluc3R1bWVudHMgU0stQU02
MiBUZXN0IGFuZCBEZXZlbG9wbWVudCBCb2FyZAo+ID4gKwo+ID4gK0Rlc2NyaXB0aW9uCj4gPiAr
PT09PT09PT09PT0KPiA+ICtUaGlzIGNvbmZpZ3VyYXRpb24gd2lsbCBidWlsZCBhIGNvbXBsZXRl
IGltYWdlIGZvciB0aGUgVEkgU0stQU02MiBib2FyZC4KPiA+ICsKPiA+ICtIb3cgdG8gQnVpbGQK
PiA+ICs9PT09PT09PT09PT0KPiA+ICtTZWxlY3QgdGhlIGRlZmF1bHQgY29uZmlndXJhdGlvbiBm
b3IgdGhlIHRhcmdldDoKPiA+ICskIG1ha2UgYW02Mnhfc2tfZGVmY29uZmlnCj4gPiArCj4gPiAr
T3B0aW9uYWw6IG1vZGlmeSB0aGUgY29uZmlndXJhdGlvbjoKPiA+ICskIG1ha2UgbWVudWNvbmZp
Zwo+ID4gKwo+ID4gK0J1aWxkOgo+ID4gKyQgbWFrZQo+ID4gKwo+ID4gK1RvIGNvcHkgdGhlIHJl
c3VsdGltZyBvdXRwdXQgaW1hZ2UgZmlsZSB0byBhbiBTRCBjYXJkIHVzZSBkZDoKPiA+ICskIGRk
IGlmPW91dHB1dC9pbWFnZXMvc2RjYXJkLmltZyBvZj0vZGV2L3NkWCBicz0xTQo+ID4gKwo+ID4g
K0hvdyB0byBSdW4KPiA+ICs9PT09PT09PT09Cj4gPiArSW5zZXJ0IHRoZSBTRCBjYXJkIGludG8g
dGhlIFNLLUFNNjIgYm9hcmQsIGFuZCBwb3dlciBpdCB1cCB0aHJvdWdoCj4gPiArdGhlIFVTQiBU
eXBlLUMgY29ubmVjdG9yLiBUaGUgc3lzdGVtIHNob3VsZCBjb21lIHVwLiBZb3UgY2FuIHVzZQo+
ID4gK2EgbWljcm8tVVNCIGNhYmxlIHRvIGNvbm5lY3QgdG8gdGhlIGNvbm5lY3RvciBsYWJlbGVk
IFVBUlQgdG8KPiA+ICtjb21tdW5pY2F0ZSB3aXRoIHRoZSBib2FyZC4KPiA+IGRpZmYgLS1naXQg
YS9jb25maWdzL2FtNjJ4X3NrX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYW02Mnhfc2tfZGVmY29uZmln
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMDgzNzIwZjUx
Mgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvY29uZmlncy9hbTYyeF9za19kZWZjb25maWcK
PiA+IEBAIC0wLDAgKzEsNDUgQEAKPiA+ICtCUjJfYWFyY2g2ND15Cj4gPiArQlIyX1JPT1RGU19Q
T1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+ID4gK0JSMl9S
T09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvdGkvYW02Mnhfc2svZ2VuaW1hZ2UuY2Zn
Igo+ID4gK0JSMl9MSU5VWF9LRVJORUw9eQo+ID4gK0JSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hf
REVGQVVMVF9DT05GSUc9eQo+ID4gK0JSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+ID4g
K0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJ0aS9rMy1hbTYyNS1zayIKPiA+ICtC
UjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKPiA+Cj4gCj4gQlIyX0xJTlVYX0tFUk5F
TF9ORUVEU19IT1NUX09QRU5TU0w9eSAgaXMgbWlzc2luZyBhdCBsZWFzdCBhdCB0aGUgZW5kIG9m
Cj4gdGhlIHNlcmllLgoKWWVzIGdvb2QgZmluZCwgdGhlIHNhbWUgd2FzIHNpbmNlIHJlcG9ydGVk
IGJ5IEJyeWNlICh2aWEgRE0pLCB3aG8KZW5jb3VudGVyZWQgYnVpbGQgaXNzdWVzIHRoYXQgaGUg
Y29uZmlybWVkIGdvdCBmaXhlZCBieSBhZGRpbmcgdGhpcwpsaW5lLiBXaWxsIGluY2x1ZGUgaW50
byB2MTAuCgotLQpBbmRyZWFzIERhbm5lbmJlcmcKVGV4YXMgSW5zdHJ1bWVudHMgSW5jCgoKCj4g
Cj4gRnJhbsOnb2lzCj4gCj4gCj4gPiArQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkU9eQo+ID4g
K0JSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1RJX1dMMThYWD15Cj4gPiArQlIyX1RBUkdFVF9S
T09URlNfRVhUMj15Cj4gPiArQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKPiA+ICtCUjJfVEFS
R0VUX1JPT1RGU19FWFQyX1NJWkU9IjI1Nk0iCj4gPiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9G
SVJNV0FSRT15Cj4gPiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVS
U0lPTj15Cj4gPiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lP
Tl9WQUxVRT0idjIuNy4wIgo+ID4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfUExB
VEZPUk09ImszIgo+ID4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfVEFSR0VUX0JP
QVJEPSJsaXRlIgo+ID4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQkwzMl9PUFRF
RT15Cj4gPiArQlIyX1RBUkdFVF9PUFRFRV9PUz15Cj4gPiArQlIyX1RBUkdFVF9PUFRFRV9PU19Q
TEFURk9STT0iazMiCj4gPiArQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU49eQo+ID4gK0JSMl9U
QVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQz0iYW02MngiCj4gPiArQlIyX1RBUkdFVF9USV9LM19J
TUFHRV9HRU5fU09DX1RZUEVfR1A9eQo+ID4gK0JSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX0NP
TkZJRz0iZXZtIgo+ID4gK0JSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSPXkKPiA+ICtCUjJfVEFS
R0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRF9ERUZDT05GSUc9ImFtNjJ4X2V2bV9yNSIKPiA+ICtC
UjJfVEFSR0VUX1VCT09UPXkKPiA+ICtCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09O
RklHPXkKPiA+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKPiA+ICtCUjJfVEFS
R0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIyLjEwIgo+ID4gK0JSMl9UQVJHRVRf
VUJPT1RfQk9BUkRfREVGQ09ORklHPSJhbTYyeF9ldm1fYTUzIgo+ID4gK0JSMl9UQVJHRVRfVUJP
T1RfTkVFRFNfRFRDPXkKPiA+ICtCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQo+ID4g
K0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzE9eQo+ID4gK0JSMl9UQVJHRVRfVUJPT1Rf
TkVFRFNfVElfSzNfRE09eQo+ID4gK0JSMl9UQVJHRVRfVUJPT1RfVElfSzNfRE1fU09DPSJhbTYy
eHgiCj4gPiArIyBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9CSU4gaXMgbm90IHNldAo+ID4gK0JS
Ml9UQVJHRVRfVUJPT1RfRk9STUFUX0lNRz15Cj4gPiArQlIyX1RBUkdFVF9VQk9PVF9TUEw9eQo+
ID4gK0JSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9InRpc3BsLmJpbiIKPiA+ICtCUjJfVEFSR0VU
X1VCT09UX0NVU1RPTV9NQUtFT1BUUz0iVEVFPSQoQklOQVJJRVNfRElSKS90ZWUtcGFnZXJfdjIu
YmluIgo+ID4gK0JSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09MUz15Cj4gPiArQlIyX1BBQ0tBR0Vf
SE9TVF9HRU5JTUFHRT15Cj4gPiArQlIyX1BBQ0tBR0VfSE9TVF9NVE9PTFM9eQo+ID4gLS0KPiA+
IDIuMzQuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
