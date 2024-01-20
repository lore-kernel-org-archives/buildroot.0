Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5EDC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1964640253;
	Sat, 20 Jan 2024 17:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1964640253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8e3zKSUAyjg; Sat, 20 Jan 2024 17:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2480540A53;
	Sat, 20 Jan 2024 17:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2480540A53
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 079281BF31E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 17:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D41AF42169
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 17:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D41AF42169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IV5xDHVqWbnk for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 17:46:44 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B064B420F8
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 17:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B064B420F8
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50f11e3ba3aso2545148e87.1
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 09:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705772801; x=1706377601;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DMwmK1bHDKmqpt6hdwZy5D5v7Z3cmENSZQnph1ghUo0=;
 b=sUu6sxdpNQ3GbB7kd4KfKAkKtBI7cf0GiuZ9MmpoR3/DkUzgckC4dWOfyzsfJNI+KH
 ghNdNbxt8idsAeaJw14wtSIyvqfglHrK93tA2gGlbScvMN0T1tFqtdXyfNpFYHoWbSrb
 9x2R0mxFDDquy8CTxuYnanmoBNn0ZyNG1GJTXDZfsq5t8p1eS7BJxvS3KKUVc4+jGB0K
 dByjsFNwbMk9wClPBxOSehiDOK7W8ap8vWWu/onVuVoZWq+kolLQnjS73v0z7Zk6VQQo
 gXPTSoKpUb6u+BExHO0Ox5Y7wLXh3XYoc9LAlDRlagyHays9YKxdXLKo2Gh8NPgfq4Te
 vgvg==
X-Gm-Message-State: AOJu0YyA0KABo7ajPoMa6CxdgDT1crBWTPhTVIliPLYkSY/ek6dgkFOF
 gI7o6FM61oszYYdWxJ9pB82G5EdSytyIbg2p3gmL4wbhKJi5kn4Hnu+3lGjsHIJEWHz5DjEgBHb
 TxXBR83W21aWoaTOitoVQcti4GfrcZsMtf7s=
X-Google-Smtp-Source: AGHT+IHJ9JHCI6RcqYOYNOFBhmlT4LFB2NO6sE9k1iZXnhdQZw1idW44DtSmGCLCQpVxerjvXWjIL/aS2H0kWHjqi84=
X-Received: by 2002:a05:6512:1317:b0:50e:a6f8:aacf with SMTP id
 x23-20020a056512131700b0050ea6f8aacfmr796525lfu.14.1705772801278; Sat, 20 Jan
 2024 09:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20240120172839.763337-1-fontaine.fabrice@gmail.com>
 <faad09fc-7f14-42a9-8671-5882b55b39a2@vivier.eu>
In-Reply-To: <faad09fc-7f14-42a9-8671-5882b55b39a2@vivier.eu>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Jan 2024 18:46:29 +0100
Message-ID: <CAPi7W82=koh3t-qVCMt_J1W46AXeB25r7hDszxvsOZrQgyBWRw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705772801; x=1706377601; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DMwmK1bHDKmqpt6hdwZy5D5v7Z3cmENSZQnph1ghUo0=;
 b=g/K/SCvrsND8zgDpexY2TgtrEulx7erK9X1uwycBbvx+bYYOiApIUVDBzKw15YpYzv
 VUgBDFm7r4deqo0naz5xwDCPpLGMQThB/XOYbeD+FFw3pllbI7bocMEM5ga9DCbic+4L
 xXhycKNeNDlNd+74AC+lkIidBaqGpbrfUVQWEXipyRZCjxy0AMTzMU5a/5yx6pVtyc1d
 9QtYoKWIKhyzuwZxGRSkx8Sh3gqM7G2RMrFyhHORkweEEqnhxo4CO7QGffYLqhgEN2gd
 i2XhVHMAxC45nTW4ueCi0rAGOezon/FHNNS8IIe4Vwpk4TMcT0AlHLkw8KDMkkKaLchV
 +WdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g/K/SCvr
Subject: Re: [Buildroot] [PATCH 1/1] package/petitboot: fix NLS build
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

TGUgc2FtLiAyMCBqYW52LiAyMDI0IMOgIDE4OjM3LCBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2
aXZpZXIuZXU+IGEgw6ljcml0IDoKPgo+IExlIDIwLzAxLzIwMjQgw6AgMTg6MjgsIEZhYnJpY2Ug
Rm9udGFpbmUgYSDDqWNyaXQgOgo+ID4gRml4IHRoZSBmb2xsb3dpbmcgTkxTIGJ1aWxkIGZhaWx1
cmUgb24gbXVzbCByYWlzZWQgY29tbWl0Cj4gPiBiZjk1ODNhNTAyNzZmNTJlZGJjMzdkOWY4NWRm
NWYyY2M3ZmRiNWRjOgo+ID4KPiA+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2Ut
NC9vdXRwdXQtMS9ob3N0L2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LW11c2wvMTMu
Mi4wLy4uLy4uLy4uLy4uL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC1tdXNsL2Jpbi9sZDogZGlz
Y292ZXIvcGJfZGlzY292ZXItcGItZGlzY292ZXIubzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBz
eW1ib2wgJ2xpYmludGxfdGV4dGRvbWFpbicKPiA+Cj4gPiBGaXhlczoKPiA+ICAgLSBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy82ZDQ0MGQ5NmU4MTE2NzQwNDFiNWExZmRh
ZTk2ZDRjMzc3ODI0YzJhCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAgcGFja2FnZS9wZXRpdGJv
b3QvcGV0aXRib290Lm1rIHwgMTAgKysrKysrKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cGV0aXRib290L3BldGl0Ym9vdC5tayBiL3BhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5tawo+
ID4gaW5kZXggYzRlYjIwYjQ0ZC4uMjA4N2YwMWIwOSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uv
cGV0aXRib290L3BldGl0Ym9vdC5tawo+ID4gKysrIGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRi
b290Lm1rCj4gPiBAQCAtNywxMCArNywxOCBAQAo+ID4gICBQRVRJVEJPT1RfVkVSU0lPTiA9IDEu
MTQKPiA+ICAgUEVUSVRCT09UX1NPVVJDRSA9IHBldGl0Ym9vdC12JChQRVRJVEJPT1RfVkVSU0lP
TikudGFyLmd6Cj4gPiAgIFBFVElUQk9PVF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW4t
cG93ZXIvcGV0aXRib290L3JlbGVhc2VzL2Rvd25sb2FkL3YkKFBFVElUQk9PVF9WRVJTSU9OKQo+
ID4gLVBFVElUQk9PVF9ERVBFTkRFTkNJRVMgPSBlbGZ1dGlscyBuY3Vyc2VzIHVkZXYgaG9zdC1i
aXNvbiBob3N0LWZsZXggbHZtMgo+ID4gK1BFVElUQk9PVF9ERVBFTkRFTkNJRVMgPSBcCj4gPiAr
ICAgICBlbGZ1dGlscyBcCj4gPiArICAgICBuY3Vyc2VzIFwKPiA+ICsgICAgIHVkZXYgXAo+ID4g
KyAgICAgaG9zdC1iaXNvbiBcCj4gPiArICAgICBob3N0LWZsZXggXAo+ID4gKyAgICAgbHZtMiBc
Cj4gPiArICAgICAkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQo+ID4gICBQRVRJVEJPT1RfTElD
RU5TRSA9IEdQTC0yLjAKPiA+ICAgUEVUSVRCT09UX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4g
Pgo+ID4gK1BFVElUQk9PVF9DT05GX0VOViA9IExERkxBR1M9IiQoVEFSR0VUX0xERkxBR1MpICQo
VEFSR0VUX05MU19MSUJTKSIKPgo+IHNob3VsZCBpdCBiZQo+Cj4gUEVUSVRCT09UX0NPTkZfRU5W
ID0gTERGTEFHUz0iJChUQVJHRVRfTERGTEFHUykgTElCUz0kKFRBUkdFVF9OTFNfTElCUykKCk5v
LCBzZXR0aW5nIExJQlMgdG8gVEFSR0VUX05MU19MSUJTIHdpbGwgcmFpc2UgdGhlIGZvbGxvd2lu
ZyBidWlsZCBmYWlsdXJlOgoKICBHRU4gICAgICBkaXNjb3Zlci9ncnViMi9ncnViMi1wYXJzZXIu
cm8KL2hvbWUvZmFicmljZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL21pcHM2NGVsLWJ1aWxk
cm9vdC1saW51eC1tdXNsLWxkOgpjYW5ub3QgZmluZCAtbGludGw6IGZpbGUgZm9ybWF0IG5vdCBy
ZWNvZ25pemVkCgpJIGFzc3VtZSB0aGF0IHRoaXMgYnVpbGQgZmFpbHVyZSBpcyByYWlzZWQgYmVj
YXVzZSBwZXRpdGJvb3QgYWxzbwpidWlsZHMgaG9zdCB0b29scyBzdWNoIGFzIGdydWIyLXBhcnNl
ci5ybyB3aGljaCBjYW4ndCBmaW5kIGEgLWxpbnRsCmxpYnJhcnkgY29tcGF0aWJsZSB3aXRoIHRo
ZSBob3N0LgoKPgo+ID8KPgo+IFRoYW5rcywKPiBMYXVyZW50Cj4KPiA+ICAgUEVUSVRCT09UX0NP
TkZfT1BUUyA9IFwKPiA+ICAgICAgIC0tZW5hYmxlLWNyeXB0IFwKPiA+ICAgICAgIC0tZW5hYmxl
LXBsYXRmb3JtLWF1dG8gXAo+CgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
