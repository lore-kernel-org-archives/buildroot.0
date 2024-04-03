Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC308CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9243041841;
	Wed,  3 Apr 2024 21:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xqt_uFF3cTYl; Wed,  3 Apr 2024 21:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FD82418A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FD82418A3;
	Wed,  3 Apr 2024 21:00:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B36FE1BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0C816082B
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSFjZwKZ_FmC for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F3906080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F3906080B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F3906080B
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:00:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-34372e3db28so129697f8f.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 14:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712178033; x=1712782833;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WqZ0PJmJ2RlaDnE/5Bm/RV3i7L/cOBbJEWujELTQic8=;
 b=wAJU0taTG49z9ZDD9A2D2aqN4w4cieSK0405Hl7SXc3z+zpSOJ1pQJlqYM6tR6ygwN
 OnHhONmpEIm8rKpiq346FOLgXDh/F5sbgX91r2RIj3gY6BGjOtYTe3WmYA6ZxgAngTW4
 gCzFMMsL6j2zC6vp8nGqEB/qS9zUuE0u8oKv0Abmt8hxGbrZoKQhBMEJ7ZHrDCqndBNV
 SX5QZhbamP4XnpPwed8N9mlak6xNEbnhCGD9KKRWTCZMYh5fVxJ8/XFQcc3jq7SMvi/A
 8Sgxr5DNPxpqyy3Gs2jpVhfppbopWGvg5KOD3AxdxiRWDdBpCIvQRcJNSvrMpTRMDIpf
 umAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCVnR2e8ORL8mD6/gIEpBEzULUq1o8JYH8DhcFhtWDlR5FDCjWyxdqFfZb8cwHrkDdIJsMXvw5/xeYq7KDHL9hF1pkh6rpQw==
X-Gm-Message-State: AOJu0Yw/Rjw7hT5wXaQdm7mONepawHpmt144UhBhgRfAU1q/MFm/zyTQ
 3DkB1sCZboS8YA2WqF2URfcEKhT06zL5Xratv7DtcugtO3QsuP9AZ0wCNY538jWqeTFaEvX8Tfk
 g
X-Google-Smtp-Source: AGHT+IGgkUbZW37APwSNgNTXBTNbme7gtHCvf2msH5PX0G19fLRxbIVfuYKwHxAwClRqU2+VzY/ZIw==
X-Received: by 2002:a5d:6803:0:b0:343:59bd:113d with SMTP id
 w3-20020a5d6803000000b0034359bd113dmr390293wru.51.1712178033231; 
 Wed, 03 Apr 2024 14:00:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 dj11-20020a0560000b0b00b003437799a373sm4664631wrb.83.2024.04.03.14.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 14:00:32 -0700 (PDT)
Message-ID: <852e9efc-67d6-4519-bcf4-1eba73cfaff4@mind.be>
Date: Wed, 3 Apr 2024 23:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Boerge Struempfel <boerge.struempfel@gmail.com>
References: <20240123155829.387063-1-bstruempfel@ultratronik.de>
 <20240123155829.387063-3-bstruempfel@ultratronik.de>
Content-Language: en-GB
In-Reply-To: <20240123155829.387063-3-bstruempfel@ultratronik.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712178033; x=1712782833; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WqZ0PJmJ2RlaDnE/5Bm/RV3i7L/cOBbJEWujELTQic8=;
 b=Ol9f/g4kRj709f4E+hg2q3QJMVxSJnk0YMyntJS4zeLF4DhEBDnCkHbMcf/tU5Idev
 DajQ1409ubvINDDFE68SrFACK/jWVs8BDTjok9QUfztURl+9aX7Ryih3lcjUl7g5GLO5
 KlYzB881ybkLkMH8+TBITd9dYs/7HbSfXx+24llAbhnRG7I8p/3aw+NtHEauHIcRQ30V
 JiUGooUd1UlU0ilVx1n3fnlhhesGN6nawwsG0UnOcN9aXDVrs0VWD19VVks0miURVXr+
 2LWKnzcGniaVKbXA40nLnERUPz+xIj7im2K1GfUXJAQEN3jn6+jnLNmCTbma/YtlNdp9
 vZeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ol9f/g4k
Subject: Re: [Buildroot] [PATCH v4 2/2] package/swupdate: Add compatibility
 to libgpiod2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: vfazio@xes-inc.com, bonet@grenoble.cnrs.fr, bstruempfel@ultratronik.de,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAxLzIwMjQgMTY6NTgsIEJvZXJnZSBTdHJ1ZW1wZmVsIHdyb3RlOgo+IEZyb206IEJv
ZXJnZSBTdHJ1ZW1wZmVsIDxib2VyZ2Uuc3RydWVtcGZlbEBnbWFpbC5jb20+Cj4KPiBTaWduZWQt
b2ZmLWJ5OiBCb2VyZ2UgU3RydWVtcGZlbCA8YnN0cnVlbXBmZWxAdWx0cmF0cm9uaWsuZGU+Cgog
wqBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+IC0t
LQo+ICAgcGFja2FnZS9zd3VwZGF0ZS9Db25maWcuaW4gICB8IDQgKystLQo+ICAgcGFja2FnZS9z
d3VwZGF0ZS9zd3VwZGF0ZS5tayB8IDUgKysrKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3d1cGRh
dGUvQ29uZmlnLmluIGIvcGFja2FnZS9zd3VwZGF0ZS9Db25maWcuaW4KPiBpbmRleCBiYTNmNmEw
YzBmLi4zNzA4ZGYwODgxIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3d1cGRhdGUvQ29uZmlnLmlu
Cj4gKysrIGIvcGFja2FnZS9zd3VwZGF0ZS9Db25maWcuaW4KPiBAQCAtMzcsOCArMzcsOCBAQCBj
b25maWcgQlIyX1BBQ0tBR0VfU1dVUERBVEUKPiAgIAkgICAgcmVtb3RlIGhhbmRsZXIuCj4gICAJ
ICAqIFNlbGVjdCBCUjJfUEFDS0FHRV9MSUJSU1lOQyB0byBhZGQgc3VwcG9ydCBmb3IgdXNpbmcK
PiAgIAkgICAgcmRpZmYgaGFuZGxlci4KPiAtCSAgKiBTZWxlY3QgQlIyX1BBQ0tBR0VfTElCR1BJ
T0QgdG8gYWRkIHN1cHBvcnQgZm9yCj4gLQkgICAgbWljcm9jb250cm9sbGVyIGZpcm13YXJlIHVw
ZGF0ZS4KPiArCSAgKiBTZWxlY3QgQlIyX1BBQ0tBR0VfTElCR1BJT0Qgb3IgQlIyX1BBQ0tBR0Vf
TElCR1BJT0QyIHRvIGFkZAo+ICsJICAgIHN1cHBvcnQgZm9yIG1pY3JvY29udHJvbGxlciBmaXJt
d2FyZSB1cGRhdGUuCj4gICAJICAqIFNlbGVjdCBCUjJfUEFDS0FHRV9FRklCT09UTUdSIHRvIGFk
ZCBzdXBwb3J0IGZvciBFRkkgQm9vdAo+ICAgCSAgICBHdWFyZC4KPiAgIAkgICogU2VsZWN0IEJS
Ml9QQUNLQUdFX0xJQkNVUkwsIEJSMl9QQUNLQUdFX0xJQldFQlNPQ0tFVFMsCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvc3d1cGRhdGUvc3d1cGRhdGUubWsgYi9wYWNrYWdlL3N3dXBkYXRlL3N3dXBk
YXRlLm1rCj4gaW5kZXggY2E4YzE0MDg4Ni4uYTJiMDk5NTIyNyAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL3N3dXBkYXRlL3N3dXBkYXRlLm1rCj4gKysrIGIvcGFja2FnZS9zd3VwZGF0ZS9zd3VwZGF0
ZS5tawo+IEBAIC03Miw3ICs3MiwxMCBAQCBlbHNlCj4gICBTV1VQREFURV9NQUtFX0VOViArPSBI
QVZFX0xJQkZESVNLPW4KPiAgIGVuZGlmCj4gICAKPiAtaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJH
UElPRCkseSkKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJHUElPRDIpLHkpCj4gK1NXVVBEQVRF
X0RFUEVOREVOQ0lFUyArPSBsaWJncGlvZDIKPiArU1dVUERBVEVfTUFLRV9FTlYgKz0gSEFWRV9M
SUJHUElPRD15Cj4gK2Vsc2UgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJHUElPRCkseSkKPiAgIFNX
VVBEQVRFX0RFUEVOREVOQ0lFUyArPSBsaWJncGlvZAo+ICAgU1dVUERBVEVfTUFLRV9FTlYgKz0g
SEFWRV9MSUJHUElPRD15Cj4gICBlbHNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
