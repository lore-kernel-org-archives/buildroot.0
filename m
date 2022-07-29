Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E52C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 06:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5DB640B44;
	Fri, 29 Jul 2022 06:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5DB640B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TeqqDpPxiazs; Fri, 29 Jul 2022 06:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE55240AA4;
	Fri, 29 Jul 2022 06:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE55240AA4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6E751BF3B9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 06:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9032A408CE
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 06:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9032A408CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nZb8M81j749 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 06:53:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA9B40303
Received: from 2.mo548.mail-out.ovh.net (2.mo548.mail-out.ovh.net
 [178.33.255.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DA9B40303
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 06:53:20 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BF886227A0;
 Fri, 29 Jul 2022 06:53:18 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:53:17 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <bbb22425-6695-661d-7a85-10c89cd6a587@kaod.org>
Date: Fri, 29 Jul 2022 08:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-6-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729000904.1295295-6-joel@jms.id.au>
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d20ab673-acdd-4d5c-a3b5-c50e35e0e8d6
X-Ovh-Tracer-Id: 9502032267027843878
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdpoffvtefjohhsthepmhhoheegke
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001c05f4bc7-fac4-43a8-8115-cdd446268b03,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 5/9] arch/powerpc: Add Power9 CPU type
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

T24gNy8yOS8yMiAwMjowOSwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IFRoZSBQb3dlcjkgQ1BVIHdh
cyByZWxlYXNlZCBieSBJQk0gaW4gMjAxNi4gSXQgaXMgYSA2NC1iaXQgQ1BVCj4gaW1wbGVtZW50
aW5nIElTQSB2My4wLiBJdCBydW5zIGluIGJpZyBhbmQgbGl0dGxlIGVuZGlhbiBtb2RlcywgYW5k
Cj4gc3VwcG9ydHMgVlNYIGFuZCBBbHRpVmVjLgo+IAo+IFBvd2VyOSBpcyBzdXBwb3J0ZWQgYXMg
b2YgR0NDIDYuMSBhbmQgQmludXRpbHMgMi4yNi4KCkFoLiBUaGF0J3Mgd2hhdCBJIHdhcyBhc2tp
bmcgZm9yICEKClJldmlld2VkLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoK
VGhhbmtzLAoKQy4KCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5p
ZC5hdT4KPiAtLS0KPiAgIGFyY2gvQ29uZmlnLmluLnBvd2VycGMgfCA3ICsrKysrKysKPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25m
aWcuaW4ucG93ZXJwYyBiL2FyY2gvQ29uZmlnLmluLnBvd2VycGMKPiBpbmRleCA3YzZhZTg0MzQ4
ZTkuLjRjNjMzYzMzOGQ4NiAxMDA2NDQKPiAtLS0gYS9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjCj4g
KysrIGIvYXJjaC9Db25maWcuaW4ucG93ZXJwYwo+IEBAIC0xNDksNiArMTQ5LDEyIEBAIGNvbmZp
ZyBCUjJfcG93ZXJwY19wb3dlcjgKPiAgIAlkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4gICAJ
c2VsZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQwo+ICAgCXNlbGVjdCBCUjJfUE9XRVJQ
Q19DUFVfSEFTX1ZTWAo+ICtjb25maWcgQlIyX3Bvd2VycGNfcG93ZXI5Cj4gKwlib29sICJwb3dl
cjkiCj4gKwlkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4gKwlzZWxlY3QgQlIyX1BPV0VSUENf
Q1BVX0hBU19BTFRJVkVDCj4gKwlzZWxlY3QgQlIyX1BPV0VSUENfQ1BVX0hBU19WU1gKPiArCXNl
bGVjdCBCUjJfQVJDSF9ORUVEU19HQ0NfQVRfTEVBU1RfNgo+ICAgZW5kY2hvaWNlCj4gICAKPiAg
IGlmIEJSMl9QT1dFUlBDX0NQVV9IQVNfU1BFCj4gQEAgLTIyOCw2ICsyMzQsNyBAQCBjb25maWcg
QlIyX0dDQ19UQVJHRVRfQ1BVCj4gICAJZGVmYXVsdCAicG93ZXI2IglpZiBCUjJfcG93ZXJwY19w
b3dlcjYKPiAgIAlkZWZhdWx0ICJwb3dlcjciCWlmIEJSMl9wb3dlcnBjX3Bvd2VyNwo+ICAgCWRl
ZmF1bHQgInBvd2VyOCIJaWYgQlIyX3Bvd2VycGNfcG93ZXI4Cj4gKwlkZWZhdWx0ICJwb3dlcjki
CWlmIEJSMl9wb3dlcnBjX3Bvd2VyOQo+ICAgCWRlZmF1bHQgInBvd2VycGM2NCIJaWYgQlIyX2dl
bmVyaWNfcG93ZXJwYzY0Cj4gICAJZGVmYXVsdCAicG93ZXJwYyIJaWYgQlIyX2dlbmVyaWNfcG93
ZXJwYwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
