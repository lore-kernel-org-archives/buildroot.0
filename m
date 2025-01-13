Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6F1C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 21:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9C9780561;
	Mon, 13 Jan 2025 21:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Adja8usHS8C2; Mon, 13 Jan 2025 21:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B77C180842
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B77C180842;
	Mon, 13 Jan 2025 21:40:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72C8FF05
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 605996082A
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCTwNnhtIEKf for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 21:40:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 416E1607CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 416E1607CF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 416E1607CF
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:40:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.64]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZkpR-1u1YQR3tB9-00JFBx; Mon, 13
 Jan 2025 22:40:01 +0100
Message-ID: <f73b2857-8857-46df-a182-697731146196@gmx.de>
Date: Mon, 13 Jan 2025 22:40:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-4-fiona.klute@gmx.de>
 <20250113213003.0b2ef4ec@windsurf>
 <c8ac2b3f-4652-4764-a302-c518bd0f1696@gmx.de>
 <20250113222223.7e909bca@windsurf>
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
In-Reply-To: <20250113222223.7e909bca@windsurf>
X-Provags-ID: V03:K1:9dXU4eUB7xrg9gbFADNa9Zc4W5285cG8GPEHrP4RrbgWdXvTg4r
 RfPP4kt3M3/W7eUAGcObB3SIMmb6lfQ6+V06L0gaioBcm9syzOFZebdk62DkRtTzvvze6hl
 IJGZ+NHq1y1WmgZt2hUoOtdUs5szq2IPBw5XgwcZODvsZIqhBjaUEhKOK1OUdVV4mkJtEm/
 UxvbKainf4WunELQg4y1A==
UI-OutboundReport: notjunk:1;M01:P0:jkpB1bxVogo=;ke2P/aFxwnSunD9i2JxFw/cqa2T
 OcDhFJzd1TWhGmLUL1v9KuuuHqtYBoqCStB6Q6Igh1MLqWRgrAb3n4b1kJ+A+9Ec+UQ6s1LAg
 iUc8ZjgckuiA07NVK17SSI8qY0otFQjo3hOvs+44hS2hVYvatLAfBu0tMpkOwVDCuzK2k8+D2
 pq40NHp/mPWvq+j4xCJ3Uur15ohkQlqziAi/lsSgmuvAB0qmFILsU+IgFX9BoNlh4Skb16H/+
 sFoaJSV0mvQamnHvAAiJtgTyv0xFe8hGQye/wWDzQx3JqYVuK4VMi9GGgyy0H6ixOF8uLoeoB
 DTthV70bnXY/8Foa45L5DAbOg8ONyVyIOOk5aovozKHfH1Hb2MKiePUU56c8vJxlSEfCd9GTl
 KlG6eFIOYtn/76WgMCR3C7FbhuaDH5wcRDbtj63Ns+JlnMosaWkBm0K8DdNwD991vbM/T2Wln
 pS0wGQPJzMFbCVBlPxocZEdTyRlI4mFhJlxDOrGIpyDR4o9VQp2wI/cBXqcuVr7nAXOJKxO2r
 Dm4XDKz+Aq1smj8m2/1spfsCRLfU5LY8u1UOWpXmgtrQo8uX5c55Qwo9Q/VV/i2bl6KLGYKDI
 kGLZ+HXLdvubLJVF2xYUF3RQbJybbyVHt/rxS1oYG3hsRFio8oHuQqLKKuF/+hbZ2SZNlUnpG
 Se9+vAa3Y2zJl1qiXmH6juAeROVWQRZ2PEo0TM1tKTXqL95MS1hmvfwCESlCgy39rqczmimJA
 e4XMBM7pdz40i+gJ25FCHdQ2oFR2rs2lcJHkU2xniS+Blw95pBBBT4A7S36hhgInE6AsJUhG3
 pCXm8bMTwIT3Z0EDDQdL8JRsY0WCyIKLRqvcJIGNIZ0F8udwvF1aaJdyq493jBtuiCttakE1M
 CzuK0zwvFdCO7cAoFifN4t0YXEpmsj1wnEW+s9Tc05JV6w8qf3oPaQbsbHyT+Jn3K8UPinT1c
 NkBMYYfzAXFTuEj4RhY8KCmj/SpyfhDxQf43W+2Rnu7N55JeGo2KNao9VKJFVGTHyTMBLyccz
 o3EhIzKcjOzDcA1V1UnxV/mNbL+dNvCsPZWqv4Rp3k5vByUNYNF1IAMQ8kFdO1cZC1jsjPZsQ
 J3aY1D3mO3MPVW2YUscS48UrsGvm+2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736804401; x=1737409201; i=fiona.klute@gmx.de;
 bh=JzI00vw5qIcYvoySGVXJLxRJqTmO6BB4pSkEjwtXRgs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qdoBZUpejYyioyIcl/w4xdCHISopgcX13yyDBk4zn3DacHK3zpeHIfs36oMKflYm
 O+VU49UV1jfpHYQ4j6+dV1Ixg8Yq2k0jGzi+f2SBb31zlqGnOoftI+XJpSsMVoLNX
 59MeCzrId/bH6fHjIU8g9cvXQAPwBMSGz0KWrj6cjTSyaMyxA8nUImSgT9Vs4w0Fn
 FY54Bi8tI1pAVtMXApv0UvzZjZ+itAbPV/5WNxhCwY4nnR0SJRQeiSwyw8dE9YEba
 XnoGXOpDkA48nRD1FaJIA0itW+bST5+QK9Sz3OQuxKpy76fikLrsRKXSXsZwZ2RU9
 lDeRnl9cFq3ac53M6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=qdoBZUpe
Subject: Re: [Buildroot] [PATCH v7 3/5] package/python-gobject: bump to
 version 3.50.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.01.25 um 22:22 schrieb Thomas Petazzoni:
> On Mon, 13 Jan 2025 21:58:49 +0100
> Fiona Klute <fiona.klute@gmx.de> wrote:
>
>>> Is this change thanks to the bump of python-gobject to 3.50.0, or
>>> related to the previous patch? I'm trying to figure out if this
>>> dependency change has anything to do with the version bump.
>>
>> This part is related to the previous patch. python-gobject requires GOI,
>> and if that works with musl python-gobject will, too.
>
> So the enabling of python-gobject for musl toolchains is independent
> from the version bump of python-gobject?
It should be, yes. Alpine hasn't had any compatibility for the currently
packaged version (3.42.2) and newer.

Should I split the commit in that case?

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
