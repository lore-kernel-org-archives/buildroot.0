Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BD3C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 07:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF3A140B0F;
	Fri, 29 Jul 2022 07:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF3A140B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3703G9U9phg; Fri, 29 Jul 2022 07:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D66D74033F;
	Fri, 29 Jul 2022 07:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D66D74033F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 551A01BF31B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AAC64177F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AAC64177F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfN2S1VK-Dhf for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 07:11:54 +0000 (UTC)
X-Greylist: delayed 00:16:42 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7D274175C
Received: from 3.mo548.mail-out.ovh.net (3.mo548.mail-out.ovh.net
 [188.165.32.156])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7D274175C
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 07:11:53 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4E8B8227D7;
 Fri, 29 Jul 2022 06:55:09 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:55:08 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <ec102e4a-9ae6-6005-40a6-5d35e483d92a@kaod.org>
Date: Fri, 29 Jul 2022 08:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-9-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729000904.1295295-9-joel@jms.id.au>
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b64bdc95-fc42-4f6c-8055-6333a12856f1
X-Ovh-Tracer-Id: 9533275987531893542
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdpoffvtefjohhsthepmhhoheegke
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006aab33ef9-ec53-4a5f-bb38-f31a27e2e9c1,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 8/9] package/zlib-ng: Revert Power8 special
 casing
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

T24gNy8yOS8yMiAwMjowOSwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IFdpdGggImFyY2gvcG93ZXJw
YzogRW5hYmxlIHBvd2VycGM2NGxlIG9ubHkgb24gQ1BVcyB0aGF0IHN1cHBvcnQgaXQiCj4gYnVp
bGRyb290IHdpbGwgbm8gbG9uZ2VyIGJ1aWxkIGEgdG9vbGNoYWluIHRoYXQgYnJlYWtzIGZlYXR1
cmUKPiBkZXRlY3Rpb24uCj4gCj4gUmVtb3ZlIHRoZSBzcGVjaWFsIGNhc2luZyBzbyB0aGUgYnVp
bGQgc3lzdGVtIGNhbiBkbyBmZWF0dXJlIGRldGVjdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
b2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PgoKCgpSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBH
b2F0ZXIgPGNsZ0BrYW9kLm9yZz4KClRoYW5rcywKCkMuCj4gLS0tCj4gICBwYWNrYWdlL3psaWIt
bmcvemxpYi1uZy5tayB8IDYgLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS96bGliLW5nL3psaWItbmcubWsgYi9wYWNrYWdl
L3psaWItbmcvemxpYi1uZy5tawo+IGluZGV4IDkzOGFjZDQxODFhNi4uZmI0OTdiOGMxMWQwIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvemxpYi1uZy96bGliLW5nLm1rCj4gKysrIGIvcGFja2FnZS96
bGliLW5nL3psaWItbmcubWsKPiBAQCAtMjMsMTAgKzIzLDQgQEAgaWZlcSAoJChCUjJfYXJtKSx5
KQo+ICAgWkxJQl9OR19DT05GX09QVFMgKz0gLURXSVRIX0FDTEU9MSAtRFdJVEhfTkVPTj0xCj4g
ICBlbmRpZgo+ICAgCj4gLWlmZXEgKCQoQlIyX3Bvd2VycGNfcG93ZXI4KSx5KQo+IC1aTElCX05H
X0NPTkZfT1BUUyArPSAtRFdJVEhfUE9XRVI4PU9OCj4gLWVsc2UKPiAtWkxJQl9OR19DT05GX09Q
VFMgKz0gLURXSVRIX1BPV0VSOD1PRkYKPiAtZW5kaWYKPiAtCj4gICAkKGV2YWwgJChjbWFrZS1w
YWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
