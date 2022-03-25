Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AB6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 10:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F344D403E7;
	Fri, 25 Mar 2022 10:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMGXcYuGcD2M; Fri, 25 Mar 2022 10:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9CFD4035D;
	Fri, 25 Mar 2022 10:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3CFF1BF2E4
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 10:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B20F860B73
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 10:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8AffDEGW1x3A for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 10:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4CF760AD7
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 10:17:13 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a17so8660947edm.9
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 03:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bsXCLU4UvTVF2S+ML+8XY12Yi3QCDDpvvxLMHMLe/KU=;
 b=lO+8pHVv/fGdyZLHET6TdxEV5bSz7/tuVMgPi7If/GrrLWLv4+XNCqy9p5+HyB5npQ
 dNSRxRWHsyqkbNpKppdTJH70Y3kdwd8T0s/R338MwUpGz78/QXxZC2oP58Tb44xSrcxe
 MhQ4koFw4aIKGIkRQHjeJ0ilZCwT/0o3tMaZMKMoakZ6lTppDAIRHg6oBBnH1LImeMAr
 OfzQOI90D2QSIO1+b18dmXPBRL0Iyyg9NL3qdfE5MybxGbGUbGV6nyvRlGEgZpalE334
 nmFn4lr4f09zHqmNBLBmV8vqcArC/YiA7YNX3JKhUZc7ziJbSjU7kg8UAKzUtVz/TeNw
 j0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bsXCLU4UvTVF2S+ML+8XY12Yi3QCDDpvvxLMHMLe/KU=;
 b=Q0HJUIkncIG7qcChmdzX61h4epw8cwcteeJiYpMtB6qpoNF7pmJ5tTacZVRXz6qNMd
 tmfYnEys7cGx13WvHyU+ja5l2e8FE0FBPD7aTG6kAi6WPjBXLeXJVSpe6ZKKU6D8yYIs
 0vMj1XVlzga+pV9/Ow0Rz4Z7yoB95QNLq4PWT52OOeiRsuTEr+9SJyRSFe1s+rJfQinx
 6Zd+df4ZxPwlf2xxfaJKPMbPu4ZpAmZoa/3siP9nX1k1Hm6AquyljaE/omeCowSdtcyg
 xQA0SMH3EWFAY6J7jgO4JPhpiRF7xbU0VG37caQd6aPTNb1e2gg22KHr4exvxUvZmWQe
 F6iQ==
X-Gm-Message-State: AOAM532ysYyFt2LAbUPCFmA7Ub79coUbBpPRK4NXaxyil+P5U4gj1m0K
 vo7TD8XTaPTZ+PsgRtaSdjEftOLqb+bRBY2f1mrePA==
X-Google-Smtp-Source: ABdhPJy/I2rXcho8h3qMcbc7zHLG+IXa9GdVzhN+RDFAAhJ/Ozv4cZQ5hG2V9uACMyD2JtOKLjQOLVEGMYOTaB3RZP4=
X-Received: by 2002:a05:6402:cac:b0:410:a920:4e90 with SMTP id
 cn12-20020a0564020cac00b00410a9204e90mr12187180edb.60.1648203431790; Fri, 25
 Mar 2022 03:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220319094939.1588302-1-yann.morin.1998@free.fr>
In-Reply-To: <20220319094939.1588302-1-yann.morin.1998@free.fr>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 25 Mar 2022 11:17:00 +0100
Message-ID: <CAN5uoS8U23D3SkWSEqQDKanf5ESfDzs9CFyJFtRO2mvTK1xp1g@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] boot/optee-os: fix version choice
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
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCk9uIFNhdCwgMTkgTWFyIDIwMjIgYXQgMTA6NDksIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IENvbW1pdCBjNWQ0NDFiN2YyZWUg
KGJvb3Qvb3B0ZWUtb3M6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjApIGZvcmdvdCB0bwo+IHByb3Bh
Z2F0ZSB0aGUgcnVzdGMgYXJjaCBkZXBlbmRlbmN5IGZyb20gdGhlIG5ldyB2ZXJzaW9uLCB0byB0
aGUgZGVmYXVsdAo+IGNsYXVzZSBvZiB0aGUgY2hvaWNlLgo+Cj4gVGhpcyBsZWF2ZXMgb25seSB0
aGUgY3VzdG9tIGdpdCB0cmVlIGFzIGEgcG9zaWJsZSBzb3VyY2UgZm9yIGJ1aWxkaW5nCgpuaXQ6
IHMvcG9zaWJsZS9wb3NzaWJsZS8KCj4gT1AtVEVFIE9TIGluIGNhc2UgdGhlIGhvc3QgY2FuJ3Qg
aGF2ZSBhIHJ1c3RjIGNvbXBpbGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gUmVwb3J0ZWQtYnk6IFRob21hcyBQZXRhenpvbmkg
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gQ2M6IENsw6ltZW50IEzDqWdlciA8Y2xl
bWVudC5sZWdlckBib290bGluLmNvbT4KPiBDYzogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5j
YXJyaWVyZUBsaW5hcm8ub3JnPgo+IC0tLQo+ICBib290L29wdGVlLW9zL0NvbmZpZy5pbiB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZp
Zy5pbgo+IGluZGV4IDE4ZTFlZmVlNTUuLjMwYjZmNjI0MzQgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9v
cHRlZS1vcy9Db25maWcuaW4KPiArKysgYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+IEBAIC0x
Myw3ICsxMyw3IEBAIGlmIEJSMl9UQVJHRVRfT1BURUVfT1MKPgo+ICBjaG9pY2UKPiAgICAgICAg
IHByb21wdCAiT1AtVEVFIE9TIHZlcnNpb24iCj4gLSAgICAgICBkZWZhdWx0IEJSMl9UQVJHRVRf
T1BURUVfT1NfTEFURVNUCj4gKyAgICAgICBkZWZhdWx0IEJSMl9UQVJHRVRfT1BURUVfT1NfTEFU
RVNUIGlmIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfQVJDSF9TVVBQT1JUUwo+ICAgICAgICAgaGVs
cAo+ICAgICAgICAgICBTZWxlY3QgdGhlIHZlcnNpb24gb2YgT1AtVEVFIE9TIHlvdSB3YW50IHRv
IHVzZQoKTEdUTS4KQWNrZWQtYnk6IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUuY2FycmllcmVA
bGluYXJvLm9yZz4KCmJyLApldGllbm5lCgo+Cj4gLS0KPiAyLjI1LjEKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
