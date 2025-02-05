Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8E2C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD2B4176A;
	Wed,  5 Feb 2025 10:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ooCtQTW2WSW; Wed,  5 Feb 2025 10:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E20741762
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E20741762;
	Wed,  5 Feb 2025 10:24:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 068D012A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEBBC81B04
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3y5sptLVMox for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:24:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 576F581CEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 576F581CEF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 576F581CEF
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:24:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.32]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzyJ-1t91ia1mO7-00kxj7; Wed, 05
 Feb 2025 11:24:23 +0100
Message-ID: <65993a52-5c65-43b6-b3c0-77b2164bd426@gmx.de>
Date: Wed, 5 Feb 2025 11:24:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>,
 Christian Stewart <christian@aperture.us>, yann.morin@orange.com
Cc: Buildroot Mailing List <buildroot@buildroot.org>,
 Thomas Perale <thomas.perale@mind.be>
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
 <CA+h8R2odWOyS=7=9LGGkBGHYENiLHtkj76_L2Zvq_PHOFYs9sA@mail.gmail.com>
 <527da78c-270f-4ec6-8a6e-1210456517a5@mind.be> <Z6MhhfrgmRrtMhrB@yd-6wlzhs3>
 <CA+h8R2qR95DDHn45tqUG57rSCRWpfWkVU2sd2GxpCDhkkzrr_w@mail.gmail.com>
 <e0de913d-45c5-4c03-9c98-e6009e8c4c5c@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <e0de913d-45c5-4c03-9c98-e6009e8c4c5c@mind.be>
X-Provags-ID: V03:K1:pO3wG3+uaWEcD4TqYzPAWeWEGk6lW/jyvA8PemRxFnsjax3a1vJ
 4PXWOrV76flELc9B/eKb/YSHG1HsG2EHBAHX4qhwo5QHEi/3kkN4F/GWKHqCXIDK9iWEI9E
 w0sZ3D0GtfabpRNT4f+C6uPSRq7N88PbSMevDX/xuHhzBr0NDzoBYEoql2PGbcYJNGTiWR5
 bPCSbINuE27uDuHSDBw6g==
UI-OutboundReport: notjunk:1;M01:P0:HGVqUm/8DZE=;gXTB/Oqzgjh3RfXRBSKcCbYKV2P
 r8PZUHruQC9Z/tonubHfgXK2sJJzLNJO4CMmw7CCzg8B80cvnJqRuX38A1cL31cma49KJFehF
 mlZeqkrO61kLyy9l0Qk9juG6LfUdzhQEHToBTWTh17Aa7Jvlpo/9OIVq8lQGhvAHEE2KLfyxq
 Gqw+zUaDK/ZtRs1cqzcdiJfqTp8Exg5FTeTpMhhug0qrwoFx4CuP9DnN1W9TCGLMFYKyLx8i5
 2t4yLQgahRC0Kx5XVciNjToj3X7VnzumB/r8J30hfk2wXhEePII0+vGaHYqbwDd/yAi+jW0Yb
 gOtaQw728kvp5iSrEuMmN2lpnJw6+oQbfLKtpVCAHsQNz0iFFZjCGhyPW4i0DPY4Q5asRnJBh
 c9hu6iTpctJw15E5buN0aPTWi7WKZFAsUFlORN68EA0y+4uYOubZU0mbn7KH9QZpBCp0crypz
 TpClB8s9iRkNf0xdF8ljLR0slGzKtSkAEcO8fqOA2SOh/5svOfoSun3lAT+ueWb5duKEMres3
 QrFyMW9LAklbZ9uTDFmuGMvTJxjauBavVuruNHogxVeSMUm5l+a2kiGkO2g/QB0hhbakFKgEU
 dTnnx2SNxrzpc939fhcfuj7ZqGgivdH7u1AMPx6PkbTUnRqnhGDNnfH3OG4+SUo/lMTi2kAAK
 mdLjIPVfeMqKCfFpbCQSuBVRC65II8H41Vst3egBkbc+7DWjexG+u1v6DA0IPwZvgxbN+vMAK
 KaenQ6FkF8SkTna/YuWQEFK+zKI83YItucwANi9pcYp5sVQRoA8Bz0Gck7aNDpdZRLH7nGbfL
 0UIyP7YWdq71N7oimBi2C/6V6y9P636xfBFylZlImbBQie+yxuVnCIKfJdZCI+8rR3VPSplNx
 kDMBNJkvH+3DEB+ZsCcRUzsRhAWLTLUp4DClCvdO6Twv8lJ8PhhkTUafuWN82y+n9nmG56/Or
 K+L/H3DtqrOMNYabhc1c++JAt4Umm0VEwj7Wh2l7u9p0d54mWEH6C5bLzAK/yvckhzDLqrmiC
 VWZ1+yzuqWgTiywEUhyfEPC5xASX8+wlz5x0Ixt/l//7m54UvyWfuVm6huMpHQ0L/hSWCJB8H
 YFmZ2ZO8skn7B+MF2Qq7+wnfjoNRsxlcFPsKISATCLrrXNHu+m2oVS3el7oqFnHCp2Cs03CPW
 xrYf7D38UfYBAaSN1hAWGHE8HwGYginfpLvbd46p7ZJN3SMFj44pVZeOGSAm94egBaCNnY1S6
 wcpQSceXfuj55fnU9Jzx1Tj50XhLlqd4xG2Ll6ZPe/UfgceEhJmBsaIjVnikqdfsB0eIOHrC3
 2mHKlvcTPNxF7nclFrRpU2ypfEHkcPAgbLKR3FZ5wBmiFvJUUIFmZlnTXT5U0i2xu2KcL4pkT
 1sFGcWlGYj8ogFYA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738751063; x=1739355863; i=fiona.klute@gmx.de;
 bh=aF5BI2dT9BOHUOeUqECTelDyVhYExhMnrlBOoO6Gem8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qHZH1joNZb/Lb1XT7mma1LDUeu7QbvvVKBlt5XSDx9If6fsx+zOUU+niRZNo4Rn+
 QH+hOZmaBGk7A9Siwk2lVaPcvRBFiCohCcNg/pHLF7xID4r/K9myJC1KnpC8VZaan
 HTnrJI7KsqV/neC2/+3VVWy6y86PnOirKJtY9Zv1BPtsoYQH9IeWmAOH32GtWUfv3
 zEjHg2x00yLlxCF3yVHUlR/O9HQY1DWB2brBE1IZD3Dbj361j3YEV6+5Stf13m2tg
 udCgjNEvPWYe9gcjADr5YsJN4O54u0AULDcrE5vxTecCnnYyOENQbSlyOTAjoF61p
 5VezQP/bfzIDl7A6ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=qHZH1joN
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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

SGkgZXZlcnlvbmUhCgpBbSAwNS4wMi4yNSB1bSAxMDo0MiBzY2hyaWViIEFybm91dCBWYW5kZWNh
cHBlbGxlOgo+Cj4KPiBPbiAwNS8wMi8yMDI1IDEwOjIwLCBDaHJpc3RpYW4gU3Rld2FydCB3cm90
ZToKPj4gSGkgWWFubiwKPj4KPj4gT24gV2VkLCBGZWIgNSwgMjAyNSwgMTI6MjnigK9BTSA8eWFu
bi5tb3JpbkBvcmFuZ2UuY29tCj4+IDxtYWlsdG86eWFubi5tb3JpbkBvcmFuZ2UuY29tPj4gd3Jv
dGU6Cj4+Cj4+IMKgwqDCoMKgID7CoCBZZXMgSSBhZ3JlZSAtIHRoaXMgcGF0Y2ggKGFuZCBZYW5u
J3MgaW5mcmFzdHJ1Y3R1cmUgcGF0Y2ggdGhhdAo+PiB0aGlzIHBhdGNoCj4+IMKgwqDCoMKgID4g
ZGVwZW5kcyBvbikgc2hvdWxkIGJlIGluIHBrZy1nb2xhbmcgaW5zdGVhZCBvZiBhbiBpbmRpdmlk
dWFsCj4+IHBhY2thZ2UuCj4+Cj4+IMKgwqDCoCBOb3Qgc3VyZSBJIGVudGlyZWx5IGdyb2sgdGhh
dC4gVGhlIGNoYW5nZSBJIHN1Ym1pdHRlZCBpcyBpbiBwa2ctCj4+IGdvbGFuZywKPj4gwqDCoMKg
IGFzIGl0IGlzIGluZnJhLgo+Cj4gIMKgWWVzLCBzb3JyeSwgSSB3YXMgdGFsa2luZyBhYm91dCB0
aGUgcGFydCBpbiBmaWxlYmVhdCAoYW5kIEkgZm9yZ290Cj4gdGhhdCBmaWxlYmVhdCB3YXMgYSBu
ZXcgcGFja2FnZSkuCj4KPgo+PiDCoMKgwqAgU28sIEkgZ3Vlc3MgeW91IG9ubHkgYWN0dWFsbHkg
c3VnZ2VzdGVkIG1vdmluZyBzZXR0aW5nIC1mdXNlLQo+PiBsZD1iZmQgYW5kCj4+IMKgwqDCoCAt
V2wsLS1uby1waWUgZmxhZ3MgaW50byBwa2ctZ29sYW5nLCByaWdodD8KPj4KPj4KPj4gTXkgdGhp
bmtpbmcgaXMgdGhhdCB3ZSBhbHdheXMgd2FudCBHbyB0byBoYXZlIGZ1c2UtbGQgc2V0IHRvIHRo
ZQo+PiBjb3JyZWN0ICJsZCIgd2UgYXJlIHVzaW5nLiBTbyBpdCBtYWtlcyBzZW5zZSB0byBzZXQg
dGhpcyBpbiBwa2ctZ29sYW5nLgo+Pgo+PiBUaGlzIHdheSBhbnkgbmV3IHBhY2thZ2VzIHRoYXQg
aGF2ZSBkeW5hbWljIGxpbmtpbmcgKGNnbykgd2lsbCBhbHNvCj4+IHBpY2sgdXAgdGhlIGZpeCBh
cyBuZWVkZWQuCj4KPiAgwqBBRkFJVSBpdCB3b3VsZCBiZSBuZWVkZWQgZm9yIGFueSBjb21iaW5h
dGlvbiBvZgo+IC0gQ0dPIHBhY2thZ2U7Cj4gLSBhcmNoIHdoZXJlIEdvIGRlY2lkZXMgaXQgbmVl
ZHMgZ29sZDsKPiAtIHRvb2xjaGFpbiB0aGF0IGRvZXNuJ3QgaGF2ZSBnb2xkLgo+Cj4gU28gdGhl
IG9ubHkgcGFja2FnZS1zcGVjaWZpYyBhc3BlY3QgaXMgaW5kZWVkIHRoYXQgaXQncyBDR08uCj4K
PiAgwqBXZSBkb24ndCBoYXZlIGEgd2F5IGF0IHRoZSBtb21lbnQgZm9yIGEgcGFja2FnZSB0byBp
bmRpY2F0ZSB0aGF0IGl0J3MKPiB1c2luZyBDR08gKHRoZXJlJ3MganVzdCBhIENvbmZpZy5pbiBk
ZXBlbmRzIGxpbmUpLiBCdXQgSSB0aGluayB0aGUgZXh0bGQKPiBvcHRpb24gb25seSBhcHBsaWVz
IHRvIENHTyBidWlsZHMgYW55d2F5Lgo+Cj4KPj4gwqDCoMKgIFdoZW4gSSBpbml0aWFsbHkgbmVl
ZGVkIC1mdXNlLWxkPWJmZCBmb3IgZmlsZWJlYXQsIEkgZGlkIG5vdCBmZWVsCj4+IHZlcnkKPj4g
wqDCoMKgIGNvbmZpZGVudCB0aGF0IHdlIHNob3VsZCBkbyBpdCB1bmNvbmRpdGlvbmFsbHkuIElu
ZGVlZCwgbm9uZSBvZiB0aGUKPj4gwqDCoMKgIHtob3N0LSx9Z29sYW5nLXBhY2thZ2UgcGFja2Fn
ZXMgd2UgaGFkIGF0IHRoYXQgdGltZSBuZWVkZWQgaXQgYXQKPj4gYWxsLiBTbwo+PiDCoMKgwqAg
SSBjb25jbHVkZWQgdGhhdCBmaWxlYmVhdCB3YXMgc3BlY2lhbCAoaXQgd2FzIGFscmVhZHkgc3Bl
Y2lhbCBpbiBhCj4+IGZldwo+PiDCoMKgwqAgb3RoZXIgcmVzcGVjdHMsIHNvIG1laCkuCj4+Cj4+
Cj4+IEl0IGlzIGp1c3QgYmVjYXVzZSBpdCB1c2VzIGNnbywgb3IgYW0gSSB3cm9uZz8KPj4KPj4g
wqDCoMKgIEFuZCBzaW5jZSBJIGFtIGZhciBmcm9tIGEgZ28gZXhwZXJ0LCBJIGhhdmUgbm8gaWRl
YSBob3cgaW1wYWN0ZnVsCj4+IHN1Y2ggYQo+PiDCoMKgwqAgY2hhbmdlIHdvdWxkIGJlLiBTbyBJ
IHdhcyBhIGJpdCBza2VwdGljYWwgYXQgbWFraW5nIGl0IHBhcnQgb2YgdGhlCj4+IGluZnJhCj4+
IMKgwqDCoCBzbyB0aGF0IGl0IGFwcGxpZWQgdG8gYWxsIHBhY2thZ2VzLgo+Pgo+Pgo+Pgo+PiDC
oMKgwqAgU3RpbGwgdG9kYXksIG9ubHkgb25lIHBhY2thZ2UgKGNvbnRhaW5lcmQpIGFjdHVhbGx5
IG5lZWRzIGl0OyBpdCBpcwo+PiDCoMKgwqAgc3RpbGwgYW4gZXhjZXB0aW9uLiBUaHVzIF9JXyBh
bSBzdGlsbCBhIGxpdHRsZSBiaXQgc2tlcHRpY2FsIHRoYXQKPj4gdGhpcwo+PiDCoMKgwqAgc2hv
dWxkIGJlIG1vdmVkIGludG8gdGhlIGluZnJhLgo+Cj4gIMKgQUZBSVUsIHRoZSBwcm9ibGVtICh0
aGF0IEdvIHdhbnRzIHRvIHVzZSBnb2xkIGV2ZW4gaWYgaXQgaXMgbm90Cj4gYXZhaWxhYmxlKSBy
ZWFsbHkgc2hvdWxkIGV4aXN0IGZvciBhbGwgcGFja2FnZXMsIHRoZXJlIGlzIG5vdGhpbmcKPiBw
YWNrYWdlLXNwZWNpZmljIGFib3V0IGl0Lgo+Cj4gIMKgVGhlcmUgaXMgYWxzbyB0aGUgcG90ZW50
aWFsIHByb2JsZW0gdGhhdCBsZC5iZmQgZG9lc24ndCBhY3R1YWxseSB3b3JrLAo+IGJ1dCB3ZSBk
b24ndCBoYXZlIGEgc29sdXRpb24gZm9yIHRoYXQgYW5kIG5vIGVhc3kgd2F5IHRvIGRldGVjdCBh
dAo+IENvbmZpZy5pbiBsZXZlbCB3aGVuIGl0IHdvdWxkIGV4aXN0Lgo+Cj4gIMKgVGhlbiB0aGVy
ZSBpcyB0aGUgYWRkaXRpb25hbCBQSUUgaXNzdWUgdGhhdCBGaW9uYSBhZGRyZXNzZXMgd2l0aCB0
aGlzCj4gcGF0Y2ggLSBJIGhhdmUgbm8gaWRlYSBpZiB0aGF0IG9uZSBpcyBwYWNrYWdlLXNwZWNp
ZmljIG9yIG5vdC4gSSBfdGhpbmtfCj4gdGhlIGF1dG9idWlsZCBmYWlsdXJlIG9uIGNsb3VkZmxh
cmVkIFsxXSBpcyB0aGUgc2FtZSBpc3N1ZSwgYnV0IEknbSBub3QKPiBzdXJlLiBJdCBkb2VzIGZl
ZWwgbGlrZSB0aGF0IG9uZSBpcyBwcmV0dHkgbXVjaCBwYWNrYWdlLWluZGVwZW5kZW50IGFzCj4g
d2VsbCB0aG91Z2guCgpUaGF0IG9uZSBsb29rcyBkaWZmZXJlbnQ6IFRoZSBidWlsZCBpcyBmb3Ig
MzIgYml0IGFybSwgbm90IGFhcmNoNjQsIEdvCmRvZXNuJ3QgZm9yY2UgR29sZCB0aGVyZS4gQW5k
IHRoZSBjaGVjayBpZiBQSUUgaXMgc3VwcG9ydGVkIFsxXSBzZWVtcyB0bwpvbmx5IGJyZWFrIHdp
dGggdGhlIGFkZGVkIC0tZnVzZS1sZD1iZmQgZmxhZy4gVW5sZXNzIGl0IGlzIGluZGVwZW5kZW50
bHkKYnJva2VuIG9uIGFybSB0byBiZWdpbiB3aXRoLgoKPj4gwqDCoMKgIEJ1dCBpZiBDaHJpc3Rp
YW4sIG91ciBlcmVzaWRlbnQgZ28gZXhwZXJ0LCBzYXlzIHdlIHNob3VsZCBnbyBmb3IgaXQsCj4+
IMKgwqDCoCB0aGVuIGxldCdzIGRvIGl0Lgo+Pgo+PiDCoMKgwqAgU3RpbGwsIEkgYmVsaWV2ZSB0
aGVyZSBzaG91bGQgYmUgYSB3YXkgZm9yIHBhY2thZ2VzIHRvIGJlIGFibGUgdG8KPj4gcGFzcwo+
PiDCoMKgwqAgYXJiaXRyYXJ5IGV4dGxkZmxhZ3MsIGFuZCB0aHVzIHRoZSB2YXJpYWJsZSBzaG91
bGQgYmUgZXhwb3NlZC4KPj4KPj4KPj4gWWVzLCB0aGF0IHZhcmlhYmxlIHNob3VsZCBiZSBleHBv
c2VkLCBJIGFncmVlLiBJdCdzIHVzZWZ1bCB0byBiZSBhYmxlCj4+IHRvIHBhc3MgZXh0cmEgbGQg
ZmxhZ3MgYXMgbmVlZGVkLgo+Cj4gIMKgSSBhbHNvIGFncmVlIHRoYXQgdGhlIHZhcmlhYmxlIHNo
b3VsZCBiZSBleHBvc2VkLiBFdmVuIHRob3VnaCBJIGRvbid0Cj4gdGhpbmsgaXQgc2hvdWxkIGJl
IHVzZWQgYnkgYW55IHBhY2thZ2UgZm9yIHRoZSB0aW1lIGJlaW5nLgo+Cj4gIMKgQnV0IEkgdGhp
bmsgdGhlIGV4dGxkIGFuZCBQSUUgb3B0aW9ucyBzaG91bGQgYmUgYXBwZW5kZWQgdG8gaXQgZnJv
bQo+IHRoZSBpbmZyYS4KT2theSwgSSdsbCBsb29rIGF0IGFkanVzdGluZyB0aGUgcGF0Y2ggZm9y
IHRoYXQuIERvZXMgZXZlcnlvbmUgYWdyZWUgdGhlCm92ZXJyaWRlIHNob3VsZCBiZSBsaW1pdGVk
IHRvIGFhcmNoNjQsIHBsdXMgbXVzbCBmb3IgdGhlIC0tbm8tcGllIHBhcnQ/CkkgdGhpbmsgaXQg
bWFrZXMgc2Vuc2UgdG8ga2VlcCB0aGUgb3ZlcnJpZGUgYXMgbmFycm93IGFzIHBvc3NpYmxlIHRv
CmF2b2lkIHVuaW50ZW5kZWQgc2lkZSBlZmZlY3RzLgoKQmVzdCByZWdhcmRzLApGaW9uYQoKWzFd
Cmh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vYmxvYi84NDJlNGI1MjA3MDAzZGI2OTJkNzJh
MWFlYmE0ZjE2NGJiZWIxYzEzL3NyYy9jbWQvbGluay9pbnRlcm5hbC9sZC9saWIuZ28jTDE4Nzkt
TDE4OTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
