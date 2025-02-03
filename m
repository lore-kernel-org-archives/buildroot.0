Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2CBC02197
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37875407A5;
	Mon,  3 Feb 2025 17:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsw6DjRy9hMV; Mon,  3 Feb 2025 17:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B797340799
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B797340799;
	Mon,  3 Feb 2025 17:09:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64E7112A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 473CA40913
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f11GITpchXTh for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB86340177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB86340177
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB86340177
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:09:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.178]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBm1e-1tZSa902k0-008QtL; Mon, 03
 Feb 2025 18:09:25 +0100
Message-ID: <3e1f51fb-1c04-420b-b25d-e4f3b014b46f@gmx.de>
Date: Mon, 3 Feb 2025 18:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org
References: <20250131-add-wlr-randr-package-v2-1-7ea1a44b5b7e@armadeus.com>
 <2dfb2ff3959f3e8099908cb088745fb0@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <2dfb2ff3959f3e8099908cb088745fb0@free.fr>
X-Provags-ID: V03:K1:GGGD+28PSkvai/p+fx/mPJCTH/zzamwOgiCPfZb7naqaXF5+OtI
 b3MCdGTq6DAgnlgHktqxEw5zBk2NK2TvXHuW0zSO/NAa8eYmWL2Cd32bnG8XHDo4ecPALIz
 flFoihtC0MShtvrGL8TTwz/1q32dSaLH3NyqVMrzQts3CM48DrQwg+IjFqoLgzJ8UdjIIAv
 2re4lYhbh8ByXik21/QwA==
UI-OutboundReport: notjunk:1;M01:P0:HyitWJAsJFg=;t7ITqqWEtCdC9euusPSw98OPQ6e
 3xaClfd6mPfPyuTNz9pjv0QyZKRvP1Jj+pEQlGcE49cKInjQxxSEl0iP9r1wDH+FQrfqU/cd8
 MpgGYzlS8juNppqctsCeprBWIX9nnlvVq2ro61xq/1L00wcTW6bRKNAYuBzaUZthCWwuYmzTM
 SJqqZujSYJ5xWweOrDfybXh8VDDORgalg/eKFsGCe3pgBHitLK+clxkfqSj9CXe4fozlqa+ei
 ovx6E00Q4zFg0jD5hZx0CPwNchD23FCYCHvo517mfQYgnTLBps/SZjnfqVs4B5aCDKQSZ+mFW
 7Xf79+PqIt15daLO79h7Bq9ku8hd7qd4WeYfliKKK5v4FxC5/vlW5cCFAw9vKFXWBbp7z8Z5x
 lfI/2iWHcVv1Qbr3A+EbDIQ/11NZEe2Aar6sqTjgzQTQGMZU/LhXEhsR155FPsXW+DFZ2w1fz
 xLwshrKZN+PtKnSKb+z9dP0QrKwJIvP6mvsoGfFfpKkXNFe8h1vM3AFm/Jey0+MV0Giy6WZJL
 PaeaRgLFHDCmTeL0BiTwhX21nrp4fBMs+27tQ9V3ZQj2AS7yDuWMawM9ijHuh8FGZpNqpcg80
 iu5ff4TQCYFAUHWFbJKOPfapy6q5yG2v1yPui7wA5UNMJzhWQ9xUOl4an0P6W5nyT0hWyW1gB
 UVneVwY5KDKfYeLgvxwBni18XW8Nuc0tzhLAEXmcgy8QrMXPTOv6pVlaY9n2kIcMunbIcrsBT
 ddmdvFZ31p+CrvPZYcedw8OHIIm3OkPvY96ONsYS2Smb2R3C3La+BsdNK58CtkRohKK4z4Mkj
 VKclPGy7XjnmzGMGA0K7/Y454dMH0Fa2k2HDSTbkvxM7TnNAbgvUFb5UhHD6OyLb/8miOfULN
 Z2wQx48R9mNEFLqSh2lNa5qhaIDNufa5jWQU6+WDZKYrexBWuHYUXmBnay42/wkL9Jzx7Ne08
 UFzjjW04zfNssxEEimMg8I9gpSVXV5u9HBn9FqrT/uFYMPpFjK/G0qUlTxTYVCbvdbmUNHZtI
 Lr95KlLXB7mInikgt1u93i58MHvf64OLTrQmnv5OYo9y1lty+rL/Wh8nbzUtapm9kFo+j+CV9
 BwsUoLJJ7z1ah9fTMF7WsYEILxh7lvPSnQzcM42d7KLOfUwsJXsCSktG9E3Mrp5ZdGJZ9xgrW
 Oq8NGWPecZdt7/dL2nqJirKICYOi0HHV0BO+B/vM3cd63cpzm3MuXxJpfWH6IInS3yx3fsGcv
 bn/qwhIYlNxnjXSFsYAmlXXZ7DpqXGHQSUzRAhGiaTrtV34ChC7Ab+2J9VPr1jfmqIQaFtUmV
 QStoswnNU4JRK+CAwoU4ZfvQXTiwDyMDtURX1iEcKle+PG3aPvHnALs2yO6lC3d+nfu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738602565; x=1739207365; i=fiona.klute@gmx.de;
 bh=NTQAJbWtzTDgR/vV6In0DMVMsdb0ZB816GXVVsMTvW8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=P49SE9kX1T4e69zlYh1MPlaaKy59v5eD04muRxkNbvkVseKESbovISHMJ31Snb5Z
 ohMhamSpDiwnepztVzr5UVVFCMOKaLLZ+6ZcWn22ikaQxecbcmh3DOJSewHdYuO8d
 QELFfjzwjMo/EAg9sONokDOt8b1odPNPyni4J4FlpZW5P0rVvNrzL7TDyBZtnlDxF
 JN4pqLa+PqGH6HfvuToW/MtLEsn3lU4q6+V7psUZqkesAInB/clDoQhEQg5c80hOA
 syWrytLaugS+KN7XH4bZj1smiS5Tt8P/NxnNSC4bsluVV3G1PEgFvWw8nhzw/g7HH
 1g7BGxn8D5zC2aDxeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=P49SE9kX
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

QW0gMDMuMDIuMjUgdW0gMTY6MTggc2NocmllYiBKdWxpZW4gT2xpdmFpbjoKPiBIaSBTZWJhc3Rp
ZW4sCj4KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCEKPgo+IE9uIDMxLzAxLzIwMjUgMTM6MzAs
IFPDqWJhc3RpZW4gU3p5bWFuc2tpIHdyb3RlOgo+PiBVdGlsaXR5IHRvIG1hbmFnZSBvdXRwdXRz
IG9mIGEgV2F5bGFuZCBjb21wb3NpdG9yLgo+Pgo+PiBUZXN0ZWQtYnk6IEZpb25hIEtsdXRlIChX
SVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+PiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6
eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Cj4+IC0tLQo+Cj4gV2hp
bGUgdGVzdGluZyB3aXRoIHRlc3QtcGtnLCBJIG9ic2VydmVkIDQgYnVpbGQgZmFpbHVyZXMuCj4K
PiAgwqDCoMKgIGNhdCA+IHdsci1yYW5kci5jb25maWcgPDxFT0YKPiAgwqDCoMKgIEJSMl9QQUNL
QUdFX1dBWUxBTkQ9eQo+ICDCoMKgwqAgQlIyX1BBQ0tBR0VfV0xSX1JBTkRSPXkKPiAgwqDCoMKg
IEVPRgo+ICDCoMKgwqAgdXRpbHMvdGVzdC1wa2cgLWEgLWMgd2xyLXJhbmRyLmNvbmZpZyAtcCB3
bHItcmFuZHIKPiAgwqDCoMKgIC4uLgo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJyLWFybS1iYXNpYyBbMjgvNDBdOiBGQUlMRUQKPiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBici1pMzg2LXBlbnRpdW00LWZ1bGwgWzMxLzQwXTogRkFJTEVE
Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnItbWlwczY0LW42NC1mdWxs
IFszMi80MF06IEZBSUxFRAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBici1wb3dlcnBjLTYwM2Ut
YmFzaWMtY3BwIFszNC80MF06IEZBSUxFRAo+Cj4gWW91IGNhbiByZXByb2R1Y2UgdGhvc2UgaXNz
dWVzIGNyZWF0aW5nIGEgdG9vbGNoYWluIGZpbGUKPiBhbmQga2VlcCBvbmx5IHRob3NlIDQgdG9v
bGNoYWlucyBpbiBpdC4gRS5nLgo+Cj4gIMKgwqDCoCBjcCBzdXBwb3J0L2NvbmZpZy1mcmFnbWVu
dHMvYXV0b2J1aWxkL3Rvb2xjaGFpbi1jb25maWdzLmNzdiBteS0KPiB0b29sY2hhaW5zLmNzdgo+
Cj4gVGhlbiBlZGl0IHRoZSAibXktdG9vbGNoYWlucy5jc3YiIGZpbGUuIFRoZW4gcnVuOgo+Cj4g
IMKgwqDCoCB1dGlscy90ZXN0LXBrZyAtYSAtdCBteS10b29sY2hhaW5zLmNzdiAtYyB3bHItcmFu
ZHIuY29uZmlnIC1wIHdsci0KPiByYW5kcgo+Cj4gQWxsIHRoZSBmYWlsdXJlcyBsb29rcyB0aGUg
c2FtZS4gRXJyb3IgaXM6Cj4KPiAgwqDCoMKgIC4uL21haW4uYzogSW4gZnVuY3Rpb24g4oCYaGVh
ZF9oYW5kbGVfbmFtZeKAmToKPiAgwqDCoMKgIC4uL21haW4uYzo0MTk6MTU6IGVycm9yOiBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhzdHJkdXDigJk7Cj4gZGlkIHlvdSBtZWFu
IOKAmHN0cm5kdXDigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+
ICDCoMKgwqDCoMKgIDQxOSB8wqAgaGVhZC0+bmFtZSA9IHN0cmR1cChuYW1lKTsKPgo+IENhbiB5
b3UgaGF2ZSBhIGxvb2sgYXQgdGhvc2UgYnVpbGQgaXNzdWVzLCBwbGVhc2U/CgpUaG9zZSB0b29s
Y2hhaW5zIGFsbCB1c2UgdUNsaWJjLCBhbmQgaXQgc2VlbXMgdUNsaWJjIHByb3ZpZGVzIHN0cmR1
cApvbmx5IGlmIF9HTlVfU09VUkNFIGlzIGRlZmluZWQuIFRoZSBwYXRjaCBiZWxvdyBtYWtlcyB0
aGUgYnVpbGRzIHBhc3MsCnRob3VnaCBJIGNhbid0IHByb21pc2UgdGhlIHJlc3VsdHMgKndvcmsq
LiBMb29raW5nIGF0IHRoZSBCdWlsZHJvb3QKY29tbWl0IGxvZyB0aGF0IHNlZW1zIHRvIGJlIGEg
c29tZXdoYXQgY29tbW9uIGlzc3VlIHdpdGggdUNsaWJjLCB0aG91Z2guCgpCZXN0IHJlZ2FyZHMs
CkZpb25hCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLm1rIGIvcGFj
a2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLm1rCmluZGV4IDIyNzllMjI5MjYuLjE3OGNhNmI1MDcg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5taworKysgYi9wYWNrYWdl
L3dsci1yYW5kci93bHItcmFuZHIubWsKQEAgLTExLDQgKzExLDkgQEAgV0xSX1JBTkRSX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFCiAgIyBob3N0LXdheWxhbmQgaXMgZm9yIHdheWxhbmQtc2Nhbm5l
cgogIFdMUl9SQU5EUl9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgaG9zdC13YXlsYW5kIHdh
eWxhbmQKCitpZmVxICgkKEJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJQkMpLHkpCisjIHVDbGliYyBw
cm92aWRlcyBzdHJkdXAoKSBvbmx5IGlmIF9HTlVfU09VUkNFIGlzIGRlZmluZWQKK1dMUl9SQU5E
Ul9DT05GX09QVFMgKz0gLURjX2FyZ3M9LURfR05VX1NPVVJDRQorZW5kaWYKKwogICQoZXZhbCAk
KG1lc29uLXBhY2thZ2UpKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
