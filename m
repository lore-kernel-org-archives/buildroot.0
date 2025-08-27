Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA66CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 15:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24B8540CE3;
	Wed, 27 Aug 2025 15:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJJV2B1Daf2D; Wed, 27 Aug 2025 15:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31B12404A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B12404A6;
	Wed, 27 Aug 2025 15:22:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 034BC17D
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 15:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCCA480739
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 15:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4zHTWqtQNSt for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 15:22:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8D3F80B89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D3F80B89
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8D3F80B89
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 15:22:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3cb9268511bso1030481f8f.0
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 08:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756308151; x=1756912951;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D6kzJ1DGThLzIK1XJg9uxdcdEg3k0jBswnnkQBzno9o=;
 b=vMzZl3cZxo1fmbf10KOv0PiNydHIC+CvlCNhv1nsgcbkRoW2D1uwEV4AqaixAvf8TM
 WeF0fPJzZPJEIhXt1jMEATCwx/rYzv2h0X6qeq5bcXqEmD9PO98usQ9jfZwKjKdaJsVJ
 SR7sdBLCmXGcCQoruMqXsWlfu1+U/MgwHLatOuu+2amA9aF9lULpwtgM0jwdxxvgH7EV
 SnAkJ0Vl84FqNK/gABwLS4DmvlmBqr3su0JlLK4/fYvDI+YJSvKa0Md3zecDrNCSZ3IC
 vG0jncSqZIDPRtG+BoFi/X0BlUrU7egvcwtHPnhogSd8CI+s/oN+n+W0fh9yqztMzgQA
 hgqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3TdK1WXzOPFGSX5nW09tdZbeDcBOAA2FhBOa0qG4C10WFBc/+HREHrLzBuPMm6gayB3iYkTyOj8g=@buildroot.org
X-Gm-Message-State: AOJu0YxyCiaxKqBbnN1X27pqnJUltpdabi1S+le+gChmvqkhYzVOHwwr
 hYBSp4h8/kX4oqDTeUeE3pRfQ4we/wpsnTySruNO+albIdbbmSpFnkKbntVHzj0vV3U=
X-Gm-Gg: ASbGncvFNzL3C5n5u0SneNvDDKJOorQGOdp/fucNAR4M8KAQT4wXRC3OCrs5j//TDtM
 jmXz0WLDpFBldVeXWzKiQwXk0kHEged/HA3kHBzkAhj+LoF6DZQi7BL79l90AkAJLBjDPc2ji3+
 Cc+rG0MYHSWKFjJOjmACM7nE7HOm0RHW7rcpXZ7wfrgYfgMzRHxt769q7actC0exHTXnd10tHnV
 tZJY3qCqqbHYofLAIzGibHFGZb6PYFJBqyaJT53X/3ChLOkbItta5ZVaJcJvMi0Ha8xgj3ks0PT
 RtjYTFyZ0zq1UAUw3G7jAvMbxMExJjWjzz1sY3CXuvOs1FIuxW60moKTaaJUcZJTrydLxZraWVI
 K0O6XTpPmciQvmgGoJjaO+76gwjNgmPd8JqjXRveRcJ6x3hkLE9Rusoh5NeejUbDkvw4M/JHv8E
 y2jP3E5TN6QDL8S/NV0zTd
X-Google-Smtp-Source: AGHT+IEya4EHXFTUTRuSb31W1naPNqV7Hf/HW2H7cswm1YRhmXMDhP0kS+nvMvqRlg/kukA07llS/Q==
X-Received: by 2002:a05:6000:3105:b0:3b7:886b:fb76 with SMTP id
 ffacd0b85a97d-3c5da83b893mr16791517f8f.12.1756308151446; 
 Wed, 27 Aug 2025 08:22:31 -0700 (PDT)
Received: from [10.5.90.80]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cc4b102889sm4478152f8f.51.2025.08.27.08.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 08:22:31 -0700 (PDT)
Message-ID: <f6d95d33-d134-4390-be7f-ee1a674b25ee@smile.fr>
Date: Wed, 27 Aug 2025 17:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
References: <20250818132436.338635-1-fiona.klute@gmx.de>
 <CA+h8R2pxc0gy4pjVnBJr596Z6RTsMV25svYwP-OLOwigzTb6Cw@mail.gmail.com>
 <cc0f34e2-366d-4f78-a8e7-5c163e57c3c2@smile.fr>
 <17c60c20-55aa-4864-b838-45751b67210e@gmx.de>
 <20250826121851.06ec731e@windsurf>
Content-Language: en-US
In-Reply-To: <20250826121851.06ec731e@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756308151; x=1756912951; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D6kzJ1DGThLzIK1XJg9uxdcdEg3k0jBswnnkQBzno9o=;
 b=KLrTD6IddSY0Hl9jxFx7nWAHVoHTg3Z7mcwtOrQHLvhRX1b1T632Mhl6Nd9lWACEfu
 IqbY9T+BlKLz7lDRjMNuhGCnA10uMJw00E1xRLym96nGaxmHyMctAU/pkg+6X+Qeo4U/
 9aXYfS+4y1fAhSGoKXg97WO2p25HQi4Fgrk+g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=KLrTD6Id
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: prefer cgroup v2
 with kernel >=5.4 and no systemd
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
Cc: "Arnout Vandecappelle \(Essensium/Mind\)" <arnout@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmlvbmEsIFRob21hcywgQWxsLAoKTGUgMjYvMDgvMjAyNSDDoCAxMjoxOCwgVGhvbWFz
IFBldGF6em9uaSBhIMOpY3JpdMKgOgo+IE9uIE1vbiwgMjUgQXVnIDIwMjUgMTI6MjQ6MjcgKzAy
MDAKPiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPiB3cm90ZToKPiAKPj4gSXQgbG9v
a3MgbGlrZSB0aGUgImtlcm5lbCB0b28gb2xkIGZvciB0b29sY2hhaW4iIHByb2JsZW0gYXBwZWFy
ZWQgCj4+IGJlZm9yZSwgaW4gY29tbWl0IDUyMWI2Zjg1NTA4ZWU5YWI4NDhiMGIyZWExZDM2ZWRh
ZjE3MDFiYzEgdGhhdCB3YXMgdGhlIAo+PiByZWFzb24gdG8gdXNlIHRoZSAic3RhYmxlIiBCb290
bGluIHRvb2xjaGFpbiBpbnN0ZWFkIG9mICJibGVlZGluZy1lZGdlIi4gCj4+IEVhcmxpZXIgdGhp
cyB5ZWFyIHRoZSBzdGFibGUgdG9vbGNoYWluIHdhcyB1cGRhdGVkIHdpdGggaGVhZGVycyA1LjQg
Cj4+IChjb21taXQgOTQ3ZGJjOTJhMjBjNWFjZWE3ODgyMTY2Y2FlNzg5M2U2ZWE2NjFlMSksIHNv
IEkgdGhpbmsgdGhlIAo+PiByZWFzb25hYmxlIHNvbHV0aW9uIGhlcmUgaXMgdG8gdXBkYXRlIHRo
ZSBrZXJuZWwuIExvb2tzIGxpa2UgdGhlIGtlcm5lbCAKPj4gY29uZmlnIG5lZWRzIHRvIGJlIGFk
anVzdGVkIGZvciA1LjQueCwgSSdsbCBzZW5kIGEgcGF0Y2ggd2hlbiBJIGhhdmUgdGhlIAo+PiB0
ZXN0cyBwYXNzaW5nLgo+IAo+IEluZGVlZCwgbm93IHRoYXQgdGhlIHN0YWJsZSBCb290bGluIHRv
b2xjaGFpbnMgdXNlIDUuNCBoZWFkZXJzLCBhbGwKPiB0ZXN0cyBzaG91bGQgdXNlID49IDUuNCBr
ZXJuZWwgdmVyc2lvbnMuCj4gCj4+IEFub3RoZXIgcXVlc3Rpb24gaXMgaWYgaXQgc3RpbGwgbWFr
ZXMgc2Vuc2UgdG8gY2xhaW0gc3VwcG9ydCBmb3Iga2VybmVsIAo+PiB2ZXJzaW9ucyA8IDUuNCBh
bmQgY2dyb3VwIHYxLiBNYXliZSBpdCdkIGJlIGJldHRlciB0byBzaW1wbGlmeSB0aGluZ3MgCj4+
IGFuZCBoYXZlICJkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF81XzQi
IGZvciBhbGwgdGhlIAo+PiBEb2NrZXIgcGFja2FnZXMsIG9yIGV2ZW4gcmVtb3ZlIHBhY2thZ2Uv
Y2dyb3VwZnMtbW91bnQgZW50aXJlbHkgYW5kIAo+PiByZXF1aXJlIGFsbCBwYWNrYWdlcyB0aGF0
IG5lZWQgY2dyb3VwcyB0byB1c2UgdjI/IFRoZXJlIGFyZW4ndCB0aGF0IAo+PiBtYW55LCBncmVw
cGluZyBmb3IgQlIyX1BBQ0tBR0VfQ0dST1VQRlNfTU9VTlQgKG90aGVyIHRoYW4gRG9ja2VyIGFu
ZCAKPj4gUG9kbWFuLCB3aGljaCBhbHJlYWR5IHdvcmtzIHdpdGggZWl0aGVyKSB0aGVyZSBhcmUg
cGFja2FnZS9tb2J5LWJ1aWxka2l0IAo+PiAoZGVmaW5pdGVseSBzdXBwb3J0cyBjZ3JvdXB2Miks
IHBhY2thZ2UvbGlidmlydCAoaGF2ZW4ndCBjaGVja2VkLCBidXQgCj4+IEknZCBiZSBleHRyZW1l
bHkgc3VycHJpc2VkIGlmIG5vdCksIGFuZCBwYWNrYWdlL2JhbGVuYS1lbmdpbmUgKG5vIGlkZWEs
IAo+PiB0aGlzIGlzIHRoZSBmaXJzdCB0aW1lIEkndmUgaGVhcmQgb2YgaXQpLgo+IAo+IFRvdGFs
bHkgZmluZSB3aXRoIHRoaXMgaWRlYS4gSSB0aGluayBpdCdzIE9LIHRvIHJlcXVpcmUgYSA1LjQg
a2VybmVsIGlmCj4geW91IHdhbnQgdG8gcnVuIERvY2tlci4KCkFncmVlLiBJZiB3ZSByZWFsbHkg
d2FudCB0byBrZWVwIGNncm91cHYxLCB3ZSBtdXN0IGF0IGxlYXN0IGFkZCBhIHNwZWNpZmljIHRl
c3QKdG8gY2hlY2sgaWYgb3RoZXIgcGFja2FnZXMgKGxpa2UgZG9ja2VyKSBhcmUgc3RpbGwgd29y
a2luZyB3aXRoIG9ubHkgY2dyb3VwdjEuCgpJJ20gbm90IHN1cmUgaXQncyB3b3J0aCB0aGUgZWZm
b3J0LgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRob21hcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
