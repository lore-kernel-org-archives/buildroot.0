Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529E5C021BE
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 10:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 261F9610BF;
	Thu, 27 Feb 2025 10:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6IuGl_NitGk; Thu, 27 Feb 2025 10:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E098561036
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E098561036;
	Thu, 27 Feb 2025 10:44:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61B8C68
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 10:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 510F580DCE
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 10:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L54xvdNaHEAj for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 10:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.8;
 helo=13.mo584.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C29880DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C29880DC1
Received: from 13.mo584.mail-out.ovh.net (13.mo584.mail-out.ovh.net
 [178.33.251.8])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C29880DC1
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 10:44:50 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.139.47])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4Z3SRV0PV0z1V52
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 10:35:50 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-mxcx2 (unknown [10.110.118.184])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B59B71FEBE;
 Thu, 27 Feb 2025 10:35:49 +0000 (UTC)
Received: from armadeus.com ([37.59.142.102])
 by ghost-submission-5b5ff79f4f-mxcx2 with ESMTPSA
 id D/J9JAVAwGeeagAAYR5WkQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 27 Feb 2025 10:35:49 +0000
X-OVh-ClientIp: 90.11.248.239
Message-ID: <77f795b2-9f18-4e29-96fc-69d4b39747d2@armadeus.com>
Date: Thu, 27 Feb 2025 11:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
References: <20250226205144.1843356-1-festevam@gmail.com>
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
In-Reply-To: <20250226205144.1843356-1-festevam@gmail.com>
X-Ovh-Tracer-Id: 4613374871719177077
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjedvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeekvdevudegjeffgeelueeifedugfdvuefgvefhgfevlefhtdduvefgheetffetudenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekgegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=pXyJrxOK6EHx0wC9Fp0kGdbyr65gs0ZXKBf1dayFeGQ=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1740652550; v=1;
 b=rguysAaeCWtcSYJ+wJjkf93Z0zf5pyyQhRjA8SKc3N686UomDi1fy6ooycrYaynLf/5pKuUR
 K/xsMNYRp/JveIXx0rlegwMIPdk+fLI071rPgKLoy70R+1/GnDOxNlHFALnEzjzxj1Kv+bS/+Hd
 Z1aL66vzRoRHndXc4a34TvR92mdx2w9nzQkJu3GLAqido2tvuRYqzV3q64m/pV0AIT9BODjaRMt
 0bI/7XPzMlZdRv18az9ieSUtqBUwoI7VWZGTL4XhIO2dw7NIBPNsqOC8Z4T9O77bHg2bgJLmz72
 uzsPwZMVRjuapJ/u7oWfS4+dGaDhfIqkUKvYm19NRzFbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=rguysAae
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004bdfa99c8-8dcb-4021-abc8-ebc2a4298049,
 402C38FE4E7FAF5306BC1F87C1BCA7B502EE91B2)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/2] package/freescale-imx: Allow firmware
 installation on i.MX93
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

SGkgRmFiaW8sIGFsbCwKCk9uIDIvMjYvMjUgOTo1MSBQTSwgRmFiaW8gRXN0ZXZhbSB3cm90ZToK
PiAgIAo+IC1pZiBCUjJfUEFDS0FHRV9GSVJNV0FSRV9JTVhfTkVFRFNfRERSX0ZXCj4gK2lmIEJS
Ml9QQUNLQUdFX0ZJUk1XQVJFX0lNWF9ORUVEU19ERFJfRlcgfHwgQlIyX1BBQ0tBR0VfRklSTVdB
UkVfSU1YX05FRURTX0REUl9GV19JTVg5CgpXaXRoIHRoYXQgY2hhbmdlcywgdGhlIHVzZXIgY2Fu
IGNob29zZSBERFIgb24gaS5NWDl7MSwzfSBzeXN0ZW1zIHdoZXJlYXMgCm9ubHkgTFBERFIgaXMg
c3VwcG9ydGVkLiBUaGUgRERSMyBhbmQgRERSNCBvcHRpb25zIHNob3VsZCBiZSBoaWRkZW4gb24g
CmkuTVg5My4KClJlZ2FyZHMsCgo+ICAgCj4gICBjaG9pY2UKPiAgIAlib29sICJERFIgdHJhaW5p
bmcgYmluYXJpZXMiCgoKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1hZGV1cyBTeXN0ZW1z
ClNvZnR3YXJlIGVuZ2luZWVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
