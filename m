Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FD3C77B7C
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 19:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C64B60AA4;
	Mon, 23 Jun 2025 19:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qJ0UgGcqD8N; Mon, 23 Jun 2025 19:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EC1E60A80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EC1E60A80;
	Mon, 23 Jun 2025 19:51:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A73212C
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 19:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BEE54097E
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 19:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxyqDomNpM6B for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 19:51:23 +0000 (UTC)
X-Greylist: delayed 474 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 23 Jun 2025 19:51:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3254640954
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3254640954
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.76.65;
 helo=2.mo582.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 2.mo582.mail-out.ovh.net (2.mo582.mail-out.ovh.net
 [46.105.76.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3254640954
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 19:51:21 +0000 (UTC)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.110.37.246])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4bQz5n2BGxz1S7r
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 19:43:25 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-g85gx (unknown [10.110.188.214])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 06C58C0D40;
 Mon, 23 Jun 2025 19:43:24 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-5b5ff79f4f-g85gx with ESMTPSA
 id OadFNVyuWWiBHQsAlRk63A
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 23 Jun 2025 19:43:24 +0000
X-OVh-ClientIp: 86.243.209.203
Message-ID: <940dc13c-453c-488b-a272-5c588074ed74@armadeus.com>
Date: Mon, 23 Jun 2025 21:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
References: <1f81ede7-bb56-4e84-b873-edfbaa8d010e@rnout.be>
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
In-Reply-To: <1f81ede7-bb56-4e84-b873-edfbaa8d010e@rnout.be>
X-Ovh-Tracer-Id: 12564198536858299253
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnheptdetkeevieegueelteejieefledtieefjefhleevjefhhfejieeigfdtuedtjedunecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppeduvdejrddtrddtrddupdekiedrvdegfedrvddtledrvddtfedpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=LhWglUm2VuD7aYJDR51qBP30kCN0a5wFzdSiRts5a7k=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1750707805; v=1;
 b=LeWBoR/fYu026nPk4YI3X7srcQNiYYA9RwVO8sU7ut+RnvIy2cRY14LblhOenJFKTFpq2E21
 5phkSZNGuHxwxybwcDRn51iOAPuzEf/PY1dhJKKcdVv60GexfQ5E2bCKuoJusBE4M79U9IDF/rl
 7TqCtrDTiNUtHGvwgA40oMPxnkEVmJN4WNQFiM1GG63oGRJ+O8KKVBI5QGL4RKtoHVr7s8NnGbQ
 etFlW6djzBVkoM21oELkdHSmZ5mQm0UYkpO0cnuaLnI12evVGaDFD3OhA+gQp+gOISImpr0mNUn
 SSgzQIucFO19ohlaUazPIuA1oRFdFcUTz/POrL2BtKd2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=LeWBoR/f
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002c3547460-4ebc-4efc-93cd-cfcc94804013,
 3F4BCB62C4A06A789BB46895925384D9C6605543)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] armabuilder failures on host-tar
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

SGkgQXJub3V0LAoKT24gNi8yMy8yNSA2OjI0IFBNLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90
ZToKPiAgwqBIaSBTZcyBYmFzdGllbiwKPiAKPiAgwqBTaW5jZSBhIGNvdXBsZSBvZiBkYXlzIChw
cm9iYWJseSBzaW5jZSAyMDI1LTA2LTIyIDIzOjQzOjM5KSwgdGhlIAo+IGFybWFidWlsZGVyIGF1
dG9idWlsZGVyIGlzIGZhaWxpbmcgY29udGludW91c2x5IFsxXSBvbiBob3N0LXRhciAob3IgCj4g
b3RoZXIgaG9zdCBwYWNrYWdlcykgd2l0aCB0aGlzIGVycm9yOgoKOi8KCj4gCj4gbWFrZVszXTog
L2Jpbi9zaDogT3BlcmF0aW9uIG5vdCBwZXJtaXR0ZWQKPiAKPiAgwqBDb3VsZCB5b3UgdGFrZSBh
IGxvb2sgYXQgd2hhdCBpcyBnb2luZyBvbj8KClN1cmUsIGl0IHNob3VsZCBiZSBmaXhlZCBub3cu
CgpUaGFua3MhClJlZ2FyZHMsCgo+IAo+ICDCoFJlZ2FyZHMsCj4gIMKgQXJub3V0Cj4gCj4gWzFd
IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvPyAKPiBzdWJtaXR0ZXI9UyVDMyVBOWJh
c3RpZW4lMjBTenltYW5za2klMjAoYXJtYWJ1aWxkZXIpCj4gCj4gCj4gCgoKLS0gClPDqWJhc3Rp
ZW4gU3p5bWFuc2tpLCBBcm1hZGV1cyBTeXN0ZW1zClNvZnR3YXJlIGVuZ2luZWVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
