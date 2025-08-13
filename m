Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E83CA0EC4
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 07:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F924102B;
	Wed, 13 Aug 2025 07:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOk45Jzw4qjq; Wed, 13 Aug 2025 07:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821E240FF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821E240FF9;
	Wed, 13 Aug 2025 07:52:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5857938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 07:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABC6040112
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 07:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJsKaC9xK5Ju for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 07:52:43 +0000 (UTC)
X-Greylist: delayed 1103 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 Aug 2025 07:52:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D041F400E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D041F400E6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.173;
 helo=1.mo576.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net
 [178.33.251.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D041F400E6
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 07:52:42 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.254.143])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4c20Vw4MYyz5wTR
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 07:34:16 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-dg9qv (unknown [10.111.182.10])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 34E8A81263;
 Wed, 13 Aug 2025 07:34:16 +0000 (UTC)
Received: from armadeus.com ([37.59.142.106])
 by ghost-submission-5b5ff79f4f-dg9qv with ESMTPSA
 id MIE/O/c/nGiqAwAAwKra4Q
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 13 Aug 2025 07:34:16 +0000
X-OVh-ClientIp: 90.11.248.239
Message-ID: <b3aed606-5b71-4f79-bd47-59cee6adf59e@armadeus.com>
Date: Wed, 13 Aug 2025 09:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Cc: breno.lima@nxp.com
References: <20250812231417.1249446-1-festevam@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20250812231417.1249446-1-festevam@gmail.com>
X-Ovh-Tracer-Id: 4609434221892201354
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpedtgeehtdduledtudevveekveevveefffdthedtieekgeeukeevtdffieegteekhfenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=kj0VWXgg2st88n0wp06ZuORVXubTGxeoFftuqfPFxuY=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1755070456; v=1;
 b=WxAwUTdxte340PoWQg2MW7LaBjl2JeqycvovfzlNWCHi1EwtEr7Dy57hnmv4fkGHrStzFGZT
 cTbZmTd2YHNxP63Juh2lPdyCWvECzO6SoHWKVOuYo39VLfojhsuMO7vRny+3XD01AMqHbABaIMw
 shD3VorGMsU80NZPISFNYoU5XNQcVe9mZH975cyAvlEXJ2qGMYlSgbGKes3IFuOoZGN9chom07c
 7O+h/vXZ+MvmmptcFJdi8lh5/roqWBztVFLPUZFDuMbPgnZd3XfIr1gMw3NgVOba/mmZcbsct/F
 nN1pMg2bqODRaTwJgdDtCgFEgCMbbxsjK59frvkSOlIEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=WxAwUTdx
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006fd0542b9-5346-4ae8-ba84-1e292b45b223,
 0C39A146902883F6F8F0121D354C7FD2E14C4150)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH] freescale_imx93evk_defconfig: Add OP-TEE OS
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

T24gOC8xMy8yNSAxOjE0IEFNLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IEZyb206IEJyZW5vIExp
bWEgPGJyZW5vLmxpbWFAbnhwLmNvbT4KPiAKPiBBZGQgT1AtVEVFIE9TIFN1cHBvcnQgZnJvbSB0
aGUgTlhQIEJTUCBsZi02LjEyLjMtMS4wLjAgdmVyc2lvbi4KPiAKPiBUaGUgaS5NWDkzIEJvb3Qg
Q29udGFpbmVyIHJlcXVpcmVzIGEgcmF3IFRFRSBiaW5hcnkgd2l0aG91dCBhIFRFRSBoZWFkZXIu
Cj4gVXBkYXRlIHRoZSBpbXg5LWJvb3Rsb2FkZXItcHJlcGFyZS5zaCBzY3JpcHQgYW5kIENvbmZp
Zy5pbiBhY2NvcmRpbmdseQo+IHRvIGVuc3VyZSBjb21wYXRpYmlsaXR5IHdpdGggdGhpcyByZXF1
aXJlbWVudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmVubyBMaW1hIDxicmVuby5saW1hQG54cC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+
IC0tLQo+ICAgYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvaW14OS1ib290bG9hZGVyLXByZXBh
cmUuc2ggfCAyICstCj4gICBib290L29wdGVlLW9zL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDIgKy0KPiAgIGNvbmZpZ3MvZnJlZXNjYWxlX2lteDkzZXZrX2RlZmNv
bmZpZyAgICAgICAgICAgICAgICAgIHwgNyArKysrKysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBTw6liYXN0aWVu
IFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpSZWdhcmRzLAoK
LS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1hZGV1cyBTeXN0ZW1zClNvZnR3YXJlIGVuZ2lu
ZWVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
