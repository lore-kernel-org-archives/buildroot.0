Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4C6C282C5
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 10:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 396E740869;
	Mon,  3 Mar 2025 10:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kY1OEVK7XdrV; Mon,  3 Mar 2025 10:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 250D1407E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 250D1407E8;
	Mon,  3 Mar 2025 10:09:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34853182
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 10:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2357080F33
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 10:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99kqQB_oUMLc for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 10:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.40.29;
 helo=14.mo584.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E979780F27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E979780F27
Received: from 14.mo584.mail-out.ovh.net (14.mo584.mail-out.ovh.net
 [46.105.40.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E979780F27
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 10:09:48 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.148.178])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4Z5sx94BfPz1RDw
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 08:51:25 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-fdm5q (unknown [10.108.42.198])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id F3CEA1FEAC;
 Mon,  3 Mar 2025 08:51:24 +0000 (UTC)
Received: from armadeus.com ([37.59.142.99])
 by ghost-submission-5b5ff79f4f-fdm5q with ESMTPSA
 id HOqHJoxtxWeStgAAYCCnJQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 03 Mar 2025 08:51:24 +0000
X-OVh-ClientIp: 92.148.253.243
Message-ID: <6e3e8537-ed1e-4648-8f2d-936e42f53c79@armadeus.com>
Date: Mon, 3 Mar 2025 09:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
References: <20250301164215.623958-1-festevam@gmail.com>
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
In-Reply-To: <20250301164215.623958-1-festevam@gmail.com>
X-Ovh-Tracer-Id: 7893965724811455349
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeekvdevudegjeffgeelueeifedugfdvuefgvefhgfevlefhtdduvefgheetffetudenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekgegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=sHcZrHOs8LFXrpGI6N54QyC0S6v23wr4ETtR8nQEVVI=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1740991885; v=1;
 b=gIg5PyAQi4t8YrAzx1U+xG0HhoZQNAHqbImqZWgzCxDH8vI9I1IqyprGIKuga8yoZ1BMghM3
 FHMRn0EG0zR/Y1w0ZeQjRU+LppAHMF5qXJtwpEAUMGTwIXwxlS+b0OAbdgnmz0sQvczFs8/TCCO
 tnsAgYD48pZvTHxXLjWyVlH446G7NMv5C9ZoWYARef0hwgczYSQPCe7Llk+ipLAeZuHY0ibwWTX
 Cn6PhFhydbObGyJqF6gIKNm683qBqCgu2Iw8y3Nu4Nl31zXBS/Y0jLGXwuUSHAGtF9NzbQLS8/O
 t2O7sZOfIr5A9v4cbIhVqxO/lTuDw8i3d+AgTyHzowm7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=gIg5PyAQ
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00372644819-a74a-457a-97fe-161c4b164cd1,
 39CF1E360B0B06E5E3976D295647969F45C67937)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH] package/freescale-imx: Forbid DDR selection
 for i.MX93
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

SGVsbG8gRmFiaW8sIGFsbCwKCk9uIDMvMS8yNSA1OjQyIFBNLCBGYWJpbyBFc3RldmFtIHdyb3Rl
Ogo+IFRoZSBEUkFNIGNvbnRyb2xsZXIgb24gdGhlIGkuTVg5MyBkb2VzIG5vdCBzdXBwb3J0IERE
UjMgbm9yIEREUjQgbWVtb3JpZXMuCj4gCj4gRm9yYmlkIHRoZSBzZWxlY3Rpb24gb2YgRERSMyBh
bmQgRERSNCBmaXJtd2FyZXMgb24gdGhlIGkuTVg5MyBjYXNlLgo+IAo+IEZpeGVzOiAxZWM5NTYx
MzBkNmYgKCJwYWNrYWdlL2ZyZWVzY2FsZS1pbXg6IEFsbG93IGZpcm13YXJlIGluc3RhbGxhdGlv
biBvbiBpLk1YOTMiKQo+IFJlcG9ydGVkLWJ5OiBTZWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3Rp
ZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogU2ViYXN0aWVuIFN6eW1h
bnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpUaGFuayB5b3UhCgpSZWdh
cmRzLAoKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1hZGV1cyBTeXN0ZW1zClNvZnR3YXJl
IGVuZ2luZWVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
