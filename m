Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AA1C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 06:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A0248136D;
	Fri, 29 Jul 2022 06:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A0248136D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BsZBBJibdadE; Fri, 29 Jul 2022 06:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3AE181362;
	Fri, 29 Jul 2022 06:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3AE181362
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BCDA1BF3B9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 06:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9514416A3
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 06:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9514416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5X_PDxmMfBR for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 06:48:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E1AB41615
Received: from 1.mo552.mail-out.ovh.net (1.mo552.mail-out.ovh.net
 [178.32.96.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E1AB41615
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 06:48:43 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.159])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1379F23199;
 Fri, 29 Jul 2022 06:48:40 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:48:39 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <685ab467-1c43-9faa-7081-37525717c305@kaod.org>
Date: Fri, 29 Jul 2022 08:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729000904.1295295-3-joel@jms.id.au>
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: dbdbfbbd-32f0-4ca4-a4ae-b920208c8f56
X-Ovh-Tracer-Id: 9423782223028849446
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdpoffvtefjohhsthepmhhoheehvd
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004575c50ac-bb1a-4032-b6fc-ba9c52cba27a,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 2/9] arch/powerpc: Clarify generic CPUs
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

T24gNy8yOS8yMiAwMjowOCwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IEluIHRoZSBjYXNlIHdoZXJl
IGEgc3BlY2lmaWMgQ1BVIGlzIG5vdCBzZWxlY3RlZCwgc2V0IGFuIGFwcHJvcHJpYXRlCj4gZ2Nj
IHRhcmdldCBmb3IgdGhlIGFyY2hpdGVjdHVyZS4KPiAKPiBGb3IgY2xhcml0eSB0aGlzIGludHJv
ZHVjZXMgYSBCUjJfZ2VuZXJpY19wb3dlcnBjNjQgYXMgYSBnZW5lcmljIDY0IGJpdAo+IENQVSBh
cyB0aGlzIG1ha2VzIHRoZSBpdCBjbGVhcmVyIHdoZW4gYnJvd3NpbmcgbWVudWNvbmZpZy4KPiAK
PiBXZSBjYW4ndCBoYXZlIGEgZ2VuZXJpYyBwcGM2NGxlIEdDQywgYXMgYXR0ZW1wdGluZyB0byBj
b25maWd1cmUgZ2xpYmMKPiBmb3IgcG93ZXJwYzY0bGUgZmFpbHM6Cj4gCj4gICBjb25maWd1cmU6
IGVycm9yOiAqKiogIFBPV0VSOCBvciBuZXdlciBpcyByZXF1aXJlZCBvbiBwb3dlcnBjNjRsZS4K
PiAgIF9fYnVpbHRpbl9zaWduYml0IGlzIGJyb2tlbi4gIEdDQyA3LjQgb3IgbmV3ZXIgaXMgcmVx
dWlyZWQgdG8gcmVzb2x2ZQo+ICAgKFBSODM4NjIpLiBUaGUgY29tcGlsZXIgbXVzdCBzdXBwb3J0
IC1tYWJpPWllZWVsb25nZG91YmxlIGFuZAo+ICAgLW1sb25nLWRvdWJsZS0xMjggc2ltdWx0YW5l
b3VzbHkuCj4gCj4gSGVuY2Ugc2V0IFBvd2VyOCBhcyB0aGUgZGVmYXVsdCBDUFUgZm9yIHBvd2Vy
cGM2NGxlLgoKcG93ZXI4IGlzIG5vdyA4IHllYXJzIG9sZC4gSXMgdGhlcmUgYW55IHZhbHVlIGlu
IGFkZGluZyBhIHBvd2VyOQp0YXJnZXQgPwoKUmV2aWV3ZWQtYnk6IEPDqWRyaWMgTGUgR29hdGVy
IDxjbGdAa2FvZC5vcmc+CgpUaGFua3MsCgpDLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0
YW5sZXkgPGpvZWxAam1zLmlkLmF1Pgo+IC0tLQo+ICAgYXJjaC9Db25maWcuaW4ucG93ZXJwYyB8
IDEzICsrKysrKysrKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjIGIv
YXJjaC9Db25maWcuaW4ucG93ZXJwYwo+IGluZGV4IGVmMGU4NWZlYzY4MC4uOGQzOTJiZmRlODE0
IDEwMDY0NAo+IC0tLSBhL2FyY2gvQ29uZmlnLmluLnBvd2VycGMKPiArKysgYi9hcmNoL0NvbmZp
Zy5pbi5wb3dlcnBjCj4gQEAgLTksMTIgKzksMTcgQEAgY29uZmlnIEJSMl9QT1dFUlBDX0NQVV9I
QVNfU1BFCj4gICAKPiAgIGNob2ljZQo+ICAgCXByb21wdCAiVGFyZ2V0IEFyY2hpdGVjdHVyZSBW
YXJpYW50Igo+IC0JZGVmYXVsdCBCUjJfZ2VuZXJpY19wb3dlcnBjCj4gKwlkZWZhdWx0IEJSMl9n
ZW5lcmljX3Bvd2VycGMgaWYgIUJSMl9BUkNIX0lTXzY0Cj4gKwlkZWZhdWx0IEJSMl9nZW5lcmlj
X3Bvd2VycGM2NCBpZiBCUjJfQVJDSF9JU182NAo+ICsJZGVmYXVsdCBCUjJfcG93ZXJwY19wb3dl
cjggaWYgQlIyX3Bvd2VycGM2NGxlCj4KPiAgIAloZWxwCj4gICAJICBTcGVjaWZpYyBDUFUgdmFy
aWFudCB0byB1c2UKPiAgIGNvbmZpZyBCUjJfZ2VuZXJpY19wb3dlcnBjCj4gLQlib29sICJnZW5l
cmljIgo+IC0JIyBObyBDIGxpYnJhcnkgc3VwcG9ydHMgdGhpcyB2YXJpYW50IG9uIHBwYzY0bGUK
PiArCWJvb2wgImdlbmVyaWMgKDMyIGJpdCkiCj4gKwlkZXBlbmRzIG9uICFCUjJfQVJDSF9JU182
NAo+ICtjb25maWcgQlIyX2dlbmVyaWNfcG93ZXJwYzY0Cj4gKwlib29sICJnZW5lcmljICg2NCBi
aXQpIgo+ICsJZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NAo+ICAgCWRlcGVuZHMgb24gIUJSMl9w
b3dlcnBjNjRsZQo+ICAgY29uZmlnIEJSMl9wb3dlcnBjXzQwMQo+ICAgCWJvb2wgIjQwMSIKPiBA
QCAtMjIwLDYgKzIyNSw4IEBAIGNvbmZpZyBCUjJfR0NDX1RBUkdFVF9DUFUKPiAgIAlkZWZhdWx0
ICJwb3dlcjYiCWlmIEJSMl9wb3dlcnBjX3Bvd2VyNgo+ICAgCWRlZmF1bHQgInBvd2VyNyIJaWYg
QlIyX3Bvd2VycGNfcG93ZXI3Cj4gICAJZGVmYXVsdCAicG93ZXI4IglpZiBCUjJfcG93ZXJwY19w
b3dlcjgKPiArCWRlZmF1bHQgInBvd2VycGM2NCIJaWYgQlIyX2dlbmVyaWNfcG93ZXJwYzY0Cj4g
KwlkZWZhdWx0ICJwb3dlcnBjIglpZiBCUjJfZ2VuZXJpY19wb3dlcnBjCj4gICAKPiAgIGNvbmZp
ZyBCUjJfUkVBREVMRl9BUkNIX05BTUUKPiAgIAlkZWZhdWx0ICJQb3dlclBDIglpZiBCUjJfcG93
ZXJwYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
