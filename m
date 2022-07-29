Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE142C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 06:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CFEC605A3;
	Fri, 29 Jul 2022 06:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CFEC605A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id neY9iPUF8MEu; Fri, 29 Jul 2022 06:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62316600CA;
	Fri, 29 Jul 2022 06:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62316600CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 462A81BF3B9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 06:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FCDC40761
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 06:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FCDC40761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9CUuJzWUjhZ for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 06:58:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07363403D8
Received: from 1.mo552.mail-out.ovh.net (1.mo552.mail-out.ovh.net
 [178.32.96.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07363403D8
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 06:58:16 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DA6F6240D6;
 Fri, 29 Jul 2022 06:48:59 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:48:58 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <4c8bcfee-f4ef-6527-6272-109130292cd8@kaod.org>
Date: Fri, 29 Jul 2022 08:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729000904.1295295-2-joel@jms.id.au>
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 557cb4aa-5488-428e-8951-f6313954ff21
X-Ovh-Tracer-Id: 9429130249018247974
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdfovfetjfhoshhtpehmohehhedv
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002f8bdcba9-788d-4ed0-b661-e2155f29c0f5,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 1/9] arch/powerpc: Hide SPE ABI behind CPU
 type
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

T24gNy8yOS8yMiAwMjowOCwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IFRoZSB0YXJnZXQgQUJJIG9w
dGlvbiBmb3IgUG93ZXJQQyBpcyBmb3Igc2VsZWN0aW5nIHRoZSBTUEUgQUJJLCBub3QgdGhlCj4g
RUxGIEFCSSB0aGF0IHVzZXJzIG1heSBleHBlY3QuCj4gCj4gSGlkZSBpdCB3aGVuIHRoZXJlIGlz
IG5vIG9wdGlvbiBhdmFpbGFibGUgdG8gbWFrZSBpdCBjbGVhcmVyIHdoZW4KPiBicm93c2luZyBt
ZW51Y29uZmlnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQu
YXU+CgpSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KClRoYW5r
cywKCkMuCgo+IC0tLQo+ICAgYXJjaC9Db25maWcuaW4ucG93ZXJwYyB8IDIgKysKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcu
aW4ucG93ZXJwYyBiL2FyY2gvQ29uZmlnLmluLnBvd2VycGMKPiBpbmRleCBjNDhlZGQzYmI0MGMu
LmVmMGU4NWZlYzY4MCAxMDA2NDQKPiAtLS0gYS9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjCj4gKysr
IGIvYXJjaC9Db25maWcuaW4ucG93ZXJwYwo+IEBAIC0xNDMsNiArMTQzLDcgQEAgY29uZmlnIEJS
Ml9wb3dlcnBjX3Bvd2VyOAo+ICAgCXNlbGVjdCBCUjJfUE9XRVJQQ19DUFVfSEFTX1ZTWAo+ICAg
ZW5kY2hvaWNlCj4gICAKPiAraWYgQlIyX1BPV0VSUENfQ1BVX0hBU19TUEUKPiAgIGNob2ljZQo+
ICAgCXByb21wdCAiVGFyZ2V0IEFCSSIKPiAgIAlkZWZhdWx0IEJSMl9wb3dlcnBjX1NQRSBpZiBC
UjJfUE9XRVJQQ19DUFVfSEFTX1NQRQo+IEBAIC0xNTcsNiArMTU4LDcgQEAgY29uZmlnIEJSMl9w
b3dlcnBjX1NQRQo+ICAgCWJvb2wgIlNQRSIKPiAgIAlkZXBlbmRzIG9uIEJSMl9QT1dFUlBDX0NQ
VV9IQVNfU1BFCj4gICBlbmRjaG9pY2UKPiArZW5kaWYKPiAgIAo+ICAgY29uZmlnIEJSMl9QT1dF
UlBDX1NPRlRfRkxPQVQKPiAgIAlib29sICJVc2Ugc29mdC1mbG9hdCIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
