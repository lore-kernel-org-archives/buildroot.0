Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDF4CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 16:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 248AF815C1;
	Wed, 13 Aug 2025 16:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9jBcVLwZJw8; Wed, 13 Aug 2025 16:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36D248379F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36D248379F;
	Wed, 13 Aug 2025 16:57:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB755938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD69A8378A
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QV5BcmQs8FCO for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 16:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.118;
 helo=19.mo581.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 336DD815C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 336DD815C1
Received: from 19.mo581.mail-out.ovh.net (19.mo581.mail-out.ovh.net
 [178.33.251.118])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 336DD815C1
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:57:32 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.110.37.191])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4c2F0n6hcdz6V6J
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:57:29 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-64gvf (unknown [10.110.118.160])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 653CD802AD;
 Wed, 13 Aug 2025 16:57:29 +0000 (UTC)
Received: from armadeus.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-64gvf with ESMTPSA
 id J8i9EPnDnGi9jQEA4sCyRg
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 13 Aug 2025 16:57:29 +0000
X-OVh-ClientIp: 90.11.248.239
Message-ID: <bdd2f6dc-d916-4a04-9c57-24ff0f7197c2@armadeus.com>
Date: Wed, 13 Aug 2025 18:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Tisserand?= <sebastien.tisserand@armadeus.com>,
 buildroot@buildroot.org
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
References: <20250813081813.4475-1-sebastien.tisserand@armadeus.com>
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
In-Reply-To: <20250813081813.4475-1-sebastien.tisserand@armadeus.com>
X-Ovh-Tracer-Id: 14121318110170114864
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeekjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpedvvdejtdfhfeelkeelleevudevtdeiuddukeelgeefgfdvieevjedtfefgtdefvdenucffohhmrghinhepshhighhmrgdqtghhvghmnhhithiirdguvgenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=Cy/iwRo8JJsFiSKOVUj8afcD5WiAAX8cwIfO7uLSG8Y=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1755104250; v=1;
 b=LgCQ9qawmoO1AxHvKdZExT5Ic55HDQJSHCZWFwcMzCIPAUaQRugZ3VfO+dK1SNg7jtj5YOb1
 rTt8t0gHHFFGOmv7fEp3PbtH2QLgjSayw2ATG5YGeNTzYT9CfyPSVgArwbC1QXjeTY/bDDPc0Gt
 GgExB89z7WycdtZx0E42IcE17E0PDN9nk8YgqIx/rpZIQs6mCQBed2aOVWrKQtFexdizvsh85iC
 p4hs5aqnClDF4lMSYIjK0Z8632XlLGVFQjvIPjje0bVGjUNqelcTs3MLMouV+yMPFK4l6A+LLjZ
 HpL88lU/jlbMHHLQh0k5fHLI4VuuLCQAgjx2jSQs4bsDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=LgCQ9qaw
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005df897f7d-afe4-4d07-abbb-ab39293331e3,
 0C39A146902883F6F8F0121D354C7FD2E14C4150)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH]
 package/gstreamer1/gst1-plugins-bayer2rgb-neon: bump to latest git commit
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

T24gOC8xMy8yNSAxMDoxOCBBTSwgU8OpYmFzdGllbiBUaXNzZXJhbmQgd3JvdGU6Cj4gTGFzdGVz
dCBnaXQgY29tbWl0IHN1cHBvcnRzIG1vcmUgYmF5ZXIgZm9ybWF0czoKPiBodHRwczovL2dpdGxh
Yi1leHQuc2lnbWEtY2hlbW5pdHouZGUvZW5zYy9nc3QtYmF5ZXIycmdiLW5lb24vLS9jb21taXQv
YjVhZDc4YTFjNmJmYWEzYWRjZTVmMGY2OTQ5M2VmY2NlMTA2ZTk1Mwo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFPDqWJhc3RpZW4gVGlzc2VyYW5kIDxzZWJhc3RpZW4udGlzc2VyYW5kQGFybWFkZXVzLmNv
bT4KPiAtLS0KPiAgIC4uLi9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24uaGFzaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgIC4uLi9nc3QxLXBsdWdpbnMtYmF5ZXIycmdi
LW5lb24vZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uLm1rICB8IDIgKy0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3ZWQtYnk6
IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4K
ClJlZ2FyZHMsCgotLSAKU8OpYmFzdGllbiBTenltYW5za2ksIEFybWFkZXVzIFN5c3RlbXMKU29m
dHdhcmUgZW5naW5lZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
