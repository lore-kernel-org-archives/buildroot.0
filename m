Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2329CC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 17:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9639340C5F;
	Tue, 20 Sep 2022 17:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9639340C5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjQeFop_KRgp; Tue, 20 Sep 2022 17:18:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FD5340C57;
	Tue, 20 Sep 2022 17:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FD5340C57
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C44D41BF2CE
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 17:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FFA740A1D
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 17:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FFA740A1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lG-oarpO4-NX for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 17:18:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1A4D40194
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net
 [46.105.37.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1A4D40194
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 17:18:52 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E6599238DC;
 Tue, 20 Sep 2022 17:09:40 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 20 Sep
 2022 19:09:40 +0200
X-OVh-ClientIp: 82.64.250.170
Message-ID: <67a21fcf-03ce-0eb7-8e19-0ae171057d5b@kaod.org>
Date: Tue, 20 Sep 2022 19:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, Joel Stanley <joel@jms.id.au>,
 <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-4-joel@jms.id.au>
 <c1b32b94-df43-96ad-72e0-8a6592e042fb@mind.be>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c1b32b94-df43-96ad-72e0-8a6592e042fb@mind.be>
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 31a72060-1764-4649-9d34-4fd4e0efc11a
X-Ovh-Tracer-Id: 17569668047599864681
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfehieejleffgfekteduledvffeiiefgudehfedukeeijeevhfdtvefhfedtffdtnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehhedv
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0060c0bb310-b477-4f6f-af83-e5be8bfd84ab,
 441AFC317D3E5D064EE6C0DCC588AAD1A9B9E513) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only
 on CPUs that support it
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOS8xOC8yMiAxMjoyMywgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gCj4gCj4gT24g
MjkvMDcvMjAyMiAwMjowOCwgSm9lbCBTdGFubGV5IHdyb3RlOgo+PiBJbnZhbGlkIGNvbmZpZ3Vy
YXRpb25zIGxlYWQgdG8gYnVpbGQgZmFpbHVyZXMsIHN1Y2ggYXMgdHJ5aW5nIHRvIGVuYWJsZQo+
PiBwcGM2NGxlIGZvciB0aGUgcHBjOTcwOgo+Pgo+PiDCoMKgIGh0dHA6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm5ldC9yZXN1bHRzL2ZkYTg4Njc2OGZjZTI1Y2NkOWI1MmI2MzVmZjViMTNkYTdiYTJk
MGMvCj4+Cj4+IEluIG9yZGVyIHRvIHJ1biBhIHBwYzY0bGUgdXNlcnNwYWNlIGEga2VybmVsIHRo
YXQgcnVucyBpbiB0aGlzIG1vZGUgaXMKPj4gcmVxdWlyZWQuIFRoZSBvbmx5IENQVSBzdXBwb3J0
ZWQgaW4gYnVpbGRyb290IHRoYXQgY2FuIGJvb3QgYSBwcGM2NGxlCj4+IGtlcm5lbCBpcyBQb3dl
cjgsIHNvIG1hcmsgYWxsIG9mIHRoZSBvdGhlciA2NC1iaXQgY2FwYWJsZSBDUFVzIGFzIG5vdAo+
PiBzdXBwb3J0aW5nIHBwYzY0bGUuCj4+Cj4+IFRoaXMgZHJvcHMgdGhlIGNvbW1lbnQgYWJvdXQg
bGliYywgd2hpY2ggaXMgdHJ1ZSBidXQgZG9lc24ndCB0ZWxsIHRoZQo+PiB3aG9sZSBzdG9yeS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPiAKPiAg
wqBBcHBsaWVkIHRvIG1hc3RlciB3aXRoIHNvbWUgY2hhbmdlcywgc2VlIGJlbG93Lgo+IAo+PiAt
LS0KPj4gwqAgYXJjaC9Db25maWcuaW4ucG93ZXJwYyB8IDExICsrKysrKystLS0tCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjIGIvYXJjaC9Db25maWcuaW4ucG93ZXJwYwo+
PiBpbmRleCA4ZDM5MmJmZGU4MTQuLjdjNmFlODQzNDhlOSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9D
b25maWcuaW4ucG93ZXJwYwo+PiArKysgYi9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjCj4+IEBAIC03
MSwxMSArNzEsOSBAQCBjb25maWcgQlIyX3Bvd2VycGNfNjA0ZQo+PiDCoMKgwqDCoMKgIGRlcGVu
ZHMgb24gIUJSMl9BUkNIX0lTXzY0Cj4+IMKgIGNvbmZpZyBCUjJfcG93ZXJwY182MjAKPj4gwqDC
oMKgwqDCoCBib29sICI2MjAiCj4+IC3CoMKgwqAgIyBObyBDIGxpYnJhcnkgc3VwcG9ydHMgdGhp
cyB2YXJpYW50IG9uIHBwYzY0bGUKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uICFCUjJfcG93ZXJw
YzY0bGUKPj4gwqAgY29uZmlnIEJSMl9wb3dlcnBjXzYzMAo+PiDCoMKgwqDCoMKgIGJvb2wgIjYz
MCIKPj4gLcKgwqDCoCAjIE5vIEMgbGlicmFyeSBzdXBwb3J0cyB0aGlzIHZhcmlhbnQgb24gcHBj
NjRsZQo+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9wb3dlcnBjNjRsZQo+PiDCoCBjb25m
aWcgQlIyX3Bvd2VycGNfNzQwCj4+IMKgwqDCoMKgwqAgYm9vbCAiNzQwIgo+PiBAQCAtMTAyLDYg
KzEwMCw3IEBAIGNvbmZpZyBCUjJfcG93ZXJwY184NjAKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9u
ICFCUjJfQVJDSF9JU182NAo+PiDCoCBjb25maWcgQlIyX3Bvd2VycGNfOTcwCj4+IMKgwqDCoMKg
wqAgYm9vbCAiOTcwIgo+PiArwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9wb3dlcnBjNjRsZQo+IAo+
ICDCoEFzIHN1Z2dlc3RlZCBieSBUaG9tYXMsIEkgY2hhbmdlZCB0aGlzIHRvIHBvc2l0aXZlIGxv
Z2ljLiBJJ2xsIGFsc28gcHVzaCBhIGZvbGxvdy11cCBwYXRjaCB0aGF0IGNoYW5nZXMgdGhlIHJl
c3Qgb2YgdGhlIGZpbGUgdG8gcG9zaXRpdmUgbG9naWMuCj4gCj4gIMKgQ291bGQgeW91IChvciBh
bnkgb3RoZXIgcG93ZXJwYyAiZXhwZXJ0IikgcmV2aWV3IHRoZSBjb25kaXRpb25zIHRvIGJlIHN1
cmUgdGhlIGFyY2hpdGVjdHVyZSBzZWxlY3Rpb24gb3B0aW9ucyBhcmUgY29ycmVjdCBub3c/Cj4g
Cj4+IMKgwqDCoMKgwqAgc2VsZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQwo+PiDCoCBj
b25maWcgQlIyX3Bvd2VycGNfODU0MAo+PiDCoMKgwqDCoMKgIGJvb2wgIjg1NDAgLyBlNTAwdjEi
Cj4+IEBAIC0xMjksMjEgKzEyOCwyNSBAQCBjb25maWcgQlIyX3Bvd2VycGNfZTY1MDAKPj4gwqDC
oMKgwqDCoCBzZWxlY3QgQlIyX1BPV0VSUENfQ1BVX0hBU19BTFRJVkVDCj4+IMKgIGNvbmZpZyBC
UjJfcG93ZXJwY19wb3dlcjQKPj4gwqDCoMKgwqDCoCBib29sICJwb3dlcjQiCj4+IC3CoMKgwqAg
IyBObyBDIGxpYnJhcnkgc3VwcG9ydHMgdGhpcyB2YXJpYW50IG9uIHBwYzY0bGUKPj4gwqDCoMKg
wqDCoCBkZXBlbmRzIG9uICFCUjJfcG93ZXJwYzY0bGUKPj4gwqAgY29uZmlnIEJSMl9wb3dlcnBj
X3Bvd2VyNQo+PiDCoMKgwqDCoMKgIGJvb2wgInBvd2VyNSIKPj4gLcKgwqDCoCAjIE5vIEMgbGli
cmFyeSBzdXBwb3J0cyB0aGlzIHZhcmlhbnQgb24gcHBjNjRsZQo+PiDCoMKgwqDCoMKgIGRlcGVu
ZHMgb24gIUJSMl9wb3dlcnBjNjRsZQo+PiArwqDCoMKgIGRlcGVuZHMgb24gQlIyX0FSQ0hfSVNf
NjQKPiAKPiAgwqBBRkFJVSwgYWxsIFBPV0VSIENQVXMgYXJlIGFibGUgdG8gcnVuIGluIDMyLWJp
dCBtb2RlIAoKeWVzLiBUaGUgcXVlc3Rpb24gaXMgbW9yZSA6IGNhbiB3ZSBnZW5lcmF0ZSBjb3Jy
ZWN0bHkgMzItYml0IHNvZnR3YXJlCmZvciBhbGwgdGhlc2UgQ1BVcyA/IGZpcm13YXJlLCBrZXJu
ZWwgYW5kIHVzZXJzcGFjZS4gSSBkb3VidCB3ZSBoYXZlCmNvcnJlY3Qgc3VwcG9ydCBmb3Igb2xk
ZXIgQ1BVcy4KCj4gYW5kIEkgYmVsaWV2ZSBpdCdzIGV2ZW4gcG9zc2libGUgdG8gcnVuIGEgNjQt
Yml0IGtlcm5lbCB3aXRoIDMyLWJpdCB1c2Vyc3BhY2UgbGlrZSBvbiBBUk0uIAo+IElzIHRoaXMg
bm90IHRydWU/CgpJdCBpcy4gVGhpcyBpcyBjaGVja2VkIG9uIG9sZGVyIENQVXMsIGxpa2UgRzUs
IHVuZGVyIFFFTVUgYnV0IDMyYml0IGlzCmJpdC1yb3R0aW5nIGluIG1hbnkgcGxhY2VzLgoKPiAK
PiAgwqBJZiBQT1dFUjUrIHJlYWxseSBjYW4ndCBydW4gaW4gMzItYml0IG1vZGUgKG9yIHRoaXMg
aXMgbm90IHN1cHBvcnRlZCBieSB0aGUga2VybmVsKSwgCgpJIHRoaW5rIHRoZXJlIGlzIGFuIGlz
c3VlIHdpdGggdGhlIHVzZSBvZiB0aGUgcmZpIGluc3RydWN0aW9uIGluIDMyLWJpdAptb2RlIHdo
aWNoIHdhcyByZW1vdmVkIGZyb20gdGhlIElTQSBvZiBzZXJ2ZXIgQ1BVcy4gWW91IGNhbiBub3Qg
Z2VuZXJhdGUKYSAzMmJpdCBrZXJuZWwgZm9yIHN1Y2ggQ1BVcyBBRkFJUgoKPiBhcmUgeW91IHN1
cmUgdGhhdCB0aGlzICppcyogcG9zc2libGUgb24gUE9XRVI0PwoKUE9XRVI0IHN1cHBvcnQgd2Fz
IHJlbW92ZWQgZnJvbSBMaW51eCB+NCB5ZWFycyBhZ28uCiAgCj4gIMKgSW4gZWl0aGVyIGNhc2Us
IGlmIHRoZSBjdXJyZW50IGNvbmRpdGlvbnMgYXJlIG5vdCBjb3JyZWN0LCBwbGVhc2Ugc2VuZCAK
PiBhIGZvbGxvdy11cCBwYXRjaCB0byBmaXggdGhlbSBldmVuIG1vcmUuCgpJdCBpcyBzYWZlciB0
byBidWlsZCBhbGwgNjQtYml0IChrZXJuZWwgKyB1c2Vyc3BhY2UpIGZvciBzZXJ2ZXIgQ1BVcy4K
ICAKPj4gwqAgY29uZmlnIEJSMl9wb3dlcnBjX3Bvd2VyNgo+PiDCoMKgwqDCoMKgIGJvb2wgInBv
d2VyNiIKPj4gK8KgwqDCoCBkZXBlbmRzIG9uICFCUjJfcG93ZXJwYzY0bGUKPj4gK8KgwqDCoCBk
ZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4gCj4gIMKgU28gaGVyZSBJIHdyb3RlIHRoZSBjb25k
aXRpb24gYXMKPiAKPiAgwqDCoMKgwqBkZXBlbmRzIG9uIEJSMl9wb3dlcnBjIHx8IEJSMl9wb3dl
cnBjNjQKPiAKPiBiZWNhdXNlIEkgZG8gYmVsaWV2ZSBpdCBzdXBwb3J0cyAzMi1iaXQuCgpUaGVz
ZSBkZWZpbml0aW9ucyBjYW4gYmUgcHJvYmxlbWF0aWMgOgoKICAgY29uZmlnIEJSMl9wb3dlcnBj
X3Bvd2VyeAoJICBib29sICJwb3dlcngiCgkgIGRlcGVuZHMgb24gQlIyX3Bvd2VycGMgfHwgQlIy
X3Bvd2VycGM2NAoKYmVjYXVzZSB0aGV5IGltcGx5IHRoYXQgdGhlIGtlcm5lbCBjb3VsZCBiZSBi
dWlsdCBpbiAzMmJpdC4gU2VlIGFib3ZlLgoKVGhhbmtzLAoKQy4KCj4gCj4gIMKgUmVnYXJkcywK
PiAgwqBBcm5vdXQKPiAKPj4gwqDCoMKgwqDCoCBzZWxlY3QgQlIyX1BPV0VSUENfQ1BVX0hBU19B
TFRJVkVDCj4+IMKgIGNvbmZpZyBCUjJfcG93ZXJwY19wb3dlcjcKPj4gwqDCoMKgwqDCoCBib29s
ICJwb3dlcjciCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiAhQlIyX3Bvd2VycGM2NGxlCj4+ICvCoMKg
wqAgZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NAo+PiDCoMKgwqDCoMKgIHNlbGVjdCBCUjJfUE9X
RVJQQ19DUFVfSEFTX0FMVElWRUMKPj4gwqDCoMKgwqDCoCBzZWxlY3QgQlIyX1BPV0VSUENfQ1BV
X0hBU19WU1gKPj4gwqAgY29uZmlnIEJSMl9wb3dlcnBjX3Bvd2VyOAo+PiDCoMKgwqDCoMKgIGJv
b2wgInBvd2VyOCIKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4+IMKgwqDC
oMKgwqAgc2VsZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQwo+PiDCoMKgwqDCoMKgIHNl
bGVjdCBCUjJfUE9XRVJQQ19DUFVfSEFTX1ZTWAo+PiDCoCBlbmRjaG9pY2UKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
