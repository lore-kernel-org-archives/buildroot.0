Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F98C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 15:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77A46FA1E;
	Thu,  3 Apr 2025 15:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlWUVt0OX6c3; Thu,  3 Apr 2025 15:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EAE16FBF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EAE16FBF0;
	Thu,  3 Apr 2025 15:30:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A15DE1F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FCD740D35
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4p-BCPVGQPRV for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 15:30:07 +0000 (UTC)
X-Greylist: delayed 2285 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 03 Apr 2025 15:30:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 862BC40DD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 862BC40DD1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=87.98.181.248;
 helo=5.mo560.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 5.mo560.mail-out.ovh.net (5.mo560.mail-out.ovh.net
 [87.98.181.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 862BC40DD1
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:30:06 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.139.3])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZT4Sv0p3Cz1r54
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:51:59 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-jd7x7 (unknown [10.110.168.159])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B1EFA1FEC5;
 Thu,  3 Apr 2025 14:51:58 +0000 (UTC)
Received: from armadeus.com ([37.59.142.101])
 by ghost-submission-5b5ff79f4f-jd7x7 with ESMTPSA
 id k0OKI46g7mdciisARD8Gkw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 03 Apr 2025 14:51:58 +0000
X-OVh-ClientIp: 92.148.159.168
Message-ID: <ca5235ca-6600-41de-8763-91a5fdfd2ca0@armadeus.com>
Date: Thu, 3 Apr 2025 16:51:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 linux-amarula@amarulasolutions.com
References: <20250402074153.4038837-1-dario.binacchi@amarulasolutions.com>
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
In-Reply-To: <20250402074153.4038837-1-dario.binacchi@amarulasolutions.com>
X-Ovh-Tracer-Id: 11569184496889359306
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfevtedtvedvveelteevgeevveeutdehieeggeekvdekuefftefhjeduteetvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrudehledrudeikedpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeitdgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=Xq/k+Or76t1c/2jwDvZoBut1azWLJKEFEeO0ZVCgPPI=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1743691919; v=1;
 b=p7jn9T62xjG9hA2+ZGmT094l1veWFAWmu6FrZfUB0xuTeDUeoiLq2cKILmo8YE0U/QEz3p9y
 9nFCiunoBUFdmyrqNDGwLw4yfy904RI84MKlFgAhz82SOi+kIqyAqA71w3Cre2FE+gexiX1X88I
 b+886+G+5XITn+1srcTXUncNHn/bQIXlky3FurmITCSsn5/7OUGSRDaQBDluk95u9HVff+PaJ9j
 SqGndk27lNF/+0wyb2C2owVvYB7Y+oKco9+eYramLX/jFsKGqepdC4lwuLCLq++uptSm8pa4bKN
 I/LVBTFPxNDcFKWFEUh0RulSTysFYSPye0gRzM/lDZolA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=p7jn9T62
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00444cde2b1-b882-4b33-8161-8356208dbdac,
 1F9D3FC4C89BAF957906548A0AD7C23D91CF96C1)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mmc-utils: bump to 2aef4cd9a84d
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

T24gNC8yLzI1IDk6NDEgQU0sIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEFtb25nIHRoZSB2YXJp
b3VzIGNoYW5nZXMsIGl0J3Mgd29ydGggbm90aW5nIHRoZSBleHRlbnNpb24gb2YgdGhlCj4gcmVn
aXN0ZXIgcmVhZCBmdW5jdGlvbmFsaXR5LCBhbGxvd2luZyBhbHNvIHRvIGdldCBpdHMgdmFsdWUg
YXMgYW4KPiBhcmd1bWVudCBbMV0uCj4gTW9yZW92ZXIsIGNvbW1pdCBbMl0gZml4ZXMgdGhlIGNv
bmRpdGlvbmFsIGludm9jYXRpb24gb2Ygc3BhcnNlCj4gcHJvcGVybHkgaGFuZGxpbmcgdGhlIGNv
cnJlc3BvbmRpbmcgJ0MnIG9wdGlvbi4gSGVuY2UsIHRoZSByZWxhdGVkCj4gY2hhbmdlIGluIHRo
ZSBCdWlsZHJvb3QgY29tcGlsYXRpb24gY29tbWFuZCAoaS5lLiBDPTApLgo+IAo+IFsxXSBodHRw
czovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL21tYy9tbWMtdXRpbHMuZ2l0L2Nv
bW1pdC8/aWQ9MjFlMGZhNjQyMDczNjgzMGE5MGUxM2I0YTgwN2VjMzQ3NWRmNWU2NQo+IFsyXSBo
dHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL21tYy9tbWMtdXRpbHMuZ2l0
L2NvbW1pdC8/aWQ9YTg5Y2JhMmEwZjhjNmExOWFhNmI4MDQ4NzcyNDExNzBmNWI2YmRkMgo+IFNp
Z25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRp
b25zLmNvbT4KPiAtLS0KPiAgIHBhY2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5oYXNoIHwgMiAr
LQo+ICAgcGFja2FnZS9tbWMtdXRpbHMvbW1jLXV0aWxzLm1rICAgfCA0ICsrLS0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6
IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4K
Ci0tIApTw6liYXN0aWVuIFN6eW1hbnNraSwgQXJtYWRldXMgU3lzdGVtcwpTb2Z0d2FyZSBlbmdp
bmVlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
