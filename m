Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1280AC4706C
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 09:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C4861060;
	Tue, 16 Jan 2024 09:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91C4861060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPvYvjYT9PuT; Tue, 16 Jan 2024 09:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACFB61058;
	Tue, 16 Jan 2024 09:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DACFB61058
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E735E1BF2CB
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 09:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFB6661058
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 09:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFB6661058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_QcbVsITrPD for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 09:22:14 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED79861044
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 09:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED79861044
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e7b51b0ceso9678754e87.1
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 01:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705396932; x=1706001732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sAsUH8t6kTu0P6UTcSSG4fLcyIXFEYZ3ylwBZcbo7EE=;
 b=rLFoH4G6dUX96NORIPUBYt4qpGdM+2Mpghnzxu8bLVt9PX5RLmeErznG5bytWuSKJF
 PRDqnlbowr1cRaIVcfxAErU1daveSXZTZk4Ss4WarwqsHxfzcfZyJKRev+3lnFAEEenS
 kGjzr9dW767i0rtUvwKho7lPtZOucOqxTg71ETsCrjQ/1kiSPz+Zkw71PVzONf8WmUwS
 L0DGGWq7B5W0kWBc7ONfoaTtZ4NI1BH6Xy0N5PBrqzGFCjkRCbt2M465umLhuvq95f4S
 cCKG3xYSBixiHpbem418plBsGUPemSJT+R35ohnk0CchOt1lBqfyf2xtTuIOwpJgW+Ck
 03UA==
X-Gm-Message-State: AOJu0YzES0kh2DryHp4/yaQ+3lt+8Ti+JRO/80jFndPTcE+BNyie7IgH
 PKmGsLd9skF37GZBcSTfaKN/vM0Q/m56qaNxScA=
X-Google-Smtp-Source: AGHT+IEjeBsAfvnwOOmRxfPln+dbID1jG2d3AaCWW6r252r85xpB0zzQo9KNRGBpToEbVJDMHoDqoAYGTdV3dnhfVt0=
X-Received: by 2002:a05:6512:3dac:b0:50e:69d2:178b with SMTP id
 k44-20020a0565123dac00b0050e69d2178bmr4679350lfv.1.1705396931544; Tue, 16 Jan
 2024 01:22:11 -0800 (PST)
MIME-Version: 1.0
References: <20240115223952.2532111-1-petr.vorel@gmail.com>
In-Reply-To: <20240115223952.2532111-1-petr.vorel@gmail.com>
Date: Tue, 16 Jan 2024 10:22:00 +0100
Message-ID: <CAGm1_ktSSjXqUPRtt-_6rD_5jB6EFE5wJOjodXFjetBwcCcQAg@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1705396932; x=1706001732; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sAsUH8t6kTu0P6UTcSSG4fLcyIXFEYZ3ylwBZcbo7EE=;
 b=lgbvF55fOvuB3JfCKXEMWPTVpfKFw0xNsfGN/h5FaCu9MX2w0en8fW1xBEFOiKOsfi
 5yVePw32vHFMcVuOdAMG1TwuObtT1Xm3G/sXD0APNHX69l/opX5x1jNETeivm9q1sh02
 jYvAF21xZmJqJiyBOIEJJjSOzVOFL+m5nrzsSkxH9zjdBmUYuPOaKU0184WbnRftv/kg
 c/BcATRbqXmYrx+0hD/hbZRT+/pXrZpGWbewZlV52mrlFw4jY7IQ4dDycmyJ+xq3Sziv
 0kPDxpEVpWLdQKoUi4XWF+8Vd0EXc4P14zFCgHD1oyypKNxxcyOTZYxVPNQh/u77rCjv
 rSeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lgbvF55f
Subject: Re: [Buildroot] [PATCH 1/1] package/libqrtr-glib: bump version to
 1.2.2
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKYW4gMTUsIDIwMjQgYXQgMTE6MznigK9QTSBQZXRyIFZvcmVsIDxwZXRyLnZvcmVs
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBQcm9qZWN0IHN3aXRjaGVkIHRvIG1lc29uLgo+IFVzZSBn
aXRsYWIuZnJlZWRlc2t0b3Aub3JnIGZvciBkb3dubG9hZCAocHJldmlvdXMgVVJMIGRpZCBub3Qg
d29yayBmb3IKPiBtZXNvbiksIHRodXMgbW92aW5nIHRvIHRhci5neiBhcmNoaXZlLgo+Cj4gRGlz
YWJsZSBndGtkb2NpemUgKG5vdCBvbmx5IHRvIGZvbGxvdyBCdWlsZHJvb3QgYXBwcm9hY2gsIGJ1
dCBhbHNvIHRvIGF2b2lkCj4gYnVpbGQgZmFpbHVyZTogRVJST1I6IFByb2dyYW0gJ2d0a2RvYy1z
Y2FuJyBub3QgZm91bmQgb3Igbm90IGV4ZWN1dGFibGUpLgo+Cj4gTGljZW5zZSBmaWxlIGdvdCBy
ZW5hbWVkOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tb2JpbGUtYnJvYWRiYW5k
L2xpYnFydHItZ2xpYi8tL2NvbW1pdC85NzRlNDIzMWVhZjRhM2JmMDg3YzFkZjU0ZTc3ZGY4Y2Fj
OTM1ZTE1Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNv
bT4KClJldmlld2VkLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5j
b20+Cgo+IC0tLQo+IEhpLAo+Cj4gYnVpbGQgdGVzdGVkICh2ZXJ5IG1pbmltYWwgdGVzdGluZyk6
Cj4KPiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjUtdWNsaWJjIFsxLzZdOiBTS0lQ
UEVECj4gICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1hcm12Ny1nbGliYyBbMi82XTogT0sK
PiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1hcm12N20tdWNsaWJjIFszLzZdOiBTS0lQUEVE
Cj4gICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYtNjQtbXVzbCBbNC82XTogU0tJUFBF
RAo+ICAgICAgICAgICAgICAgICAgICAgICBici1hcm0tZnVsbC1zdGF0aWMgWzUvNl06IFNLSVBQ
RUQKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc291cmNlcnktYXJtIFs2LzZdOiBTS0lQ
UEVECj4gNiBidWlsZHMsIDUgc2tpcHBlZCwgMCBidWlsZCBmYWlsZWQsIDAgbGVnYWwtaW5mbyBm
YWlsZWQsIDAgc2hvdy1pbmZvIGZhaWxlZAo+Cj4gIHBhY2thZ2UvbGlicXJ0ci1nbGliL2xpYnFy
dHItZ2xpYi5oYXNoIHwgIDQgKystLQo+ICBwYWNrYWdlL2xpYnFydHItZ2xpYi9saWJxcnRyLWds
aWIubWsgICB8IDE2ICsrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlicXJ0
ci1nbGliL2xpYnFydHItZ2xpYi5oYXNoIGIvcGFja2FnZS9saWJxcnRyLWdsaWIvbGlicXJ0ci1n
bGliLmhhc2gKPiBpbmRleCBlMDBkZDBjYjk0Li4zODU0M2Y3ZGU5IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGlicXJ0ci1nbGliL2xpYnFydHItZ2xpYi5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJx
cnRyLWdsaWIvbGlicXJ0ci1nbGliLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBMb2NhbGx5
IGNvbXB1dGVkCj4gLXNoYTI1NiAgZGM2MjY1MjBkY2Q1M2EyMmY3MjdhZjNlZTQyYzc3MGU1NmM5
N2E2NGZlM2FkYjA2Mzc5OWQ4YWIwMzJmZTU1MSAgQ09QWUlORy5MSUIKPiAtc2hhMjU2ICAzMGQ4
NzliMmFkZTZmOGY0NjFkZWYzYTY3Nzc1NWRiNWMwMjM4YmFiZjY4OGQ1YzgzYzAzYjNlNmFiZTM1
Y2VlICBsaWJxcnRyLWdsaWItMS4wLjAudGFyLnh6Cj4gK3NoYTI1NiAgYzVjZGY1ZWE5MWNiZDJj
ZjI3NThiMjg5NjA2NGM3YjFkZmU3MTU2MDYzMjY3ZGY5MDVmOTU3YWM2OWI2Yjc2MyAgbGlicXJ0
ci1nbGliLTEuMi4yLnRhci5nego+ICtzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0
MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIExJQ0VOU0VTL0xHUEwtMi4x
LW9yLWxhdGVyLnR4dAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnFydHItZ2xpYi9saWJxcnRy
LWdsaWIubWsgYi9wYWNrYWdlL2xpYnFydHItZ2xpYi9saWJxcnRyLWdsaWIubWsKPiBpbmRleCA2
YWI4MzM1NDE3Li5jM2RmNzZkYzg0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlicXJ0ci1nbGli
L2xpYnFydHItZ2xpYi5tawo+ICsrKyBiL3BhY2thZ2UvbGlicXJ0ci1nbGliL2xpYnFydHItZ2xp
Yi5tawo+IEBAIC00LDE5ICs0LDIxIEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
Pgo+IC1MSUJRUlRSX0dMSUJfVkVSU0lPTiA9IDEuMC4wCj4gLUxJQlFSVFJfR0xJQl9TSVRFID0g
aHR0cDovL3d3dy5mcmVlZGVza3RvcC5vcmcvc29mdHdhcmUvbGlicW1pCj4gLUxJQlFSVFJfR0xJ
Ql9TT1VSQ0UgPSBsaWJxcnRyLWdsaWItJChMSUJRUlRSX0dMSUJfVkVSU0lPTikudGFyLnh6Cj4g
K0xJQlFSVFJfR0xJQl9WRVJTSU9OID0gMS4yLjIKPiArTElCUVJUUl9HTElCX1NJVEUgPSBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbW9iaWxlLWJyb2FkYmFuZC9saWJxcnRyLWdsaWIv
LS9hcmNoaXZlLyQoTElCUVJUUl9HTElCX1ZFUlNJT04pCj4gIExJQlFSVFJfR0xJQl9MSUNFTlNF
ID0gTEdQTC0yLjErCj4gLUxJQlFSVFJfR0xJQl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORy5MSUIK
PiArTElCUVJUUl9HTElCX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFUy9MR1BMLTIuMS1vci1sYXRl
ci50eHQKPiAgTElCUVJUUl9HTElCX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ICBMSUJRUlRSX0dM
SUJfREVQRU5ERU5DSUVTID0gbGliZ2xpYjIKPgo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX0dPQkpF
Q1RfSU5UUk9TUEVDVElPTikseSkKPiAtTElCUVJUUl9HTElCX0NPTkZfT1BUUyArPSAtLWVuYWJs
ZS1pbnRyb3NwZWN0aW9uCj4gK0xJQlFSVFJfR0xJQl9DT05GX09QVFMgKz0gLURpbnRyb3NwZWN0
aW9uPXRydWUKPiAgTElCUVJUUl9HTElCX0RFUEVOREVOQ0lFUyArPSBnb2JqZWN0LWludHJvc3Bl
Y3Rpb24KPiAgZWxzZQo+IC1MSUJRUlRSX0dMSUJfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1pbnRy
b3NwZWN0aW9uCj4gK0xJQlFSVFJfR0xJQl9DT05GX09QVFMgKz0gLURpbnRyb3NwZWN0aW9uPWZh
bHNlCj4gIGVuZGlmCj4KPiAtJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQo+ICsjIGRpc2Fi
bGUgZ3RrZG9jaXplCj4gK0xJQlFSVFJfR0xJQl9DT05GX09QVFMgKz0gLURndGtfZG9jPWZhbHNl
Cj4gKwo+ICskKGV2YWwgJChtZXNvbi1wYWNrYWdlKSkKPiAtLQo+IDIuNDMuMAo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
