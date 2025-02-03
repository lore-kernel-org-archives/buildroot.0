Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B410C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD3BE40757;
	Mon,  3 Feb 2025 16:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3df78rdT82Hg; Mon,  3 Feb 2025 16:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8263D408B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8263D408B2;
	Mon,  3 Feb 2025 16:41:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 448FB1A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 16:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2514140B03
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 16:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0uBi52lsc2g for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 16:41:22 +0000 (UTC)
X-Greylist: delayed 4210 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Feb 2025 16:41:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74C654057B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74C654057B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.35.78;
 helo=19.mo583.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 19.mo583.mail-out.ovh.net (19.mo583.mail-out.ovh.net
 [46.105.35.78])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74C654057B
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 16:41:21 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.2.55])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4YmqwD1Xhlz1Nw8
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:21:32 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-vqckr (unknown [10.110.188.175])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id F07451FEA2
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:21:31 +0000 (UTC)
Received: from armadeus.com ([37.59.142.111])
 by ghost-submission-5b5ff79f4f-vqckr with ESMTPSA
 id 6goYMPveoGdmwQEAk3YfMg
 (envelope-from <sebastien.szymanski@armadeus.com>)
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 15:21:31 +0000
X-OVh-ClientIp: 109.89.232.55
Message-ID: <a8ea57b5-363f-4104-83ed-b9ac88d1cd8d@armadeus.com>
Date: Mon, 3 Feb 2025 16:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <Z5+uSq3r7fZjUN9x@waldemar-brodkorb.de>
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
In-Reply-To: <Z5+uSq3r7fZjUN9x@waldemar-brodkorb.de>
X-Ovh-Tracer-Id: 16067717573243235189
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhephfehheejkeevhfffgfdtffeuvdejtdejffeuleefgfelkeetudduffekteeuuedunecuffhomhgrihhnpehophgvnhhluggrphdrohhrghdpghhithhlrggsrdgtohhmnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduuddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeefmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=4A0TkeryRDs+I/ho1PMFdw5v+46Ci6doDh+vk/rOqFU=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738596092; v=1;
 b=SQ5qV0Tu/TipsJtd8TbNQfbP/OywYHedgJcya2dbtsgDkTmx5nIFeEYTtq1VyoQKv5N8vg7T
 WiqdxJvbNcEe/0fz2RIsOPujC7XyOZyk8gTpgk/FYVhcNCK8i7NhxEH+3pzVFyUgkkuWDPrXjrD
 q2tkDWdU2rlbeus+9I0hcT3cLpvpYOSQGq+VszNUJUdFGbUy6eeiGYICmUSeLlxlOW22SA380jU
 m/wRId8gaNz8o7zG26UV/WfIadY6RQR211qNNNEBd58Eg9M2YYmANOR2KZAXVoUWEdf8Wt4DoUn
 gHyhTuP0Vu7Vfagw3/AitWAorUu6gYnIYNOGit7EemkGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=SQ5qV0Tu
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-111S0056e90809c-dae0-4b06-8c86-2e8bdba5a7c6,
 42D1D123F7650646679CF9F389D148596614922C)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH] package/openldap: update to 2.5.19
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

SGVsbG8gV2FsZGVtYXIsCgpPbiAyLzIvMjUgNjo0MSBQTSwgV2FsZGVtYXIgQnJvZGtvcmIgd3Jv
dGU6Cj4gU2VlIGhlcmUgZm9yIGEgY2hhbmdlbG9nOgo+IGh0dHBzOi8vd3d3Lm9wZW5sZGFwLm9y
Zy9zb2Z0d2FyZS9yZWxlYXNlL2NoYW5nZXNfbHRzLmh0bWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBX
YWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgo+IC0tLQo+ICAgcGFja2FnZS9vcGVu
bGRhcC9vcGVubGRhcC5oYXNoIHwgNCArKy0tCj4gICBwYWNrYWdlL29wZW5sZGFwL29wZW5sZGFw
Lm1rICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVu
LnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpJIGFsc28gaGF2ZSBjb21waWxlZCBpdCBvbiBHaXRs
YWI6CgpodHRwczovL2dpdGxhYi5jb20vc3N6eW1hbnNraS9idWlsZHJvb3QvLS9waXBlbGluZXMv
MTY1MzQ3MzIyMQoKUmVnYXJkcywKCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSwgQXJtYWRldXMg
U3lzdGVtcwpTb2Z0d2FyZSBlbmdpbmVlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
