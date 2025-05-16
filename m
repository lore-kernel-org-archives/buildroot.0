Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3DEC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3002561254;
	Fri, 16 May 2025 17:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6YacBKNLrRV; Fri, 16 May 2025 17:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5208B60687
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5208B60687;
	Fri, 16 May 2025 17:05:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC7DF1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92956400D2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQXCcjqwAzR0 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:05:32 +0000 (UTC)
X-Greylist: delayed 8400 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 16 May 2025 17:05:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDAA840025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDAA840025
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.60.232;
 helo=3.mo550.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 3.mo550.mail-out.ovh.net (3.mo550.mail-out.ovh.net
 [46.105.60.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDAA840025
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:05:30 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.9.136])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4ZzV560GqDz1csv
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:36:26 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-2jfzt (unknown [10.110.118.167])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CB0BD1FE54;
 Fri, 16 May 2025 14:36:25 +0000 (UTC)
Received: from armadeus.com ([37.59.142.99])
 by ghost-submission-5b5ff79f4f-2jfzt with ESMTPSA
 id MAG1JWlNJ2gw1wAARHEkUQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 16 May 2025 14:36:25 +0000
X-OVh-ClientIp: 86.243.209.203
Message-ID: <654d0056-4417-4e7c-888c-063e3cc7d972@armadeus.com>
Date: Fri, 16 May 2025 16:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juan Pablo Montero Castro <juanpablo.monterocastro@nxp.com>,
 buildroot@buildroot.org
References: <20250516142827.3211350-1-juanpablo.monterocastro@nxp.com>
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
In-Reply-To: <20250516142827.3211350-1-juanpablo.monterocastro@nxp.com>
X-Ovh-Tracer-Id: 5577989616997493621
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnheptddtveeufeekfeefleetleeuheettdevhfejtedthffhvdffgeffvddtleeuvddunecuffhomhgrihhnpehngihprdgtohhmpdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpkeeirddvgeefrddvtdelrddvtdefpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=ZU96o5tBYYjwyua5BExXnKWvuGQDTQopQVOWJCetD70=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1747406186; v=1;
 b=XxlxZAop6HVvtbyH3puVnm+fLmyhttw8vj7vQg1FrOBhCZQKczqLut2Q4pRlqlbx203mwA1T
 hzXd0vFIScEv+Z9TlU4xfB/A14eIQMy6p0GRIty6C8iaTpaSH0XAc+pCuTNRGE1WsRwd/KNuJN8
 CNuR5SKcPc/AP38fy6tjTVRPw8AtiigMQP/jpvXvaVkRZBBRMlkWzyNAQeTYeq7U56VoKUMYQgd
 u2SQB5yL+duJCG+5tW2aacT19sbd5V1oKPgwdc3zNK3z+O+5/uMfJVbyyUWfwJD/BB33rOWfY44
 agbCj9EfZg5AdJC31IsW3UoQOPz6IEpL6M+MHYqnG2l2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=XxlxZAop
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003fb7be56b-2404-42e7-b572-8e2008207004,
 BA9519130519BA8EEA07DE8274599FCBA8423A11)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/1] fix imx9 bootloader preparation script
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

SGVsbG8sCgpPbiA1LzE2LzI1IDQ6MjggUE0sIEp1YW4gUGFibG8gTW9udGVybyBDYXN0cm8gd3Jv
dGU6Cj4gRnJvbTogSnVhbiBQYWJsbyBNT05URVJPIENBU1RSTyA8anVhbnBhYmxvLm1vbnRlcm9j
YXN0cm9AbnhwLmNvbT4KPiAKPiBUaGlzIGNvbW1pdCByZXBsYWNlcyBBMzUgd2l0aCBBNTUgaW4g
aW14OSBib290bG9hZGVyIHByZXBhcmF0aW9uIHNjcmlwdC4KPiBpLk1YOSBmYW1pbGllcyBoYXZl
IENvcnRleEE1NSwgc2VlIGxpbmsgYmVsb3c6Cj4gaHR0cHM6Ly93d3cubnhwLmNvbS9wcm9kdWN0
cy9wcm9jZXNzb3JzLWFuZC1taWNyb2NvbnRyb2xsZXJzL2FybS1wcm9jZXNzb3JzL2ktbXgtYXBw
bGljYXRpb25zLXByb2Nlc3NvcnMvaS1teC05LXByb2Nlc3NvcnM6SU1YOS1QUk9DRVNTT1JTCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnVhbiBQYWJsbyBNT05URVJPIENBU1RSTyA8anVhbnBhYmxvLm1v
bnRlcm9jYXN0cm9AbnhwLmNvbT4KPiAtLS0KPiAgIC4uLi9mcmVlc2NhbGUvY29tbW9uL2lteC9p
bXg5LWJvb3Rsb2FkZXItcHJlcGFyZS5zaCAgfCAxMiArKysrKystLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCgpJdCB1c2VkIHRvIGJl
IGEzNSBpbiB0aGUgaW14LWltYWdlIHBhY2thZ2Ugc2NyaXB0cyBub3cgaXQgaGFzIGJlZW4gCmNo
YW5nZWQgdG8gYTU1OgoKaHR0cHM6Ly9naXRodWIuY29tL254cC1pbXgvaW14LW1raW1hZ2UvY29t
bWl0LzZlZjUzMjZkODU5YzkzODIzNTQyMjM3NmRkZDgwYmMyNGM0MTJkZjUKClNvLAoKUmV2aWV3
ZWQtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
LmNvbT4KClRoYW5rcyEKCj4gZGlmZiAtLWdpdCBhL2JvYXJkL2ZyZWVzY2FsZS9jb21tb24vaW14
L2lteDktYm9vdGxvYWRlci1wcmVwYXJlLnNoIGIvYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgv
aW14OS1ib290bG9hZGVyLXByZXBhcmUuc2gKPiBpbmRleCA4YWI1YTI0MWIwLi4yZGI4ODdhNzg1
IDEwMDc1NQo+IC0tLSBhL2JvYXJkL2ZyZWVzY2FsZS9jb21tb24vaW14L2lteDktYm9vdGxvYWRl
ci1wcmVwYXJlLnNoCj4gKysrIGIvYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvaW14OS1ib290
bG9hZGVyLXByZXBhcmUuc2gKPiBAQCAtMTgsMTkgKzE4LDE5IEBAIG1haW4gKCkKPiAgIAo+ICAg
CWlmIGdyZXAgLUVxICJeQlIyX1RBUkdFVF9PUFRFRV9PUz15JCIgIiR7QlIyX0NPTkZJR30iOyB0
aGVuCj4gICAJCSIke0hPU1RfRElSfS9iaW4vbWtpbWFnZV9pbXg4IiAtc29jIElNWDkgLWMgXAo+
IC0JCQktYXAgIiR7QklOQVJJRVNfRElSfS9ibDMxLmJpbiIgYTM1ICR7QVRGX0xPQURfQUREUn0g
XAo+IC0JCQktYXAgIiR7QklOQVJJRVNfRElSfS91LWJvb3QtaGFzaC5iaW4iIGEzNSAweDgwMjAw
MDAwIFwKPiAtCQkJLWFwICIke0JJTkFSSUVTX0RJUn0vdGVlLmJpbiIgYTM1IDB4OTYwMDAwMDAg
XAo+ICsJCQktYXAgIiR7QklOQVJJRVNfRElSfS9ibDMxLmJpbiIgYTU1ICR7QVRGX0xPQURfQURE
Un0gXAo+ICsJCQktYXAgIiR7QklOQVJJRVNfRElSfS91LWJvb3QtaGFzaC5iaW4iIGE1NSAweDgw
MjAwMDAwIFwKPiArCQkJLWFwICIke0JJTkFSSUVTX0RJUn0vdGVlLmJpbiIgYTU1IDB4OTYwMDAw
MDAgXAo+ICAgCQkJLW91dCAiJHtCSU5BUklFU19ESVJ9L3UtYm9vdC1hdGYtY29udGFpbmVyLmlt
ZyIKPiAgIAllbHNlCj4gICAJCSIke0hPU1RfRElSfS9iaW4vbWtpbWFnZV9pbXg4IiAtc29jIElN
WDkgLWMgXAo+IC0JCQktYXAgIiR7QklOQVJJRVNfRElSfS9ibDMxLmJpbiIgYTM1ICR7QVRGX0xP
QURfQUREUn0gXAo+IC0JCQktYXAgIiR7QklOQVJJRVNfRElSfS91LWJvb3QtaGFzaC5iaW4iIGEz
NSAweDgwMjAwMDAwIFwKPiArCQkJLWFwICIke0JJTkFSSUVTX0RJUn0vYmwzMS5iaW4iIGE1NSAk
e0FURl9MT0FEX0FERFJ9IFwKPiArCQkJLWFwICIke0JJTkFSSUVTX0RJUn0vdS1ib290LWhhc2gu
YmluIiBhNTUgMHg4MDIwMDAwMCBcCj4gICAJCQktb3V0ICIke0JJTkFSSUVTX0RJUn0vdS1ib290
LWF0Zi1jb250YWluZXIuaW1nIgo+ICAgCWZpCj4gICAKPiAgIAkiJHtIT1NUX0RJUn0vYmluL21r
aW1hZ2VfaW14OCIgLXNvYyBJTVg5IC1hcHBlbmQgIiR7QklOQVJJRVNfRElSfS9haGFiLWNvbnRh
aW5lci5pbWciIC1jIFwKPiAtCQktYXAgIiR7QklOQVJJRVNfRElSfS91LWJvb3Qtc3BsLWRkci5i
aW4iIGEzNSAke1NQTF9MT0FEX0FERFJ9IFwKPiArCQktYXAgIiR7QklOQVJJRVNfRElSfS91LWJv
b3Qtc3BsLWRkci5iaW4iIGE1NSAke1NQTF9MT0FEX0FERFJ9IFwKPiAgIAkJLW91dCAiJHtCSU5B
UklFU19ESVJ9L2lteDktYm9vdC1zZC5iaW4iCj4gICAKPiAgIAlmbGFzaGJpbl9zaXplPSIkKHdj
IC1jICIke0JJTkFSSUVTX0RJUn0vaW14OS1ib290LXNkLmJpbiIgfCBhd2sgJ3twcmludCAkMX0n
KSIKCgotLSAKU8OpYmFzdGllbiBTenltYW5za2ksIEFybWFkZXVzIFN5c3RlbXMKU29mdHdhcmUg
ZW5naW5lZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
