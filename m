Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E1EC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 23:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B6C66FA21;
	Fri,  8 Dec 2023 23:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B6C66FA21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2CM-lEcUIbCn; Fri,  8 Dec 2023 23:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D48536F6A0;
	Fri,  8 Dec 2023 23:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D48536F6A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06F2E1BF5D7
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 23:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0BEC42666
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 23:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0BEC42666
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ciW98e_fvg66 for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 23:04:59 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E8B442662
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 23:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E8B442662
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50bfd7be487so2976838e87.0
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 15:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702076697; x=1702681497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skawpneefh3+VWZHgXyhXNMjiRhMVogQMEfpKdolfrU=;
 b=bY+IGeyvgdR5hZwhotcDKhKM99egv5lJVYJitD+X+/P4RTpyDYtfNlZfAR3UkrveHt
 pyWmUeijbE6DtHyyr3Mg7wlKvrRejSHz3pbcTQGSoCGV+SFvsMsjldr8H4GKXpwHtfRo
 aDQr/uEim8Oyh6IIXYLCLWHq6XcNe6vd4PU7oP3WQj8dpVyqJtwTAudTj8jPozuQ1hmt
 yV0TvKo+u7NrDuZyI4naFeAtqAdMOi4nB8r2mczoRxs921gv2fi4ozPwt/kHcMVbP+xQ
 +TJAj1UHeT2lEkpfIMpALt58PGsRfQgduLnt7+eeS7YOFQYW5nYBoij4O9xSHcN4Co86
 pHmw==
X-Gm-Message-State: AOJu0Yz9VOA39nQoBAckXo9d3JcTlZeksQFHlY15JQVInqxm76SdxnG0
 jgZU+DtfJn79QbxxRQ/Bwd+KsXH1XJ9qOcjwHNo=
X-Google-Smtp-Source: AGHT+IEZdxJiScYjkT+Oj+c1zl+20Xn4aNIVNJ1lbJH0KMR+VRzvaMrp/zWpCCZE7UWFKBmhv4pcRqEpYF4lRcDRMg4=
X-Received: by 2002:a19:914f:0:b0:50b:ed85:a26e with SMTP id
 y15-20020a19914f000000b0050bed85a26emr233978lfj.48.1702076697037; Fri, 08 Dec
 2023 15:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20231207220930.1356097-1-fontaine.fabrice@gmail.com>
 <ZXOehwwVDyiGPpRf@landeda>
In-Reply-To: <ZXOehwwVDyiGPpRf@landeda>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 9 Dec 2023 00:04:44 +0100
Message-ID: <CAPi7W838vzhK48R5GduRL660bWQnS1WGTPsDmnx+gsj3HfVX3w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702076697; x=1702681497; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=skawpneefh3+VWZHgXyhXNMjiRhMVogQMEfpKdolfrU=;
 b=az5cR4yQ+KdXxdXnokkfmhns2r1891I0GWbDAkRI70k1oZxzCbK6QcLuVSZSUyqOJJ
 tlbsX5Kvp59U6aHWUBpHOFlLMlIJib6c05oqHYj4zNT6S375P0LGhdcPv70aRyNyvd3t
 HrsP+6htIG5x4C8gsNBzneZGWcH4x5IeYJ/Pjz/uC9qaPq9riHbWsFuKxucZCvTufgrq
 J6gKynEwFWAkftuunqFdyH0Gq5KYN8nEvz/VrQWjP8OLGJTarei2a/AgAhpsOmm7jg9L
 wRycLPN9yrenYLyDiaLRCfF5DebZdgCD+sf2IOaApKkwDJ6UyjOkiNiilBKGhvdxYk4X
 mwPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=az5cR4yQ
Subject: Re: [Buildroot] [PATCH 1/1] package/memtest86: pass TARGET_CC
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
Cc: Steve Kenton <skenton@ou.edu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgdmVuLiA4IGTDqWMuIDIwMjMgw6AgMjM6NTQsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBPbiAyMDIzLTEyLTA3IDIzOjA5ICswMTAwLCBG
YWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiA+IFBhc3MgQ0M9JChUQVJHRVRfQ0MpIHRv
IG1ha2UgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZAo+ID4gc2lu
Y2UgYnVtcCB0byB2ZXJzaW9uIDYuMjAgaW4gY29tbWl0Cj4gPiBhNzQzMDg3NTkzYTVmZDViMzNl
MjY1MDU5MWNhZGEwOTkyOWMyN2E2Ogo+ID4KPiA+IGdjYyAtbTMyIC14IGFzc2VtYmxlci13aXRo
LWNwcCAtYyAtSS4uL2Jvb3QgLW8gYm9vdC9zdGFydHVwLm8gLi4vYm9vdC9zdGFydHVwMzIuUwo+
ID4gZ2NjOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBvcHRpb24gJy1tMzInCj4g
Pgo+ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0
cy8xNWVjZTE5NzAzYmIyMWMxMzI2ZmYzNTNhYTc5ZjM1NTBhMDFmNjQ4Cj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICBwYWNrYWdlL21lbXRlc3Q4Ni9tZW10ZXN0ODYubWsgfCAzICsrLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9tZW10ZXN0ODYvbWVtdGVzdDg2Lm1rIGIvcGFja2FnZS9tZW10ZXN0
ODYvbWVtdGVzdDg2Lm1rCj4gPiBpbmRleCBjMGY4NTc1NWZlLi41MWQ1ODA1ZTBhIDEwMDY0NAo+
ID4gLS0tIGEvcGFja2FnZS9tZW10ZXN0ODYvbWVtdGVzdDg2Lm1rCj4gPiArKysgYi9wYWNrYWdl
L21lbXRlc3Q4Ni9tZW10ZXN0ODYubWsKPiA+IEBAIC0yMCw3ICsyMCw4IEBAIGVuZGlmCj4gPiAg
ZW5kaWYKPiA+Cj4gPiAgZGVmaW5lIE1FTVRFU1Q4Nl9CVUlMRF9DTURTCj4gPiAtICAgICAkKFRB
UkdFVF9DT05GSUdVUkVfT1BUUykgJChNQUtFKSAtQyAkKEBEKS8kKE1FTVRFU1Q4Nl9CVUlMRF9E
SVIpCj4gPiArICAgICAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgJChNQUtFKSBDQz0kKFRBUkdF
VF9DQykgXAo+Cj4gQ0M9JChUQVJHRVRfQ0MpIGlzIGFscmVhZHkgcHJlc2VudCBpbiBUQVJHRVRf
Q09ORklHVVJFX09QVFMsIHNvIHdoeSBpcwo+IGl0IG5vdCBhY2NvdW50ZWQgZm9yPwoKQmVjYXVz
ZSAiQ0M9JChUQVJHRVRfQ0MpIG1ha2UiIGlzIG5vdCB0aGUgc2FtZSBhcyAibWFrZQpDQz0kKFRB
UkdFVF9DQykiIGFzIGJ1aWxkezMyLDY0fS9NYWtlZmlsZSBpcyBzZXR0aW5nIENDIHRvIGdjYy4K
Cj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+ICsgICAgICAgICAgICAgLUMgJChA
RCkvJChNRU1URVNUODZfQlVJTERfRElSKQo+ID4gIGVuZGVmCj4gPgo+ID4gIGRlZmluZSBNRU1U
RVNUODZfSU5TVEFMTF9JTUFHRVNfQ01EUwo+ID4gLS0KPiA+IDIuNDIuMAo+ID4KPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRk
ZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTog
IFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwoKQmVzdCBSZWdhcmRzLAoKRmFicmlj
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
