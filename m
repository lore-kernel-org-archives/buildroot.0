Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06A1C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74B19605F7;
	Wed, 16 Apr 2025 21:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lyj4iLo6iLt; Wed, 16 Apr 2025 21:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6557607AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6557607AB;
	Wed, 16 Apr 2025 21:21:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D876111B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE75A81CEF
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8nfuEtXDt0K for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D5AF81312
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D5AF81312
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D5AF81312
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:21:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 25E8D1C00DD; Wed, 16 Apr 2025 23:21:51 +0200 (CEST)
Message-ID: <d6ae3304-2847-40e2-aef4-55c1fe1dbbb1@rnout.be>
Date: Wed, 16 Apr 2025 23:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250323072519.3477-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20250323072519.3477-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838511; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=a0MLydjVKjr7zNzyEvubuACnOmkWeqyrYMUfyQRjBvc=;
 b=UjEYVCrXu5gdNGt7nuOJ+6vfIQCqlTfwza3FCdxLGz23YFPMX4OWqJFK/LA1Hx9AojZHB8
 r8t5KtU5PQy6xhcyTa0p7XwDzRxAIvoHnbasS59O+1Su/b9QHpgwMJ4cEC71T2NiZLeobA
 46r8RROR+8Qk+Myh/iFQJ4zQZtFFFjyCwHmYxtP3xbzGF2PCxpSh9C11sWF20lHzUN8g9t
 DZrolIKcDDJDU6GPF8PU06m4DdFFgUMi9EGo3vHDU0RzkOd5WWHA7oeAe8rxIZ0bwbKDsp
 ggZZ5X63eUaG6ji2xC8d3nynDXbpbN5N7ZoqSyVMjNptxM81johNYl/XOt7GqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/freeswitch: fix build with GCC 14.x
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

Ck9uIDIzLzAzLzIwMjUgMDg6MjUsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IEZpeGVzOgo+IGh0dHBz
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zM2MvMzNjNDFkOGRhODE5MDkzM2Q4
NjNlZDZmNzVlNWQ1ODZkMWMyMmEyZi8KPgo+IEJ1aWxkIGVycm9yIGlzIGFsc28gcHJlc2VudCBv
biB0aGUgMjAyNC4xMS54IGJyYW5jaDoKPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvN2VlZjY5ZTY1ODc3ODMzMDdjZDkyMzFhYmRjNGEyZmVlNjBjMDc1Zi8KPgo+IFNp
Z25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgogwqBBcHBsaWVkIHRv
wqAyMDI1LjAyLnggYW5kIDIwMjQuMTEueCwgdGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0
Cgo+IC0tLQo+ICAgLi4ubnQtbW9kX3htbF9ycGMtY29uc3QtY29tcGlsZXItZXJyb3JzLnBhdGNo
IHwgMzUgKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlv
bnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2ZyZWVzd2l0Y2gvMDAwMy14bWxf
aW50LW1vZF94bWxfcnBjLWNvbnN0LWNvbXBpbGVyLWVycm9ycy5wYXRjaAo+Cj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZnJlZXN3aXRjaC8wMDAzLXhtbF9pbnQtbW9kX3htbF9ycGMtY29uc3QtY29t
cGlsZXItZXJyb3JzLnBhdGNoIGIvcGFja2FnZS9mcmVlc3dpdGNoLzAwMDMteG1sX2ludC1tb2Rf
eG1sX3JwYy1jb25zdC1jb21waWxlci1lcnJvcnMucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAuLjBjZDUyODNhMTQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
cGFja2FnZS9mcmVlc3dpdGNoLzAwMDMteG1sX2ludC1tb2RfeG1sX3JwYy1jb25zdC1jb21waWxl
ci1lcnJvcnMucGF0Y2gKPiBAQCAtMCwwICsxLDM1IEBACj4gK0Zyb20gNDc1YjY0ZDFjNTcwN2Ux
MzAyY2Y5ZjdjZmUzYzM4NWI3MzM5YzZjNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJv
bTogPT9VVEYtOD9xPz1EMD05ND1EMD1COD1EMD1CQj1EMT04Rj1EMD1CRD0yMD1EMD05Rj1EMD1C
MD1EMD1CQj1EMD1CMD89Cj4gKyA9P1VURi04P3E/PUQxPTgzPUQwPUI3PUQwPUJFPUQwPUIyPz0g
PGdpdC1kcGFAYWVnZWUub3JnPgo+ICtEYXRlOiBTYXQsIDIyIEp1biAyMDI0IDE0OjU4OjUyICsw
MjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0geG1sX2ludC9tb2RfeG1sX3JwYzogY29uc3QgY29tcGls
ZXIgZXJyb3JzCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3NpZ25hbHdpcmUv
ZnJlZXN3aXRjaC9wdWxsLzI0OTYKPiArCj4gK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxi
ZXJuZEBrdWhscy5uZXQ+Cj4gKy0tLQo+ICsgc3JjL21vZC94bWxfaW50L21vZF94bWxfcnBjL21v
ZF94bWxfcnBjLmMgfCA0ICsrLS0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3JjL21vZC94bWxfaW50L21vZF94
bWxfcnBjL21vZF94bWxfcnBjLmMgYi9zcmMvbW9kL3htbF9pbnQvbW9kX3htbF9ycGMvbW9kX3ht
bF9ycGMuYwo+ICtpbmRleCA4ZTQ5NDYyZDJjMi4uMGE0ZTVlMWU0NDkgMTAwNjQ0Cj4gKy0tLSBh
L3NyYy9tb2QveG1sX2ludC9tb2RfeG1sX3JwYy9tb2RfeG1sX3JwYy5jCj4gKysrKyBiL3NyYy9t
b2QveG1sX2ludC9tb2RfeG1sX3JwYy9tb2RfeG1sX3JwYy5jCj4gK0BAIC0zMjEsNyArMzIxLDcg
QEAgc3RhdGljIGFieXNzX2Jvb2wgdXNlcl9hdHRyaWJ1dGVzKGNvbnN0IGNoYXIgKnVzZXIsIGNv
bnN0IGNoYXIgKmRvbWFpbl9uYW1lLAo+ICsgc3RhdGljIGFieXNzX2Jvb2wgaXNfYXV0aG9yaXpl
ZChjb25zdCBUU2Vzc2lvbiAqIHIsIGNvbnN0IGNoYXIgKmNvbW1hbmQpCj4gKyB7Cj4gKyAJY2hh
ciAqdXNlciA9IE5VTEwsICpkb21haW5fbmFtZSA9IE5VTEw7Cj4gKy0JY2hhciAqYWxsb3dlZF9j
b21tYW5kcyA9IE5VTEw7Cj4gKysJY29uc3QgY2hhciAqYWxsb3dlZF9jb21tYW5kcyA9IE5VTEw7
Cj4gKyAJY2hhciAqZHA7Cj4gKyAJY2hhciAqZHVwID0gTlVMTDsKPiArIAljaGFyICphcmd2WzI1
Nl0gPSB7IDAgfTsKPiArQEAgLTkyMiw3ICs5MjIsNyBAQCBhYnlzc19ib29sIGhhbmRsZXJfaG9v
ayhUU2Vzc2lvbiAqIHIpCj4gKyAJCQkJaWYgKGxlbiA+IDApIHsKPiArIAkJCQkJaW50IHN1Y2Nl
ZWRlZCA9IFRSVUU7Cj4gKyAJCQkJCWNoYXIgKnFwID0gcWJ1ZjsKPiArLQkJCQkJY2hhciAqcmVh
ZEVycm9yOwo+ICsrCQkJCQljb25zdCBjaGFyICpyZWFkRXJyb3I7Cj4gKwo+ICsgCQkJCQlkbyB7
Cj4gKyAJCQkJCQlpbnQgYmxlbiA9IHItPmNvbm5QLT5idWZmZXJzaXplIC0gci0+Y29ublAtPmJ1
ZmZlcnBvczsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
