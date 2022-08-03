Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A75C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFB5641085;
	Wed,  3 Aug 2022 16:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB5641085
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9-emGhpyVVb; Wed,  3 Aug 2022 16:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D60D940C46;
	Wed,  3 Aug 2022 16:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D60D940C46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D59161BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACE70824E2
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE70824E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lf0YE0-aOAmz for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:09:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA41F81570
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA41F81570
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 16:09:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 273G9Gg2022277;
 Wed, 3 Aug 2022 11:09:16 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 273G9FEB062228
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Aug 2022 11:09:15 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 3
 Aug 2022 11:09:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 3 Aug 2022 11:09:15 -0500
Received: from [128.247.75.130] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 273G9F8n128723;
 Wed, 3 Aug 2022 11:09:15 -0500
Message-ID: <4111e69f-df92-2d7f-0964-d4a11cc5b18a@ti.com>
Date: Wed, 3 Aug 2022 11:09:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 <buildroot@buildroot.org>
References: <20220802200522.4619-1-x-shi@ti.com>
 <20220802200522.4619-4-x-shi@ti.com>
 <97eb0b50-ac5d-76d6-57f3-efd2d99304db@benettiengineering.com>
In-Reply-To: <97eb0b50-ac5d-76d6-57f3-efd2d99304db@benettiengineering.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659542956;
 bh=Z/W1I+ecT2ja1P02LqmMFc81+z1bu7xiPQILqUQdi4Y=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=OOh0U2pVthCWABr2o9f62wcwL1p/HjIvaQNxPKzFuongx1LiZlQ+Cmm0cxEITQtdi
 ZVRUSZVB9N3HL3guoWGWtBKtz4LDg2ZZ5StG98knvKHqwyqEO0nccMOcXqTw4bdR9E
 /ueU08Hql/0V+rhzTiBmFacGhaXKJpYdYyVtiZqI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=OOh0U2pV
Subject: Re: [Buildroot] [PATCH 3/3] board/ti/am64x_sk: add new board
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOC8yLzIyIDE2OjM3LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBYdWFuaGFvLCBBbmFu
ZCwgVGhvbWFzLCBBbGwsCj4gCj4gT24gMDIvMDgvMjIgMjI6MDUsIFh1YW5oYW8gU2hpIHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4+IEFkZHMgc3VwcG9ydCBmb3IgdGkncyBhbTY0eF9zayBib2FyZC4K
Pj4gQWRkcyB0aGUgY29uZmlncyBmb3IgZ2VuZXJhdGluZyBvdXRwdXQgc2RjYXJkIGltYWdlLgo+
PiBBZGRzIHRoZSBkZWZjb25maWdzIGZvciBhbTY0eF9zay4KPiAKPiBIZXJlIHdlIG5lZWQgYSBi
cmllZiBkZXNjcmlwdGlvbiBvZiB0aGUgYm9hcmQgYW5kIGFuIFVSTCBwb2ludGluZwo+IHRvIHRo
ZSBib2FyZCBVUkwgdG9vCj4gCj4+IFNpZ25lZC1vZmYtYnk6IFh1YW5oYW8gU2hpIDx4LXNoaUB0
aS5jb20+Cj4+IC0tLQo+PiDCoCBERVZFTE9QRVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgNCArKysKPj4gwqAgYm9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2Uu
Y2ZnIHwgMjcgKysrKysrKysrKysrKysrKysrKwo+PiDCoCBib2FyZC90aS9hbTY0eF9zay9yZWFk
bWUudHh0wqDCoCB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAg
Y29uZmlncy9hbTY0eF9za19kZWZjb25maWfCoMKgwqDCoCB8IDQ4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDEyOCBpbnNlcnRpb25zKCsp
Cj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC90aS9hbTY0eF9zay9nZW5pbWFnZS5jZmcK
Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQKPj4g
wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCj4+Cj4+IGRp
ZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+PiBpbmRleCBiMjFkZWYxMTFjLi5l
M2Q5OTQ0M2U5IDEwMDY0NAo+PiAtLS0gYS9ERVZFTE9QRVJTCj4+ICsrKyBiL0RFVkVMT1BFUlMK
Pj4gQEAgLTEyOCw4ICsxMjgsMTAgQEAgRjrCoMKgwqAgcGFja2FnZS9saWJ4bWxycGMvCj4+IMKg
IEY6wqDCoMKgIHBhY2thZ2UvcHl0aG9uLWRvY29wdC8KPj4gwqAgTjrCoMKgwqAgQW5hbmQgR2Fk
aXlhciA8Z2FkaXlhckB0aS5jb20+Cj4+ICtGOsKgwqDCoCBib2FyZC90aS9hbTY0eF9zay8KPj4g
wqAgRjrCoMKgwqAgYm9vdC90aS1rMy1pbWFnZS1nZW4vCj4+IMKgIEY6wqDCoMKgIGJvb3QvdGkt
azMtcjUtbG9hZGVyLwo+PiArRjrCoMKgwqAgY29uZmlncy9hbTY0eF9za19kZWZjb25maWcKPj4g
wqAgTjrCoMKgwqAgQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgo+PiDCoCBGOsKgwqDC
oCBwYWNrYWdlL2xpYmtyYjUvCj4+IEBAIC0zMDI2LDggKzMwMjgsMTAgQEAgTjrCoMKgwqAgV29q
Y2llY2ggTml6acWEc2tpIDxuaXppYWtAc3BveC5vcmc+Cj4+IMKgIEY6wqDCoMKgIHBhY2thZ2Uv
Znd1cC8KPj4gwqAgTjrCoMKgwqAgWHVhbmhhbyBTaGkgPFgxNTAwMDE3N0BnbWFpbC5jb20+Cj4+
ICtGOsKgwqDCoCBib2FyZC90aS9hbTY0eF9zay8KPj4gwqAgRjrCoMKgwqAgYm9vdC90aS1rMy1p
bWFnZS1nZW4vCj4+IMKgIEY6wqDCoMKgIGJvb3QvdGktazMtcjUtbG9hZGVyLwo+PiArRjrCoMKg
wqAgY29uZmlncy9hbTY0eF9za19kZWZjb25maWcKPj4gwqAgTjrCoMKgwqAgWWFpciBCZW4gQXZy
YWhhbSA8eWFpcmJhQHByb3Rvbm1haWwuY29tPgo+PiDCoCBGOsKgwqDCoCBwYWNrYWdlL2Nhc3lu
Yy8KPj4gZGlmZiAtLWdpdCBhL2JvYXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNmZyAKPj4gYi9i
b2FyZC90aS9hbTY0eF9zay9nZW5pbWFnZS5jZmcKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4g
aW5kZXggMDAwMDAwMDAwMC4uMjYzMDRmZTk4Zgo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2Jv
YXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNmZwo+PiBAQCAtMCwwICsxLDI3IEBACj4+ICtpbWFn
ZSBib290LnZmYXQgewo+PiArwqDCoMKgIHZmYXQgewo+PiArwqDCoMKgwqDCoMKgwqAgZmlsZXMg
PSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ0aWJvb3QzLmJpbiIsCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJ0aXNwbC5iaW4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAi
dS1ib290LmltZyIsCj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvC
oMKgwqAgc2l6ZSA9IDE2TQo+PiArfQo+PiArCj4+ICtpbWFnZSBzZGNhcmQuaW1nIHsKPj4gK8Kg
wqDCoCBoZGltYWdlIHsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBwYXJ0aXRpb24gdS1i
b290IHsKPj4gK8KgwqDCoMKgwqDCoMKgIHBhcnRpdGlvbi10eXBlID0gMHhDCj4+ICvCoMKgwqDC
oMKgwqDCoCBib290YWJsZSA9ICJ0cnVlIgo+PiArwqDCoMKgwqDCoMKgwqAgaW1hZ2UgPSAiYm9v
dC52ZmF0Igo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHBhcnRpdGlvbiByb290ZnMgewo+
PiArwqDCoMKgwqDCoMKgwqAgcGFydGl0aW9uLXR5cGUgPSAweDgzCj4+ICvCoMKgwqDCoMKgwqDC
oCBpbWFnZSA9ICJyb290ZnMuZXh0NCIKPj4gK8KgwqDCoCB9Cj4+ICt9Cj4+IGRpZmYgLS1naXQg
YS9ib2FyZC90aS9hbTY0eF9zay9yZWFkbWUudHh0IGIvYm9hcmQvdGkvYW02NHhfc2svcmVhZG1l
LnR4dAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi45ZTE4NGM5
ODY2Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvYm9hcmQvdGkvYW02NHhfc2svcmVhZG1lLnR4
dAo+PiBAQCAtMCwwICsxLDQ5IEBACj4+ICtUZXhhcyBJbnN0dW1lbnRzIEFNNjR4IEV2YWx1YXRp
b24gTW9kdWxlcwo+PiArCj4+ICtEZXNjcmlwdGlvbgo+PiArPT09PT09PT09PT0KPj4gKwo+PiAr
VGhlc2UgY29uZmlndXJhdGlvbnMgd2lsbCBidWlsZCBhIGNvbXBsZXRlIGltYWdlIGFuZAo+PiAr
ZGV2aWNlIHRyZWUgYmxvYnMgZm9yIHRoZSB0aGUgVEkgQU02NHhfc2sgYm9hcmQuCj4+ICsKPj4g
K0hvdyB0byBidWlsZCBpdAo+PiArPT09PT09PT09PT09PT09Cj4+ICsKPj4gK1NlbGVjdCB0aGUg
ZGVmYXVsdCBjb25maWd1cmF0aW9uIGZvciB0aGUgdGFyZ2V0Ogo+PiArJCBtYWtlIGFtNjR4X3Nr
X2RlZmNvbmZpZwo+PiArCj4+ICtPcHRpb25hbDogbW9kaWZ5IHRoZSBjb25maWd1cmF0aW9uOgo+
PiArJCBtYWtlIG1lbnVjb25maWcKPj4gKwo+PiArQnVpbGQ6Cj4+ICskIG1ha2UKPj4gKwo+PiAr
UmVzdWx0IG9mIHRoZSBidWlsZDoKPj4gKz09PT09PT09PT09PT09PT09PT0KPj4gK291dHB1dC9p
bWFnZXMvCj4+ICsrLS0gc29jCj4+ICsrLS0gdGktY29ubmVjdGl2aXR5Cj4+ICsrLS0gYmwzMS5i
aW4KPj4gKystLSBib290LnZmYXQKPj4gKystLSBJbWFnZQo+PiArKy0tIGszLWFtNjQyLXNrLmR0
Ygo+PiArKy0tIHI1LXUtYm9vdC1zcGwuYmluCj4+ICsrLS0gcm9vdGZzLmV4dDIKPj4gKystLSBy
b290ZnMuZXh0NAo+PiArKy0tIHJvb3Rmcy50YXIKPj4gKystLSBzZGNhcmQuaW1nCj4+ICsrLS0g
dGVlLmJpbgo+PiArKy0tIHRlZS1oZWFkZXJfdjIuYmluCj4+ICsrLS0gdGVlLXBhZ2VhYmxlX3Yy
LmJpbgo+PiArKy0tIHRlZS1wYWdlcl92Mi5iaW4KPj4gKystLSB0aWJvb3QzLmJpbgo+PiArKy0t
IHRpc3BsLmJpbgo+PiArKy0tIHUtYm9vdC5pbWcKPj4gKwo+PiArVG8gY29weSB0aGUgaW1hZ2Ug
ZmlsZSB0byB0aGUgc2RjYXJkIHVzZSBkZDoKPj4gKyQgZGQgaWY9b3V0cHV0L2ltYWdlcy9zZGNh
cmQuaW1nIG9mPS9kZXYvc2RYCj4+ICsKPj4gK0luc2VydCB0aGUgU0RjYXJkIGludG8gdGhlIEFN
NjR4X3NrIGJvYXJkLCBhbmQgcG93ZXIgaXQgdXAgd2l0aAo+PiArYSBVU0IgVHlwZS1DIGNvbm5l
Y3Rvci4gVGhlIHN5c3RlbSBzaG91bGQgY29tZSB1cC4gWW91IGNhbiB1c2UKPj4gK2EgbWljcm8t
VVNCIHRvIGNvbm5lY3QgdG8gdGhlIGNvbm5lY3RvciBsYWJsZWQgTUFJTl9VQVJUMCB0bwo+PiAr
Y29tbXVuaWNhdGUgd2l0aCB0aGUgYm9hcmQuCj4+IGRpZmYgLS1naXQgYS9jb25maWdzL2FtNjR4
X3NrX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjYwYTRlZmNhZjAKPj4gLS0tIC9kZXYvbnVs
bAo+PiArKysgYi9jb25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZwo+PiBAQCAtMCwwICsxLDQ4IEBA
Cj4+ICtCUjJfYWFyY2g2ND15Cj4+ICtCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBw
b3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCj4+ICtCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9
Ii1jIGJvYXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNmZyIKPj4gK0JSMl9MSU5VWF9LRVJORUw9
eQo+PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4+ICtCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE5Igo+PiArQlIyX0xJTlVYX0tFUk5FTF9VU0Vf
QVJDSF9ERUZBVUxUX0NPTkZJRz15Cj4+ICtCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkK
Pj4gK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJ0aS9rMy1hbTY0Mi1zayIKPj4g
K0JSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQ9eQo+PiArQlIyX1BBQ0tBR0VfTElOVVhf
RklSTVdBUkU9eQo+PiArQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfVElfV0wxOFhYPXkKPj4g
K0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQo+PiArQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkK
Pj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKPj4gK0JSMl9UQVJHRVRfQVJN
X1RSVVNURURfRklSTVdBUkU9eQo+PiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9D
VVNUT01fVkVSU0lPTj15Cj4+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RP
TV9WRVJTSU9OX1ZBTFVFPSJ2Mi43LjAiCj4+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX1BMQVRGT1JNPSJrMyIKPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfVEFS
R0VUX0JPQVJEPSJsaXRlIgo+PiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9CTDMy
X09QVEVFPXkKPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQURESVRJT05BTF9W
QVJJQUJMRVM9IlNQRD1vcHRlZWQiCj4+ICtCUjJfVEFSR0VUX09QVEVFX09TPXkKPj4gK0JSMl9U
QVJHRVRfT1BURUVfT1NfQ1VTVE9NX0dJVD15Cj4+ICtCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RP
TV9SRVBPX1VSTD0iaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRlZV9vcy5naXQiIAo+Pgo+
PiArQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fUkVQT19WRVJTSU9OPSIzLjE4LjAiCj4+ICtC
UjJfVEFSR0VUX09QVEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFk9eQo+PiArQlIyX1RB
UkdFVF9PUFRFRV9PU19QTEFURk9STT0iazMiCj4+ICtCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dF
Tj15Cj4+ICtCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0M9ImFtNjR4Igo+PiArQlIyX1RB
UkdFVF9USV9LM19JTUFHRV9HRU5fQ09ORklHPSJldm0iCj4+ICtCUjJfVEFSR0VUX1RJX0szX1I1
X0xPQURFUl9CT0FSRD0iYW02NHhfZXZtIgo+PiArQlIyX1RBUkdFVF9VQk9PVD15Cj4+ICtCUjJf
VEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPj4gK0JSMl9UQVJHRVRfVUJPT1Rf
Q1VTVE9NX1ZFUlNJT049eQo+PiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iMjAyMi4xMC1yYzEiCj4+ICtCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0iYW02
NHhfZXZtX2E1MyIKPj4gK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKPj4gK0JSMl9UQVJH
RVRfVUJPT1RfTkVFRFNfT1BFTlNTTD15Cj4+ICtCUjJfVEFSR0VUX1VCT09UX05FRURTX0FURl9C
TDMxPXkKPj4gKyMgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQklOIGlzIG5vdCBzZXQKPj4gK0JS
Ml9UQVJHRVRfVUJPT1RfRk9STUFUX0lNRz15Cj4+ICtCUjJfVEFSR0VUX1VCT09UX1NQTD15Cj4+
ICtCUjJfVEFSR0VUX1VCT09UX1NQTF9OQU1FPSJ0aXNwbC5iaW4iCj4+ICtCUjJfVEFSR0VUX1VC
T09UX0NVU1RPTV9NQUtFT1BUUz0iVEVFPSQoQklOQVJJRVNfRElSKS90ZWUtcGFnZXJfdjIuYmlu
Igo+PiArQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKPj4gK0JSMl9QQUNLQUdFX0hPU1Rf
R0VOSU1BR0U9eQo+PiArQlIyX1BBQ0tBR0VfSE9TVF9NVE9PTFM9eQo+IAo+IEkndmUgYnVpbHQg
dGhpcyBkZWZjb25maWcgc3VjY2Vzc2Z1bGx5IGFuZCBldmVyeXRoaW5nIGxvb2tzIGdvb2QgdG8g
bWUKPiBleGNlcHQgSSd2ZSBzZWVuIG9ubHkgbm93IHlvdSBhZGQgYWxzbyBBbmFuZCBhcyBtYWlu
dGFpbmVyIG90aGVyIHRoYW4KPiB5b3UsIHNvIHdpdGggYSBtb3RpdmF0aW9uIG9mIHRoaXMgYW5k
IHRoZSAqaW1wcm92ZW1lbnQgcmVxdWVzdGVkIGFib3ZlCj4gaW4gY29tbWl0IGxvZyo6Cj4gUmV2
aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tPgo+IAo+IEJlc3QgcmVnYXJkcwoKSGkgR2l1bGlvLAoKVGhhbmtzIGEgbG90IGZvciB0
aGUgcmV2aWV3IGFuZCB0ZXN0aW5nLgoKSSBoYXZlIGZpeGVkIHRoZSBjb21taXQgbG9ncyBhbmQg
c2VudCBpbiB2NCBvZiB0aGUgcGF0Y2guCgpJJ2xsIG1hcmsgdGhlIHJlbGV2YW50IG9sZGVyIHZl
cnNpb25zIGFzIHN1cGVyc2VkZWQuCgpUaGFua3MgYWdhaW4uCgpYdWFuaGFvCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
