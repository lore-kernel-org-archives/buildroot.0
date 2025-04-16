Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB60C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED47881ECB;
	Wed, 16 Apr 2025 21:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igmJfTd_wv3C; Wed, 16 Apr 2025 21:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D1A081EEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1A081EEB;
	Wed, 16 Apr 2025 21:27:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D52011B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A1D583F63
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlQTZNtsya02 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:27:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22D5281E98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22D5281E98
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22D5281E98
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:27:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 362341C0083; Wed, 16 Apr 2025 23:26:59 +0200 (CEST)
Message-ID: <e88b1be2-cac2-4d05-bad9-a99735ecb4ab@rnout.be>
Date: Wed, 16 Apr 2025 23:26:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20250403064750.116910-1-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20250403064750.116910-1-romain.naour@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838819; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PLxiw+IiuE0j1GxuGYY5DtIpJQnIo2QvhBoNm+dLT2s=;
 b=NBqtUq5qyi5Cx2WyEU6Dy79RGQfASR5JvYrvHTN2u3OFZi61eAeTD4JLiljoHaEKjer+YY
 bwX6go/YqIr5MQANMFEBZemFZ/bic0PFkyjAzrJXhf0tkw0OgyC7sJRGFQD7j4DmzbVKPJ
 0BIsPxYahe6khnj2gsJj/tjNiF9pGnCg/F3Uu9pGATfMH1uY4kBnQSM744Vsyi7hhji8vb
 PLQJQlixAIbikBP9pl47+wqVwYpNpYUG/0/k7HqBTjcl2Okuf8m40IAo9L4gD8hHXNlKi1
 Dk8ZgAIChCJ3fJYhHOdxAl8DdiN9gjOgmJ8VbezC0+HJ1drc3Pk6o0WT8AEYmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] support/download/svn: use 'svn info' whith
 LC_ALL=C
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDAzLzA0LzIwMjUgMDg6NDcsIFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+
IFVzZSB0aGUgJ0MnIGxvY2FsZSB3aGVuIHJldHJpZXZpbmcgdGhlIGRhdGUgb2YgdGhlIGxhc3Qg
Y2hhbmdlIHVzaW5nCj4gJ3N2biBpbmZvJyBzaW5jZSB0aGUgc3ZuIGRvd25sb2FkIGhlbHBlciBz
Y3JpcHQgZXhwZWN0Cj4gIkxhc3QgQ2hhbmdlZCBEYXRlIiBzdHJpbmcuCj4KPiBJZiBhbm90aGVy
IGxvY2FsZSBpcyB1c2VkLCB0aGUgJ2RhdGUnIGlzIGVtcHR5IHNvIHRoZSBnZW5lcmF0ZWQKPiBh
cmNoaXZlIChieSBta190YXJfZ3opIHdpbGwgbm90IG1hdGNoIHRoZSBleHBlY3RlZCBoYXNoIHNp
bmNlCj4gdGhlIGZpbGUgdGltZXN0YW1wIGlzIG5vdCBzZXQgcHJvcGVybHkuCj4KPiBJZiBMQU5H
PWZyX0ZSLlVURi04IGlzIGRlZmluZWQgaW4gdGhlIGhvc3Qgc3lzdGVtLCBzdm4gcHJpbnQgc29t
ZQo+ICJGcmVuY2ggZW5jcnlwdGVkIiB0ZXh0Ogo+Cj4gICAgZXZhbCBzdm4gLS1ub24taW50ZXJh
Y3RpdmUgLS1jb25maWctb3B0aW9uIHNlcnZlcnM6Z2xvYmFsOmh0dHAtdGltZW91dD0xMCBpbmZv
ICcnXCcnaHR0cHM6Ly9zdm4uY29kZS5zZi5uZXQvcC94bWxycGMtYy9jb2RlL2FkdmFuY2VkQHIz
MTc2J1wnJycKPiAgICAuLi4KPiAgICBEYXRlIGRlIGxhIGRlcm5pw6hyZSBtb2RpZmljYXRpb246
IDIwMjMtMDktMDIgMTk6MTM6MzUgKzAyMDAgKHNhbS4gMDIgc2VwdC4gMjAyMykKPgo+IGRpZmZv
c2NvcGUgY29uZmlybSB0aGF0IHRoZSBmaWxlIHRpbWVzdGFtcCBpcyBub3Qgc2V0IGNvcnJlY3Rs
eQo+IGluIHRoZSBnZW5lcmF0ZWQgYXJjaGl2ZToKPgo+ICQgZGlmZm9zY29wZSBOT0svbGlieG1s
cnBjLXIzMTc2LXN2bjUudGFyLmd6IE9LL2xpYnhtbHJwYy1yMzE3Ni1zdm41LnRhci5nego+IC0t
LSBOT0svbGlieG1scnBjLXIzMTc2LXN2bjUudGFyLmd6Cj4gKysrIE9LL2xpYnhtbHJwYy1yMzE3
Ni1zdm41LnRhci5nego+IOKUnOKUgOKUgCBsaWJ4bWxycGMtcjMxNzYtc3ZuNS50YXIKPiDilIIg
4pSc4pSA4pSAIGZpbGUgbGlzdAo+IOKUgiDilIIgQEAgLTEsNjI2ICsxLDYyNiBAQAo+IOKUgiDi
lIIgLS1ydy1yLS1yLS0gICAwICAgICAgICAwICAgICAgICAwICAgICA2OTM3IDIwMjUtMDQtMDIg
MDA6MDA6MDAuMDAwMDAwIGxpYnhtbHJwYy1yMzE3Ni9HTlVtYWtlZmlsZQo+IOKUgiDilIIgKy1y
dy1yLS1yLS0gICAwICAgICAgICAwICAgICAgICAwICAgICA2OTM3IDIwMjMtMDktMDIgMTc6MTM6
MzUuMDAwMDAwIGxpYnhtbHJwYy1yMzE3Ni9HTlVtYWtlZmlsZQo+Cj4gRml4IHRoaXMgaXNzdWUg
dXNpbmcgJ0MnIGxvY2FsZToKPgo+ICAgIExDX0FMTD1DIGV2YWwgc3ZuIC0tbm9uLWludGVyYWN0
aXZlIC0tY29uZmlnLW9wdGlvbiBzZXJ2ZXJzOmdsb2JhbDpodHRwLXRpbWVvdXQ9MTAgaW5mbyAn
J1wnJ2h0dHBzOi8vc3ZuLmNvZGUuc2YubmV0L3AveG1scnBjLWMvY29kZS9hZHZhbmNlZEByMzE3
NidcJycnCj4gICAgLi4uCj4gICAgTGFzdCBDaGFuZ2VkIERhdGU6IDIwMjMtMDktMDIgMTk6MTM6
MzUgKzAyMDAgKFNhdCwgMDIgU2VwIDIwMjMpCj4KPiBGaXhlczogODlmNWU5ODkzMjNhY2U4MTVh
MzJmY2VkMjdlYWVmZWUyZjQ2NjZkZQo+Cj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+CgogwqBBcHBsaWVkIHRvwqAyMDI1LjAyLngsIDIwMjQuMTEu
eCBhbmQgMjAyNC4wMi54LCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4g
ICBzdXBwb3J0L2Rvd25sb2FkL3N2biB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvZG93bmxvYWQv
c3ZuIGIvc3VwcG9ydC9kb3dubG9hZC9zdm4KPiBpbmRleCBmZjMzZjFmYTM5Li41NzZmZDQ4MzAz
IDEwMDc1NQo+IC0tLSBhL3N1cHBvcnQvZG93bmxvYWQvc3ZuCj4gKysrIGIvc3VwcG9ydC9kb3du
bG9hZC9zdm4KPiBAQCAtODEsNyArODEsNyBAQCBkb25lCj4gICAjIEluIGNhc2UgdGhlcmUgaXMg
YSByZWRpcmVjdGlvbiAoZS5nLiBodHRwIC0+IGh0dHBzKSwganVzdCBrZWVwIHRoZQo+ICAgIyBs
YXN0IGxpbmUgKHN2biBvdXRwdXRzIGV2ZXJ5dGhpbmcgb24gc3Rkb3V0KQo+ICAgIyBzaGVsbGNo
ZWNrIGRpc2FibGU9U0MyMDg2ICMgY3JlZHMgbWF5IGJlIGVtcHR5Cj4gLWRhdGU9IiQoIF9wbGFp
bl9zdm4gaW5mbyAke2NyZWRzfSAiJyR7dXJpfUAke3Jldn0nIiBcCj4gK2RhdGU9IiQoIExDX0FM
TD1DIF9wbGFpbl9zdm4gaW5mbyAke2NyZWRzfSAiJyR7dXJpfUAke3Jldn0nIiBcCj4gICAgICAg
ICAgIHxzZWQgLXIgLWUgJy9eTGFzdCBDaGFuZ2VkIERhdGU6IC8hZDsgcy8vLycKPiAgICAgICAg
ICApIgo+ICAgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
