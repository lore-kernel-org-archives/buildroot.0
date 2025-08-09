Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407C5C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 16:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D690160C12;
	Sat,  9 Aug 2025 16:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSBQFQnOC9JG; Sat,  9 Aug 2025 16:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1CCA60BC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1CCA60BC2;
	Sat,  9 Aug 2025 16:34:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B8FB1D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D5BC80DDD
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1f1drjM1nWc for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 16:34:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A752C80DA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A752C80DA6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A752C80DA6
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:34:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 522CD780333;
 Sat,  9 Aug 2025 18:34:45 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Aug 2025 18:34:45 +0200
MIME-Version: 1.0
Date: Sat, 09 Aug 2025 18:34:45 +0200
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org, Mingcong Bai <jeffbai@aosc.io>, Xi Ruoyao
 <xry111@xry111.site>
In-Reply-To: <6d18d123-03f4-4a3e-8dcc-414ca3ba1903@app.fastmail.com>
References: <20250731134401.30301-1-ju.o@free.fr>
 <6d18d123-03f4-4a3e-8dcc-414ca3ba1903@app.fastmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bb531267ca49d240c14b3d96321a5cd4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754757288;
 bh=6MF23vtr1g611WBvwb/sZVKNnNVU/yWNkhUTBkr1ViQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lbYnfqcttH6hZzkXuDh+J10siqCnIaexPAMHiIK35pvdUOmERjySZRHFUX+qN4Gsh
 BsafLYeNmHUkwpmA7srGa7klpvo7NKd5UdmsJOkpj7lX5IR62tfOLzyikS4KxGpEIL
 V1mx4X9u/sZXV8jUYc4e14cmOFNVujjdlrXFmRDC8OqP6uRuLSahFLGjOul2lmaVUh
 6sYJhpcJbUPG1Qt/KTUl5/oU3A0hvDozQMkFGh4Xga08d60GqPm3rmIqyq5CQxvrEE
 zxHMmQRSDJhobl70tGggt42lqMGlOo7jzDowZw3WVdOM2NAX/qgSeV7Tu65wQ4gpdI
 LC8lOc2YCnBhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lbYnfqct
Subject: Re: [Buildroot] [PATCH v3 1/1] arch/loongarch: Mark lp64f and lp64s
 as broken
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

T24gMDgvMDgvMjAyNSAxMzoxNCwgSmlheHVuIFlhbmcgd3JvdGU6Cj4g5ZyoMjAyNeW5tDfmnIgz
MeaXpeWRqOWbmyDkuIvljYg5OjQ077yMSnVsaWVuIE9saXZhaW7lhpnpgZPvvJoKPj4gRnJvbTog
SmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPgpbLi4uXQo+PiBUaGlzIGNvbW1p
dCBtYXJrcyB0aG9zZSBBQklzIGFzIGJyb2tlbiBhdCB0aGUgbW9tZW50IHRvIGFsbG93IHRpbWUK
Pj4gZm9yIGludmVzdGlnYXRpb24uIEFsc28sIHNpbmNlIGdjYyBkZWZhdWx0cyB0byB0aGUgImxw
NjRkIiBBQkkgd2hpY2gKPj4gcmVxdWlyZXMgYSA2NGJpdCBGUFUgaXMgcHJlc2VudCwgdGhlIEJS
Ml9MT09OR0FSQ0hfRlBVXzMyIGFuZAo+PiBCUjJfTE9PTkdBUkNIX0ZQVV9OT05FIG9wdGlvbnMg
YWxzbyBuZWVkcyB0byBiZSBtYXJrZWQgYXMgYnJva2VuCj4+IGFzIHdlbGwuIFNlZSBbNF0uCj4+
IAo+PiBbMV0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L2UxN2RhMTA4ZDFm
YjRlNmFiZGEyNjQ0NWRjMDUzYjM1QGZyZWUuZnIvCj4+IFsyXQo+PiBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZjk4NTcwMjkzODIzODY3ZTZjNDNhMTY3MmUxYTRiNDNj
YTFlNGJlNQo+PiBbM10KPj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
L2NmNTZjMzdmYWJjYWU5NjRkYmY0Zjk2ZWI0M2E3ZTRkOTY0NDUyYjYKPj4gWzRdCj4+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC83YjBmMWNiNjI5ZmNlOGE1N2Q5YjY0NGI4YmVi
OGIyYUBmcmVlLmZyLwo+PiAKPj4gQ2M6IE1pbmdjb25nIEJhaSA8amVmZmJhaUBhb3NjLmlvPgo+
PiBDYzogWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+Cj4gCj4gT29wcywgdGhpcyB3YXMg
bWlzc2VkIGJ5IG15IGVtYWlsIGZpbHRlciBhZ2Fpbi4KPiAKPiBSZXZpZXdlZC1ieTogSmlheHVu
IFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPgo+IAo+IE1hbnkgdGhhbmtzIGZvciB5b3Vy
IGhlbHAuCgpXaXRoIHlvdXIgcmV2aWV3LCBJIGFwcGxpZWQgdGhpcyBwYXRjaCB0byBtYXN0ZXIs
IHRoYW5rcy4KCj4+IFNpZ25lZC1vZmYtYnk6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHln
b2F0LmNvbT4KPj4gW0p1bGllbjoKPj4gIC0gYWRkIGxpbmsgdG8gbWFpbGluZyBsaXN0IGRpc2N1
c3Npb24KPj4gIC0gYWRkIGNvbmZpZ3VyYXRpb24gdG8gcmVwcm9kdWNlIGlzc3VlcyB0byBoZWxw
IGZ1dHVyZSBpbnZlc3RpZ2F0aW9ucwo+PiAgLSBhZGQgbGlua3MgdG8gYXV0b2J1aWxkZXIgZmFp
bHVyZXMgaW4gY29tbWl0IGxvZwo+PiAgLSBtYXJrIEJSMl9MT09OR0FSQ0hfRlBVX3szMixOT05F
fSBhcyBicm9rZW4KPj4gXQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
