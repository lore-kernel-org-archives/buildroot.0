Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84786C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FCEC4048E;
	Tue,  4 Feb 2025 15:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeLFKIer93ng; Tue,  4 Feb 2025 15:09:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B1E640744
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B1E640744;
	Tue,  4 Feb 2025 15:09:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D75312A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CB294048E
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xk4TYa-HQ3vy for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:09:01 +0000 (UTC)
X-Greylist: delayed 95650 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 04 Feb 2025 15:08:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0ABB840873
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ABB840873
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.63.100;
 helo=6.mo575.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net
 [46.105.63.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ABB840873
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:08:59 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.148.164])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4YnRQL5NcSz1qXp
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:01:14 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-5s9v9 (unknown [10.111.182.62])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 53A7E1FEAE;
 Tue,  4 Feb 2025 15:01:14 +0000 (UTC)
Received: from armadeus.com ([37.59.142.114])
 by ghost-submission-5b5ff79f4f-5s9v9 with ESMTPSA
 id ly6fN7kromeM/wAAJYdTxA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 04 Feb 2025 15:01:14 +0000
X-OVh-ClientIp: 109.89.232.55
Message-ID: <b2769ce8-7d49-49df-a4da-3c69ef3886e3@armadeus.com>
Date: Tue, 4 Feb 2025 16:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20250204-usbutils-libiconv-v1-1-231fe27db48c@armadeus.com>
 <20250204154722.29eef633@windsurf>
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
In-Reply-To: <20250204154722.29eef633@windsurf>
X-Ovh-Tracer-Id: 3150830893477718901
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepkefhieehheeuhffgieduueekudejfeehfefgfefhkeeludeiveeiveegkefhfeeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=ksML/eumFyuVuKp/3+IGrFpNc0h5pcG/LPe7B7Y/8+k=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738681274; v=1;
 b=WwwobAhkObmWYXN2Lhb2S2MSTejy2+SruuA588aU+J7Qga3nz7/YrmBP2ECHVeBCPKKs4PvM
 i9qTgWs034EpWgrQ1JC+ltneE4rTx1P6lZ3U6afOUAAJzv1hmY4FBkf13zw2rAxXK6fj2MDNUtp
 J/EXNaY0jXzPWBLQtftWQAxe2ODYqBPoOhRQSD9MV5OSBgL+uPGkZ1WqeGmvrUmdIF39SD+YqKE
 sMXarS310aieS31ceVxpIOb18i/V+VCVQTaHy1At0RrHyDHsbQ2BDGXjKfyUtQ2xvK2EP2LqYy5
 1wM8Wyy61YOygr/yq0ioCFvju3R/Yqcd8D7wnJcH8+uTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=WwwobAhk
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-114S008aa7868b3-35d9-44f6-b1e4-a43ff0c8f042,
 4737E9D519EB4FB7C7382537C238276C7098ED2F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH] package/usbutils: select libiconv if needed
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

T24gMi80LzI1IDM6NDcgUE0sIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4gT24gVHVlLCAwNCBG
ZWIgMjAyNSAwOTozODo1MiArMDEwMAo+IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JvdGU6Cj4gCj4+IGljb252LmggaXMgYWx3YXlzIGlu
Y2x1ZGVkIGJ5IHVzYm1pc2MuYyBzbyBzZWxlY3QgQlIyX1BBQ0tBR0VfTElCSUNPTlYKPj4gaWYg
IUJSMl9FTkFCTEVfTE9DQUxFCj4gCj4gSGF2ZSB5b3UgYmVlbiBhYmxlIHRvIGZpZ3VyZSBvdXQg
c2luY2Ugd2hlbiB0aGlzIHByb2JsZW0gc3RhcnRlZAo+IG9jY3VycmluZywgc28gd2UgY2FuIHVu
ZGVyc3RhbmQgd2hldGhlciB0aGUgZml4IG5lZWRzIHRvIGJlIGJhY2twb3J0ZWQKPiB0byBhIHN0
YWJsZSBicmFuY2ggb3Igbm90PwoKVGhlcmUgaXMgb25lIGZhaWxlZCBidWlsZCBmb3IgdGhlIHNh
bWUgcmVhc29uIGZvciB1c2J1dGlscy0wMTUgWzBdLiBPbiAKMjAyNC4wMiwgd2UgaGF2ZSB1c2J1
dGlscy0wMTcgc28gaXQgY2FuIGJlIGJhY2twb3J0ZWQgdGhlcmUgSSBndWVzcy4KClswXSAKaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYThlL2E4ZTE5NjFkOTEwMDZmYjZk
OTljMGFhZjM0ODhhOThhZjczZTkxNDMvLwoKUmVnYXJkcywKCj4gCj4gVGhhbmtzIQo+IAo+IFRo
b21hcwoKCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSwgQXJtYWRldXMgU3lzdGVtcwpTb2Z0d2Fy
ZSBlbmdpbmVlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
