Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B072EC43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 21:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7496F60EB1;
	Mon, 29 Jun 2026 21:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGyqTgGefLi7; Mon, 29 Jun 2026 21:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E30D60D95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782768411;
	bh=2QAzo3F1FRs3h9zjZ5KZ+KGmTuI3K/Bv0uJZAqzyQzY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rwUGqoRxPI8E3CrgpFDQzCYqDC2qPmh1wHfgdJx1Kl9bKXerULw8aJvpDVJWfI4Ko
	 XA6fIQ5gBRMPS4yuWlydCOA4n1tMrmQtiy2CBam8VH4x275V3ppgtfTW06xvDsyIZK
	 q6k95rT+uie8jfLE/7g61LSxje+KQ7ao1C1kZBjGYou9eB3bU3MlPjOpOd4S4KZFnv
	 U4GVF6iKd5EauKhufbOqkfIgHNBP0OSsOlEiZqc8whV6gjANaGv0nVZUozc4WeGFaP
	 Gnb37cAymy+s7phoyLH5gSvHBVIuWMc9Cu34bkgNIT91RQf3HWmXuq5u3ZW4eKNHbu
	 ESUJR4bcilalg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E30D60D95;
	Mon, 29 Jun 2026 21:26:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5BAE149
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E31AD40A86
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Clqa_USykJ-y for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 21:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C391940A38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C391940A38
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C391940A38
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:26:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so31837015e9.1
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 14:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782768406; x=1783373206;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g3Y+dK3WwXVF/+iV96M0yxdcMidpp6K2VtfLxH9ZPJ8=;
 b=dYUkLTfunLbTgJJLMP9C9rmfccWx00T8DzGdoAejHxpP9Y0h3eKGcYkZuRzTMW7Kuo
 HJXFc3tyjhp1+XerSnehS+G+UGN8p6RSPEh+ivjFD2kR99ldo9HpZvv/XZS2XT2q34uU
 qCYeP1lhQ4n+HiDk6LTZoWarAofmlNGoL8GLVNlQ08N8yMg4Bd8HyxnuPBjQG8BKgC1b
 VBcBjjVHU8yhEWYyxQe6z5gaxXQnn2tVHiz62j1NC2WFDIFDarqxbFGps0CUvh9z0D+U
 ZcnsBdg3365GdB9a4DxcnZidkssvXhYmoUyahVznqSAa2tVVnUgddSpUvyfypGnaj6Vg
 vXUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+3abfyC5xOmkFAtXEBZsN0EBbPSuVRNEY5P0Xz77fQXTH3HhgD8iLGuH4RaIYYryNI7NbbtIlM8L4=@buildroot.org
X-Gm-Message-State: AOJu0YyiQOnAeh4rW4eR/HxiGSmH6tvH72BBsCmpsLams5OR08Zvgn3w
 5FkSoA59R3Di0+pgMBRWXPNUKeT4IrFgR7ZNejopvfOAFGJESPjCg+zmbx7/9ufdgEM=
X-Gm-Gg: AfdE7cnxyFOLvRAkP5Mi1MjgE9Y8MqMFxY2mJ0s9fsQSNVTSZ/veKmIWGgRb/KVMavt
 9uchIpGRRyID/oJ/KZlhLqccCaQt19qE/gVeG5V123Hb5+A4akrToI8DCWndvloSv7/teex86kw
 ccI//E931CP0ByzkVQSo/nOjT+Mt8tXWxrmcfR8wTp3AQhHlWd4FD7UcHC9eMIY6i+xCwO3VNUa
 3pnZV/oefOlzZbWXlpy8JEMWnw17mxKb87t/s+bsI0pDZdyZUqrkKoDf+RIuk24D61MOkb7XMyA
 13fOENZSgRBhh5QaSOXFzQKTf/YRyz6GIUyRjj15lbPMeH5ITT/fej4T3cW8oYNMM+gC6sSUt8k
 pKyCIrr+HrmMuut5qOGEdSU3FOGnh6XcK1iBigbLm5tk3kY98ymp4HS+qnLiRlaSv5RCuEbOuE+
 CKevnOezKvsht5t720jNsLUI7gGKeRoEs6+Bqj/uUnRb5d/r5ERLwO1KD98Zs+4jBlgy+SY8PRQ
 YLR5CIcaRySXrBRQtXbkPNwMGvuigQXWHdmqr7oAn7NfBcqdYX8XIU=
X-Received: by 2002:a05:600c:1f84:b0:493:8391:919a with SMTP id
 5b1f17b1804b1-493b828ebb1mr19088215e9.16.1782768406459; 
 Mon, 29 Jun 2026 14:26:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8cb62f1sm27559035e9.15.2026.06.29.14.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 14:26:46 -0700 (PDT)
Message-ID: <4847f869-9e49-4340-aecf-829eadc9e8ff@smile.fr>
Date: Mon, 29 Jun 2026 23:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260627113409.777671-1-fiona.klute@gmx.de>
 <b2d7cf01-3a85-4791-bbe5-5f041bfbfdfb@smile.fr>
 <271ee7e9-d141-4174-b990-ea2171b89424@gmx.de>
Content-Language: en-US
In-Reply-To: <271ee7e9-d141-4174-b990-ea2171b89424@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782768406; x=1783373206; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g3Y+dK3WwXVF/+iV96M0yxdcMidpp6K2VtfLxH9ZPJ8=;
 b=WutSDen5HnnNsHY+D016j/s+0mPIvfs+yZvQj8USr6MmIZtVHT07Rs3TNIsvVQiKQ8
 alHpc5+f2GQoxtWXWXcEcRtZKpWIdER2689CpuGUFgmjmPKEkqsBhDVnQA/xTwoBq+Gd
 /KJoUFS7atx3MPS0dfYTuOH79gF2SAqGTSFwY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=WutSDen5
Subject: Re: [Buildroot] [PATCH 1/1] support/testing:
 TestPythonPy3NetworkmanagerGoi: check we actually get data
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmlvbmEsIEFsbCwKCkxlIDI5LzA2LzIwMjYgw6AgMjI6NDYsIEZpb25hIEtsdXRlIGEg
w6ljcml0wqA6Cj4gSGkgUm9tYWluIQo+IAo+IEFtIDI5LjA2LjI2IHVtIDIyOjE0IHNjaHJpZWIg
Um9tYWluIE5hb3VyOgo+PiBIZWxsbyBGaW9uYSwgQWxsLAo+Pgo+PiBMZSAyNy8wNi8yMDI2IMOg
IDEzOjM0LCBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4+PiBUaGUgc2Ft
cGxlIHNjcmlwdCB3b3VsZCd2ZSBwYXNzZWQgZXZlbiBpZiB0aGUgY29ubmVjdGlvbnMgbGlzdCB3
YXMKPj4+IGVtcHR5LiBDaGVjayB0aGF0IHRoZXJlIGlzIGF0IGxlYXN0IG9uZSBjb25uZWN0aW9u
LCBhbmQgdGhhdCB0aGUKPj4+IHNhbXBsZSBzY3JpcHQgY2FuIHJlYWQgbG9vcGJhY2sgZGV2aWNl
IGluZm9ybWF0aW9uLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZpb25hIEtsdXRlIDxmaW9uYS5r
bHV0ZUBnbXguZGU+Cj4+PiAtLS0KPj4+IMKgIC4uLi90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRo
b25fbmV0d29ya21hbmFnZXJfZ29pLnB5wqDCoMKgwqAgfCA4ICsrKysrKysrCj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlLwo+Pj4gc2FtcGxlX3B5dGhvbl9uZXR3b3JrbWFuYWdlcl9n
b2kucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS8KPj4+IHNhbXBsZV9weXRob25f
bmV0d29ya21hbmFnZXJfZ29pLnB5Cj4+PiBpbmRleCAyNDBlODQzN2ZkLi5kZmY2OGU2NmY5IDEw
MDY0NAo+Pj4gLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhv
bl9uZXR3b3JrbWFuYWdlcl9nb2kucHkKPj4+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3NhbXBsZV9weXRob25fbmV0d29ya21hbmFnZXJfZ29pLnB5Cj4+PiBAQCAtMjQsMyAr
MjQsMTEgQEAgZm9yIGMgaW4gY29ubmVjdGlvbnM6Cj4+PiDCoMKgwqDCoMKgIHByaW50KCJ7fToi
LmZvcm1hdChjLmdldF9pZCgpKSkKPj4+IMKgwqDCoMKgwqAgYy5mb3JfZWFjaF9zZXR0aW5nX3Zh
bHVlKHByaW50X3ZhbHVlcywgTm9uZSkKPj4+IMKgwqDCoMKgwqAgcHJpbnQoIlxuIikKPj4+ICtw
cmludCgiZm91bmQge30gZGVmaW5lZCBjb25uZWN0aW9ucyIuZm9ybWF0KGxlbihjb25uZWN0aW9u
cykpKQo+Pj4gK2Fzc2VydCBsZW4oY29ubmVjdGlvbnMpID4gMAo+Pj4gKwo+Pj4gKyMgY2hlY2sg
dGhhdCB3ZSBjYW4gZmluZCB0aGUgbG9vcGJhY2sgZGV2aWNlIC4uLgo+Pj4gK2xvb3BiYWNrID0g
Y2xpZW50LmdldF9kZXZpY2VfYnlfaWZhY2UoImxvIikKPj4+ICsjIC4uLiBhbmQgcmVhZCBpdHMg
dHlwZSBhbmQgc3RhdHVzIGFzIGV4cGVjdGVkCj4+PiArYXNzZXJ0IGxvb3BiYWNrLmdldF9kZXZp
Y2VfdHlwZSgpLm5hbWUgPT0gIkxPT1BCQUNLIgo+Pj4gK2Fzc2VydCBsb29wYmFjay5nZXRfc3Rh
dGUoKS5uYW1lID09ICJBQ1RJVkFURUQiCj4+Cj4+IEhhdmUgeW91IGNoZWNrZWQgdGhhdCB0aGlz
IHRlc3QgaXMgd29ya2luZyBhcyBleHBlY3RlZCB1c2luZyBhIGdpdGxhYiBydW5uZXIgPwo+Pgo+
PiBXZSBoYWQgc29tZSBpc3N1ZSByZWNlbnRseSB1c2luZyBsb2NhbCBuZXR3b3JrOgo+Pgo+PiBT
ZWU6Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1p
dC8KPj4gYTM2NzM2MmFmMDBlZDM0OTkxNWIwYjQ0OTZlYmViOTkxMGZjODZlNAo+Pgo+PiBDYW4g
eW91IGRvdWJsZSBjaGVjaz8KPiBJc3N1ZSB0aGVyZSB3YXMgdXNpbmcgdGhlIGxvb3BiYWNrIGRl
dmljZSBvZiB0aGUgR2l0bGFiIHJ1bm5lci4KPiAKPiBUaGlzIHRlc3QgZG9lc24ndCBkbyB0aGF0
OiBUaGUgcGF0Y2ggY2hhbmdlcyB0aGUgc2FtcGxlIHNjcmlwdCBydW5uaW5nIGluIHRoZQo+IHRl
c3QgVk0gKHRoZSBRZW11IGluc3RhbmNlIHN0YXJ0ZWQgYnkgdGhlIHRlc3QpLCB0byBjaGVjayB0
aGF0IE5ldHdvcmtNYW5hZ2VyCj4gcnVubmluZyBpbiB0aGF0IFZNIGNhbiBwcm92aWRlIGluZm9y
bWF0aW9uIG9uIHRoZSBsb29wYmFjayBkZXZpY2Ugb2YgdGhlIFZNCj4gaXRzZWxmLiBFdmVyeXRo
aW5nIGlzIGNvbnRhaW5lZCB3aXRoaW4gUWVtdSwgaWYgdGhhdCBkb2Vzbid0IHdvcmsgY2xlYXJs
eQo+IHNvbWV0aGluZyBpbiB0aGUgYnVpbGQgaXMgYnJva2VuLiBBbHNvIGl0IGRvZXNuJ3QgZG8g
YW55IElQIGNvbW11bmljYXRpb24sIG5vdAo+IGV2ZW4gYSBwaW5nLCBpdCBqdXN0IGNoZWNrcyB0
aGF0IE5NIGNhbiBzZWUgdGhlIGxvb3BiYWNrIGRldmljZS4gVGhlIHRlc3QgaXMKPiBkZWZpbmVk
IGluIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX25ldHdvcmttYW5h
Z2VyX2dvaS5weQo+ICh1bmNoYW5nZWQgaW4gdGhlIHBhdGNoKS4KPiAKPiBJZiBHaXRsYWIgcnVu
bmVyIHNlY3VyaXR5IHBvbGljaWVzIGNvdWxkIGNhdXNlIHRoZSBsb29wYmFjayBkZXZpY2UgaW5z
aWRlIHRoZQo+IFFlbXUgVk0gdG8gZGlzYXBwZWFyIChub3Qgc3VyZSBob3cgdGhhdCBjb3VsZCBo
YXBwZW4gd2l0aG91dCBzb21laG93IGJyZWFraW5nCj4gUWVtdSB0byB0aGUgcG9pbnQgb2Ygbm90
IGJvb3RpbmcpLCB0aGUgc2FtZSB3b3VsZCBhZmZlY3QgYWxsIG90aGVyIHRlc3RzIHVzaW5nCj4g
aXQsIGxpa2UgdGhlIGlwdGFibGVzIGFuZCBuZnRhYmxlcyBvbmVzIChhbmQgcHJvYmFibHkgbW9y
ZSkuCgpJbmRlZWQsIGl0IHdhcyB3aXRoIHRoZSBsb29wYmFjayBkZXZpY2Ugb2YgdGhlIEdpdGxh
YiBydW5uZXIsIG5vdCB0aGUgb25lIGluIHRoZQpRZW11IFZNLgoKU29ycnkgZm9yIHRoZSBub2lz
ZS4KCkFwcGxpZWQgdG8gbWFzdGVyLiBUaGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
