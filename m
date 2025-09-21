Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBCFCAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 15:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB30781E50;
	Sun, 21 Sep 2025 15:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4lRnyeBDEke; Sun, 21 Sep 2025 15:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B3D81EC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B3D81EC7;
	Sun, 21 Sep 2025 15:25:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E80D3D3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE842411FF
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvyPREYWxNeA for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 15:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E50C5411FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50C5411FC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E50C5411FC
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:25:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AD0D019F57B;
 Sun, 21 Sep 2025 17:25:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Sep 2025 17:25:08 +0200
MIME-Version: 1.0
Date: Sun, 21 Sep 2025 17:25:08 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?=
 <salvador.joseluis@gmail.com>
In-Reply-To: <20250920155803.829424-1-romain.naour@smile.fr>
References: <20250920155803.829424-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <9463655da3efbfd029902737fe94b4e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758468310;
 bh=u7L6BMuKGMa5zW+gRLflF9to21PEj+yxiS/hxleHQrQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eXw4Ne839oRkPUWNiJPXnANPF296P15cWiOuF5TV9KIld0g542iRpiW6zTxG9c7Hk
 11YIJmBe3Qw+KjGpgtjOqziB/eg5hOblXr4ic555ctSLuLaFnwNiR1ToAaIB2JS63p
 q3HVANfu8r8yJmTWQZVxIBF2A0J4KQB0Q/nGQgIhci/XjR8tfm5ssR2BMEVpQ2al3X
 NWqAbWpRZ2WU5AgwmYy8cnXwP/MeWahesnbCCq9yv2JUP4TwYsSbCd/mLcJqd8sdj5
 hq/oVVg9MnXp5y3xZAY+p7zUSi8MYZZBgKtiuG1IJm+ZSLbc1t/OistDjDEflFVKNM
 lOmULMXK+3A9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eXw4Ne83
Subject: Re: [Buildroot] [PATCHv2] support/testing: TestZfsUclibc: use
 internal backend for uClibc-ng toolchain
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAvMDkvMjAyNSAxNzo1OCwgUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4g
QXMgcmVwb3J0ZWQgb24gdGhlIG1haWxpbmcgbGlzdCBbMV0gd2hpbGUgaW52ZXN0aWdhdGluZyB0
aGUKPiBUZXN0WmZzVWNsaWJjIEdpdGxhYi1DSSBmYWlsdXJlLCB0aGUgcHl0aG9uIDMuMTMgaW50
ZXJwcmV0ZXIgaXRzZWYKPiBzZWdmYXVsdCBhdCBydW50aW1lOgo+IAo+ICAgRmF0YWwgUHl0aG9u
IGVycm9yOiBfUHlUaHJlYWRTdGF0ZV9BdHRhY2g6IG5vbi1OVUxMIG9sZCB0aHJlYWQgc3RhdGUK
PiAgIFB5dGhvbiBydW50aW1lIHN0YXRlOiBwcmVpbml0aWFsaXplZAo+ICAgVGhyZWFkIDB4U2Vn
bWVudGF0aW9uIGZhdWx0Cj4gCj4gVGhpcyBpc3N1ZSBpcyByZWxhdGVkIHRvIHRoZSBweXRob24g
My4xMyB2ZXJzaW9uIGJ1bXAgWzJdIHdlcmUgc2V2ZXJhbAo+IGludGVybmFsIGNoYW5nZXMgd2Vy
ZSBhZGRlZCBbM10gdG8gc3VwcG9ydCBQRVAgNzAzIFs0XS4KPiBQRVAgNzkzIGlzIGFib3V0IENQ
eXRob27igJlzIGdsb2JhbCBpbnRlcnByZXRlciBsb2NrICjigJxHSUzigJ0pIHJlbW92YWwKPiBm
b3IgbXVsdGktdGhyZWFkcyBzdXBwb3J0IHRoYXQgcmVxdWlyZXMgYSB3b3JraW5nIEMxMSAidGhy
ZWFkX2xvY2FsIgo+IGZvciB0aHJlYWQtbG9jYWwgc3RvcmFnZSBbNV0uCj4gCj4gVGhlIG5ldyB1
Y2xpYmMtbmcgMS4wLjU1IHJlbGVhc2UgY29udGFpbnMgYSBmaXggZm9yIHRoaXMgaXNzdWUgWzZd
Lgo+IAo+IFNpbmNlIHRoZSBwcmVidWlsdCBCb290bGluZyBhYXJjaDY0IHVjbGliYyBzdGFibGUg
MjAyNS4wOC0xIGlzIGJhc2VkCj4gb24gcHJldmlvdXMgdUNsaWJjLW5nIHJlbGVhc2UgKDEuMC41
NCkgd2UgaGF2ZSB0byB1c2UgdGhlIGludGVybmFsCj4gdG9vbGNoYWluIGJhY2tlbmQgdG8gYnVp
bGQgYSBuZXcgdUNsaWJjLW5nIHRvb2xjaGFpbiB1c2luZyB1Y2xpYmMtbmcKPiAxLjAuNTUuCj4g
Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
am9icy8xMTI3MTEyNDg1OSAKPiAoVGVzdFpmc1VjbGliYykKPiAKPiBbMV0gCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzdhNGQyNDVkLTE1NTYtNDNjOS04OTk3LTZiMWY3OTFh
ZmJmZUBnbWFpbC5jb20vIAo+IChUZXN0WmZzVWNsaWJjKQo+IFsyXSBkNjNlMjA3ZWI4NjkwNjNm
ODJjODY3NjU4Njc2YzI5MDNiZWIwOGNiCj4gWzNdIAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRo
b24vY3B5dGhvbi9jb21taXQvNmU5N2E5NjQ3YWUwMjhmYWNiMzkyZDEyZmMyNDk3MzUwMzY5M2Jk
Ngo+IFs0XSBodHRwczovL3BlcHMucHl0aG9uLm9yZy9wZXAtMDcwMy8KPiBbNV0gaHR0cHM6Ly9n
Y2MuZ251Lm9yZy9vbmxpbmVkb2NzL2djYy0xNS4xLjAvZ2NjL1RocmVhZC1Mb2NhbC5odG1sCj4g
WzZdIAo+IGh0dHBzOi8vZ2l0aHViLmNvbS93YngtZ2l0aHViL3VjbGliYy1uZy9jb21taXQvOTRj
MTI5N2Q1MjI2M2UyMGNkOTcxNTYwMWFmYTM3ZjQ5ZDAwOGQ5Mwo+IAo+IENjOiBKb3PDqSBMdWlz
IFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KPiBDYzogV2FsZGVt
YXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
