Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B6BC021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 19:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFE0F83474;
	Thu, 13 Feb 2025 19:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaiySYRYoyvM; Thu, 13 Feb 2025 19:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C25498356C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C25498356C;
	Thu, 13 Feb 2025 19:25:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98C67C2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 19:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 887D6405A9
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 19:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlUn99wpDUa0 for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 19:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0F8840140
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0F8840140
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0F8840140
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 19:25:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.117.255]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bk4-1tIvsp3ZR0-010woI; Thu, 13
 Feb 2025 20:25:09 +0100
Message-ID: <d2495c58-827a-4666-b318-1be64e1bcab8@gmx.de>
Date: Thu, 13 Feb 2025 20:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, bryce.schober@gmail.com
Cc: buildroot@buildroot.org, =?UTF-8?Q?Ga=C3=ABl_PORTAY?=
 <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, =?UTF-8?Q?Jos=C3=A9_Mendes?=
 <jp.baltazar.mendes@gmail.com>
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
 <20250207171458.1127620-4-fiona.klute@gmx.de>
 <da600884-960d-4deb-b776-cc78c49acce2@mind.be>
 <CAJpxd046ZwnSh77pxciqCi8tdRhQwiKSb3AjdMkB7+qMvqQcFA@mail.gmail.com>
 <615cd79c-2d9e-4205-a9bc-9f8b66cd8f96@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <615cd79c-2d9e-4205-a9bc-9f8b66cd8f96@mind.be>
X-Provags-ID: V03:K1:Uwdue0Jba4dEbFAAGtGAGpDgB5e/lbUCn9J6ppd93r6YVZ6rw9p
 gNZeSvBCpyI0D1uqV0BxVUvVP1gc+LFOWmOujuguBIJP+Gboyxt3zxKenMJF2L8IPQLMipX
 glZ67+andM/CcMjGn7GYZywxlJrpEzXL6WGTnT9AeZ5AkSlCRBKe2GPVlpvaFEctlVtgAWt
 TVZclm3/dNtQ9Zl8snv7Q==
UI-OutboundReport: notjunk:1;M01:P0:mFQjf+x8ZRE=;pGcUD/S1ne9zk6F77Ny6F7uR59P
 6ID5PsWe+6BeiEtGaLfhKqK1FFa6CBXj81UdyaKW8NxBn3mTPyIzrBi4M+SlkRVGDIjC7I8xA
 9U+dPPbaue+M5ke4pRRJyU/ouSke2+bRKLsSB8kBxRtTN2Snoc2M+D6dK8ctiSXkhWhLNBez0
 JG0WSljK3vEx8C0QlyXIrULTKE4AfYAlvHgdb8FR5zB9TSqT1qJsHbgoZQiN7TeC7fEazIhc5
 8I1UDbfUsa5fgPimfMkp6I6+bmtotrgaV2gN2rmHrYMw1Oa8rDqKCy3ztDyrEy4t57SGi0lTn
 w7xPzjN/04MJraQTijUrjq5uJxtfKwX9F7gn0Nw+yUP6/nDuu9k8q2T/SD083ffIaKvvAN+s1
 7gt/ypBuW7mAvBpxyCUsYNV9YpehIomWxIvfgUNiUUscHG5vpouNGDQuvT4oCFdQ6riPcAQUB
 ZvLWinIboggpcn80WygZFjFe1emiUv10I41ma1SzQhL1fWpuUfTyEbIvripdGvga/Lfgr6VWq
 SKgK1CZCYLUDOJrHCsQg/+Jz84h4vx3nMY44en/zfuFmcSx/a+Y1xNgjTt19olQtsQI0bQKDc
 ZxtxAVdTHjFLCO/zoH6KAu7EVkowObG3lGX23sH6KVsVMvNMK5R40LysjU5bo5Hk0rvfpGuBz
 yiNE5tX0JSqdxA/sxBVAlO914xV3hnKDaDa2HDpKTgbPWiZ5cOkCjrsD1wTFqSWbSdncyv2R/
 QbvIuFyNXzXGoDpFLDtWK1IYTIHuRi6Qsz0n4u4p40zvhkKCZtUKJyomsgqQwac1bOEU5wQ6m
 rlbHU0T6paYavTYgQfUZZNflDeu1zTM6Ucu1BDmlKqc/bqdnFTErS9wGyiXKqeoofI5i0pwyZ
 oRPh6q/C/IjMnBIG1GY5+7NCxxTZZTmiT5DzQJz5v6bvgzS6ItUY/UKzk//+ceNf5fyaA8+Cg
 I3fuA39AVnJHKAz2NmcLWxcAsKu3YuK3N9FLATUePOlMaOpmzwqVnOKe2BFwqoYxnOf56Orlj
 kB2A01uomsxreg5rUHaBRMQGiE3Pu7RiI/9/UNO88iKZIwDDv+l1wf3DHZQbuW4R1/QgTGA3o
 rGl+CaLmqGOn13duOHeSq4aZ2l/2NCq5e0l/ucmFX4L6E60MHfRwq2pKZBXR6DQ5qTrGR64en
 l83qDg8VZoDyphaoJUx8EUIfEYlRUfeU2TJZbKJbxko0VES3CEI43BIF/QZawj8VarPvQQlFb
 m4klyyjZwj3atW788Yvl2vjy0a32HeljnMfx51BBGbbQ/08aQhi76y7JiM7c5zqkHQ/WGiY+/
 e7n/KVOUgtgZUf0Aqsq/ToOuBBr7dsaHKuiUtTkw8s4bF/hPrjOw18cgselGoxEGdT/mSU065
 HuuGwmAjrwnAn3GwaeIZRnbC1Aw1lGKRj05W9CEISjTAx2wXCOkhgldmaPjse5vrODiFmxg40
 uv0vg3w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739474710; x=1740079510; i=fiona.klute@gmx.de;
 bh=OPhOWGleUdYzvgAQr3eUxefZNQnUSMkGOd5vDT/ZXjY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hvZ2hVNJFMPoO3rhkMmn6nGTnu/MHxQjJfGoAb0TlgDP5tpmEIVZNy/9Os5StI+m
 WQFTvq6ul07EVEZinTr0F+MsxVpdQx+Sw60wNUUdc0xRoRGNE7nAusz+RAvpB4nUs
 ZbP66Six4Y9a1AgH3QXrUDHa/x10r5ldrmQtMPiqe2MJWeaKQATUlf2+93t0vpDo7
 wVu0U8qzl9GI/C4aDZtaeq4x/QmTdpKrUZO5lMvsgeAfovUo2mUoqw70/VmBmIr8t
 N7PLcvF52Xk/knzZKwAEw9fLgrRVgOexTTV2cn8ig6A5oFWFivmrmFcFVdInbB26n
 zyRe7Hf0qNHvUd8E/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hvZ2hVNJ
Subject: Re: [Buildroot] [PATCH v3 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
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

QW0gMTAuMDIuMjUgdW0gMDg6NDQgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPgo+Cj4g
T24gMDcvMDIvMjAyNSAyMzozNiwgYnJ5Y2Uuc2Nob2JlckBnbWFpbC5jb20gd3JvdGU6Cj4+Cj4+
IEhpIEFybm91dCwKPj4KPj4gT24gRnJpLCBGZWIgNywgMjAyNSBhdCAxOjM34oCvUE0gQXJub3V0
IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdAo+PiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcg
PG1haWx0bzpidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4+IHdyb3RlOgo+Pgo+PiDCoMKgwqDCoCDC
oCBMb29rcyBnb29kIGF0IGZpcnN0IHNpZ2h0LiBJJ20gdGhpbmtpbmcgdGhvdWdoOiB3b3VsZG4n
dCBpdCBiZQo+PiBlYXNpZXIgaWYgd2UKPj4gwqDCoMKgIGNvbnZlcnQgYWxsIFJQaSBjb25maWdz
IChncmFkdWFsbHkpIHRvIFUtQm9vdCwgYW5kIG1lbnRpb24gaW4gdGhlCj4+IHJlYWRtZSAoYW5k
Cj4+IMKgwqDCoCBjb25maWcudHh0IGNvbW1lbnRzKSBob3cgdG8gYm9vdCB3aXRob3V0IFUtQm9v
dD8KPj4KPj4KPj4gRllJLCBVLUJvb3QgZG9lc24ndCBzdXBwb3J0IHRoZSBSUGkgUENJL05WTWUg
aW50ZXJmYWNlIGJlY2F1c2XCoG9mIGEKPj4gY3VycmVudCBsYWNrIG9mIHN1cHBvcnQgaW4gdGhl
IHVwc3RyZWFtIGtlcm5lbC4gU28gd2UgYXJlIGFjdHVhbGx5Cj4+IG1vdmluZyBhd2F5IGZyb20g
VS1Cb290wqBpbiBhIHByZXZpb3VzIHByb2plY3QgdG93YXJkIHVzaW5nIHRoZSBycGkKPj4gZmly
bXdhcmUgc3VwcG9ydCBmb3IgaW50ZWdyYXRpbmcgd2l0aCBBLyBCIHVwZGF0ZSBzeXN0ZW1zLiBJ
J20gbm90Cj4+IHNheWluZyB0aGF0IGl0IGhhcyB0byBiZSBlYXN5IGZvciBwZW9wbGUgbGlrZSB1
cywgSSdtIGp1c3QgY2hpbWluZyBpbgo+PiB3aXRoIHRoZSBmYWN0IHRoYXQgVS1Cb290wqBpc24n
dCBhbHdheXMgdGhlwqBiZXN0IGFuc3dlciBmb3IgYWxsIHVzZSBjYXNlcy4KPgo+ICDCoFdoYXQg
SSBoYWQgaW4gbWluZCBpczogX3JlbW92aW5nXyBVLUJvb3QgaXMgYWN0dWFsbHkgcXVpdGUgZWFz
eSwgeW91Cj4ganVzdCBuZWVkIHRvIGNoYW5nZSB0d28gbGluZXMgaW4gdGhlIGNvbmZpZy50eHQg
KEFGQUlVKS4gVGh1cywgaXQgbWFrZXMKPiBzZW5zZSB0byBtZSB0aGF0IG91ciBkZWZjb25maWdz
IHNob3VsZCBhbGwgaGF2ZSBVLUJvb3QsIGFuZCB0aGUKPiByZWFkbWUudHh0IGNhbiBleHBsYWlu
IGhvdyB0byBidWlsZCB3aXRob3V0IFUtQm9vdC4KVGhhdCBtYWtlcyBzZW5zZSB0byBtZSwgbWFp
bnRhaW5pbmcgZGVmY29uZmlncyBmb3IgYSBmdWxsIG1hdHJpeCBvZgpib2FyZCB0eXBlL21haW5s
aW5lIG9yIGRvd25zdHJlYW0ga2VybmVsL3UtYm9vdCBvciBub3QgZG9lc24ndCBzZWVtCnByYWN0
aWNhbC4gTWF5YmUgaXQnZCBtYWtlIHNlbnNlIHRvIGhhdmUgYSBzdGFuZGFyZCwgYW5kIG9uZSBl
eGFtcGxlIGZvcgplYWNoIG9mIHRoZSBwb3NzaWJsZSBkZXZpYXRpb25zPwoKQW5kIG1heWJlIG1l
bnRpb24gcG9zc2libGUgcGl0ZmFsbHMgaW4gdGhlIHJlYWRtZSBhcyBmYXIgYXMga25vd24sIGUu
Zy4KSSByZWNlbnRseSBidW1wZWQgaW50byBkaWZmZXJlbnQga2VybmVsIGNvbmZpZyBvcHRpb25z
IHRvIG1ha2UgdGhlCm1pY3JvU0Qgc2xvdCBvbiBQaSBaZXJvIDJXIHdvcmsgKHJlc3VsdDoga2Vy
bmVsIGNhbid0IGZpbmQgcm9vdGZzIGlmIHlvdQpzd2l0Y2ggYmV0d2VlbiBkb3duc3RyZWFtIGFu
ZCBtYWlubGluZSBhbmQgcmV1c2UgdGhlIGNvbmZpZykuCgpCZXN0IHJlZ2FyZHMsCkZpb25hCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
