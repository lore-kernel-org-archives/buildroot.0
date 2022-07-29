Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D41C19F2B
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 07:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0A3B40AA4;
	Fri, 29 Jul 2022 07:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0A3B40AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lgeiUCc53gN6; Fri, 29 Jul 2022 07:31:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3A3640476;
	Fri, 29 Jul 2022 07:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3A3640476
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08DF71BF31B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D98AE40476
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D98AE40476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyZviBTtMFwl for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 07:31:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBC0C40017
Received: from 3.mo548.mail-out.ovh.net (3.mo548.mail-out.ovh.net
 [188.165.32.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBC0C40017
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 07:31:42 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 33C6B227D9;
 Fri, 29 Jul 2022 06:54:54 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:54:53 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <66f9df85-f686-de37-091f-3b2ce04bcf84@kaod.org>
Date: Fri, 29 Jul 2022 08:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-8-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729000904.1295295-8-joel@jms.id.au>
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 40236ad4-4da2-4af2-98f0-91ecbfc63374
X-Ovh-Tracer-Id: 9529053862862228262
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdfovfetjfhoshhtpehmohehgeek
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002cedd8edf-af8c-4b13-9378-adb50e0e6708,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 7/9] package/mesa3d: Remove force disable of
 power8
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
bGRyb290IHdpbGwgbm8gbG9uZ2VyIGJ1aWxkIGEgdG9vbGNoYWluIHRoYXQgaGFzIGJyb2tlbiBW
TVggc3VwcG9ydC4KPiAKPiBSZW1vdmUgdGhlIHNwZWNpYWwgY2FzaW5nIHNvIHRoZSBidWlsZCBz
eXN0ZW0gY2FuIGRvIGZlYXR1cmUgZGV0ZWN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvZWwg
U3RhbmxleSA8am9lbEBqbXMuaWQuYXU+CgpSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIg
PGNsZ0BrYW9kLm9yZz4KClRoYW5rcywKCkMuCgo+IC0tLQo+ICAgcGFja2FnZS9tZXNhM2QvbWVz
YTNkLm1rIHwgMyArLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFj
a2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4gaW5kZXggOTY1MjBlMmVmZDIzLi45NTU0MDJkYmI3ZGQg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4gKysrIGIvcGFja2FnZS9t
ZXNhM2QvbWVzYTNkLm1rCj4gQEAgLTI2LDggKzI2LDcgQEAgTUVTQTNEX0RFUEVOREVOQ0lFUyA9
IFwKPiAgIAl6bGliCj4gICAKPiAgIE1FU0EzRF9DT05GX09QVFMgPSBcCj4gLQktRGdhbGxpdW0t
b214PWRpc2FibGVkIFwKPiAtCS1EcG93ZXI4PWRpc2FibGVkCj4gKwktRGdhbGxpdW0tb214PWRp
c2FibGVkCj4gICAKPiAgICMgQ29kZXNvdXJjZXJ5IEFSTSAyMDE0LjA1IGZhaWwgdG8gbGluayBs
aWJtZXNhX2RyaV9kcml2ZXJzLnNvIHdpdGggLS1hcy1uZWVkZWQgbGlua2VyCj4gICAjIGZsYWcg
ZHVlIHRvIGEgbGlua2VyIGJ1ZyBiZXR3ZWVuIGJpbnV0aWxzIDIuMjQgYW5kIDIuMjUgKDIuMjQu
NTEuMjAxNDAyMTcpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
