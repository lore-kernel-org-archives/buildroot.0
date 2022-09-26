Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FE3C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 15:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51AE182D0F;
	Mon, 26 Sep 2022 15:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51AE182D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9fr00ozUjCp; Mon, 26 Sep 2022 15:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B62682CE4;
	Mon, 26 Sep 2022 15:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B62682CE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51A9F1BF3A6
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 15:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13C3460FB1
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 15:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C3460FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOmTuEF45El8 for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 15:51:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86FC860681
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86FC860681
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 15:51:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28QFopUg068779;
 Mon, 26 Sep 2022 10:50:51 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28QFopJT128658
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Sep 2022 10:50:51 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 26
 Sep 2022 10:50:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 26 Sep 2022 10:50:51 -0500
Received: from [10.250.33.43] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28QFookZ014653;
 Mon, 26 Sep 2022 10:50:51 -0500
Message-ID: <e274882b-626b-eb08-15a0-c7b6ac68eb7a@ti.com>
Date: Mon, 26 Sep 2022 10:50:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Anand Gadiyar <gadiyar@ti.com>, <buildroot@buildroot.org>
References: <20220923205543.1518798-1-gadiyar@ti.com>
 <20220923205543.1518798-3-gadiyar@ti.com>
In-Reply-To: <20220923205543.1518798-3-gadiyar@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1664207451;
 bh=yzJRtk664j4LJEU38W4ZKwA/e0Z3o91vcQqqL1sBrRE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=oq1t9PPOzOEEoGFjycJdsCz6udaMa4Ij/+nk5Cch9obWH59COuJjcjpsTwEKHLdQA
 +rpJbLK3rWLR/ePvQOA5nArF/0zh7QYTS/P+j/9SLNpAWsmRMXiUdAi5htXYzwcPmj
 kZzX6QrouJiKcZizsQu2t7lnxtSXbn1MhXDVVbKc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=oq1t9PPO
Subject: Re: [Buildroot] [PATCH v5 2/3] boot/ti-k3-image-gen: add new package
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
From: Andrew Davis via buildroot <buildroot@buildroot.org>
Reply-To: Andrew Davis <afd@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOS8yMy8yMiAzOjU1IFBNLCBBbmFuZCBHYWRpeWFyIHdyb3RlOgo+IEZyb206IFh1YW5oYW8g
U2hpIDx4LXNoaUB0aS5jb20+Cj4gCj4gVGhpcyBpcyB0aGUgaW1hZ2UgZ2VuZXJhdG9yIHRoYXQg
YnVpbGRzIHRoZSBmdWxsIGJvb3QgYmluYXJ5LAo+IHRpYm9vdDMuYmluLCBmb3IgdGhlIFI1IGNv
cmUgb24gVEkncyBrMyBkZXZpY2VzLgo+IFRoaXMgcmVxdWlyZXMgdGhlIFI1IHNwbCBvdXRwdXQg
ZnJvbSB0aGUgdGktazMtcjUtbG9hZGVyIHBhY2thZ2UuCj4gCj4gaHR0cHM6Ly9naXQudGkuY29t
L2NnaXQvazMtaW1hZ2UtZ2VuL2szLWltYWdlLWdlbgo+IAo+IFNpZ25lZC1vZmYtYnk6IFh1YW5o
YW8gU2hpIDx4LXNoaUB0aS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5hbmQgR2FkaXlhciA8Z2Fk
aXlhckB0aS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0
aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IC0tLQo+ICAgREVWRUxPUEVSUyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwo+ICAgYm9vdC9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICBib290L3RpLWszLWltYWdlLWdlbi9Db25maWcu
aW4gICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrCj4gICBib290L3RpLWszLWltYWdl
LWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaCB8ICAyICsrCj4gICBib290L3RpLWszLWltYWdlLWdl
bi90aS1rMy1pbWFnZS1nZW4ubWsgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrCj4gICA1
IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBi
b290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290
L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaAo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawo+IAo+IGRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDVmMzZjYmY1MzUuLjgxZjA5NWY3
OTkgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMTI5
LDYgKzEyOSw3IEBAIEY6CXBhY2thZ2UvbGlieG1scnBjLwo+ICAgRjoJcGFja2FnZS9weXRob24t
ZG9jb3B0Lwo+ICAgCj4gICBOOglBbmFuZCBHYWRpeWFyIDxnYWRpeWFyQHRpLmNvbT4KPiArRjoJ
Ym9vdC90aS1rMy1pbWFnZS1nZW4vCj4gICBGOglib290L3RpLWszLXI1LWxvYWRlci8KPiAgIAo+
ICAgTjoJQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgo+IEBAIC0zMDY3LDYgKzMwNjgs
NyBAQCBOOglXb2pjaWVjaCBOaXppxYRza2kgPG5pemlha0BzcG94Lm9yZz4KPiAgIEY6CXBhY2th
Z2UvZnd1cC8KPiAgIAo+ICAgTjoJWHVhbmhhbyBTaGkgPFgxNTAwMDE3N0BnbWFpbC5jb20+Cj4g
K0Y6CWJvb3QvdGktazMtaW1hZ2UtZ2VuLwo+ICAgRjoJYm9vdC90aS1rMy1yNS1sb2FkZXIvCj4g
ICAKPiAgIE46CVlhaXIgQmVuIEF2cmFoYW0gPHlhaXJiYUBwcm90b25tYWlsLmNvbT4KPiBkaWZm
IC0tZ2l0IGEvYm9vdC9Db25maWcuaW4gYi9ib290L0NvbmZpZy5pbgo+IGluZGV4IGNlMTdiMmRm
NmIuLjFiMjViYWNmZWUgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9Db25maWcuaW4KPiArKysgYi9ib290
L0NvbmZpZy5pbgo+IEBAIC0yMiw2ICsyMiw3IEBAIHNvdXJjZSAiYm9vdC9zNTAwLWJvb3Rsb2Fk
ZXIvQ29uZmlnLmluIgo+ICAgc291cmNlICJib290L3NoaW0vQ29uZmlnLmluIgo+ICAgc291cmNl
ICJib290L3N1bjIwaS1kMS1zcGwvQ29uZmlnLmluIgo+ICAgc291cmNlICJib290L3N5c2xpbnV4
L0NvbmZpZy5pbiIKPiArc291cmNlICJib290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4iCj4g
ICBzb3VyY2UgImJvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiIKPiAgIHNvdXJjZSAiYm9v
dC91Ym9vdC9Db25maWcuaW4iCj4gICBzb3VyY2UgImJvb3QvdmV4cHJlc3MtZmlybXdhcmUvQ29u
ZmlnLmluIgo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4gYi9i
b290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAuLjAwNDE2ZGNlZmMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9vdC90
aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4gQEAgLTAsMCArMSwyNCBAQAo+ICtjb25maWcgQlIy
X1RBUkdFVF9USV9LM19JTUFHRV9HRU4KPiArCWJvb2wgInRpLWszLWltYWdlLWdlbiIKPiArCXNl
bGVjdCBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUgo+ICsJaGVscAo+ICsJICBVc2UgVEkncyBr
My1pbWFnZS1nZW4gdG8gYnVpbGQgYSBzZXBhcmF0ZSBiYXJlIG1ldGFsCj4gKwkgIGJvb3QgYmlu
YXJ5IGZyb20gYSBzZXBhcmF0ZSBzcGwuIEN1cnJlbnRseSBzdXBwb3J0cwo+ICsJICB2ZXJzaW9u
IDA4LjA0LjAwLjAwNSBhcyBkZWZhdWx0Lgo+ICsKPiArCSAgaHR0cHM6Ly9naXQudGkuY29tL2Nn
aXQvazMtaW1hZ2UtZ2VuL2szLWltYWdlLWdlbi8KPiArCj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJ
X0szX0lNQUdFX0dFTl9TT0MKPiArCXN0cmluZyAiU09DIHR5cGUgZm9yIGltYWdlIGdlbiIKPiAr
CWRlcGVuZHMgb24gQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU4KPiArCWhlbHAKPiArCSAgVGhl
IHRhcmdldCBTb0Mgb3B0aW9uIGZvciBpbWFnZSBnZW4uCj4gKwkgIEZvciBleGFtcGxlLCAiYW02
NHgiIGZvciBBTTY0WCBib2FyZHMuCj4gKwoKCkkgY2FuIGFkZCB0aGlzIGluIGFuIGFkZC1vbiBw
YXRjaCBsYXRlciwgYnV0IGlmIHRoaXMgcGF0Y2ggbmVlZHMgcmUtc3B1bgpmb3Igc29tZSBvdGhl
ciByZWFzb24sIGZlZWwgZnJlZSB0byBhZGQgaXQgaGVyZS4KCldlIG5lZWQgb25lIG1vcmUgb3B0
aW9uIGZvciAidHlwZSIKCj5jb25maWcgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fVFlQRQo+
CXN0cmluZyAiU09DIHNlY3VyaXR5IHR5cGUgZm9yIGltYWdlIGdlbiIKPglkZXBlbmRzIG9uIEJS
Ml9UQVJHRVRfVElfSzNfSU1BR0VfR0VOCj4JaGVscAo+CSAgVGhlIHNlY3VyaXR5IHR5cGUgb3B0
aW9uIGZvciBpbWFnZSBnZW4uCj4JICBPcHRpb25zIGFyZSAiZ3AiLCAiaHMtZnMiLCBvciAiaHMt
c2UiLgoKYW5kIHVzZWQgYXMgYW5vdGhlciBtYWtlIHNldHRpbmcgYmVsb3cgYXMKCj5TT0NfVFlQ
RT0kKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fVFlQRSkpIFwKCm90
aGVyd2lzZSBMR1RNLAoKQWNrZWQtYnk6IEFuZHJldyBEYXZpcyA8YWZkQHRpLmNvbT4KCkFuZHJl
dwoKCj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9DT05GSUcKPiArCXN0cmlu
ZyAiQ09ORklHIHR5cGUgZm9yIGltYWdlIGdlbiIKPiArCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9U
SV9LM19JTUFHRV9HRU4KPiArCWhlbHAKPiArCSAgVGhlIGJvYXJkIGNvbmZpZyBvcHRpb24gZm9y
IGltYWdlIGdlbi4KPiArCSAgVXN1YWxseSAic2siIG9yICJldm0iLgo+ICsKPiBkaWZmIC0tZ2l0
IGEvYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLmhhc2ggYi9ib290L3RpLWsz
LWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMC4uZTMwN2EwMmE2Nwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9ib290
L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaAo+IEBAIC0wLDAgKzEsMiBAQAo+
ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYgIGU1ODVkYzg2OGFkYTIxZWYzMzg5MTU5
NTQxZDY2OWI4OGJjNDA2YjQ1MzQ3MGU5MmRhODVkOTIyMmQyNzFjOTYgIGszLWltYWdlLWdlbi0w
OC4wNC4wMC4wMDUudGFyLmd6Cj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3Rp
LWszLWltYWdlLWdlbi5tayBiL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5t
awo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMWY5NzQ5MDM5Mgo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9ib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1n
ZW4ubWsKPiBAQCAtMCwwICsxLDMzIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMK
PiArIyB0aS1rMy1pbWFnZS1nZW4KPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsK
PiArVElfSzNfSU1BR0VfR0VOX1ZFUlNJT04gPSAwOC4wNC4wMC4wMDUKPiArVElfSzNfSU1BR0Vf
R0VOX1NJVEUgPSBodHRwczovL2dpdC50aS5jb20vY2dpdC9rMy1pbWFnZS1nZW4vazMtaW1hZ2Ut
Z2VuL3NuYXBzaG90Cj4gK1RJX0szX0lNQUdFX0dFTl9TT1VSQ0UgPSBrMy1pbWFnZS1nZW4tJChU
SV9LM19JTUFHRV9HRU5fVkVSU0lPTikudGFyLmd6Cj4gK1RJX0szX0lNQUdFX0dFTl9MSUNFTlNF
ID0gQlNELTMtQ2xhdXNlCj4gK1RJX0szX0lNQUdFX0dFTl9MSUNFTlNFX0ZJTEVTID0gc3lzdGVt
LWZpcm13YXJlLWltYWdlLWdlbi0xLjAtbWFuaWZlc3QuaHRtbAo+ICtUSV9LM19JTUFHRV9HRU5f
SU5TVEFMTF9JTUFHRVMgPSBZRVMKPiArVElfSzNfSU1BR0VfR0VOX0RFUEVOREVOQ0lFUyA9IGhv
c3QtYXJtLWdudS10b29sY2hhaW4gdGktazMtcjUtbG9hZGVyCj4gK1RJX0szX0lNQUdFX0dFTl9N
QUtFID0gJChCUjJfTUFLRSkKPiArVElfSzNfSU1BR0VfR0VOX1NPQyA9ICQoY2FsbCBxc3RyaXAs
JChCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0MpKQo+ICtUSV9LM19JTUFHRV9HRU5fQ09O
RklHID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX0NPTkZJRykp
Cj4gK1RJX0szX0lNQUdFX0dFTl9NQUtFX09QVFMgPSBcCj4gKwlTT0M9JChUSV9LM19JTUFHRV9H
RU5fU09DKSBcCj4gKwlDT05GSUc9JChUSV9LM19JTUFHRV9HRU5fQ09ORklHKSBcCj4gKwlDUk9T
U19DT01QSUxFPSQoSE9TVF9BUk1fR05VX1RPT0xDSEFJTl9JTlNUQUxMX0RJUikvYmluL2FybS1u
b25lLWVhYmktIFwKPiArCVNCTD0kKEJJTkFSSUVTX0RJUikvcjUtdS1ib290LXNwbC5iaW4gXAo+
ICsJTz0kKEJJTkFSSUVTX0RJUikgXAo+ICsJQklOX0RJUj0kKEJJTkFSSUVTX0RJUikKPiArCj4g
K2RlZmluZSBUSV9LM19JTUFHRV9HRU5fQlVJTERfQ01EUwo+ICsJJChUSV9LM19JTUFHRV9HRU5f
TUFLRSkgLUMgJChARCkgJChUSV9LM19JTUFHRV9HRU5fTUFLRV9PUFRTKQo+ICtlbmRlZgo+ICsK
PiArZGVmaW5lIFRJX0szX0lNQUdFX0dFTl9JTlNUQUxMX0lNQUdFU19DTURTCj4gKwljcCAkKEBE
KS90aWJvb3QzLmJpbiAkKEJJTkFSSUVTX0RJUikKPiArZW5kZWYKPiArCj4gKyQoZXZhbCAkKGdl
bmVyaWMtcGFja2FnZSkpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
