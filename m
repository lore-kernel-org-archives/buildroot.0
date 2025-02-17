Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B200C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3AC56062F;
	Mon, 17 Feb 2025 12:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjEb9CbgmMv9; Mon, 17 Feb 2025 12:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D748C6064E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D748C6064E;
	Mon, 17 Feb 2025 12:40:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E91F72
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 428C06064E
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFokJNSXFSC4 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:40:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA6FE6062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA6FE6062F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA6FE6062F
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:40:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.144]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybKf-1tRFBl0GJ3-017E7x; Mon, 17
 Feb 2025 13:40:48 +0100
Message-ID: <70e6aac6-bc72-408f-be07-f0ff2e45bde1@gmx.de>
Date: Mon, 17 Feb 2025 13:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org
References: <20250131-add-wlr-randr-package-v2-1-7ea1a44b5b7e@armadeus.com>
 <2dfb2ff3959f3e8099908cb088745fb0@free.fr>
 <3e1f51fb-1c04-420b-b25d-e4f3b014b46f@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJkNTaZBQkNK+tyAAoJEO6nJs4hI1pY3qwQ
 AKdoJJHZpRu+C0hd10k6bcn5dr8ibqgsMHBJtFJuGylEsgF9ipWz1rMDWDbGVrL1jXywfwpR
 WSeFzCleJq4D0hZ5n+u+zb3Gy8fj/o3K/bXriam9kR4GfMVUATG5m9lBudrrWAdI1qlWxnmP
 WUvRSlAlA++de7mw15guDiYlIl0QvWWFgY+vf0lR2bQirmra645CDlnkrEVJ3K/UZGB0Yx67
 DfIGQswEQhnKlyv0t2VAXj96MeYmz5a7WxHqw+/8+ppuT6hfNnO6p8dUCJGx7sGGN0hcO0jN
 kDmX7NvGTEpGAbSQuN2YxtjYppKQYF/macmcwm6q17QzXyoQahhevntklUsXH9VWX3Q7mIli
 jMivx6gEa5s9PsXSYkh9e6LhRIAUpnlqGtedpozaAdfzUWPz2qkMSdaRwvsQ27z5oFZ0dCOV
 Od39G1/bWlY+104Dt7zECn3NBewzJvhHAqmAoIRKbYqRGkwTTAVNzAgx+u72PoO5/SaOrTqd
 PIsW5+d/qlrQ49LwwxG8YYdynNZfqlgc90jls+n+l3tf35OQiehVYvXFqbY7RffUk39JtjwC
 MfKqZgBTjNAHYgb+dSa7oWI8q6l26hdjtqZG+OmOZEQIZp+qLNnb0j781S59NhEVBYwZAujL
 hLJgYGgcQ/06orkrVJl7DICPoCU/bLUO8dbfzsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmQ1Nr0C
 GwwFCQPCZwAACgkQ7qcmziEjWlgY/w//Y4TYQCWQ5eWuIbGCekeXFy8dSuP+lhhvDRpOCqKt
 Wd9ywr4j6rhxdS7FIcaSLZa6IKrpypcURLXRG++bfqm9K+0HDnDHEVpaVOn7SfLaPUZLD288
 y8rOce3+iW3x50qtC7KCS+7mFaWN+2hrAFkLSkHWIywiNfkys0QQ+4pZxKovIORun+HtsZFr
 pBfZzHtXx1K9KsPq9qVjRbKdCQliRvAukIeTXxajOKHloi8yJosVMBWoIloXALjwCJPR1pBK
 E9lDhI5F5y0YEd1E8Hamjsj35yS44zCd/NMnYUMUm+3IGvX1GT23si0H9wI/e4p3iNU7n0MM
 r9aISP5j5U+qUz+HRrLLJR7pGut/kprDe2r3b00/nttlWyuRSm+8+4+pErj8l7moAMNtKbIX
 RQTOT31dfRQRDQM2E35nXMh0Muw2uUJrldrBBPwjK2YQKklpTPTomxPAnYRY8LVVCwwPy8Xx
 MCTaUC2HWAAsiG90beT7JkkKKgMLS9DxmX9BN5Cm18Azckexy+vMg79LCcfw/gocQ4+lQn4/
 3BjqSuHfj+dXG+qcQ9pgB5+4/812hHog78dKT2r8l3ax3mHZCDTAC9Ks3LQU9/pMBm6K6nnL
 a4ASpGZSg2zLGIT0gnzi5h8EcIu9J1BFq6zRPZIjxBlhswF6J0BXjlDVe/3JzmeTTts=
In-Reply-To: <3e1f51fb-1c04-420b-b25d-e4f3b014b46f@gmx.de>
X-Provags-ID: V03:K1:BxB2lds/23Z41Z+pIqbWo/0cZcke8QD3YbUCKZ9XarPulbJN/+e
 VMfXgDkkPDv0nRR1IPeFKgm8uOwH+x3oB+i95/+Wda0X49T6mF69O4qJTPRcfMmYuB4gln0
 ai6eTUPtlrOjuzXyj9JA5qJ5TvUnwjXwSVQU/GatfqLwpihexr2abEXllp3zua+w3oh1MVU
 ABnNah4MtIJPIu2hWw6ZQ==
UI-OutboundReport: notjunk:1;M01:P0:QJx3y/8F9p0=;/OO5b9PUtPXpK5GCrlP60afgmr3
 FhmCEY8QwEtemxbUApkplC2jj1aC4lak3/uYhdyfXtJwYp+NG2KS2sSnBEv+UdSo4Rc5IvmSH
 AMWhdrYr8qPOpgaGVZX5hVXLW7A1hn5aY22ZkNDy+Nqeq9UdhDRjhMryOUOKMxkwud1vXZdcK
 KXLUQiTJc746Z74WJO/P7J9nAgY6/x1mvcrX5WtzSdA6VGHDB0tlKYe9rNA8XK4OcU3NcuHgM
 Nuvi/t9VC3XBJxSbB/6X7hyR6n5LmBRZ4jxzivVp4QEBaEVhqLZTvgQ5yPOj0MbaUKIE98bg8
 l2aSoIIfd3RGVo/Mjo+wUveZ4NSnAiIwN0HSeDsWJW/bgKFmXPU0sJpA+EvdSFvtKk3vzCZlI
 MVfgLh2kNVgqkC30SjklJnzwlc/qCpM0GQavFGl5ZqB2i7fUokeUHx3wn7bMQsW05OQMP30TZ
 IpDPdHVgHY+v1FAy5dWZPWXrQDr5ZJR3JJaM+AyAxB354OiNzvuEHcZNnEshrmFZ+MDllI1MO
 IA3ff0f5ACv0h0U1EbScBDutM2YYmpHJCcdB8WPiCxkHX8srUNEoFFgjMVVKAaGccDljHxNB9
 PY6+LXd17kRhviYji42RYAPN3YCuwydRTYNs3g2kNJrK0mFcdFFg7Q7HQcSpdx1a9vVTn25wD
 6bX9k02hEIUg9ucfoj2kXz43uV2e0+9Fs9tu8FYShqtibgti5MuoA7MFa1VWmbJhMlSbgx5oJ
 RFms9iVC7JTgTjDtl2uVyDXVvZgBcEp8QD0jc681QwQu68/HYBIEelkqfjBtND4Zx117BWwzW
 IH94yV6ctXMtZxOzJmf7fzH2taqxyvE/gfNwd+fcjsVumWoKHPZTDurGY/7z81YbioQ3007Iz
 TUsptQZ7p4reS9Bk2tG6mAtbQmNqP2wdiIv2SY/kSjiFnMB6QiEE1URt+pHWLsum8OH2WqLZt
 yhJvTCyGHEjjMojdY3BUCaZvhta8VVaKiPurZ+e2xWnK3QvuJW48Qsmv3n9ogGnAWfLggBajH
 g1CG5NGaPNgvFlZj1gRCwfnUMgMSqCvvjsypFHNiMWZuHuZ7+IhGoBVqcW7S3jtFSqWOSCSva
 JXKits5J/vbsxocmvpE7w2rgdQ9uHg3XJo+gUJ1VdTUBDpBjB47bIy0M5vvEEsO1CXx+6Nx+a
 zbNGpsmofeAgL3Aj341vJO/Ulyun5GjvZ2OI0sbJV46QxsJUQkul1Y3N+L/TjO2/DXtiw45K0
 EB2qkAsv9Imw3zUE+Wk2vrtVjXL8NzdqOUAO7j8bgl1AbxQ2OSPwQZwZ/O1j5li8QEApXphcw
 im8MVfiWULC4RT1+oCJM1rQ5L5Lmt+AEaap8y5C5tIFmaUjLSdql20f8KPpGek/ZrqMJwbq0z
 ASXLk+MGiPSPWahf4dVyCQJYC5Z7xdJ/mTN9TgsPWS9pmTTnrEqT4Px/yKsV8dcBu2YwKceeM
 xkWBEeA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739796048; x=1740400848; i=fiona.klute@gmx.de;
 bh=8P0BHaOF05vJ5jAotYfsB8dcdppm2SZ5hw42wYwkPb4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=N7jTa4bt8orAxaGpUunjJI/14fXnK9SlA6oBkoud0LctjXnOGBupsQDMjUkynvoU
 xRE54O8+EQqxM7F5peBCRyzz5PSDqaeGmvijjzcW+sCWZOcODuRmyv5dECJo3rgN/
 OdWOZLxOLuZLyRbQoPS3/r4k8X4OjVAlDZABJY0s3unVIfd9hpW9yIZpwoS1FQfEG
 q8AIW0g95iasCILFh0ySZ1oXM9qDgDDfHXTR2uIBaPgyGkd5dIMJR7euQB11o8eq+
 3oKvLnXws4Pt0ZqNN1PoA8oOR37AqzJ5yMqOC2Vx1H+TOb6nzBlv9T1tbAqC2ouIT
 DgwMbenp8YeBrTO4gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=N7jTa4bt
Subject: Re: [Buildroot] [PATCH v2] package/wlr-randr: new package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU8OpYmFzdGllbiwKCmFyZSB5b3UgcGxhbm5pbmcgb24gc2VuZGluZyBhIHYzIHdpdGggdGhl
IHVDbGliYyBmaXgsIG9yIHNob3VsZCBJIGRvIHRoYXQ/CgpCZXN0IHJlZ2FyZHMsCkZpb25hCgpB
bSAwMy4wMi4yNSB1bSAxODowOSBzY2hyaWViIEZpb25hIEtsdXRlIHZpYSBidWlsZHJvb3Q6Cj4g
QW0gMDMuMDIuMjUgdW0gMTY6MTggc2NocmllYiBKdWxpZW4gT2xpdmFpbjoKPj4gSGkgU2ViYXN0
aWVuLAo+Pgo+PiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCEKPj4KPj4gT24gMzEvMDEvMjAyNSAx
MzozMCwgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4+PiBVdGlsaXR5IHRvIG1hbmFnZSBv
dXRwdXRzIG9mIGEgV2F5bGFuZCBjb21wb3NpdG9yLgo+Pj4KPj4+IFRlc3RlZC1ieTogRmlvbmEg
S2x1dGUgKFdJV0EpIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTw6li
YXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Cj4+PiAt
LS0KPj4KPj4gV2hpbGUgdGVzdGluZyB3aXRoIHRlc3QtcGtnLCBJIG9ic2VydmVkIDQgYnVpbGQg
ZmFpbHVyZXMuCj4+Cj4+IMKgwqDCoMKgIGNhdCA+IHdsci1yYW5kci5jb25maWcgPDxFT0YKPj4g
wqDCoMKgwqAgQlIyX1BBQ0tBR0VfV0FZTEFORD15Cj4+IMKgwqDCoMKgIEJSMl9QQUNLQUdFX1dM
Ul9SQU5EUj15Cj4+IMKgwqDCoMKgIEVPRgo+PiDCoMKgwqDCoCB1dGlscy90ZXN0LXBrZyAtYSAt
YyB3bHItcmFuZHIuY29uZmlnIC1wIHdsci1yYW5kcgo+PiDCoMKgwqDCoCAuLi4KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyLWFybS1iYXNpYyBb
MjgvNDBdOiBGQUlMRUQKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyLWkzODYt
cGVudGl1bTQtZnVsbCBbMzEvNDBdOiBGQUlMRUQKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJyLW1pcHM2NC1uNjQtZnVsbCBbMzIvNDBdOiBGQUlMRUQKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBici1wb3dlcnBjLTYwM2UtYmFzaWMtY3BwIFszNC80MF06IEZBSUxF
RAo+Pgo+PiBZb3UgY2FuIHJlcHJvZHVjZSB0aG9zZSBpc3N1ZXMgY3JlYXRpbmcgYSB0b29sY2hh
aW4gZmlsZQo+PiBhbmQga2VlcCBvbmx5IHRob3NlIDQgdG9vbGNoYWlucyBpbiBpdC4gRS5nLgo+
Pgo+PiDCoMKgwqDCoCBjcCBzdXBwb3J0L2NvbmZpZy1mcmFnbWVudHMvYXV0b2J1aWxkL3Rvb2xj
aGFpbi1jb25maWdzLmNzdiBteS0KPj4gdG9vbGNoYWlucy5jc3YKPj4KPj4gVGhlbiBlZGl0IHRo
ZSAibXktdG9vbGNoYWlucy5jc3YiIGZpbGUuIFRoZW4gcnVuOgo+Pgo+PiDCoMKgwqDCoCB1dGls
cy90ZXN0LXBrZyAtYSAtdCBteS10b29sY2hhaW5zLmNzdiAtYyB3bHItcmFuZHIuY29uZmlnIC1w
IHdsci0KPj4gcmFuZHIKPj4KPj4gQWxsIHRoZSBmYWlsdXJlcyBsb29rcyB0aGUgc2FtZS4gRXJy
b3IgaXM6Cj4+Cj4+IMKgwqDCoMKgIC4uL21haW4uYzogSW4gZnVuY3Rpb24g4oCYaGVhZF9oYW5k
bGVfbmFtZeKAmToKPj4gwqDCoMKgwqAgLi4vbWFpbi5jOjQxOToxNTogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHN0cmR1cOKAmTsKPj4gZGlkIHlvdSBtZWFuIOKA
mHN0cm5kdXDigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+PiDC
oMKgwqDCoMKgwqAgNDE5IHzCoCBoZWFkLT5uYW1lID0gc3RyZHVwKG5hbWUpOwo+Pgo+PiBDYW4g
eW91IGhhdmUgYSBsb29rIGF0IHRob3NlIGJ1aWxkIGlzc3VlcywgcGxlYXNlPwo+Cj4gVGhvc2Ug
dG9vbGNoYWlucyBhbGwgdXNlIHVDbGliYywgYW5kIGl0IHNlZW1zIHVDbGliYyBwcm92aWRlcyBz
dHJkdXAKPiBvbmx5IGlmIF9HTlVfU09VUkNFIGlzIGRlZmluZWQuIFRoZSBwYXRjaCBiZWxvdyBt
YWtlcyB0aGUgYnVpbGRzIHBhc3MsCj4gdGhvdWdoIEkgY2FuJ3QgcHJvbWlzZSB0aGUgcmVzdWx0
cyAqd29yayouIExvb2tpbmcgYXQgdGhlIEJ1aWxkcm9vdAo+IGNvbW1pdCBsb2cgdGhhdCBzZWVt
cyB0byBiZSBhIHNvbWV3aGF0IGNvbW1vbiBpc3N1ZSB3aXRoIHVDbGliYywgdGhvdWdoLgo+Cj4g
QmVzdCByZWdhcmRzLAo+IEZpb25hCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93bHItcmFuZHIv
d2xyLXJhbmRyLm1rIGIvcGFja2FnZS93bHItcmFuZHIvd2xyLQo+IHJhbmRyLm1rCj4gaW5kZXgg
MjI3OWUyMjkyNi4uMTc4Y2E2YjUwNyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dsci1yYW5kci93
bHItcmFuZHIubWsKPiArKysgYi9wYWNrYWdlL3dsci1yYW5kci93bHItcmFuZHIubWsKPiBAQCAt
MTEsNCArMTEsOSBAQCBXTFJfUkFORFJfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAgwqAjIGhv
c3Qtd2F5bGFuZCBpcyBmb3Igd2F5bGFuZC1zY2FubmVyCj4gIMKgV0xSX1JBTkRSX0RFUEVOREVO
Q0lFUyA9IGhvc3QtcGtnY29uZiBob3N0LXdheWxhbmQgd2F5bGFuZAo+Cj4gK2lmZXEgKCQoQlIy
X1RPT0xDSEFJTl9VU0VTX1VDTElCQykseSkKPiArIyB1Q2xpYmMgcHJvdmlkZXMgc3RyZHVwKCkg
b25seSBpZiBfR05VX1NPVVJDRSBpcyBkZWZpbmVkCj4gK1dMUl9SQU5EUl9DT05GX09QVFMgKz0g
LURjX2FyZ3M9LURfR05VX1NPVVJDRQo+ICtlbmRpZgo+ICsKPiAgwqAkKGV2YWwgJChtZXNvbi1w
YWNrYWdlKSkKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
