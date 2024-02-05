Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37143C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7770840459;
	Mon,  5 Feb 2024 17:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7770840459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIDqgJC6RB4z; Mon,  5 Feb 2024 17:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52C9D404A0;
	Mon,  5 Feb 2024 17:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52C9D404A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9894D1BF2B1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ABB7404A0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ABB7404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nnwxx9m_S3EM for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:02:48 +0000 (UTC)
Received: from 13.mo582.mail-out.ovh.net (13.mo582.mail-out.ovh.net
 [188.165.56.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A99D240459
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A99D240459
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.176.170])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id AB8B226BBB
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:53:56 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-d2w8j (unknown [10.110.178.109])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5DD5E1FD22;
 Mon,  5 Feb 2024 16:53:56 +0000 (UTC)
Received: from armadeus.com ([37.59.142.95])
 by ghost-submission-6684bf9d7b-d2w8j with ESMTPSA
 id FVbDE6QSwWVjPwEA5uOYuQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 05 Feb 2024 16:53:56 +0000
X-OVh-ClientIp: 92.148.253.243
Message-ID: <506452af-5722-41d3-a5f2-2a9eed0d4263@armadeus.com>
Date: Mon, 5 Feb 2024 17:53:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wojciech Nizinski <wojciech.nizinski@grinn-global.com>,
 buildroot@buildroot.org
References: <20230914165046.3687491-1-wojciech.nizinski@grinn-global.com>
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
In-Reply-To: <20230914165046.3687491-1-wojciech.nizinski@grinn-global.com>
X-Ovh-Tracer-Id: 1343198590839679861
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfedvuddgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepkedvvedugeejffegleeuieefudfgvdeugfevhffgveelhfdtudevgfehtefftedunecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0015bc5913c-623b-4759-bc43-84ce73490728,
 B61640D6B145E66104E0D0FA1FBCBF41853E9D36)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/1] board/freescale/common/imx:
 imx8-bootloader-prepare: enable error checking
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

SGkgV29qY2llY2gsIEFsbCwKCkkgdGVzdGVkIHlvdXIgcGF0Y2ggYW5kIGl0IGRvZXMgd29yay4g
SSBoYXZlIHNvbWUgY29tbWVudHMgdGhvdWdoLCBzZWUgCmJlbG93Li4uCgpPbiA5LzE0LzIzIDE4
OjUwLCBXb2pjaWVjaCBOaXppbnNraSB3cm90ZToKPiBSdW4gc2NyaXB0IHdpdGggJ2VycmV4aXQn
IGJhc2ggb3B0aW9uIHRvIGRldGVjdCBhbnkgZXJyb3JzIGZyb20KPiBzdWJjb21tYW5kcy4KPiAK
PiBJdCB3aWxsIGZpeCBzaXR1YXRpb24gd2hlcmUgJ2Rkcl9mdy5iaW4nIHdhcyBtaXNzaW5nIGJ1
dCBzdWNjZXNzZnVsbAo+IGJ1aWxkIGNyZWF0ZWQgYnJva2VuIGJvb3QgaW1hZ2UuIFBvc3QgaW1h
Z2Ugc2NyaXB0IHJlcG9ydCB0aGlzIGJ5Ogo+IAo+IGNhdDogL2hvbWUvdXNlci9idWlsZHJvb3Qv
b3V0cHV0L2ltYWdlcy9kZHJfZncuYmluOiBObyBzdWNoIGZpbGUgb3IKPiBkaXJlY3RvcnkKPiAK
PiBhbmQgYnVpbGQgZmluaXNoIHdpdGggc3VjY2Vzcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXb2pj
aWVjaCBOaXppbnNraSA8d29qY2llY2gubml6aW5za2lAZ3Jpbm4tZ2xvYmFsLmNvbT4KPiAtLS0K
PiAgIGJvYXJkL2ZyZWVzY2FsZS9jb21tb24vaW14L2lteDgtYm9vdGxvYWRlci1wcmVwYXJlLnNo
IHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0
IGEvYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvaW14OC1ib290bG9hZGVyLXByZXBhcmUuc2gg
Yi9ib2FyZC9mcmVlc2NhbGUvY29tbW9uL2lteC9pbXg4LWJvb3Rsb2FkZXItcHJlcGFyZS5zaAo+
IGluZGV4IDdlYmYxNWI2ZmYuLjhkNDRlNTg4YzUgMTAwNzU1Cj4gLS0tIGEvYm9hcmQvZnJlZXNj
YWxlL2NvbW1vbi9pbXgvaW14OC1ib290bG9hZGVyLXByZXBhcmUuc2gKPiArKysgYi9ib2FyZC9m
cmVlc2NhbGUvY29tbW9uL2lteC9pbXg4LWJvb3Rsb2FkZXItcHJlcGFyZS5zaAo+IEBAIC03Myw0
ICs3Myw1IEBAIG1haW4gKCkKPiAgIAlleGl0ICQ/Cj4gICB9Cj4gICAKPiArc2V0IC1vIGVycmV4
aXQKCkZvciBjb25zaXN0ZW5jeSwgbWF5YmUgeW91IHNob3VsZCB1c2UgJ3NldCAtZScgaGVyZS4g
KHV0aWxzL2RvY2tlci1ydW4gCmlzIHRoZSBvbmx5IHNjcmlwdCB0aGF0IHVzZXMgJytzZXQgLW8g
ZXJyZXhpdCcpCgpBbHNvLCB0aGUgb25seSB3YXkgKEkgYW0gdGhpbmtpbmcgb2YpIHRvIG5vdCBo
YXZlIHRoZSBkZHJfZncuYmluIGZpbGUgaXMgCmlmIHRoZSB1c2VyIGRpZG4ndCBzZWxlY3QgdGhl
IGZpcm13YXJlLWlteCBwYWNrYWdlLiBNYXliZSwgdGhlIHNjcmlwdCAKc2hvdWxkIHByb2R1Y2Vz
IGFuIGhpbnQgdG8gdGhlIHVzZXIgYWJvdXQgaG93IHRvIGdldCB0aGF0IGRkcl9mdyBiaW4gZmls
ZT8KCiJkZHJfZncgZmlsZSBub3QgZm91bmQ6IGRpZCB5b3Ugc2VsZWN0IGZpcm13YXJlLWlteCBw
YWNrYWdlPyIKClJlZ2FyZHMsCgo+ICAgbWFpbiAkQAoKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tp
LCBBcm1hZGV1cyBTeXN0ZW1zClNvZnR3YXJlIGVuZ2luZWVyCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
