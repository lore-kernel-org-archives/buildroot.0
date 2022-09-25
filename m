Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31691C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 13:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADA0C60BFB;
	Sun, 25 Sep 2022 13:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADA0C60BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFCRl09JLEVc; Sun, 25 Sep 2022 13:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB9D160BF1;
	Sun, 25 Sep 2022 13:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB9D160BF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D39661BF2AA
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 13:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF0B76074C
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 13:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF0B76074C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yg_5JsFOHoyv for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 13:34:09 +0000 (UTC)
X-Greylist: delayed 00:07:12 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EAAC60BFB
Received: from 7.mo552.mail-out.ovh.net (7.mo552.mail-out.ovh.net
 [188.165.59.253])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EAAC60BFB
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 13:34:09 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5F6C62446C;
 Sun, 25 Sep 2022 13:26:54 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Sun, 25 Sep
 2022 15:26:53 +0200
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9588eb0f-e007-593a-9db7-b34a711d1458@kaod.org>
Date: Sun, 25 Sep 2022 15:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: <buildroot@buildroot.org>
References: <20220925132218.3848758-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220925132218.3848758-1-clg@kaod.org>
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 2c178070-65f6-41fa-9e2f-bcb12607929d
X-Ovh-Tracer-Id: 6277454931563940762
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegtddgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpoffvtefjohhsthepmhhoheehvd
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-108S0021a257e60-9ed2-4ab4-aa7b-33aa2a683ea8,
 F2BAAC272AACDAE9383B0CB74E4F720F3B7CB042) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH] configs/aspeed_ast2600evb: Set
 BR2_ARM_FPU_VFPV4D16
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
Cc: Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOS8yNS8yMiAxNToyMiwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4gVGhlIGZlYXR1cmVz
IG9mIHRoZSBDb3J0ZXggQTcgQ1BVIG9uIHRoZSBBc3BlZWQgQVNUMjYwMCBBMyBTb0MgYXJlIDoK
PiAKPiAgICBoYWxmIHRodW1iIGZhc3RtdWx0IHZmcCBlZHNwIHZmcHYzIHZmcHYzZDE2IHRscyB2
ZnB2NCBpZGl2YSBpZGl2dCBscGFlIGV2dHN0cm0KPiAKPiB0aGUgdmZwdjNkMTYgZmVhdHVyZSBi
aXQgaXMgY29tbW9uIHRvIGJvdGggdmZwdjMgYW5kIHZmcHY0Lgo+IAo+IERyb3AgQlIyX0FSTV9G
UFVfVkZQVjQgd2hpY2ggYWN0aXZhdGVzIHRoZSB1c2Ugb2YgdnBmZDMyIChhbmQgYnJlYWtzCj4g
dXNlciBzcGFjZSkuIFNldCBCUjJfQVJNX0ZQVV9WRlBWNEQxNiBpbnN0ZWFkLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4gLS0tCj4gICBjb25m
aWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKVGhpcyBwYXRjaCBpcyBhIHBvc3NpYmxl
IGNhbmRpZGF0ZSBmb3IgMjAyMi4wOC54LgoKVGhhbmtzLAoKQy4KCgo+IAo+IGRpZmYgLS1naXQg
YS9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXNwZWVkX2Fz
dDI2MDBldmJfZGVmY29uZmlnCj4gaW5kZXggY2QwNThhZDBhYzI4Li4wNDIzOTU2NmM4MzggMTAw
NjQ0Cj4gLS0tIGEvY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcKPiArKysgYi9j
b25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZwo+IEBAIC0xLDcgKzEsNyBAQAo+ICAg
IyBBcmNoaXRlY3R1cmUKPiAgIEJSMl9hcm09eQo+ICAgQlIyX2NvcnRleF9hNz15Cj4gLUJSMl9B
Uk1fRlBVX1ZGUFY0PXkKPiArQlIyX0FSTV9GUFVfVkZQVjREMTY9eQo+ICAgCj4gICAjIFN5c3Rl
bQo+ICAgQlIyX1RBUkdFVF9HRU5FUklDX0hPU1ROQU1FPSJhc3BlZWQtZXZiIgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
