Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308C0EEB570
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4ACB41869;
	Fri,  8 Sep 2023 20:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4ACB41869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VW6NcwmrLWjV; Fri,  8 Sep 2023 20:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3B6041800;
	Fri,  8 Sep 2023 20:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3B6041800
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D35421BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8CFE4180D
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8CFE4180D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wlaXcG-RcwFJ for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:58:37 +0000 (UTC)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87AFC41800
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87AFC41800
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-414b0bdea1cso15886341cf.1
 for <buildroot@buildroot.org>; Fri, 08 Sep 2023 13:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694206716; x=1694811516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vxzc0QWaMiG8XD5EGtgbE/pWtDWw6PDtj5KgWBvWLfw=;
 b=HC1S8fS3mKjAe0402wl0p7FDItgPRbAno9s7cMdAydgN2cgYeOBwOP1IiGIGHRDAxh
 vGMkfcOtNMw/QkRAbaKarajGw26yODx2ghQPJ+lQeGGJwmTCfQFkBSapvCnF4I9nkdgK
 4VM7PALfA446Bqf3nXIzY9XsNM9DgwwDMvI8v+o4fkCTTCrRaoIafTFanQ7cd24uAlEk
 9xtg1Z+Rg4wQx0GGBw8j9Zidi92Raf/cbEeZugmmpssf+zFdYdo1mPd5mN/LeAEpdtCM
 EDFvIDKDlE/smi7O0/QAYY9pARN93k2GAaCNk4KHjS/NxUJk+KPbz0lgxMV4s25gW7lH
 +y6g==
X-Gm-Message-State: AOJu0YwkqF+bgsr/gnLQZr81zlLOhKVeX1iDjx+JtYBvLuJhUcBUemLO
 t8i4dJ1PUuI/luE6tXmMKqL7Nal7jL/FY/2aiSo=
X-Google-Smtp-Source: AGHT+IE1vhEt14iM9e/CLnhsSrfkptxuKOAG8G9p4JTptLEaFBucDIaD5yNAZkuz37A+ugxkMtkdIAD1NGbd5vt6wjE=
X-Received: by 2002:ac8:5802:0:b0:412:fa6:56f8 with SMTP id
 g2-20020ac85802000000b004120fa656f8mr4408239qtg.12.1694206715850; Fri, 08 Sep
 2023 13:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230908192714.2716398-1-james.hilliard1@gmail.com>
 <20230908214620.0d515173@windsurf>
In-Reply-To: <20230908214620.0d515173@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 8 Sep 2023 14:58:23 -0600
Message-ID: <CADvTj4qEN2LesjKx3Ct20xgETaVUpzoVSMfG+3Y+FVF601X05w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694206716; x=1694811516; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vxzc0QWaMiG8XD5EGtgbE/pWtDWw6PDtj5KgWBvWLfw=;
 b=meKGFIE9/HJ1mP2MA3MLjshUp3i0iszUfx/NurkNUab0Hih5vi0Gac+g6QG9KGj0ma
 7dQfCYlp+hYH00dKuVxjCh/2IllvPRWJ71UyvD66U9pUzfs8Et/i00YXyR/TOZKyqDMS
 lagR7hk8VPK0SNhuvp9S2Ax/Rav9mkJYz2S8Zy20mvjnIwIKTVlhA5tyhwV/fbIPrwJF
 d6odd266MZDUnd7u8pKbgzhag9nX/lfmndTes54hNZnzvSaksqhZkDODXpz1WiPxGPr8
 c6iuELIsJUBJXcHq0ZuHeAw2Ofr0YNB7r/sqRRbh3yKYWofO51Z1hencYVtJzuPWapSu
 DdcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=meKGFIE9
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.18.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBTZXAgOCwgMjAyMyBhdCAxOjQ24oCvUE0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksICA4IFNlcCAyMDIzIDEz
OjI3OjE0IC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gPiAtQ09HX1ZFUlNJT04gPSAwLjE2LjEKPiA+ICtDT0dfVkVSU0lPTiA9IDAu
MTguMAo+ID4gIENPR19TSVRFID0gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2VzCj4gPiAg
Q09HX1NPVVJDRSA9IGNvZy0kKENPR19WRVJTSU9OKS50YXIueHoKPiA+ICBDT0dfSU5TVEFMTF9T
VEFHSU5HID0gWUVTCj4gPiBAQCAtMTUsNyArMTUsNyBAQCBDT0dfQ09ORl9PUFRTID0gXAo+ID4g
ICAgICAgLURkb2N1bWVudGF0aW9uPWZhbHNlIFwKPiA+ICAgICAgIC1EbWFucGFnZXM9ZmFsc2Ug
XAo+ID4gICAgICAgLURwcm9ncmFtcz10cnVlIFwKPiA+IC0gICAgIC1Ec291cDI9ZW5hYmxlZCBc
Cj4KPiBTaG91bGRuJ3QgdGhpcyBoYXZlIGJlZW4gY2hhbmdlZCB0byAtRHNvdXAyPWRpc2FibGVk
IGFzIHBhcnQgb2YgY29tbWl0Cj4gZGZmNjcxNzBmNzM5NTllNjgyNmVjM2U4N2U4OTI3NDdmOGQz
YTVmYiwgd2hpY2ggY2hhbmdlZCB3cGV3ZWJraXQgdG8KPiB1c2UgbGlic291cDMgaW5zdGVhZCBv
ZiBsaWJzb3VwMiA/CgpUaGVyZSB3ZXJlIGJ1aWxkIGVycm9ycywgdGhlIHZlcnNpb24gYnVtcCBz
ZWVtcyB0byBiZSByZXF1aXJlZCB0byB1c2UgbGlic291cDMuCgo+Cj4gSSB0aGluayBpdCBtYWtl
cyBzZW5zZSB0byBoYXZlIHRoaXMgc2VwYXJhdGUgZnJvbSB0aGUgY29nIHZlcnNpb24gYnVtcC4K
Pgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9v
dGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5n
Cj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
