Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3501C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC3C860857;
	Wed, 16 Apr 2025 21:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYJ1Z27tO1iX; Wed, 16 Apr 2025 21:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0FB660B0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0FB660B0C;
	Wed, 16 Apr 2025 21:27:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0955A159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E39B7408AC
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_wZMf_NSd0F for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00FCB4100F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00FCB4100F
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00FCB4100F
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:27:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7AB231C0083; Wed, 16 Apr 2025 23:27:36 +0200 (CEST)
Message-ID: <4117f72b-4ce3-41db-85fc-67604c5a5c14@rnout.be>
Date: Wed, 16 Apr 2025 23:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20250403071258.1995429-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20250403071258.1995429-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838856; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BHJYxJJoqdq7i0Goak19DBwvB5O6ZusSPeaudyf0Cyk=;
 b=Gm4qcQg/BGE+vURiqlKFUM3UBwlsAhP2WqhBm4xn5hTMe72lEN21431eUar9l+O/ENfkAK
 I5NxSjNZbykJpPgkA7Ny8+LoXpBAdRpTHzqzIe5hWvXqXE1yOuWV+bOAGLEfI2XesjWCb7
 jEF19/m/O6Eqbg3Xf/sLCAku7bTp68M9pjuLfkGeecCNIGRFbO+svCpZnsG5VjH8MLiU94
 oRrXKO/G+OmQrp3ZP/Svy5dzBsyOcli0I0VkXQ2MkeB+3upHMdRkMzvIDy49ptQNDnC0VV
 387tytsx3IGvddzE5qB8//PBkrB2fFQSbBCR9DjJR1tGTAZ+HTCl0KXi/5ihhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/glibc: disable on RISC-V ilp32f and
 lp64f, not supported
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

Ck9uIDAzLzA0LzIwMjUgMDk6MTIsIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBnbGliYyBmYWlscyB0byBidWlsZCBvbiBSSVNDLVYgMzItYml0IHdpdGggdGhlIGlscDMy
ZiBBQkkgYW5kIG9uCj4gUklTQy1WIDY0LWJpdCB3aXRoIHRoZSBscDY0ZjogYm90aCB1c2Ugc2lu
Z2xlLXBvaW50IHByZWNpc2lvbiBmbG9hdGluZwo+IHBvaW50LCB3aGljaCBnbGliYyBkb2Vzbid0
IHN1cHBvcnQsIGZhaWxpbmcgZHVyaW5nIHRoZSBjb25maWd1cmUgc3RlcAo+IHdpdGg6Cj4KPiAg
ICBjb25maWd1cmU6IGVycm9yOiBnbGliYyBkb2VzIG5vdCB5ZXQgc3VwcG9ydCB0aGUgc2luZ2xl
IGZsb2F0aW5nLXBvaW50IEFCSQo+Cj4gRml4IHRoYXQgYnkgZGlzYWJsaW5nIGdsaWJjIHN1cHBv
cnQgb24gdGhvc2UgY29uZmlndXJhdGlvbnMuCj4KPiBGaXhlczoKPgo+ICAgIGh0dHBzOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9mZThkNTY5Y2FiNTA3OTkyOTc4ZWYwZGE2NDky
NzhkZDNhOWUwYjIzLwo+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4KCiDCoEFwcGxpZWQgdG/CoDIwMjUuMDIueCwgMjAyNC4x
MS54IGFuZCAyMDI0LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0K
PiAgIHBhY2thZ2UvZ2xpYmMvQ29uZmlnLmluIHwgNCArKystCj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9n
bGliYy9Db25maWcuaW4gYi9wYWNrYWdlL2dsaWJjL0NvbmZpZy5pbgo+IGluZGV4IGQ0NjRiM2Rl
ZjguLjUyNzUyZTk3NWUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nbGliYy9Db25maWcuaW4KPiAr
KysgYi9wYWNrYWdlL2dsaWJjL0NvbmZpZy5pbgo+IEBAIC0yMiw3ICsyMiw5IEBAIGNvbmZpZyBC
UjJfUEFDS0FHRV9HTElCQ19BUkNIX1NVUFBPUlRTCj4gICAJZGVmYXVsdCB5IGlmIEJSMl9taWNy
b2JsYXplCj4gICAJZGVmYXVsdCB5IGlmIEJSMl9hcmMgJiYgQlIyX0FSQ19BVE9NSUNfRVhUICYm
ICFCUjJfYXJjNzUwZCAmJiAhQlIyX2FyYzc3MGQKPiAgIAlkZXBlbmRzIG9uICFCUjJfUE9XRVJQ
Q19DUFVfSEFTX1NQRQo+IC0JZGVwZW5kcyBvbiBCUjJfUklTQ1ZfSVNBX1JWQSB8fCAhQlIyX3Jp
c2N2Cj4gKwkjIGdsaWJjIG5lZWRzIGF0b21pYyBpbnN0cnVjdGlvbnMsIGFuZCBkb2VzIG5vdCBz
dXBwb3J0Cj4gKwkjIHNpbmdsZS1wcmVjaXNpb24gZmxvYXRpbmcgcG9pbnQgQUJJcyAoaWxwMzJm
IGFuZCBscDY0ZikKPiArCWRlcGVuZHMgb24gKEJSMl9SSVNDVl9JU0FfUlZBICYmICFCUjJfUklT
Q1ZfQUJJX0lMUDMyRiAmJiAhQlIyX1JJU0NWX0FCSV9MUDY0RikgfHwgIUJSMl9yaXNjdgo+ICAg
CWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiAgIAo+ICAgY29uZmlnIEJSMl9QQUNLQUdFX0dMSUJD
X1NVUFBPUlRTCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
