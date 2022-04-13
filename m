Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489B4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 20:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC38560E40;
	Wed, 13 Apr 2022 20:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oc5f_jBo57sT; Wed, 13 Apr 2022 20:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2148B60E2C;
	Wed, 13 Apr 2022 20:45:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEEA21BF38D
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF17660E1D
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-ZqG_0eVaW6 for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 20:45:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EACC60B97
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 20:45:28 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-e2a00f2cc8so3273198fac.4
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 13:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j+TDsbXAmUtMealDpo/WKSWSHwrVHWwOTyaQ0YAH6SI=;
 b=bMagKqHzlaG09597E2ePaZ4cz79A37Wap/rKFOA7Eyi7KIo9W9p0Ti/wJBBLQ+IA1D
 sHd/nf8fxTDQ4bI1PqhptYVtFQblyGUq6ZmSuoI9n+xg3V1vXUspjRBbgQGT2l0PhZk3
 Ffsia1wGN0kMp9RbiSQMp9t4MXZioo2eTd5pIvxislW+LIyrD3GLzvHoj41I8nRwRVLc
 KhuAh9nEvA9s8FM21o0KRr+hsqVuzHv0izXIT3WKcyEdNWIwH+F1HWXlG4to3ZVxrWdI
 Ekpb0IEitJD6BhBikemrRGf5hhYm0wzTYME0fmUxDlya4Sel3DZx3tZdySOnWtBFMxyt
 X+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j+TDsbXAmUtMealDpo/WKSWSHwrVHWwOTyaQ0YAH6SI=;
 b=wT5A4Xz7mXDMAx48K608NbzTp/IcrExQVqVzf64/RXB8BeQmI9ootaMUO+kVzNqhXX
 OCKJ0sqxNMaocNwjIQ45EPD1orGJzqP/QhJIivWGanJrvbijwfMlJDsYmz6vDVwLs7Dv
 S7n3zGgiai+hJSeoX1/WISb+N40pIGxTG03vtYsqT5WQkWHxpUWskCEwQWccqIa/PNEv
 BTfriL4Gj4XCvDFNIvRRJEGCmOEdeh3UHpLYrRfC3XeCiQRGcnqq1B6Jwlob5KrfSBkK
 wvmU+ocfzIcleHfg1dtEF20ZPyerGyS6uWs87LNiGpPw/BzA4UNYlsfhofiVlTURS47T
 gKkg==
X-Gm-Message-State: AOAM530Fy2h110m/1GB1iTx3shvkSvEOj5EBE5+2iwp0RVYBjBBZTX5Y
 p/aEANnpFX/QTVK2GKVrTBn6P/Fbq5/zZv8rLxXnU9LBjQI=
X-Google-Smtp-Source: ABdhPJxEXnQ3rtkCLPICqEg96aHTUjVaWsiz4zbANRKBl251/YoRgJZtw/0p7kPrBvYt8FLzClqgVNmDSYzc6QfBAiA=
X-Received: by 2002:a05:6870:d28d:b0:da:b3f:3234 with SMTP id
 d13-20020a056870d28d00b000da0b3f3234mr15700oae.228.1649882726681; Wed, 13 Apr
 2022 13:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220413193216.891178-1-fontaine.fabrice@gmail.com>
 <20220413223407.7e71113f@windsurf>
In-Reply-To: <20220413223407.7e71113f@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 13 Apr 2022 22:43:27 +0200
Message-ID: <CAPi7W83vjfzR5J1q9_tKotNhzQZLVVHr0DwR_6OYcnJDS84Q8g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: disable on riscv
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiAxMyBhdnIuIDIwMjIgw6AgMjI6MzQsIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFdlZCwgMTMgQXByIDIwMjIg
MjE6MzI6MTYgKzAyMDAKPiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IHJpc2N2IGlzIG5vdCBzdXBwb3J0ZWQgc2luY2Ugc3dpdGNoIHRv
IGludGVybmFsIGJpbmQgcmVzdWx0aW5nIGluIHRoZQo+ID4gZm9sbG93aW5nIGJ1aWxkIGZhaWx1
cmUgc2luY2UgY29tbWl0Cj4gPiAwYzhkZDZlYmQ2NTZlMDZjZjk5YTYzZWI5MzM0MzcxNWY0ODUz
NTAzOgo+ID4KPiA+IEludmFsaWQgY29uZmlndXJhdGlvbiBgcmlzY3Y2NC1idWlsZHJvb3QtbGlu
dXgtbXVzbCc6IG1hY2hpbmUgYHJpc2N2NjQtYnVpbGRyb290JyBub3QgcmVjb2duaXplZAo+Cj4g
VGhpcyBzZWVtcyBvZGQuIFdoYXQgaW4gZGhjcCBpcyBhcmNoaXRlY3R1cmUtc3BlY2lmaWM/CgpO
b3RoaW5nIHRvIG15IGtub3dsZWRnZSwgYnV0IGJpbmQtOS4xMS4zNi9jb25maWcuc3ViIGV4dHJh
Y3RlZCBmcm9tCmJpbmQudGFyLmd6IGRvZXNuJ3QgY29udGFpbiBhbnkgbWVudGlvbiBvZiByaXNj
diByZXN1bHRpbmcgaW4gdGhlCmFib3ZlIGZhaWx1cmUuCgo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9t
YXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29t
CgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
