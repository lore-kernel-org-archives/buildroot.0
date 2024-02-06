Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC91EC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 685F7611C5;
	Tue,  6 Feb 2024 16:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 685F7611C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oc8ghrwUFxyY; Tue,  6 Feb 2024 16:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7495D612B6;
	Tue,  6 Feb 2024 16:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7495D612B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1EF1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62DE6415A3
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62DE6415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjxI9Ph4BqAi for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:26:23 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A56E400E7
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A56E400E7
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40fe2744e5cso5044785e9.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 08:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707236781; x=1707841581;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rYgKIs8X4TmGHFBS9aVCvFlFIQMHFqyIEMK23VO2Yeg=;
 b=U+qQu/U9R3KtrVTXMpomVYxTQzKjx2VrF2eWgy7obv6gv0ZHHz5EcpwEEJjCJVXxFV
 Q/KoHjLo//19Uo+V6x3D0lC2Q69/WCsIxAYx5eC9224ST8d6uEO0AYMDZZBgKtonL7Ik
 6/kgtyERryhExOPMGorv8jtSIn05/LVvG9D4XmzxxvRO+YQ+IPYauyJeMhByVUJAa/ou
 Q7y4QS2LTBTuYPJXJ4i4UZuO3LUiXd5H8g3Ld1ZHgDtacZHVOHwrPTqAwLfgsel/G0sL
 JG/6zYpsfEhNRrEMsEMEmE8GNnoCLOhcqR7Sk+tqrNKyisUCI8yqmDKTmcJdDQ5fcwA0
 y2/w==
X-Gm-Message-State: AOJu0YzdCs1d+eYpxnxkilaMaGgfnLx5Dn+kRdt0NEpKO5sUJSww+0ji
 XtDMtD4jYGHnOkL6gBBiIJaSldLGWKuOKnA8er5IWiV9HHxfiL3YwACRSgOY3k0=
X-Google-Smtp-Source: AGHT+IFLZaG+X50NNIPsN+bJJ9kr8Aj3awSL+IKZ63tilbnl0qiKrBuX20toAd56uhFLM9ZPkJr/6A==
X-Received: by 2002:a05:600c:358d:b0:40f:d31a:66c8 with SMTP id
 p13-20020a05600c358d00b0040fd31a66c8mr7604938wmq.17.1707236781094; 
 Tue, 06 Feb 2024 08:26:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXNmHlubipoNCBRrcHsrBis9mEeqCcmA1gOifJM88DeaWhEKZehKJLk1AUEoXBaTmVOE9iIeThNgN0c5jrof+/Lhn/WNCm98Q==
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c3b8300b0040ef95e1c78sm2579926wms.3.2024.02.06.08.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 08:26:20 -0800 (PST)
Message-ID: <a5094bfe-bdb7-4b21-8c0a-5b5dc7984d15@smile.fr>
Date: Tue, 6 Feb 2024 17:26:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: Joseph Burt <caseorum@gmail.com>, buildroot@buildroot.org
References: <20230112075509.2200-1-caseorum@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230112075509.2200-1-caseorum@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707236781; x=1707841581;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rYgKIs8X4TmGHFBS9aVCvFlFIQMHFqyIEMK23VO2Yeg=;
 b=gu8joXr1SRt42EKm3Em9dGWuZOIcDWkbcbgn8czdLpFnoXey1cNojKz1BSuFTtlkiW
 HKkjVqunA/YMrXlSEf66+gVvxEIzeMniYap8lVjFZUh9euIqkQkUPBCcH5IUwtxG0/Nb
 Wdc+WSfbE8b0zDKYlWm+wFTXRJZ1dcM0V6AaMphZHng7Du3f6OgJLcdkjtgqdzEbfKF5
 ugkADxIu6AGCgmzXuKbvc/owswb1hjMyiXBN3D3YU2Ubm7UJ2KpO2rF00DfT7Uv/PTgv
 asBmU5X1lotXraGZOcYeFkMX3mmyPb9kqMSRnSS/PYmNYCJIDEUqLE7OnvwyL+hhkjxp
 Yq8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=gu8joXr1
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: reenable Qemu user-land
 emulation for musl toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxMi8wMS8yMDIzIMOgIDA4OjU1LCBKb3NlcGggQnVydCBhIMOpY3JpdMKgOgo+
IENvbXBhdGlibGUgInN0cnVjdCBzaWdldmVudCIgYWRkZWQgdXBzdHJlYW0gaW4gbXVzbCAxLjIu
MiBbMV0uCj4gCj4gWzFdIGh0dHBzOi8vZ2l0Lm11c2wtbGliYy5vcmcvY2dpdC9tdXNsL2NvbW1p
dC8/aWQ9N2M3MTc5MmU4NzY5MTQ1MWYyYTZiNzYzNDhlODNhZDE4ODlmMWRjYgoKT2sgYnV0IGl0
IHdvdWxkIGZhaWwgd2l0aCBleGlzdGluZyAob2xkKSBwcmVidWlsdCBtdXNsIHRvb2xjaGFpbnMu
CklzIG11c2wgMS4yLjIgb2xkIGVub3VnaD8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKb3NlcGggQnVydCA8Y2FzZW9ydW1AZ21haWwuY29tPgo+IC0tLQo+ICBw
YWNrYWdlL3FlbXUvQ29uZmlnLmluIHwgNSAtLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L0NvbmZpZy5pbiBiL3BhY2th
Z2UvcWVtdS9Db25maWcuaW4KPiBpbmRleCAxNTRiOThhNTQxLi5kODE4YmViYjM0IDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvcWVtdS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3FlbXUvQ29uZmln
LmluCj4gQEAgLTEwMiwxNiArMTAyLDExIEBAIGNvbW1lbnQgInN5c3RlbXMgZW11bGF0aW9uIG5l
ZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSIKPiAgCj4gIGNvbmZpZyBCUjJfUEFD
S0FHRV9RRU1VX0xJTlVYX1VTRVIKPiAgCWJvb2wgIkVuYWJsZSBMaW51eCB1c2VyLWxhbmQgZW11
bGF0aW9uIgo+IC0JIyBJbmNvbXBhdGlibGUgInN0cnVjdCBzaWdldmVudCIgZGVmaW5pdGlvbiBv
biBtdXNsCj4gLQlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfTVVTTAo+ICAJaGVscAo+
ICAJICBTYXkgJ3knIHRvIGJ1aWxkIExpbnV4IHVzZXItbGFuZCBlbXVsYXRvcnMuCj4gIAo+ICAj
IE5vdGU6IGJzZC11c2VyIGNhbiBub3QgYmUgYnVpbGQgb24gTGludXgKPiAgCj4gLWNvbW1lbnQg
IkxpbnV4IHVzZXItbGFuZCBlbXVsYXRpb24gbmVlZHMgYSBnbGliYyBvciB1Q2xpYmMgdG9vbGNo
YWluIgo+IC0JZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX1VTRVNfTVVTTAo+IC0KPiAgY29uZmln
IEJSMl9QQUNLQUdFX1FFTVVfQ0hPT1NFX1RBUkdFVFMKPiAgCWJvb2wgIlNlbGVjdCBpbmRpdmlk
dWFsIGVtdWxhdG9yIHRhcmdldHMiCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1FFTVVfU1lT
VEVNIHx8IEJSMl9QQUNLQUdFX1FFTVVfTElOVVhfVVNFUgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
