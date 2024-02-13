Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A90C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 14:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12E88414C8;
	Tue, 13 Feb 2024 14:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wd3u86uB7vKd; Tue, 13 Feb 2024 14:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C899640929
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C899640929;
	Tue, 13 Feb 2024 14:13:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D3B41BF354
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 14:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47D7360B31
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 14:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8tzfrs8E995 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 14:12:58 +0000 (UTC)
X-Greylist: delayed 541 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 13 Feb 2024 14:12:57 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E60776089E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60776089E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.75.36;
 helo=2.mo561.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 2.mo561.mail-out.ovh.net (2.mo561.mail-out.ovh.net
 [46.105.75.36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E60776089E
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 14:12:57 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.25.111])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4TZ32x5m6vz1BFk
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 14:03:53 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-s59fr (unknown [10.110.113.149])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 67F831FECF;
 Tue, 13 Feb 2024 14:03:53 +0000 (UTC)
Received: from armadeus.com ([37.59.142.106])
 by ghost-submission-6684bf9d7b-s59fr with ESMTPSA
 id +C2RF8l2y2WVGgAA5gfEXQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 13 Feb 2024 14:03:53 +0000
X-OVh-ClientIp: 92.148.253.243
Message-ID: <b290bcce-1455-427e-9f6a-419c344366df@armadeus.com>
Date: Tue, 13 Feb 2024 15:02:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Arnout Vandecappelle <arnout@mind.be>
References: <20240213130444.12586-1-ju.o@free.fr>
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
In-Reply-To: <20240213130444.12586-1-ju.o@free.fr>
X-Ovh-Tracer-Id: 8559372570088696742
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudehgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeekvdevudegjeffgeelueeifedugfdvuefgvefhgfevlefhtdduvefgheetffetudenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006e66efd63-6ac9-4022-8ebb-1066f74ef995,
 8CA07152DC61E3307569CE588BF5DAD580CF0A4B)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/1] board/freescale:
 imx9-bootloader-prepare.sh: fix script
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

SGkgSnVsaWVuLCBhbGwsCgpPbiAyLzEzLzI0IDE0OjA0LCBKdWxpZW4gT2xpdmFpbiB3cm90ZToK
PiBDb21taXQgYzA1ZjI3YyAiY29uZmlncy9mcmVlc2NhbGVfaW14OTNldms6IG5ldyBkZWZjb25m
aWciLCB3aGVuCj4gYXBwbGllZCwgYWRkZWQgZmV3IFNoZWxsQ2hlY2sgZml4dXBzIG9uIHRvcCBv
ZiB0aGUgb3JnaW5pYWwKPiBzdWJtaXNzaW9uLiBEdXJpbmcgdGhvc2UgY2hhbmdlcywgb25lIGV4
dHJhIGJhY2tzbGFzaCB3YXMgYWRkZWQsCj4gbWFraW5nIHRoZSBpbXg5LWJvb3Rsb2FkZXItcHJl
cGFyZS5zaCBmYWlsLgo+IAo+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSBieSByZW1vdmlu
ZyB0aGlzIGV4dHJhIGJhY2tzbGFzaC4KPiAKPiBGaXhlczoKPiAKPiAgICAgIGRkOiBmYWlsZWQg
dG8gb3BlbiAnL2J1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzL3UtYm9vdC1hdGYtY29udGFpbmVyLmlt
Zyc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAgICAgIG1ha2U6ICoqKiBbTWFrZWZpbGU6
ODIwOiB0YXJnZXQtcG9zdC1pbWFnZV0gRXJyb3IgMQo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0tCgpSZXZpZXdlZC1ieTogU8OpYmFzdGllbiBT
enltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgpUZXN0ZWQtQnk6IFPD
qWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KClJl
Z2FyZHMsCgo+ICAgYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvaW14OS1ib290bG9hZGVyLXBy
ZXBhcmUuc2ggfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvaW14
OS1ib290bG9hZGVyLXByZXBhcmUuc2ggYi9ib2FyZC9mcmVlc2NhbGUvY29tbW9uL2lteC9pbXg5
LWJvb3Rsb2FkZXItcHJlcGFyZS5zaAo+IGluZGV4IGE5NjExYTgxYmQuLjhhYjVhMjQxYjAgMTAw
NzU1Cj4gLS0tIGEvYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvaW14OS1ib290bG9hZGVyLXBy
ZXBhcmUuc2gKPiArKysgYi9ib2FyZC9mcmVlc2NhbGUvY29tbW9uL2lteC9pbXg5LWJvb3Rsb2Fk
ZXItcHJlcGFyZS5zaAo+IEBAIC0yMSw3ICsyMSw3IEBAIG1haW4gKCkKPiAgIAkJCS1hcCAiJHtC
SU5BUklFU19ESVJ9L2JsMzEuYmluIiBhMzUgJHtBVEZfTE9BRF9BRERSfSBcCj4gICAJCQktYXAg
IiR7QklOQVJJRVNfRElSfS91LWJvb3QtaGFzaC5iaW4iIGEzNSAweDgwMjAwMDAwIFwKPiAgIAkJ
CS1hcCAiJHtCSU5BUklFU19ESVJ9L3RlZS5iaW4iIGEzNSAweDk2MDAwMDAwIFwKPiAtCQkJLW91
dCAiJHtCSU5BUklFU19ESVJ9L3UtYm9vdC1hdGYtY29udGFpbmVyLmltZyIgXAo+ICsJCQktb3V0
ICIke0JJTkFSSUVTX0RJUn0vdS1ib290LWF0Zi1jb250YWluZXIuaW1nIgo+ICAgCWVsc2UKPiAg
IAkJIiR7SE9TVF9ESVJ9L2Jpbi9ta2ltYWdlX2lteDgiIC1zb2MgSU1YOSAtYyBcCj4gICAJCQkt
YXAgIiR7QklOQVJJRVNfRElSfS9ibDMxLmJpbiIgYTM1ICR7QVRGX0xPQURfQUREUn0gXAoKLS0g
ClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1hZGV1cyBTeXN0ZW1zClNvZnR3YXJlIGVuZ2luZWVy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
