Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7E4C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 08:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE56A400C4;
	Fri, 17 May 2024 08:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9YrGgl9F17k; Fri, 17 May 2024 08:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECA4040132
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECA4040132;
	Fri, 17 May 2024 08:41:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 234071BF20B
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 08:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1027483BEF
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 08:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwz-N02jiWRY for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 08:41:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=87.98.178.36;
 helo=5.mo561.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB98183BEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB98183BEE
Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net
 [87.98.178.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB98183BEE
 for <buildroot@buildroot.org>; Fri, 17 May 2024 08:41:33 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.139.3])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4VggF31prtz1LcG
 for <buildroot@buildroot.org>; Fri, 17 May 2024 08:32:23 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pdfqg (unknown [10.110.96.215])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D4B911FED1;
 Fri, 17 May 2024 08:32:22 +0000 (UTC)
Received: from armadeus.com ([37.59.142.101])
 by ghost-submission-6684bf9d7b-pdfqg with ESMTPSA
 id nnbCMBYWR2a+QRAARJCOCQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 17 May 2024 08:32:22 +0000
X-OVh-ClientIp: 92.148.253.243
Message-ID: <0ff11f55-6ae4-4206-a9e4-9f8cc5c68f0e@armadeus.com>
Date: Fri, 17 May 2024 10:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>
References: <20240515100209.24769-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5AvCmYZDD_0DfcuBZqyS0Fu9Se5PdtjfohH2yPPGQdbjg@mail.gmail.com>
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
In-Reply-To: <CAOMZO5AvCmYZDD_0DfcuBZqyS0Fu9Se5PdtjfohH2yPPGQdbjg@mail.gmail.com>
X-Ovh-Tracer-Id: 1591740996359154672
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdehfedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeujeffheehvddtuefhjeevveffkeetfffgtedvjeekleelvdfhjeelfeeludduieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045d1166bf-b8a0-4b98-b64f-19d6f2c04bc7,
 9569C84E05C71D58F00340027D646A2164E3897E)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/nxp-bt-wifi-firmware: new
 package
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
Cc: Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFiaW8sCgpPbiA1LzE1LzI0IDEzOjA4LCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IEhpIFPD
qWJhc3RpZW4sCj4gCj4gT24gV2VkLCBNYXkgMTUsIDIwMjQgYXQgNzowMuKAr0FNIFPDqWJhc3Rp
ZW4gU3p5bWFuc2tpCj4gPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPiB3cm90ZToK
Pj4KPj4gVGhpcyBwYWNrYWdlIHByb3ZpZGVzIGZpcm13YXJlcyBmb3IgTlhQIFdpRmkgKyBCbHVl
dG9vdGggY2hpcHNldHMuCj4+IEl0IGlzIG5hbWVkICJueHAtYnQtd2lmaS1maXJtd2FyZSIgc28g
dGhhdCBpdCBpcyBub3QgY29uZnVzZWQgd2l0aCB0aGUKPj4gcGFja2FnZSBmaXJtd2FyZS1pbXgu
Cj4gCj4gVGhhbmtzIGZvciB0aGUgcGF0aC4KCjopCgo+IAo+IElzIHRoZXJlIHN1cHBvcnQgaW4g
QnVpbGRyb290IGZvciB0aGUKPiBodHRwczovL2dpdGh1Yi5jb20vbnhwLWlteC9td2lmaWV4IGtl
cm5lbCBtb2R1bGVzIHRvbz8KCk5vcGUuIEkgZGlkIHRlc3QgaXQgYnV0IG91dCBvZiB0aGUgYnVp
bGRyb290IHRyZWUuIEkgaGF2ZSBhbHNvIHRlc3RlZCAKdGhlIGluLWtlcm5lbCBtd2lmaWV4IGRy
aXZlci4KClJlZ2FyZHMsCgo+IAo+IEkgd2FudCB0byB0ZXN0IHRoZSBJVzYxMiBXaWZpIG9uIHRo
ZSBpbXg5My1ldmsgYm9hcmQuCj4gCj4gVGhhbmtzLAo+IAo+IEZhYmlvIEVzdGV2YW0KCi0tIApT
w6liYXN0aWVuIFN6eW1hbnNraSwgQXJtYWRldXMgU3lzdGVtcwpTb2Z0d2FyZSBlbmdpbmVlcgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
