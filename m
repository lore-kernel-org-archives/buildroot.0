Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7838AC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 479D84203B;
	Tue,  6 Feb 2024 22:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiYvHLWeaowP; Tue,  6 Feb 2024 22:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5394242048
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5394242048;
	Tue,  6 Feb 2024 22:20:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30B761BF276
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ABE64203B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qm67nHissBHK for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:20:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82EB342048
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82EB342048
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82EB342048
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:20:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a38291dbe65so124041966b.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 14:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707258008; x=1707862808;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jva104N32U58tVVgSxVZYWTf4o1pYABGdTWc64Gfy1o=;
 b=vQxXWeBr79iCkC9Zh9VuISe0A+/YfI+Suhi1CxItKhDtkvmGO0nH3U57UfVWCEfOA5
 GhFynzKM7o35YZfdBICpJAapPCPoRjKVI5ST5Mqypa+I0LAAnYFEak4AC+LuyQBNKxoX
 hVh/iMwkcblP9XHHk3Pa/hxKhzSHkRALconWwADgwFGrfnDiJO9ZSonMvg3MrsAFCDbd
 YVP9GJmvFukbteRXxqanWxyBNYkTBiMBCJvQEjwqiKR9RK7q6zc/PE1AAuMgm0fsHEv7
 h1yrPl6zVqTPDwpf8tyBYSp776Jyas90QOp9GFzDPewQMK+of9G8hUd0N+z9KWcuFEKM
 GcUQ==
X-Gm-Message-State: AOJu0YyzzuTks7q+tLoOs07mykirjmQEs/zUEDYFp0RPL5wO63n3YGjb
 Biyss2Atj0gJhXogFqBSiL8inV2y3YATiluz2Bm1hErAlOM5qSYKwYbzHLt/kG8=
X-Google-Smtp-Source: AGHT+IGcpSf3pxt7np4Unu4gisC+L/KKQ0iutktFvq/VA0qGI0Eg7DEz4ikrzYWM6nlGR5ex+2BsMg==
X-Received: by 2002:a17:906:b312:b0:a36:7b8c:8a10 with SMTP id
 n18-20020a170906b31200b00a367b8c8a10mr2464044ejz.74.1707258008368; 
 Tue, 06 Feb 2024 14:20:08 -0800 (PST)
Received: from [192.168.101.106]
 (i19-lef01-t2-89-85-255-235.ft.lns.abo.bbox.fr. [89.85.255.235])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170906670800b00a377ac3730esm22140ejp.2.2024.02.06.14.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 14:20:08 -0800 (PST)
Message-ID: <e65d24b9-b525-4b4a-a2df-04d5a3fbdecc@smile.fr>
Date: Tue, 6 Feb 2024 23:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240106101202.495801-1-fontaine.fabrice@gmail.com>
 <2be6d0df-6165-4da9-b69c-ad0deb5444be@smile.fr>
 <CAPi7W81fffV_0zMh50hgB7bw7++JZzkdSpFUXXbHMPMKmHtbQw@mail.gmail.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CAPi7W81fffV_0zMh50hgB7bw7++JZzkdSpFUXXbHMPMKmHtbQw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707258008; x=1707862808;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jva104N32U58tVVgSxVZYWTf4o1pYABGdTWc64Gfy1o=;
 b=NXh8f9aITFOd7SqYEUYf5BY2zdS+71DY+I/eSC9eXDNIQfddLlKn3Cp9eIsoV+X5mB
 J6yHJHPcR3PQgoi35YSvG7F7nSr9ZCZb8UIKZ5M2PRYU+n5nsh2FB1488KtEbVxqgwWP
 9ZX58N8vGNcDMc8+qkVG0+QGAipk7hdgW/hmtQh7ID38d+bqBuoRDIBQRznVBAooqCEN
 fvWPas7vzEwaRagNeekD8K3pPZVsSDzYUz5pw8jjHhI76LNGL98TIP1fdqXV53n2THTJ
 rTLWgFPgzRLaJUmCfrXCBpQFv8eoGoUMNefpMpqwlv4DALuWT0onCWlRz0gWIDWMD5GK
 vlJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=NXh8f9aI
Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: don't set NLS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDYvMDIvMjAyNCDDoCAxODo1OSwgRmFicmljZSBGb250YWluZSBhIMOpY3JpdMKgOgo+IEhl
bGxvIFJvbWFpbiwKPiAKPiBMZSBtYXIuIDYgZsOpdnIuIDIwMjQgw6AgMTg6MzIsIFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiBhIMOpY3JpdCA6Cj4+Cj4+IEhlbGxvLAo+Pgo+
PiBMZSAwNi8wMS8yMDI0IMOgIDExOjEyLCBGYWJyaWNlIEZvbnRhaW5lIGEgw6ljcml0IDoKPj4+
IG5jbXBjIGlzIGFibGUgdG8gYXV0b21hdGljYWxseSBkZXRlY3QgTkxTIHN1cHBvcnQgc2luY2Ug
dmVyc2lvbiAwLjQ3IGFuZAo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL011c2ljUGxheWVyRGFlbW9u
L25jbXBjL2NvbW1pdC9jMjY0ZGIwNGRkMzBhZjMwMWU3ZDg1YzlkMTQ1YmIxZjFhZTNmZWEzCj4+
PiBzbyBsZXQgaXQgaGFuZGxlIGF1dG9tYXRpY2FsbHkgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBi
dWlsZCBmYWlsdXJlIHdpdGgKPj4+IGEgYm9vdGxpbiB0b29sY2hhaW4gd2hpY2ggZW1iZWRzIGEg
Z2V0dGV4dCBkZWZpbml0aW9uIGluIGxpYmludGwuaCB3aGljaAo+Pj4gd2lsbCBjbGFzaCB3aXRo
IHRoZSBmYWtlIGdldHRleHQgZGVmaW5pdGlvbiBwcm92aWRlZCBieSBuY21wYyBzaW5jZQo+Pj4g
aHR0cHM6Ly9naXRodWIuY29tL011c2ljUGxheWVyRGFlbW9uL25jbXBjL2NvbW1pdC85NWFmMjdh
YjJkM2NlYjlkZjI2ZWJiNGUwZDkzNmUzOTJhODRjMTUzOgo+Pj4KPj4+IEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSAuLi9zcmMvc2F2ZV9wbGF5bGlzdC5jeHg6ODoKPj4+IC9ob21lL2J1aWxkcm9vdC9h
dXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9ob3N0L29yMWstYnVpbGRyb290LWxpbnV4LWdu
dS9zeXNyb290L3Vzci9pbmNsdWRlL2xpYmludGwuaDozOToxNDogZXJyb3I6IGV4cGVjdGVkIHVu
cXVhbGlmaWVkLWlkIGJlZm9yZSAnY29uc3QnCj4+PiAgICAzOSB8IGV4dGVybiBjaGFyICpnZXR0
ZXh0IChjb25zdCBjaGFyICpfX21zZ2lkKQo+Pj4gICAgICAgfCAgICAgICAgICAgICAgXn5+fn5+
fgo+Pj4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2hvc3Qv
b3Ixay1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvbGliaW50bC5oOjM5
OjE0OiBlcnJvcjogZXhwZWN0ZWQgJyknIGJlZm9yZSAnY29uc3QnCj4+PiAuLi9zcmMvaTE4bi5o
OjIyOjIwOiBub3RlOiB0byBtYXRjaCB0aGlzICcoJwo+Pj4gICAgMjIgfCAjZGVmaW5lIGdldHRl
eHQoeCkgKHgpCj4+PiAgICAgICB8ICAgICAgICAgICAgICAgICAgICBeCj4+Pgo+Pj4gSW5kZWVk
LCBldmVuIGlmIE5MUyBpcyBkaXNhYmxlZCBieSB0aGUgdXNlciwgbGliaW50bC5oIHdpbGwgYmUg
aW5jbHVkZWQKPj4+IGJ5Cj4+PiAvaG9tZS9mYWJyaWNlL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9v
cHQvZXh0LXRvb2xjaGFpbi9vcjFrLWJ1aWxkcm9vdC1saW51eC1nbnUvaW5jbHVkZS9jKysvMTMu
Mi4wL29yMWstYnVpbGRyb290LWxpbnV4LWdudS9iaXRzL21lc3NhZ2VzX21lbWJlcnMuaAo+Pj4g
dGhvdWdoIGluY2x1ZGUgPGNocm9ubz4KPj4KPj4gV2UgdXN1YWxseSB3YW50IHRvIGV4cGxpY2l0
bHkgaGFuZGxlIHN1Y2ggb3B0aW9uIGZyb20gQnVpbGRyb290IHBhY2thZ2UgdG8gbm90Cj4+IHJl
bHkgb24gYXV0b21hdGljIGRldGVjdGlvbiAoYXMgY3VycmVudGx5IGRvbmUpLgo+Pgo+PiBJdCBs
b29rIGxpa2UgbW9yZSBhIGJ1ZyBpbiBuY21wYyBidWlsZCBzeXN0ZW0/Cj4gCj4gSSBkb24ndCBr
bm93LCB1cHN0cmVhbSB3YW50cyB0byBoYXZlIHRoZSBzYW1lIGNvZGUgd2l0aCBhbmQgd2l0aG91
dAo+IE5MUywgc28gdGhleSBkZWNpZGVkIHRvIGRlZmluZSBhIGdldHRleHQgbWFjcm8gd2hlbiBO
TFMgaXMgZGlzYWJsZWQuCj4gSSBjb3VsZCBmaW5kIGFuIHVwc3RyZWFtYWJsZSBzb2x1dGlvbiBh
cyB1cHN0cmVhbSB3aWxsIHByb2JhYmx5IHJlamVjdAo+IGEgcGF0Y2ggdGhhdCByZW1vdmVzIHRo
aXMgZ2V0dGV4dCBkZWZpbmUgYW5kIHB1dHMgI2lmZGVmIEVOQUJMRV9OTFMKPiBiZWZvcmUgZXZl
cnkgZ2V0dGV4dCBjYWxscy4KPiBEbyB5b3UgaGF2ZSBhbiB1cHN0cmVhbWFibGUgc29sdXRpb24g
b3Igc2hvdWxkIHdlIGp1c3QgYWRkIGEgTkxTCj4gZGVwZW5kZW5jeSB0byBuY21wYz8KClRoZSBw
cm9ibGVtIGhlcmUgaXMgdGhhdCBsaWJpbnRsLmggaGVhZGVyIGlzIHByZXNlbnQgaW4gdGhlIHN0
YWdpbmcgZGlyZWN0b3J5CndoZW4gYSBnbGliYyBiYXNlZCB0b29sY2hhaW4gaXMgdXNlZCB3aXRo
IG9yIHdpdGhvdXQgTkxTIGVuYWJsZWQuCgpJZiBuY21wYyB3YW50IHRvIGRlZmluZSBnZXR0ZXh0
IGFzIGEgbWFjcm8gd2hlbiBOTFMgaXMgZGlzYWJsZWQsIGl0cyBidWlsZApzeXN0ZW0gc2hvdWxk
IGF0IGxlYXN0IGRvIHNvbWUgY2hlY2sgYmVmb3JlIGRlZmluaW5nIGdldHRleHQgYXMgYSBtYWNy
byBzaW5jZQp0aGUgbGliaW50bC5oIGhlYWRlciBjYW4gYmUgaW5jbHVkZWQgaW5kaXJlY3RseS4K
CldoZW4gbGliaW50bC5oIGhlYWRlciBwcm92aWRlIGdldHRleHQsIGl0IHNob3VsZCBiZSB1bmRl
ZiBiZWZvcmUgYWRkaW5nIHRoZQpnZXR0ZXh0IG1hY3JvLgoKU29tZXRoaW5nIGxpa2UgdGhpcyAo
dW50ZXN0ZWQpOgoKaTE4bi5oOgoKI2lmZGVmIEhBVkVfSU5UTAojaW5jbHVkZSA8bGliaW50bC5o
PgojZW5kaWYKCiNpZmRlZiBFTkFCTEVfTkxTCi4uLgojZWxzZQojdW5kZWYgZ2V0dGV4dAojZGVm
aW5lIGdldHRleHQoeCkgKHgpCi4uLgojZW5kaWYKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAK
Pj4KPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4KPj4+Cj4+PiBGaXhlczoKPj4+ICAt
IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2M4NjBlNjQ5MDlkZDNiN2Zh
MDMzZGIwOTcwZTFjZmMxMzc2YzRlYzUKPj4+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzLzM2ZWFiNTU2ZmFjODAxMjQ3NTViZmY0MTEwYWYzZTQzZmU2ZWRkNzgKPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdt
YWlsLmNvbT4KPj4+IC0tLQo+Pj4gIHBhY2thZ2UvbmNtcGMvbmNtcGMubWsgfCAzICstLQo+Pj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9uY21wYy9uY21wYy5tayBiL3BhY2thZ2UvbmNtcGMvbmNtcGMu
bWsKPj4+IGluZGV4IGJjOGE2MmRhZWEuLjA5NjU5ODFmMjMgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNr
YWdlL25jbXBjL25jbXBjLm1rCj4+PiArKysgYi9wYWNrYWdlL25jbXBjL25jbXBjLm1rCj4+PiBA
QCAtMjAsOCArMjAsNyBAQCBOQ01QQ19DUEVfSURfVkVORE9SID0gbmNtcGNfcHJvamVjdAo+Pj4K
Pj4+ICBOQ01QQ19DT05GX09QVFMgPSBcCj4+PiAgICAgICAtRGN1cnNlcz1uY3Vyc2VzIFwKPj4+
IC0gICAgIC1EZG9jdW1lbnRhdGlvbj1kaXNhYmxlZCBcCj4+PiAtICAgICAkKGlmICQoQlIyX1NZ
U1RFTV9FTkFCTEVfTkxTKSwtRG5scz1lbmFibGVkLC1EbmxzPWRpc2FibGVkKQo+Pj4gKyAgICAg
LURkb2N1bWVudGF0aW9uPWRpc2FibGVkCj4+Pgo+Pj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElS
Q19UT09MUykseSkKPj4+ICBOQ01QQ19ERVBFTkRFTkNJRVMgKz0gbGlyYy10b29scwo+Pgo+IAo+
IEJlc3QgUmVnYXJkcywKPiAKPiBGYWJyaWNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
