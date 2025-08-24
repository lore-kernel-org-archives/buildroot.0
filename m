Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7B9CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 14:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1423B41808;
	Sun, 24 Aug 2025 14:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id raFcYDLXIiMD; Sun, 24 Aug 2025 14:54:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2629341863
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2629341863;
	Sun, 24 Aug 2025 14:54:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C05CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1448541808
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiUp2RIOEtY9 for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 14:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9D7B41863
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9D7B41863
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9D7B41863
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:54:16 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b49f7aaf5so21048425e9.2
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 07:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756047254; x=1756652054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A1EQAb+Qkh/P6GQZkqeb0VNW8mFG0oG5jAe7hf/dJZk=;
 b=gL8q0R468qbo1ROkHU9plaW4zYSo/lSDwqmvS0dwP6odRyV031q4AbCukBtd2QQWiN
 Cr5pY9aHBy1oKOtVRuVYF4CZdbCuWlAedp1b+ohWLAom8IBvFsVxotgs86XUs+lcGF8n
 gs/TZaqrJ8LcebyH7s1kDmRDdUdCQ5+qb0Q065neSiFoUs197dq0H/4eeUADuwxHAm9G
 eK6LngYHbxRZKrOpbFKzDEWY6G6xSJzy7tyNavXyH6zcyLMPhfXLBfapDncDQNBpWrdf
 ZYwfh1RHSS4LsFa7pLJSUf2O3lVUh43WyvqDIafV7x8nKUN7JyVHfzqBqnOeykcwYw4Q
 RI3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6F+PzgrjaADeRYD1Q+Js82o2l9JbaSFnijqS+Ttnr2nb0aqvcs+pdugat0DQ0OAarTAI0Kdjpokg=@buildroot.org
X-Gm-Message-State: AOJu0YzglYuwGHpEWF3xT8jEfzngNp99SkmS4xm0YBlS5zzShtLCsFMC
 CYPrR+Hbjpt1WA+RA0q2SGhu4YywdOHez56fIsQScL8BZ3cIrRba3pXccpjNqveC7SpgdIUfuGj
 kzTmh
X-Gm-Gg: ASbGncuFlUswk6l6R1KJFkC5irbGZWAVDKSXv7Lw+eBT23Y3f/IKpbJ3HkFxTmX1n2b
 +dvvSj+/DWGI4DoRlG9eXkl7tlYqPIObEiyHvL2TG7MGG+ud3FCl+itrZlpnccQZG8STD2tnu90
 3N493qEmD4DOlVqd73r94LhS+O+rd1sdKJ+viDNu9ODfTVw+aOKaYPBuAjdv6UoIMA2PjI41lXi
 GLqQ13VgsTEtC9+Xz9+3y2h/60ZCPEBVsAu0xe4D1W3WgN+jqxKO3nxHo630PkUfal/ijFXjOBp
 Tq9jjWfQTDNhTPgAfR9Th3gt5Cu4SXQolEM8epjlGO5V4KJSU1NYDYd4EZ2KvAKbVO7UjbjLZrW
 zuL16zIjD9gP1bh0zKRTWrTjD2UgM/9ab+3vY8sPf9z2liWEGrl0DIZpANickGrp1BCPgBqlWQR
 IElxbAa6lPHnCBtxBdbiUhbS5tkfa3PkiI+Tj9lSSBLeNHaAl82WlFs2IFOikF
X-Google-Smtp-Source: AGHT+IEmHn8a9wyHypl4pi6gCGuP0kHKJvb+danE2B+gYnSynlwd0CnvM4itb+sYoHKFWJx9UZHiBQ==
X-Received: by 2002:a05:600c:35cb:b0:45b:47e1:ef78 with SMTP id
 5b1f17b1804b1-45b517ddbc9mr72407795e9.35.1756047254398; 
 Sun, 24 Aug 2025 07:54:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711211cbcsm7653411f8f.31.2025.08.24.07.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 07:54:14 -0700 (PDT)
Message-ID: <cab9082f-671d-432f-af5f-22bae16d8403@smile.fr>
Date: Sun, 24 Aug 2025 16:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20250818202709.3216273-1-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20250818202709.3216273-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756047254; x=1756652054; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A1EQAb+Qkh/P6GQZkqeb0VNW8mFG0oG5jAe7hf/dJZk=;
 b=mjM1zH1dYxYctfc/W6LlFJR0/15MmJ7Iesk97AZSmZq9454S4Nf0pkYO+yauK3ulff
 xnj0YkAbTgGK3in3EQgYPo5Ybw7UHvWJeEMC4/fzd48uZliJwyQQwQPYbR3QE/+6jqS0
 iXDuaH3ivapq9K5JCdDjohysJf7yr/aYhO7kI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=mjM1zH1d
Subject: Re: [Buildroot] [PATCH] support/testing: use again the default
 BR2_BACKUP_SITE
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAxOC8wOC8yMDI1IMOgIDIyOjI3LCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGlzIHJldmVydHMgY29tbWl0IDU1OWJi
MzNhZTcxZGQyMzU4Y2EyMzE0Y2NiMjRiNTZjYzM4MDlmYzEsIHdoaWNoCj4gd2FzIGRpc2FibGlu
ZyBCUjJfQkFDS1VQX1NJVEUgaW4gb3VyIHRlc3RzIHdpdGggdGhlIGZvbGxvd2luZwo+IHJlYXNv
bmluZzoKPiAKPiAgICAgc3VwcG9ydC90ZXN0aW5nOiBkbyBub3QgdXNlIHMuYi5vCj4gCj4gICAg
IEN1cnJlbnRseSwgdGhlIHJ1bnRpbWUgdGVzdHMgd2lsbCB1c2UgdGhlIHNvdXJjZXMuYnVpbGRy
b290Lm9yZyBiYWNrdXAKPiAgICAgbWlycm9yLCB3aGljaCBpcyB0aGUgZGVmYXVsdCBzZXR1cC4K
PiAKPiAgICAgSG93ZXZlciwgaW4gc29tZSBjYXNlcyB3ZSBkbyBub3Qgd2FudCB0byB1c2UgdGhl
IGJhY2t1cCBzaXRlLCBiZWNhdXNlIHdlCj4gICAgIHdhbnQgdG8gZW5zdXJlIHRoYXQgdGhlIGRv
d25sb2FkIGFjdHVhbGx5IHdvcmtzLgo+IAo+ICAgICBUaGlzIGlzIHRoZSBjYXNlIGZvciB2ZW5k
b3JlZCBwYWNrYWdlcywgbGlrZSBjYXJnbyBvciBnb2xhbmcgcGFja2FnZXMsCj4gICAgIGZvciB3
aGJpY2ggd2Ugd2FudCB0byBjaGVjayB0aGF0IGd0aGUgZG93bmxvYWQgc3RpbGwgd29ya3Mgd2hl
biB3ZQo+ICAgICB1cGRhdGUgdGhlIHJ1c3Qgb3IgZ28gdmVyc2lvbnMsIG9yIHdoZW4gb3VyIGRv
d25sb2FkIGhlbHBlcnMgY2hhbmdlLgo+IAo+ICAgICBTbywgZGlzYWJsZSB0aGUgdXNlIG9mIHRo
ZSBiYWNrdXAgc2l0ZSBpbiBhbGwgcnVudGltZSB0ZXN0cywgYW5kIGRyb3AKPiAgICAgdGhlIG5v
LWxvbmdlciBuZWVkZWQgc3BlY2lhbCBjYXNlcy4KPiAKPiAgICAgU2lnbmVkLW9mZi1ieTogWWFu
biBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gICAgIENjOiBUaG9tYXMgUGV0
YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IAo+IEhvd2V2ZXIsIG5vdCB1
c2luZyB0aGUgYmFja3VwIHNpdGUgaXMgY2F1c2luZyBhIExPVCBvZiByYW5kb20gZmFpbHVyZXMK
PiBpbiBHaXRsYWIgQ0ksIG1ha2luZyB0aGUgcmVzdWx0cyBiYXJlbHkgdXNhYmxlLiBTaW5jZSBp
dCdzIG1vcmUKPiBpbXBvcnRhbnQgdG8gZ2V0IHJlYWwgZmFpbHVyZXMgdGhhbiByYW5kb20gb25l
cyBkdWUgdG8gZG93bmxvYWQKPiBpc3N1ZXMsIGxldCdzIHJlLWVuYWJsZSBCUjJfQkFDS1VQX1NJ
VEUgaW4gb3VyIHRlc3RpbmcgaW5mcmFzdHJ1Y3R1cmUuCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiAtLS0KPiAgc3VwcG9ydC90
ZXN0aW5nL2luZnJhL2Jhc2V0ZXN0LnB5ICAgICAgICAgICAgICAgfCAxIC0KPiAgc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL2Rvd25sb2FkL3Rlc3RfZ2l0LnB5ICAgICAgfCA1ICsrKystCj4gIHN1cHBv
cnQvdGVzdGluZy90ZXN0cy9kb3dubG9hZC90ZXN0X2dpdGZvcmdlLnB5IHwgNSArKysrLQo+ICBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvZG93bmxvYWQvdGVzdF9zc2gucHkgICAgICB8IDQgKysrLQo+
ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3J1c3QucHkgICAgICB8IDEgKwo+
ICA1IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy9pbmZyYS9iYXNldGVzdC5weSBiL3N1cHBvcnQv
dGVzdGluZy9pbmZyYS9iYXNldGVzdC5weQo+IGluZGV4IDRmMDIwZThhOTMuLjlmYjlkZmZjNTMg
MTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2Jhc2V0ZXN0LnB5Cj4gKysrIGIv
c3VwcG9ydC90ZXN0aW5nL2luZnJhL2Jhc2V0ZXN0LnB5Cj4gQEAgLTM3LDcgKzM3LDYgQEAgY2xh
c3MgQlJDb25maWdUZXN0KHVuaXR0ZXN0LlRlc3RDYXNlKToKPiAgICAgICAgICBzdXBlcihCUkNv
bmZpZ1Rlc3QsIHNlbGYpLl9faW5pdF9fKG5hbWVzKQo+ICAgICAgICAgIHNlbGYudGVzdG5hbWUg
PSBzZWxmLl9fY2xhc3NfXy5fX25hbWVfXwo+ICAgICAgICAgIHNlbGYuYnVpbGRkaXIgPSBzZWxm
Lm91dHB1dGRpciBhbmQgb3MucGF0aC5qb2luKHNlbGYub3V0cHV0ZGlyLCBzZWxmLnRlc3RuYW1l
KQo+IC0gICAgICAgIHNlbGYuY29uZmlnICs9ICdcbkJSMl9CQUNLVVBfU0lURT0iIlxuJwo+ICAg
ICAgICAgIHNlbGYuY29uZmlnICs9ICdcbkJSMl9ETF9ESVI9Int9IlxuJy5mb3JtYXQoc2VsZi5k
b3dubG9hZGRpcikKPiAgICAgICAgICBzZWxmLmNvbmZpZyArPSAiXG5CUjJfSkxFVkVMPXt9XG4i
LmZvcm1hdChzZWxmLmpsZXZlbCkKPiAgCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9kb3dubG9hZC90ZXN0X2dpdC5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9kb3dubG9h
ZC90ZXN0X2dpdC5weQo+IGluZGV4IDNjZjk4ZjY0NTYuLmJhNTJlMDNlZjUgMTAwNjQ0Cj4gLS0t
IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Rvd25sb2FkL3Rlc3RfZ2l0LnB5Cj4gKysrIGIvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL2Rvd25sb2FkL3Rlc3RfZ2l0LnB5Cj4gQEAgLTcsNyArNywxMCBA
QCBpbXBvcnQgaW5mcmEKPiAgCj4gIAo+ICBjbGFzcyBHaXRUZXN0QmFzZShpbmZyYS5iYXNldGVz
dC5CUkNvbmZpZ1Rlc3QpOgo+IC0gICAgY29uZmlnID0gIiIKPiArICAgIGNvbmZpZyA9IFwKPiAr
ICAgICAgICAiIiIKPiArICAgICAgICBCUjJfQkFDS1VQX1NJVEU9IiIKPiArICAgICAgICAiIiIK
PiAgICAgIGdpdHJlbW90ZWRpciA9IGluZnJhLmZpbGVwYXRoKCJ0ZXN0cy9kb3dubG9hZC9naXQt
cmVtb3RlIikKPiAgICAgIGdpdHJlbW90ZSA9IE5vbmUKPiAgCj4gZGlmZiAtLWdpdCBhL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9kb3dubG9hZC90ZXN0X2dpdGZvcmdlLnB5IGIvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL2Rvd25sb2FkL3Rlc3RfZ2l0Zm9yZ2UucHkKPiBpbmRleCA0NzdjMzY1YTM0Li5l
MWFjMzVlYzY3IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9kb3dubG9hZC90
ZXN0X2dpdGZvcmdlLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Rvd25sb2FkL3Rl
c3RfZ2l0Zm9yZ2UucHkKPiBAQCAtNSw3ICs1LDEwIEBAIGltcG9ydCBpbmZyYQo+ICAKPiAgCj4g
IGNsYXNzIEdpdGZvcmdlVGVzdEJhc2UoaW5mcmEuYmFzZXRlc3QuQlJDb25maWdUZXN0KToKPiAt
ICAgIGNvbmZpZyA9ICIiCj4gKyAgICBjb25maWcgPSBcCj4gKyAgICAgICAgIiIiCj4gKyAgICAg
ICAgQlIyX0JBQ0tVUF9TSVRFPSIiCj4gKyAgICAgICAgIiIiCj4gIAo+ICAgICAgZGVmIHNldFVw
KHNlbGYpOgo+ICAgICAgICAgIHN1cGVyKEdpdGZvcmdlVGVzdEJhc2UsIHNlbGYpLnNldFVwKCkK
PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Rvd25sb2FkL3Rlc3Rfc3NoLnB5
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Rvd25sb2FkL3Rlc3Rfc3NoLnB5Cj4gaW5kZXggN2Q2
YWMzYWFmNy4uMTI2MDAyYTM1NSAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
ZG93bmxvYWQvdGVzdF9zc2gucHkKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvZG93bmxv
YWQvdGVzdF9zc2gucHkKPiBAQCAtNyw3ICs3LDkgQEAgaW1wb3J0IGluZnJhCj4gIAo+ICAKPiAg
Y2xhc3MgU1NIVGVzdEJhc2UoaW5mcmEuYmFzZXRlc3QuQlJDb25maWdUZXN0KToKPiAtICAgIGNv
bmZpZyA9IGluZnJhLmJhc2V0ZXN0Lk1JTklNQUxfQ09ORklHCj4gKyAgICBjb25maWcgPSBpbmZy
YS5iYXNldGVzdC5NSU5JTUFMX0NPTkZJRyArICcnJwo+ICtCUjJfQkFDS1VQX1NJVEU9IiIKPiAr
JycnCj4gICAgICBzc2hkX3Rlc3RfZGlyID0gaW5mcmEuZmlsZXBhdGgoInRlc3RzL2Rvd25sb2Fk
L3NzaGQiKQo+ICAgICAgc3NoZCA9IE5vbmUKPiAgCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcnVzdC5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfcnVzdC5weQo+IGluZGV4IDgxNjBjYjYwNTMuLjc2MzEyNWNhMjAgMTAwNjQ0
Cj4gLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9ydXN0LnB5Cj4gKysr
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9ydXN0LnB5Cj4gQEAgLTcwLDYg
KzcwLDcgQEAgY2xhc3MgVGVzdFJ1c3RWZW5kb3JpbmcoaW5mcmEuYmFzZXRlc3QuQlJDb25maWdU
ZXN0KToKPiAgICAgICAgICBCUjJfUEFDS0FHRV9SSVBHUkVQPXkKPiAgICAgICAgICBCUjJfUEFD
S0FHRV9QWVRIT04zPXkKPiAgICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT05fQ1JZUFRPR1JBUEhZ
PXkKPiArICAgICAgICBCUjJfQkFDS1VQX1NJVEU9IiIKPiAgICAgICAgICAiIiIKPiAgCj4gICAg
ICBkZWYgc2V0VXAoc2VsZik6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
