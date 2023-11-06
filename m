Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1F3C4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 09:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B04F40C13;
	Mon,  6 Nov 2023 09:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B04F40C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYkIXXWfzSFl; Mon,  6 Nov 2023 09:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11EAE40C16;
	Mon,  6 Nov 2023 09:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11EAE40C16
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6A841BF316
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EDDB41D76
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EDDB41D76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zO2hBUX8_4lG for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 09:06:47 +0000 (UTC)
X-Greylist: delayed 3290 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 Nov 2023 09:06:46 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDBC541BDE
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net
 [178.33.251.173])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDBC541BDE
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 09:06:46 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.156.220])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id AB177265BB
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 08:57:00 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-2vwkh (unknown [10.110.115.224])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2F6D61FE9F;
 Mon,  6 Nov 2023 08:57:00 +0000 (UTC)
Received: from armadeus.com ([37.59.142.110])
 by ghost-submission-6684bf9d7b-2vwkh with ESMTPSA
 id +D2RBlyqSGWREhEA2VPDxA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 06 Nov 2023 08:57:00 +0000
X-OVh-ClientIp: 92.148.253.243
Message-ID: <7f0c8620-e888-4dc6-a755-47fe5438f367@armadeus.com>
Date: Mon, 6 Nov 2023 09:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231011110932.4425-1-sebastien.szymanski@armadeus.com>
 <20231011110932.4425-2-sebastien.szymanski@armadeus.com>
 <20231103101626.70a83c47@windsurf>
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
In-Reply-To: <20231103101626.70a83c47@windsurf>
X-Ovh-Tracer-Id: 12275686688493202431
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddufedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepueejffehhedvtdeuhfejveevffekteffgfetvdejkeelledvhfejleefleduudeinecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0041c1502eb-f1aa-4c4c-9550-0bbd22057c3f,
 BC1146EEEF18C09ACD714886CB2ED73D47DF7878)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/4] package/imx-mkimage: bump version to
 lf-6.1.36-2.1.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gMTEvMy8yMyAxMDoxNiwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToK
PiBIZWxsbyBTw6liYXN0aWVuLAo+IAo+IE9uIFdlZCwgMTEgT2N0IDIwMjMgMTM6MDk6MjkgKzAy
MDAKPiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5j
b20+IHdyb3RlOgo+IAo+PiBCdW1wIGlteC1ta2ltYWdlIHRvIHRoZSBsYXRlc3QgdmVyc2lvbiB0
byBnYWluIGkuTVg5IHN1cHBvcnQuCj4+Cj4+IFBhdGNoIDAwMDEgYW5kIDAwMDQgYXJlIG1lcmdl
ZCB1cHN0cmVhbToKPj4gaHR0cHM6Ly9naXRodWIuY29tL254cC1pbXgvaW14LW1raW1hZ2UvY29t
bWl0L2ZmMjNjNGZkODRiYjg4ZDczYjUyYTBjY2FkNzMzNTIyZDJmYWE0NzcKPj4gaHR0cHM6Ly9n
aXRodWIuY29tL254cC1pbXgvaW14LW1raW1hZ2UvY29tbWl0L2JjZTgyOTEyYzgyMDZlZGQwY2M5
N2FmOGM2YjMwMjQwMjI5ZmFlN2YKPj4KPj4gUGF0Y2ggMDAwMiBpcyBubyBtb3JlIG5lZWRlZCwg
QlVJTERfTERGTEFHUyB2YXIgaXMgbm93IGF2YWlsYWJsZToKPj4gaHR0cHM6Ly9naXRodWIuY29t
L254cC1pbXgvaW14LW1raW1hZ2UvY29tbWl0LzgxODVhMDAwYTdjNmFmNTYyZTc3M2RhODEyYzZj
OGQxNDE4MTU1MzEKPj4KPj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNl
YmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+IAo+IEkndmUgYXBwbGllZCwgYWZ0ZXIg
ZG9pbmcgc29tZSBmaXhlcy4KPiAKPj4gLS0tCj4+ICAgLi4ub3ZlcnJpZGluZy1CTDMyLWFuZC1C
TDMzLW5vdC1vbmx5LUJMLnBhdGNoIHwgNjAgLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgLi4uLzAw
MDItQWRkLUxERkxBR1MtdG8tbGluay1zdGVwLnBhdGNoICAgICAgIHwgMjYgLS0tLS0tLS0KPj4g
ICAuLi5ydC1mb3Itb3ZlcnJpZGluZy1CTDMxLUJMMzItYW5kLUJMMzMucGF0Y2ggfCA2MSAtLS0t
LS0tLS0tLS0tLS0tLS0tCj4+ICAgcGFja2FnZS9pbXgtbWtpbWFnZS9pbXgtbWtpbWFnZS5oYXNo
ICAgICAgICAgIHwgIDIgKy0KPj4gICBwYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLm1r
ICAgICAgICAgICAgfCAgNyArKy0KPj4gICA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMTUxIGRlbGV0aW9ucygtKQo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2lteC1t
a2ltYWdlLzAwMDEtQWRkLXN1cHBvcnQtZm9yLW92ZXJyaWRpbmctQkwzMi1hbmQtQkwzMy1ub3Qt
b25seS1CTC5wYXRjaAo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2lteC1ta2ltYWdl
LzAwMDItQWRkLUxERkxBR1MtdG8tbGluay1zdGVwLnBhdGNoCj4+ICAgZGVsZXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvaW14LW1raW1hZ2UvMDAwNC1BZGQtc3VwcG9ydC1mb3Itb3ZlcnJpZGluZy1C
TDMxLUJMMzItYW5kLUJMMzMucGF0Y2gKPiAKPiBUaGUgcmVtYWluaW5nIHBhdGNoIDAwMDMgc2hv
dWxkIGhhdmUgYmVlbiByZW51bWJlcmVkIDAwMDEsIGFuZCB0aGUKPiByZW1vdmVkIHBhdGNoZXMg
MDAwMSwgMDAwMiBhbmQgMDAwNCBzaG91bGQgaGF2ZSBiZWVuIGRyb3BwZWQgZnJvbSB0aGUKPiAu
Y2hlY2twYWNrYWdlaWdub3JlIGZpbGUuCj4gCj4+ICAgSU1YX01LSU1BR0VfTElDRU5TRSA9IEdQ
TC0yLjArCj4+ICAgSU1YX01LSU1BR0VfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAKPiBUaGlz
IHdhcyBubyBsb25nZXIgY29ycmVjdCBhcyB0aGUgZmlsZSBoYXMgYmVlbiByZW5hbWVkICJMSUNF
TlNFIiwgc28KPiB0aGUgbGVnYWwgaW5mb3JtYXRpb24gd2FzIG5vdCB3b3JraW5nLgo+IAo+IElu
IGdlbmVyYWwsIHBsZWFzZSB0cnkgdG8gcnVuICJtYWtlIGNoZWNrLXBhY2thZ2UiIGFuZCAibWFr
ZQo+IDxwa2c+LWxlZ2FsLWluZm8iIHRvIHZlcmlmeSB0aGlzIHNvcnQgb2YgZGV0YWlscy4KCkkg
ZGlkbid0IGtub3cgYWJvdXQgdGhlIC5jaGVja3BhY2thZ2VpZ25vcmUgZmlsZS4gSSdsbCBwYXkg
YXR0ZW50aW9uIHRvIAppdCBhbmQgdGhlIF9MSUNFTlNFX0ZJTEVTIG5leHQgdGltZSEgVGhhbmtz
IQoKUmVnYXJkcywKCj4gCj4gUHVzaGVkIHdpdGggdGhvc2UgY2hhbmdlcy4gVGhhbmtzIGEgbG90
IQo+IAo+IFRob21hcwoKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1hZGV1cyBTeXN0ZW1z
ClNvZnR3YXJlIGVuZ2luZWVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
