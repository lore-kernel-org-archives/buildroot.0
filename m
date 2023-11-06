Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E96C4167B
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 08:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C5741EB1;
	Mon,  6 Nov 2023 08:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97C5741EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UvMvhudYgba1; Mon,  6 Nov 2023 08:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B780E41EAC;
	Mon,  6 Nov 2023 08:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B780E41EAC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC2811BF410
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 08:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 940BB41EAC
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 08:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 940BB41EAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CM3bG0oOyPod for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 08:29:33 +0000 (UTC)
X-Greylist: delayed 607 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 Nov 2023 08:29:33 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1402D41DC5
Received: from 8.mo584.mail-out.ovh.net (8.mo584.mail-out.ovh.net
 [188.165.33.112])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1402D41DC5
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 08:29:32 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.146.166])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 2735926F83
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 08:11:54 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-578g4 (unknown [10.110.208.100])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9E81A1FEA5;
 Mon,  6 Nov 2023 08:11:53 +0000 (UTC)
Received: from armadeus.com ([37.59.142.97])
 by ghost-submission-6684bf9d7b-578g4 with ESMTPSA
 id 8eZvJMmfSGUxMAAAPU2Gkg
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 06 Nov 2023 08:11:53 +0000
X-OVh-ClientIp: 92.148.253.243
Message-ID: <679e812d-965a-485b-b6b6-df15a2b01be0@armadeus.com>
Date: Mon, 6 Nov 2023 09:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231105061347.2854218-1-james.hilliard1@gmail.com>
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
In-Reply-To: <20231105061347.2854218-1-james.hilliard1@gmail.com>
X-Ovh-Tracer-Id: 11514015397517388609
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddufedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepffffleettddtffetieekveeftedutdfgffffgfeihfejffdtgfetledufeelkeeknecuffhomhgrihhnpehphihpihdrohhrghdpphihthhhohhnhhhoshhtvggurdhorhhgnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0028b229cd9-070d-426f-950b-0b1ddd81047b,
 BC1146EEEF18C09ACD714886CB2ED73D47DF7878)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-login: bump to
 version 0.6.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTEvNS8yMyAwNzoxMywgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gICBwYWNr
YWdlL3B5dGhvbi1mbGFzay1sb2dpbi9weXRob24tZmxhc2stbG9naW4uaGFzaCB8IDQgKystLQo+
ICAgcGFja2FnZS9weXRob24tZmxhc2stbG9naW4vcHl0aG9uLWZsYXNrLWxvZ2luLm1rICAgfCA0
ICsrLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi9weXRob24tZmxh
c2stbG9naW4uaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWZsYXNrLWxvZ2luL3B5dGhvbi1mbGFzay1s
b2dpbi5oYXNoCj4gaW5kZXggYzg4YjcwZjJkNS4uYWYwMzRhZTc1MSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi9weXRob24tZmxhc2stbG9naW4uaGFzaAo+ICsrKyBi
L3BhY2thZ2UvcHl0aG9uLWZsYXNrLWxvZ2luL3B5dGhvbi1mbGFzay1sb2dpbi5oYXNoCj4gQEAg
LTEsNSArMSw1IEBACj4gICAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBp
L2ZsYXNrLWxvZ2luL2pzb24KPiAtbWQ1ICA4MDIwYjIyYWQ3ZWM2ZjE3MDM0ZjkwMTE3YTUyMDYz
MyAgRmxhc2stTG9naW4tMC42LjIudGFyLmd6Cj4gLXNoYTI1NiAgYzBhN2JhYTlmZGM0NDhjZGQz
ZGQ2ZjA5MzlkZjcyZWVjNTE3N2IyZjdhYmU2Y2I4MmZjOTM0ZDI5Y2FhYzljMyAgRmxhc2stTG9n
aW4tMC42LjIudGFyLmd6Cj4gK21kNSAgNjg5NTY0YjhiN2YzNzgyZjBkYjM4MmI3YWE4NWJiYzIg
IEZsYXNrLUxvZ2luLTAuNi4zLnRhci5nego+ICtzaGEyNTYgIDVlMjNkMTRhNjA3ZWYxMjgwNmM2
OTk1OTBiODlkMGYwZTBkNjdiYWVlYzU5OWQ3NTk0N2JmOWMxNDczMzAzMzMgIEZsYXNrLUxvZ2lu
LTAuNi4zLnRhci5nego+ICAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAg
IHNoYTI1NiAgN2E5ZGZiOWM1ZGEyMDRlZDEzNzBmM2I2MmMxM2UyOTkyYTEyZGExZGE3MDdmNDdl
MTU2ODk3ZWViNDM0NGU1YiAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1m
bGFzay1sb2dpbi9weXRob24tZmxhc2stbG9naW4ubWsgYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1s
b2dpbi9weXRob24tZmxhc2stbG9naW4ubWsKPiBpbmRleCAzOTRmZTE5N2UzLi5lZDEwYzk4ZjVh
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWZsYXNrLWxvZ2luL3B5dGhvbi1mbGFzay1s
b2dpbi5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWZsYXNrLWxvZ2luL3B5dGhvbi1mbGFzay1s
b2dpbi5tawo+IEBAIC00LDkgKzQsOSBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiAgIAo+IC1QWVRIT05fRkxBU0tfTE9HSU5fVkVSU0lPTiA9IDAuNi4yCj4gK1BZVEhPTl9G
TEFTS19MT0dJTl9WRVJTSU9OID0gMC42LjMKPiAgIFBZVEhPTl9GTEFTS19MT0dJTl9TT1VSQ0Ug
PSBGbGFzay1Mb2dpbi0kKFBZVEhPTl9GTEFTS19MT0dJTl9WRVJTSU9OKS50YXIuZ3oKPiAtUFlU
SE9OX0ZMQVNLX0xPR0lOX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFj
a2FnZXMvY2MvZGEvZWFlNDViYTllYzU4YWY0NWI0NmVmOTRjNmNhMDRmYjIxMWVlNTdjMDY0MjFi
Njk2ZTg5NGViMTFiMDY0Cj4gK1BZVEhPTl9GTEFTS19MT0dJTl9TSVRFID0gaHR0cHM6Ly9maWxl
cy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2MzLzZlLzJmNGUxM2UzNzNiYjQ5ZTY4YzAyYzUx
Y2VhZGQyMmQxNzI3MTVhMDY3MTZmOTI5OWQ5ZGYwMWI2ZGRiMgo+ICAgUFlUSE9OX0ZMQVNLX0xP
R0lOX0xJQ0VOU0UgPSBNSVQKPiAgIFBZVEhPTl9GTEFTS19MT0dJTl9MSUNFTlNFX0ZJTEVTID0g
TElDRU5TRQo+ICAgUFlUSE9OX0ZMQVNLX0xPR0lOX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCgpS
ZXZpZXdlZC1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJt
YWRldXMuY29tPgoKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1hZGV1cyBTeXN0ZW1zClNv
ZnR3YXJlIGVuZ2luZWVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
