Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504FAC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE09F40A61;
	Mon,  5 Feb 2024 18:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE09F40A61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cq-9ZqxVLfnN; Mon,  5 Feb 2024 18:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 923D040438;
	Mon,  5 Feb 2024 18:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 923D040438
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82FD01BF285
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 687FE81E11
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 687FE81E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KF4Tre4jwhS9 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:59:58 +0000 (UTC)
Received: from 18.mo581.mail-out.ovh.net (18.mo581.mail-out.ovh.net
 [188.165.56.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFBE081E10
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFBE081E10
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.139.11])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id A1BC627377
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:30:53 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-4tws9 (unknown [10.110.113.129])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 679C01FEB1;
 Mon,  5 Feb 2024 15:30:53 +0000 (UTC)
Received: from armadeus.com ([37.59.142.106])
 by ghost-submission-6684bf9d7b-4tws9 with ESMTPSA
 id bTRBFy3/wGVQSwEAkrM3og
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 05 Feb 2024 15:30:53 +0000
X-OVh-ClientIp: 92.148.253.243
Message-ID: <e2b5128b-eced-48c1-aabe-a954b03c88d5@armadeus.com>
Date: Mon, 5 Feb 2024 16:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240110205100.147660-1-ju.o@free.fr>
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <20240110205100.147660-1-ju.o@free.fr>
X-Ovh-Tracer-Id: 18387352857109326709
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfedvtddgjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpedttdeiiefhhfekgeehjeektdegleehieetjeffhefgffetjeegtdefteehkeduudenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00673a94cfc-fc43-4ab6-ac27-88cc0f5dd6d4,
 B61640D6B145E66104E0D0FA1FBCBF41853E9D36)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/imx8mmpico: uboot needs
 openssl
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLCBBbGwsCgpPbiAxLzEwLzI0IDIxOjUxLCBKdWxpZW4gT2xpdmFpbiB3cm90ZToK
PiBDb21taXQgNzhlOGYzODMgImNvbmZpZ3MvaW14OG1tcGljbzogYnVtcCBic3AgY29tcG9uZW50
cyB0byB2ZXJzaW9uCj4gdG4ta2lya3N0b25lXzUuMTUuNzEtMi4yLjAiIGJ1bXBlZCBjb21wb25l
bnRzLCBidXQgZm9yZ290IHRvIGFkZAo+IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTD15
Lgo+IAo+IFRoaXMgY29tbWl0IGFkZHMgaXQgdG8gdGhlIGRlZmNvbmZpZyB0byBmaXggdGhlIGJ1
aWxkLgo+IAo+IEZpeGVzOgo+IC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290Ly0vam9icy81ODU4MTgwMjQ4Cj4gCj4gICAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20g
dG9vbHMvaW1hZ2V0b29sLmg6MjQsCj4gICAgICAgICAgICAgICAgICAgICAgIGZyb20gdG9vbHMv
YWlzaW1hZ2UuYzo3Ogo+ICAgICAgaW5jbHVkZS9pbWFnZS5oOjExNjY6MTI6IGZhdGFsIGVycm9y
OiBvcGVuc3NsL2V2cC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gICAgICAgMTE2NiB8
ICMgIGluY2x1ZGUgPG9wZW5zc2wvZXZwLmg+Cj4gICAgICAgICAgICB8ICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4KPiAtLS0KPiBDaGFuZ2UgdjEgLT4gdjI6Cj4gLSBSZWdlbmVyYXRlZCB0aGUgcGF0Y2gs
IHRvIGZpeCBhIGNvcnJ1cHRlZCBwYXRjaCBjb250ZXh0Lgo+IC0tLQo+ICAgY29uZmlncy9pbXg4
bW1waWNvX2RlZmNvbmZpZyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpJIGNvbmZpcm0gdGhhdCB0aGlzIHBhdGNoIGZpeGVzIHRoZSBidWlsZCBlcnJvciBtZW50aW9u
ZWQ6CgpUZXN0ZWQtQnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KClJlZ2FyZHMsCgo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL2lteDht
bXBpY29fZGVmY29uZmlnIGIvY29uZmlncy9pbXg4bW1waWNvX2RlZmNvbmZpZwo+IGluZGV4IGM0
MDJlYTY3NWQuLjcxMWNkZWIzOTAgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9pbXg4bW1waWNvX2Rl
ZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvaW14OG1tcGljb19kZWZjb25maWcKPiBAQCAtMjgsNiAr
MjgsNyBAQCBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9UQVJCQUxMPXkKPiAgIEJSMl9UQVJHRVRf
VUJPT1RfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIsVGVjaE5leGlvbix1
LWJvb3QtdG4taW14LHRuLWtpcmtzdG9uZV81LjE1LjcxLTIuMi4wXzIwMjMwNTEyKS91LWJvb3Qt
dG4taW14LXRuLWtpcmtzdG9uZV81LjE1LjcxLTIuMi4wXzIwMjMwNTEyLnRhci5neiIKPiAgIEJS
Ml9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJwaWNvLWlteDhtbSIKPiAgIEJSMl9UQVJH
RVRfVUJPT1RfTkVFRFNfRFRDPXkKPiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkK
PiAgIEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NVU1RPTT15Cj4gICBCUjJfVEFSR0VUX1VCT09U
X0ZPUk1BVF9DVVNUT01fTkFNRT0idS1ib290LW5vZHRiLmJpbiIKPiAgIEJSMl9UQVJHRVRfVUJP
T1RfU1BMPXkKCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSwgQXJtYWRldXMgU3lzdGVtcwpTb2Z0
d2FyZSBlbmdpbmVlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
