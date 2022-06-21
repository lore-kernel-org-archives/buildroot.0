Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7D3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 09:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D0E419A9;
	Tue, 21 Jun 2022 09:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3D0E419A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPr71r3Csg6X; Tue, 21 Jun 2022 09:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56A1E41993;
	Tue, 21 Jun 2022 09:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A1E41993
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9155D1BF429
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 09:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79FF640B92
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 09:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79FF640B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NxbNV2pmAa6x for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 09:32:54 +0000 (UTC)
X-Greylist: delayed 00:09:53 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8BC40025
Received: from smtpout4.mo529.mail-out.ovh.net
 (smtpout4.mo529.mail-out.ovh.net [217.182.185.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A8BC40025
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 09:32:54 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.238])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 76BA910F2ED4D;
 Tue, 21 Jun 2022 11:17:01 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 21 Jun
 2022 11:17:00 +0200
X-OVh-ClientIp: 82.64.250.170
Message-ID: <278ae830-93b2-e0be-9f1c-164b88248497@kaod.org>
Date: Tue, 21 Jun 2022 11:17:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, <buildroot@buildroot.org>
References: <20220606135756.2264709-1-clg@kaod.org>
 <20220606135756.2264709-2-clg@kaod.org>
 <1ae45d2d-5619-c740-58b3-4623e9587b30@mind.be>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1ae45d2d-5619-c740-58b3-4623e9587b30@mind.be>
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d65e516e-f619-4888-ba47-29c1cdbe97c2
X-Ovh-Tracer-Id: 10127751137483590563
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeffedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdfovfetjfhoshhtpehmohehvdel
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003b9f1e199-46cf-4101-8db4-0d49e806ec20,
 968046EEA762EFF7637E46B232C9329570CD0A04) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/aspeed_ast2500evb: new
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
Cc: chin-ting_kuo@aspeedtech.com, troy_lee@aspeedtech.com,
 Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNi8yMC8yMiAyMjowNCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gCj4gCj4gT24g
MDYvMDYvMjAyMiAxNTo1NywgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFRoZSBrZXJuZWwg
aXMgZnJvbSB1cHN0cmVhbSB3aXRoIGEgY3VzdG9tIGNvbmZpZyBiZWNhdXNlIHRoZSBkZWZhdWx0
Cj4+ICdhc3BlZWRfZzUnIGRlZmNvbmZpZyBidWlsZHMgYSB6SW1hZ2UgZmlsZSBpbWFnZSB0b28g
YmlnIGZvciB0aGUgZmxhc2gKPj4gbGF5b3V0Lgo+IAo+ICDCoFN0aWxsLCB3ZSBwcmVmZXIgdG8g
dXNlIHRoZSBpbi10cmVlIGRlZmNvbmZpZyB3aXRoIGEgZnJhZ21lbnQgdG8gcmVtb3ZlIHRoZSBz
dHVmZiB0aGF0IGlzIG5vdCBuZWVkZWQuCgpJIGhhZCB0aGF0IGJlZm9yZS4gSSB3aWxsIHJlZnJl
c2ggdGhlIHBhdGNoLgoKPj4gVS1Cb290IGlzIGZyb20gdGhlIE9wZW5CTUMgYnJhbmNoIHdoZXJl
IG1vc3Qgb2YgZGV2ZWxvcG1lbnQgaXMKPj4gZG9uZS4gTGF0ZXN0IG1haW5saW5lIHNob3VsZCB3
b3JrLgo+IAo+ICDCoEluIHRoYXQgY2FzZSwgd2UgZ2VuZXJhbGx5IHByZWZlciB0aGUgbWFpbmxp
bmUgdGhlbi4KCm9rLiBJIHdpbGwgZ2l2ZSBpdCB0cnkuIEFueWhvdywgd2Ugc2hvdWxkIGltcHJv
dmUgb3VyIHVwc3RyZWFtIHN1cHBvcnQuCiAgCj4+IFRoZSBtYWluIHJlc3VsdGluZyBmaWxlIGZy
b20gdGhlIGJ1aWxkIGlzIGEgZmxhc2ggaW1hZ2UuIFRoZSBwYXJ0aXRpb24KPj4gbGF5b3V0IG1h
dGNoZXMgdGhlIE9wZW5CTUMgb25lIGZvciAzMk0gY2hpcHMuIEl0IG1ha2VzIGl0IGVhc2llciB0
bwo+PiB1cGRhdGUgdGhlIGRpZmZlcmVudCBwYXJ0aXRpb25zIGZyb20gTGludXguIEludGVybWVk
aWF0ZSBmaWxlcyBjYW4gYmUKPj4gdXNlZCB0byBib290IGZyb20gVS1ib290IG92ZXIgdGhlIG5l
dHdvcmsgb3IgdG8gYm9vdCBRRU1VIHVzaW5nCj4+IC1rZXJuZWwvLWluaXRyZC8tZHRiLgo+IAo+
ICDCoE9vaCwgdmVyeSBuaWNlIHRoYXQgdGhlIHNhbWUgY29uZmlnIGNhbiBiZSBib290ZWQgaW4g
cWVtdSBhcyB3ZWxsIQoKWWVzLiBUaGUgc2FtZSBmbGFzaCBpbWFnZSBjYW4gYmUgdXNlZCBmb3Ig
UUVNVSBhbHNvLiBJIGRpZG4ndCBrbm93CmhvdyB0byBhZGQgYSBRRU1VIHRlc3QgZm9yIGEgbm9u
LVFFTVUgYm9hcmQgZm9yIGl0IGJ1dCB0aGF0J2QgYmUKbmljZS4KCj4gCj4gIMKgQWxzbywgc2Ft
ZSBjb21tZW50cyBhcyBmb3IgdGhlIGZpcnN0IHBhdGNoLgoKVGhhbmtzLAoKQy4KCgogIAo+IAo+
ICDCoFJlZ2FyZHMsCj4gIMKgQXJub3V0Cj4gCj4+Cj4+IFJldmlld2VkLWJ5OiBKb2VsIFN0YW5s
ZXkgPGpvZWxAam1zLmlkLmF1Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8
Y2xnQGthb2Qub3JnPgo+PiAtLS0KPj4KPj4gwqAgQ2hhbmdlcyBpbiB2MjoKPj4KPj4gwqAgLSBt
aW5vciBjbGVhbnVwcyBpbiByZWFkbWUudHh0Cj4+IMKgIGJvYXJkL2FzcGVlZC9hc3QyNTAwLWV2
Yi9nZW5pbWFnZS5jZmfCoMKgIHzCoCA0MCArKysrCj4+IMKgIGJvYXJkL2FzcGVlZC9hc3QyNTAw
LWV2Yi9saW51eC5jb25maWfCoMKgIHwgMjYyICsrKysrKysrKysrKysrKysrKysrKysrKwo+PiDC
oCBib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvcmVhZG1lLnR4dMKgwqDCoMKgIHzCoCA4MCArKysr
KysrKwo+PiDCoCBib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvdWJvb3QuZnJhZ21lbnQgfMKgwqAg
MSArCj4+IMKgIGNvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnwqDCoMKgwqAgfMKg
IDU4ICsrKysrKwo+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDQ0MSBpbnNlcnRpb25zKCspCj4+IMKg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvZ2VuaW1hZ2UuY2Zn
Cj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvbGludXgu
Y29uZmlnCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIv
cmVhZG1lLnR4dAo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvYXNwZWVkL2FzdDI1MDAt
ZXZiL3Vib290LmZyYWdtZW50Cj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2FzcGVl
ZF9hc3QyNTAwZXZiX2RlZmNvbmZpZwo+IAo+IFtzbmlwXQo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
