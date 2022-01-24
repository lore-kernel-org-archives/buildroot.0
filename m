Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0B8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 13:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E6B2414CA;
	Mon, 24 Jan 2022 13:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aamzhT6bbiRd; Mon, 24 Jan 2022 13:41:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8021D414C3;
	Mon, 24 Jan 2022 13:41:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A262A1BF3BB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 13:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C3284026E
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 13:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRaFtDwai6xN for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 13:41:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66252400A9
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 13:41:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r14so13667523wrp.2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 05:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IrBO9N/thQjQLd5bKRxY5msqxQ/pHzQuV+YOyfJQdCI=;
 b=s9DAU/rEr/jhz9QQ8K3ehoMtArbgD+ubvqwT9cVasXiicLBk9SnBUKpe9aynl8uw46
 DUrsJmOoHmwSFT3RZl3gD2Dxe6pF5bo6fsO1urT0BR7DucCI5/Xq2uPS5KEJXMiDcnhH
 6rM1+rSxV0c4xDz/Rp/dJpxDxleGN7CngT1wMtl1nuqHckxQb0QZgkppPNKXOmfI7BfT
 HfUYEQLpeKnJGbBLyNo62FIdvFQAT76FDID9h3vzR7bNZtC9d8d2QpeIKwsLSm5+j3iq
 JHRBQ2DVKZ8eEQbCY6/FnKpnxc5ku1+2TTGReEdiEPcFXVFwMh0ZWe7/qKAVDX0f9jYy
 EXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IrBO9N/thQjQLd5bKRxY5msqxQ/pHzQuV+YOyfJQdCI=;
 b=hxmzf5GCj2zfHocDk9gd5NFciLuaud+FO/OePSp7kwtqrbgg/0ZiW93VHuCUAxSgCr
 aUn3tebTKQ3tLAZxIDS7NdUql7Sn1NamBdBJo3ds/5FtDoU31OP6Liv30MlnWIW5hUbp
 9woKBsszp8E/W2JYMgGZ5kn29sZSNirgmEXmnBderKLROiZfzGaKg69Vox0C0hWq7bck
 Vw3POd2iE2iCRP9dPqKS1Jm4AeGXtEbDicuW1zUerhETm3VwSLTCk5EFJIZKRRmKL6H7
 TrenGDmrwa0lAAgOMJF5ZcMrQrTegw/hUiTBUvltBuM81gw28Cc92HOeha/G2emuVgdV
 UU5Q==
X-Gm-Message-State: AOAM533zVuzhvuaJtvm1H94/G/yle+G0tbFH2HJdDOcT6WUVlWBTmypp
 ZUvu9q/lkY5pvMNyb9xtz4z5UjhR3bc6vQ==
X-Google-Smtp-Source: ABdhPJyb4Qfr6vtmvZ/JW+4glBG9eO4vyHSGxoABB1QiIBneu9Ta9tgfzlmgrJoho4AGQBF90U9Kfg==
X-Received: by 2002:a05:6000:11c3:: with SMTP id
 i3mr14118957wrx.662.1643031710349; 
 Mon, 24 Jan 2022 05:41:50 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:8055:1f16:ac7:73ec?
 ([2001:861:44c0:66c0:8055:1f16:ac7:73ec])
 by smtp.gmail.com with ESMTPSA id n14sm19984541wmq.42.2022.01.24.05.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 05:41:49 -0800 (PST)
To: Vyacheslav <adeep@lexina.in>
References: <20220118111457.2491318-1-adeep@lexina.in>
 <20220122143327.7d1a1cf7@windsurf>
 <27eb54d9-6897-a2df-00c3-fb6dca8aba91@lexina.in>
 <20220122160914.7e4cc513@windsurf>
 <1a3ce2b5-4b17-b79f-5dd5-29637575d473@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4a94b253-6fe7-5e79-b1e9-331b0a9051ca@baylibre.com>
Date: Mon, 24 Jan 2022 14:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1a3ce2b5-4b17-b79f-5dd5-29637575d473@lexina.in>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] package/amlogic-boot-fip: new package
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gMjIvMDEvMjAyMiAxNzowOSwgVnlhY2hlc2xhdiB3cm90ZToKPiBIaSwg
TmVpbCEKPiBDYW4geW91IGhlbHAgdXMgd2l0aCB1bmRlcnN0YW5kaW5nIGxpY2Vuc2UgZm9yIEFt
bG9naWMgYmluYXJpZXMgaW4KPiBodHRwczovL2dpdGh1Yi5jb20vTGlicmVFTEVDL2FtbG9naWMt
Ym9vdC1maXA/Cj4gCj4gCj4gMjIuMDEuMjAyMiAxODowOSwgVGhvbWFzIFBldGF6em9uaSB3cm90
ZToKPj4gSGVsbG8sCj4+Cj4+IE9uIFNhdCwgMjIgSmFuIDIwMjIgMTg6MDU6MDYgKzAzMDAKPj4g
VnlhY2hlc2xhdiA8YWRlZXBAbGV4aW5hLmluPiB3cm90ZToKPj4KPj4+PiBTbyBob3cgY2FuIHRo
ZSBjb250ZW50cyBvZiB0aGlzIHJlcG9zaXRvcnkgYmUgdXNlZnVsPyBPSywgdGhlbiBjYW4gYmUK
Pj4+PiB1c2VkIGxvY2FsbHkgZm9yIHlvdXIgb3duIGV4cGVyaW1lbnRzLiBCdXQgZm9yIGJ1aWxk
aW5nIGFuIGFjdHVhbAo+Pj4+IGRldmljZSB0aGF0IHlvdSBjYW4gc2hpcC9wcm92aWRlIHRvIG90
aGVycywgdXNpbmcgdGhlIGNvbnRlbnRzIG9mIHRoYXQKPj4+PiByZXBvc2l0b3J5LCBiZWNhdXNl
IEFtbG9naWMgZG9lcyBub3QgZXZlbiBhbGxvdyB5b3UgdG8gZGlzdHJpYnV0ZSB0aGUKPj4+PiBj
b250ZW50cyBvZiB0aGlzIHJlcG9zaXRvcnkuCj4+Pj4KPj4+PiBTbyBJIGFtIHdvbmRlcmluZyBp
ZiBpdCdzIHJlYWxseSByZWFzb25hYmxlIHRvIHBhY2thZ2UgdGhpcyBpbgo+Pj4+IEJ1aWxkcm9v
dC4KPj4+PiDCoMKgIAo+Pj4gWW91IGFscmVhZHkgaGF2ZSBwYWNrYWdlL29kcm9pZGMyLWZpcm13
YXJlIHdpdGggc2FtZSBsaWNlbnNlLgo+Pj4gYW1sb2dpYy1ib290LWZpcCBqdXN0IHB1dCBhbGwg
c2ltaWxhciBiaW5hcmllcyB0b2dldGhlciBhbmQgTmVpbAo+Pj4gQXJtc3Ryb25nIG1hZGUgYSBi
dWlsZCBzeXN0ZW0gZm9yIGFtbCB1Ym9vdCBiaW5hcmllcy4KPj4KPj4gV2VsbCwgSSB3YXNuJ3Qg
YXdhcmUgcGFja2FnZS9vZHJvaWRjMi1maXJtd2FyZSB3YXMgdW5kZXIgdGhlIHNhbWUKPj4gcmVz
dHJpY3RpdmUgbGljZW5zZS4gQXJlIHRoZSBsaWNlbnNlIHRlcm1zIGZvcgo+PiBwYWNrYWdlL29k
cm9pZGMyLWZpcm13YXJlIGF2YWlsYWJsZSBzb21ld2hlcmU/IFRoaXMgcGFja2FnZSBpcwo+PiBk
b3dubG9hZGVkIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL2hhcmRrZXJuZWwvdS1ib290LCBidXQg
SSBkb24ndCBzZWUKPj4gdGhlIGxpY2Vuc2UgdGVybXMgZnJvbSBBbWxvZ2ljIHByZXZlbnRpbmcg
cmVkaXN0cmlidXRpb24uIE9mIGNvdXJzZSwgSQo+PiB1bmRlcnN0YW5kIHRoYXQgdGhleSBzaW1w
bHkgbWF5IGJlIG1pc3NpbmcgKHdoaWNoIHdvdWxkIGJlIHJlYWxseSBiYWQhKS4KClRoZSBiaW5h
cmllcyBtdXN0IGJlIHNwbGl0IGludG8gMiBjYXRlZ29yaWVzOgotIFByZS1idWlsdDogYmwyLCBi
bDMxLCBibDIxLCBibDMyLCBmaXBfY3JlYXRlLCBhbWxfZW5jcnlwdF8qLCBkZHIqLmZ3LCBhY3Nf
dG9vbC5weQotIEJ1aWx0IGluIHRoZSBWZW5kb3IgVS1Cb290IHNvdXJjZTogYWNzLmJpbiBibDMw
MS5iaW4KCkluIDIwMTksIEFtbG9naWMgZmluYWxseSBhZGRlZCBhIExJQ0VOU0UgZm9yIHRoZSBw
cmUtYnVpbHQgYmluYXJpZXMsIGJlZm9yZQpub2JvZHkga25ldyB3aGF0IHdhcyB0aGUgdGVybSBv
ZiB0aGUgZGlzdHJpYnV0aW9uLgoKY29tbWl0IDZhYmFmOWE4NjlhNjU4NGIzY2ZjYThiOTZkMDk0
NmVkNDliYzliNjQKQXV0aG9yOiBMYXdyZW5jZSBNb2sgPGxhd3JlbmNlLm1va0BhbWxvZ2ljLmNv
bT4KRGF0ZTogICBNb24gTWF5IDYgMTI6MzQ6NTYgMjAxOSAtMDcwMAoKICAgIGFkZCBMSUNFTlNF
IGZpbGUgYW5kIHRleHQgcmVmZXJyaW5nIHRvIGl0IFsxLzFdCgogICAgQ2hhbmdlLUlkOiBJZDI5
MWY0MmJlYzNkZGIwYzIxNjJlNjU0MGNlMWYzNWQxY2IxZDA3OQoKVGhlIExJQ0VOU0UgY2FuIGJl
IGZvdW5kIGF0IFsxXSBpbiBLaGFkYXMgZ2l0aHViLgoKQ29uY2VybmluZyB0aGUgYWNzLmJpbiAm
IGJsMzAxLmJpbiwgdGhleSB1c2UgdGhlIFUtQm9vdCBidWlsZCBzeXN0ZW0gYW5kCmNvbmZpZyBo
ZWFkZXIgZmlsZXMgYW5kIGFsbCB0aGVzZSB3ZXJlIGFsc28gdXBkYXRlZCB3aXRoIHRoZSBmb2xs
b3dpbmcgU1BEWDoKLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQp
ICovCgpjb21taXQgOTRkZTQzZDNkOTQwY2Y3NWI0YTllNGZkMmEyNzE1YmU4ZWZmNjEzOApBdXRo
b3I6IEppdWNoZW5nIFh1IDxqaXVjaGVuZy54dUBhbWxvZ2ljLmNvbT4KRGF0ZTogICBXZWQgRGVj
IDE2IDEwOjExOjAwIDIwMjAgKzA4MDAKCiAgICBsaWNlbnNlOiBGaXggdGhlIGxpY2Vuc2Ugb2Yg
YW1sb2dpYyByZWxhdGVkIGNvZGVzIFsxLzFdCgogICAgUEQjU1dQTC0zOTAwMQoKICAgIFByb2Js
ZW06CiAgICBBIGN1c3RvbWVyIHdhbnQgdG8gYWRkIGFtbG9naWMgZHJpdmVyIGluIHVib290IHRv
CiAgICB0aGVpciBwcml2YXRlIGJvb3Rsb2FkZXIuIFNpbmNlIHRoZSBkcml2ZXIgY29kZXMKICAg
IGFyZSBsaWNlbnNlZCB1bmRlciBHUEwtMi4wLCBhbmQgY3VzdG9tZXIgaGF2ZQogICAgdG8gb3Bl
biB0aGVpciBjb2RlLCBzbyB3ZSBuZWVkIGZpeCB0aGUgbGljZW5zZQogICAgaXNzdWUuCgogICAg
U29sdXRpb246CiAgICBGaXggdGhlIGxpY2Vuc2Ugb2Ygb3VyIHJlbGF0ZWQgY29kZSBpbiB1Ym9v
dCBieQogICAgYWRkaW5nIE1JVCBsaWNlbnNlCgogICAgVmVyaWZ5OgogICAgRnJhbmtsaW4KCiAg
ICBDaGFuZ2UtSWQ6IEkyZjM1NzFlODcyMGQxZjRkYjA2OWY4ODIzNTNkNmFlMDUwNzAyY2JhCiAg
ICBTaWduZWQtb2ZmLWJ5OiBKaXVjaGVuZyBYdSA8aml1Y2hlbmcueHVAYW1sb2dpYy5jb20+CgpO
b3RlLCBub25lIG9mIHRoZSB2ZW5kb3Igd2hvIHB1YmxpY2x5IHB1Ymxpc2hlZCB0aGUgQW1sb2dp
YyBVLUJvb3QKc291cmNlIGhhcyB0aGlzIGNoYW5nZSwgc28gd2UgY2FuIGNvbnNpZGVyIGFjcy5i
aW4gJiBibDMwMS5iaW4KZ2VuZXJhdGVkIGZyb20gR1BMLTIuMCBhcyB0aGUgY29tbWl0IGV4cGxh
aW5zLgoKPj4KPj4gQnV0IGhvdyBjYW4gYW55b25lIHVzZSB0aG9zZSBibG9icz8gWW91IGNhbid0
IHJlZGlzdHJpYnV0ZSB0aGVtLgo+PiBBY2NvcmRpbmcgdG8gdGhlaXIgbGljZW5zZSwganVzdCBw
dXR0aW5nIHRoZW0gb24gR2l0aHViIGlzIG5vdCBldmVuCj4+IGFsbG93ZWQuCgpUaGUgcHJlLWJ1
aWx0IGJpbmFyaWVzIHN0b3JlZCBvbiB0aGUgTGlicmVFTEVDIHJlcG9zaXRvcnkgb25seSBjb21l
cyBmcm9tCnB1YmxpYyBWZW5kb3Igc291cmNlcyAoS2hhZGFzLCBIYXJkS2VybmVsLCBMaWJyZSBD
b21wdXRlciwgRnJpZW5kbHlBUk0sIFJhZHhhKQphbmQgY2hlY2tlZCBhZ2FpbnN0IHZlbmRvciBy
ZXBvc2l0b3JpZXMgd2UgaGF2ZSBhY2Nlc3MgdG8uCgpXZSBhc3N1bWUgdGhleSBnb3QgcGVybWlz
c2lvbiBmcm9tIEFtbG9naWMgdG8gcHVibGljbHkgcmVkaXN0cmlidXRlIHRoZXNlIGJpbmFyaWVz
CmFzIHdlIChCYXlMaWJyZSkgd2VyZSBhbGxvd2VkIHRvIHJlZGlzdHJpYnV0ZSB0aGUgVkRFQyBm
aXJtd2FyZSBpbiBbMl0gJiBbM10uCgpOb3RlIHRoZSBzaXR1YXRpb24gaXMgc3RpbGwgdW5jbGVh
ciwgdGhpcyBpcyB3aHkgSSBoYXZlbid0IGNvbnRpbnVlZCBteSBpbml0aWFsIHBhdGNoc2V0CmZv
ciBsaWJyZXRlY2gtY2MgYXQgWzRdIGZvbGxvd2luZyB5b3VyIGNvbmNlcm5zIG92ZXIgbGljZW5z
aW5nLgoKTmVpbAoKPj4KPj4gVGhvbWFzCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2toYWRhcy91
LWJvb3QvYmxvYi9raGFkYXMtdmltcy1waWUvZmlwL0xJQ0VOU0UKWzJdIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJl
LmdpdC90cmVlL0xJQ0VOU0UuYW1sb2dpY192ZGVjClszXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtd2FyZS9saW51eC1maXJtd2FyZS5naXQvY29t
bWl0L21lc29uL3ZkZWM/aWQ9ZTA0Y2M1NmQwZTZiNmZmMDU5MjRmZjg4ZmRiYTFhNDM4ZWU3ZDNj
OApbNF0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9jb3Zl
ci8xNTMzNTQ1NDA4LTExMjQ4LTEtZ2l0LXNlbmQtZW1haWwtbmFybXN0cm9uZ0BiYXlsaWJyZS5j
b20vCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
