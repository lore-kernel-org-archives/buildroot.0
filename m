Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA6DC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 07:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80EE84175C;
	Fri, 29 Jul 2022 07:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80EE84175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeJyPnwYvHWo; Fri, 29 Jul 2022 07:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AAE341557;
	Fri, 29 Jul 2022 07:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AAE341557
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7BA91BF3B9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2BC380EE8
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2BC380EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARAovNloAy_0 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 07:03:41 +0000 (UTC)
X-Greylist: delayed 00:14:39 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE36780EC1
Received: from 2.mo552.mail-out.ovh.net (2.mo552.mail-out.ovh.net
 [178.33.105.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE36780EC1
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 07:03:40 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1BE2721D59;
 Fri, 29 Jul 2022 06:53:33 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:53:32 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <d30601fd-1b76-6c4a-1fa8-fd79e006aca2@kaod.org>
Date: Fri, 29 Jul 2022 08:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-7-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729000904.1295295-7-joel@jms.id.au>
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d96c3ce7-5830-4ad1-841e-c7619710db85
X-Ovh-Tracer-Id: 9505972917230275366
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdpoffvtefjohhsthepmhhoheehvd
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0014d3d93e3-2a42-4f14-9e3e-8dd4b5caa4d7,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 6/9] arch/powerpc: Add Power10 CPU type
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

T24gNy8yOS8yMiAwMjowOSwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IFRoZSBQb3dlcjEwIENQVSB3
YXMgcmVsZWFzZWQgYnkgSUJNIGluIDIwMjEuIEl0IGlzIGEgNjQtYml0IENQVQo+IGltcGxlbWVu
dGluZyBJU0EgdjMuMS4gSXQgcnVucyBpbiBiaWcgYW5kIGxpdHRsZSBlbmRpYW4gbW9kZXMsIGFu
ZAo+IHN1cHBvcnRzIFZTWCBhbmQgQWx0aVZlYy4KPiAKPiBJdCBpbnRyb2R1Y2VzIHByZWZpeCAo
OCBieXRlKSBpbnN0cnVjdGlvbnMgYWxvbmcgc2lkZSB0aGUgZXhpc3RpbmcgNAo+IGJ5dGUgaW5z
dHJ1Y3Rpb25zLCBhbmQgbmV3IFNJTUQgTU1BIGluc3RydWN0aW9ucy4KPiAKPiBQb3dlcjEwIGlz
IHN1cHBvcnRlZCBhcyBvZiBHQ0MgMTAgYW5kIEJpbnV0aWxzIDIuMzUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KCgpSZXZpZXdlZC1ieTogQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KClRoYW5rcywKCkMuCgo+IC0tLQo+ICAgYXJjaC9D
b25maWcuaW4ucG93ZXJwYyB8IDcgKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjIGIvYXJjaC9D
b25maWcuaW4ucG93ZXJwYwo+IGluZGV4IDRjNjMzYzMzOGQ4Ni4uMDAyOTk4ZDA3OWVlIDEwMDY0
NAo+IC0tLSBhL2FyY2gvQ29uZmlnLmluLnBvd2VycGMKPiArKysgYi9hcmNoL0NvbmZpZy5pbi5w
b3dlcnBjCj4gQEAgLTE1NSw2ICsxNTUsMTIgQEAgY29uZmlnIEJSMl9wb3dlcnBjX3Bvd2VyOQo+
ICAgCXNlbGVjdCBCUjJfUE9XRVJQQ19DUFVfSEFTX0FMVElWRUMKPiAgIAlzZWxlY3QgQlIyX1BP
V0VSUENfQ1BVX0hBU19WU1gKPiAgIAlzZWxlY3QgQlIyX0FSQ0hfTkVFRFNfR0NDX0FUX0xFQVNU
XzYKPiArY29uZmlnIEJSMl9wb3dlcnBjX3Bvd2VyMTAKPiArCWJvb2wgInBvd2VyMTAiCj4gKwlk
ZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4gKwlzZWxlY3QgQlIyX1BPV0VSUENfQ1BVX0hBU19B
TFRJVkVDCj4gKwlzZWxlY3QgQlIyX1BPV0VSUENfQ1BVX0hBU19WU1gKPiArCXNlbGVjdCBCUjJf
QVJDSF9ORUVEU19HQ0NfQVRfTEVBU1RfMTAKPiAgIGVuZGNob2ljZQo+ICAgCj4gICBpZiBCUjJf
UE9XRVJQQ19DUFVfSEFTX1NQRQo+IEBAIC0yMzUsNiArMjQxLDcgQEAgY29uZmlnIEJSMl9HQ0Nf
VEFSR0VUX0NQVQo+ICAgCWRlZmF1bHQgInBvd2VyNyIJaWYgQlIyX3Bvd2VycGNfcG93ZXI3Cj4g
ICAJZGVmYXVsdCAicG93ZXI4IglpZiBCUjJfcG93ZXJwY19wb3dlcjgKPiAgIAlkZWZhdWx0ICJw
b3dlcjkiCWlmIEJSMl9wb3dlcnBjX3Bvd2VyOQo+ICsJZGVmYXVsdCAicG93ZXIxMCIJaWYgQlIy
X3Bvd2VycGNfcG93ZXIxMAo+ICAgCWRlZmF1bHQgInBvd2VycGM2NCIJaWYgQlIyX2dlbmVyaWNf
cG93ZXJwYzY0Cj4gICAJZGVmYXVsdCAicG93ZXJwYyIJaWYgQlIyX2dlbmVyaWNfcG93ZXJwYwo+
ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
