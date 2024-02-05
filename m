Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAD7C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C9DD404A8;
	Mon,  5 Feb 2024 14:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C9DD404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNNgDwL2RmUI; Mon,  5 Feb 2024 14:27:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65C5F40B26;
	Mon,  5 Feb 2024 14:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C5F40B26
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 456771BF2B1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AFCC40941
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AFCC40941
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0Hadwuuf2Kc for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:27:41 +0000 (UTC)
Received: from 18.mo561.mail-out.ovh.net (18.mo561.mail-out.ovh.net
 [87.98.172.162])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7021E4093D
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7021E4093D
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.25.16])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 1FD4C273E5
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:21:02 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-88wql (unknown [10.110.178.153])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B060F1FEB4;
 Mon,  5 Feb 2024 14:21:01 +0000 (UTC)
Received: from armadeus.com ([37.59.142.101])
 by ghost-submission-6684bf9d7b-88wql with ESMTPSA
 id 4d2jJ83uwGVTyQAAtZgGBw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 05 Feb 2024 14:21:01 +0000
X-OVh-ClientIp: 92.148.253.243
Message-ID: <397f4464-2f02-4b7f-b71f-ca38f950fa7f@armadeus.com>
Date: Mon, 5 Feb 2024 15:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
References: <20240115105827.3179346-1-festevam@gmail.com>
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
In-Reply-To: <20240115105827.3179346-1-festevam@gmail.com>
X-Ovh-Tracer-Id: 17207409754596830069
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfedvtddgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnheptddtieeihffhkeegheejkedtgeelheeiteejffehgfffteejgedtfeetheekuddunecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0047d893a58-d770-4bfb-bccd-354ab1149dda,
 B61640D6B145E66104E0D0FA1FBCBF41853E9D36)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH] configs/imx8mpevk: select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

SGkgRmFiaW8sIEFsbCwKCk9uIDEvMTUvMjQgMTE6NTgsIEZhYmlvIEVzdGV2YW0gd3JvdGU6Cj4g
U2VsZWN0IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTCB0byBmaXggdGhlIGZvbGxvd2lu
ZyBidWlsZAo+IGVycm9yOgo+IAo+IGluY2x1ZGUvaW1hZ2UuaDoxMzk0OjEyOiBmYXRhbCBlcnJv
cjogb3BlbnNzbC9ldnAuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAgMTM5NCB8ICMg
IGluY2x1ZGUgPG9wZW5zc2wvZXZwLmg+Cj4gICAKPiAKPiBGaXhlczogaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy81ODU4MTgwMDcwCj4gU2lnbmVkLW9m
Zi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+IC0tLQo+ICAgY29uZmln
cy9mcmVlc2NhbGVfaW14OG1wZXZrX2RlZmNvbmZpZyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4gCgpJIGNvbmZpcm1lZCB0aGlzIHBhdGNoIGZpeGVzIHRoZSBidWls
ZCBlcnJvciBtZW50aW9uZWQ6CgpUZXN0ZWQtQnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJh
c3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KClJlZ2FyZHMsCgo+IGRpZmYgLS1naXQgYS9j
b25maWdzL2ZyZWVzY2FsZV9pbXg4bXBldmtfZGVmY29uZmlnIGIvY29uZmlncy9mcmVlc2NhbGVf
aW14OG1wZXZrX2RlZmNvbmZpZwo+IGluZGV4IDgyZWQ2OGM1YTlmMS4uMmFlZDA0ODQ4MjY1IDEw
MDY0NAo+IC0tLSBhL2NvbmZpZ3MvZnJlZXNjYWxlX2lteDhtcGV2a19kZWZjb25maWcKPiArKysg
Yi9jb25maWdzL2ZyZWVzY2FsZV9pbXg4bXBldmtfZGVmY29uZmlnCj4gQEAgLTI5LDYgKzI5LDcg
QEAgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChjYWxsIGdpdGh1
YixueHAtaW14LHVib290LWlteCxsZi02LjEKPiAgIEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVG
Q09ORklHPSJpbXg4bXBfZXZrIgo+ICAgQlIyX1RBUkdFVF9VQk9PVF9DT05GSUdfRlJBR01FTlRf
RklMRVM9ImJvYXJkL2ZyZWVzY2FsZS9pbXg4bXBldmsvdWJvb3QtZnJhZ21lbnQuY29uZmlnIgo+
ICAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQo+ICtCUjJfVEFSR0VUX1VCT09UX05FRURT
X09QRU5TU0w9eQo+ICAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19VVElMX0xJTlVYPXkKPiAgIEJS
Ml9UQVJHRVRfVUJPT1RfTkVFRFNfR05VVExTPXkKPiAgIEJSMl9UQVJHRVRfVUJPT1RfRk9STUFU
X0NVU1RPTT15CgotLSAKU8OpYmFzdGllbiBTenltYW5za2ksIEFybWFkZXVzIFN5c3RlbXMKU29m
dHdhcmUgZW5naW5lZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
