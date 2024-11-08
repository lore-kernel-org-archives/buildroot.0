Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F220FD5E152
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 10:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76154844BF;
	Fri,  8 Nov 2024 10:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FE_tuyfN4AYK; Fri,  8 Nov 2024 10:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EAD184522
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EAD184522;
	Fri,  8 Nov 2024 10:18:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 124F9D90
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 10:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CCC340590
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 10:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xf5ZGiVAGrc0 for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 10:18:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9507A405CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9507A405CB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9507A405CB
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 10:18:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.160.255.35] ([176.5.48.255]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiPl-1tETn82G57-00PMWZ; Fri, 08
 Nov 2024 11:17:59 +0100
Message-ID: <b961c43d-adfa-41d1-b590-4e8989eddaf9@gmx.de>
Date: Fri, 8 Nov 2024 11:17:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20241026162109.1055271-1-thomas.petazzoni@bootlin.com>
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
In-Reply-To: <20241026162109.1055271-1-thomas.petazzoni@bootlin.com>
X-Provags-ID: V03:K1:MVWyEog5dRDIClEWwazV1t0xiU1e3ZuEgNGqvzuvSShGnSSpvne
 +2trvtHZ6vyowiT3XA+P3yHrjGZ+Ej8oOP7hSxzm9OcJRQaz0ZvDF7kWt9iW3I4txorFPYU
 6AvLlSEBFQprxjepCrwtExGF1bNCqKdPVB04rJ3AoopzU6nclGVvaks9oxk+k5bdoWrjPMb
 uYhfViny8RWxAqL3xuZoQ==
UI-OutboundReport: notjunk:1;M01:P0:mr+GC42M49A=;4U0w2wnm5/dIVeKE+uAjp6202j4
 Oeq24BM8GqTqFvvhKh+fOojWVf6EHuKufuswnvqQeQ1xcGWFKvpGE7U+YRNk2JRtdw6qY/2On
 TBjl9U1VgJi5xCE0Nwhtbp3qIjnZ2aAdsSXi48wFL66CGJ9DbLYvmRdkGxvzExE63erhE05OQ
 xWeGka/uBzniiYVl8UaD7CY6FeN9tmhgcMT8F4a8SRZxefV4O0hmheIbdAnpQnVWc836gV5k6
 8XcgvChwO/NSz1o8ijBz4bnxOTMCAhOvgm+vSQ68km799gWDU2zZtVBodO9l2mV/vlBUUZ1Y+
 ej4aQQpalySrCSbxU0OYTZvggAhmuzeHBgEvMfkqFiaHLWzYFKd1FFOFqF7QZzGwl9FOhJ+5p
 qINJAZ8zr2nja1DTNfZnf2uicMlRy6O2ELDS1ULW1q06+0xLomaFUmx/VHIYKIeI8u+p74MCt
 9ybWhUtzwBM6FCr5Z/CZAXOsDrv7Rq0Xz0Cg6x6kO9h/D8y+UU8lOjJTKhBCcIjFJFoY5WEDu
 J4U4aK1OLxEEfoR23qJrL8Ds2JbvhHSeWF73SMfPRS1sD8R5UmYYBTUbOK+5lmhAZOzyeREp/
 VBunOyZ3U7VwyYdU4Nx71rYkPzAsfIsNq91FzBJpfK69YppmbVYANZXutUlfPR8nfgdIP7Y3S
 pVWjlnsJ5aeqIa0bW/ClDSaaWutstPAdaFf2obdTbNsXxmBasq5tmowjH+iCjifjQAruvWypK
 ps0qvJIm+pICq2WScI9FPH3eMWYLQ94u+DsbSc3h61iP3TUkIrfiFEjSnJMGKrKowWxlHrr76
 uCS/2cxEHImry3e6vy2St67g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1731061079; x=1731665879; i=fiona.klute@gmx.de;
 bh=k5CVvjypf51VA8CK40sYuc3XXkDv9qUkyi96Lvkg4IA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=i3gnA81/2xWE+Ys4TfkGnRcPdLwHQ/XCorQPHNPm2m21tO1pkw36sQQPrAjamyUT
 cFObz8oMY/MLjFBd03fRFzwj3h6aemRp70aTkdGgJ666B2v4K2P9/XX0dDP4Vos+z
 SxOi2lP5040zt6EHJIgpWL4EUaOWPY206E5358DfX5vIBE3QFJFhBUNMjSkmFurQF
 1Tvktb/szQZvcI4PHszSlD3pD8rzA9R22k6/CKiuq7Uu7NnuCHljRndhKgecay87K
 TGIkHyB6BLkwlNhVv3XpCBrsg8Sp7EE2YVCgfQmP5tvvQA5nHOYvszIuuMbq/ig83
 3SXB9Q8zkVISb8GWgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=i3gnA81/
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Fiona as a developer for
 all init scripts
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 26.10.24 um 18:21 schrieb Thomas Petazzoni:
> Recently, Fiona has been involved in a very nice effort to clean up
> our init scripts, and make them more consistent with each other. In
> order to continue this effort, let's make sure Fiona gets Cc'ed on all
> patches that touch init scripts by adding her to the DEVELOPERS file
> for package/*/S*.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Fiona, this is obviously a proposal, and I will not merge it if it
> doesn't get your Acked-by.

I can't promise how much time I'll have, but I'm happy to take a look
when I can.

Acked-by: Fiona Klute <fiona.klute@gmx.de>

Best regards,
Fiona

> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 409642f96f..8a14ed36ce 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1098,6 +1098,7 @@ N:	Falco Hyfing <hyfinglists@gmail.com>
>   F:	package/python-pymodbus/
>
>   N:	Fiona Klute <fiona.klute@gmx.de>
> +F:	package/*/S*
>   F:	package/python-pyasynchat/
>   F:	package/python-pyasyncore/
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
