Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA36CA0ECD
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C055B41575;
	Mon, 11 Aug 2025 16:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faS2aWcsIFk7; Mon, 11 Aug 2025 16:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACE8E41577
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE8E41577;
	Mon, 11 Aug 2025 16:06:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52EDC1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 393AF61111
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSQeKnODThVn for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:05:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com;
 envelope-from=jesse@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1755E60B33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1755E60B33
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1755E60B33
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:05:57 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-5390f4513e2so3472224e0c.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754928357; x=1755533157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFm6LbIq42rNj7e6XtMqGjGTHcWdaHFyrkd8xlLBGec=;
 b=PlTdoREpm3aZulXcPi9FKDb2QOzlw9VKgcbom2GUK7FGrRcNm/gQgkR4j5/wMnITQX
 IqLRuGCa7mxlrXBzElniuJ/gPBzXSaueXs50M74/EgGQvC49xGCdmEpEjiBDEp+m6V6P
 +NsplwQVgWGc18+Ykujf1aAOtMer8NcqFBlXvxZArccZ/9puy9JeINI97ZXWwk2MeE6+
 4oIh9NEf/JjPkSPOl6YFzaxQpW1fAfAu2QyMGbdk4DS77uEzJEAsJhijLV/UpxU7AeBd
 5XyQv3DVHBgrdOdNsfrxFoAvLmlvSzNBl3wFwtSmi3dT8TwXbJfHu/ZOmN8QUPPRS7bv
 v2XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLjsj2aI0eu8Zl/dFUM+55vF96tjKQAwpQ9zqPyXFZNk4JdDXLf88X0lJUFBO8gnyPTDstlYLY0oM=@buildroot.org
X-Gm-Message-State: AOJu0YziaEIwN+d82vQLOx/WaMBIXl1laXfPbCpZm+a4z3ytemtX2s4W
 qX5adwhTsoux05QFxa2xjnKiHu10KxtSzB6e8D2r3RpkaV7llbLwuN2jasSfLvdUirK8etz4Zs3
 OUqgEuFwwjjeh8lSwpVLtj9DRU0dUOZZ7kyrInfriSQ==
X-Gm-Gg: ASbGncusv2u7qsNmIqmUsBQ+RiZ3TaIcFnzHv5HCRkHaGmL+X7CTfIQulMcUlQoLTCR
 tkAw5hTg2658AYlI5QWlohzBLyUY1KnTc0Ue7RCaJ7VDioGZVF2RP9jhjbsQXv2i+yCOCtK+H1k
 YMFEpz8dxJNf9CaV/imA4HbU/4W8LcPGqdCIVu44+v7CQczMlv5jncQ5n3fI+F6XuEsXZf/a8R9
 F34aZhj
X-Google-Smtp-Source: AGHT+IGU/F538z7DO8S9US/ht40D2IxP+yJPtgmj3O40dht6k993um5ULhY03tP1oURgMcFAsywYBFtpVRSMiOHroC0=
X-Received: by 2002:a05:6122:1820:b0:530:7a17:88ca with SMTP id
 71dfb90a1353d-53a52ec0cc0mr4700863e0c.9.1754928356565; Mon, 11 Aug 2025
 09:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
 <20250805151814.1114414-10-alex.bennee@linaro.org>
 <20250810111639.4e36b8e7@tpx1>
In-Reply-To: <20250810111639.4e36b8e7@tpx1>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 11 Aug 2025 09:05:46 -0700
X-Gm-Features: Ac12FXxPgWik-fpXxbl8nDoa3ieBAlLWE3g0YCrbqzZIpJOAKxq5KZdFxQ0OMKE
Message-ID: <CALSpo=bOmibM5c5oy2KkD26ohe5rJ+zkKnQgscn35LyjiSYr6w@mail.gmail.com>
To: Thomas Huth <huth@tuxfamily.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc.com; s=google; t=1754928357; x=1755533157; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFm6LbIq42rNj7e6XtMqGjGTHcWdaHFyrkd8xlLBGec=;
 b=KArUDkWZvCAYy3oMGfXZChPpZqw11UxI13gmoH4wF/Sq9MRERwQPDkz3dxUoB36wxG
 my/l/2QfSHsr6KObQ6mlWXy6StnyjKPvWXPA2Gz7f0IeG3Cz0M+bhe67gOLkuv2EgRuV
 THmyFxKMsT/aud71QCCafQR/Ov2p8SeOzdXXBuAbLUztpyPLvaqizh4WcQOngI/GVuCN
 nwVpOlOXcP+56UjjUpoUbVhk0TMyg7MK4o7U7b17HOz+ZtcfhOEFnWokd+LxcGuBKGA5
 4LvZBFt1PQZ4H9wxNXBWBmF8fpOCdFpy4i/OpH41PqhISltIOOfmh8qdpcg7Qq5/UU1S
 4rRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc.com header.i=@rivosinc.com header.a=rsa-sha256
 header.s=google header.b=KArUDkWZ
Subject: Re: [Buildroot] [PATCH v4 9/9] package/kvm-unit-tests: allow
 kvmtool to be used
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
Cc: Jesse Taube <Mr.Bossman075@gmail.com>, Cyril Bur <cyrilbur@gmail.com>,
 Jesse Taube <Jesse@rivosinc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBdWcgMTAsIDIwMjUgYXQgMjoxNuKAr0FNIFRob21hcyBIdXRoIDxodXRoQHR1eGZh
bWlseS5vcmc+IHdyb3RlOgo+Cj4gQW0gVHVlLCAgNSBBdWcgMjAyNSAxNjoxODoxMSArMDEwMAo+
IHNjaHJpZWIgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjoKPgo+ID4gRm9y
IHNvbWUgdGFyZ2V0cyBsYXVuY2hpbmcgdGVzdHMgd2l0aCBrdm10b29sIGlzIGFuIG9wdGlvbiB3
aGljaCBtYWtlcwo+ID4gZm9yIGFuIGV2ZW4gc21hbGxlciB0ZXN0IGltYWdlLiBDcmVhdGUgYSBu
ZXcgc3ltYm9sIHdoaWNoIGNhbiBiZQo+ID4gZXhwYW5kZWQgd2l0aCBhZGRpdGlvbmFsIHRhcmdl
dHMgdGhhdCB3aWxsIGFsbG93IHRoZSBza2lwcGluZyBvZiB0aGUKPiA+IHNlbGVjdGlvbiBvZiBR
RU1VIGlmIG5vdCBuZWVkZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0
cy9Db25maWcuaW4gICAgICAgICB8IDkgKysrKysrKy0tCj4gPiAgcGFja2FnZS9rdm0tdW5pdC10
ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayB8IDcgKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0Nv
bmZpZy5pbgo+ID4gaW5kZXggYjg5ZjAxM2YyYS4uODBlYmM1MDBjNiAxMDA2NDQKPiA+IC0tLSBh
L3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL2t2bS11
bml0LXRlc3RzL0NvbmZpZy5pbgo+ID4gQEAgLTEzLDYgKzEzLDExIEBAIGNvbmZpZyBCUjJfUEFD
S0FHRV9LVk1fVU5JVF9URVNUU19BUkNIX1NVUFBPUlRTCj4gPiAgICAgICBkZWZhdWx0IHkgaWYg
QlIyX3Bvd2VycGM2NCB8fCBCUjJfcG93ZXJwYzY0bGUKPiA+ICAgICAgIGRlZmF1bHQgeSBpZiBC
UjJfczM5MHgKPiA+Cj4gPiArIyBTb21lIGFyY2hpdGVjdHVyZXMgY2FuIHVzZSBrdm10b29sIGlu
c3RlYWQgb2YgUUVNVSB0byBsYXVuY2ggdGhlIHRlc3RzCj4gPiArY29uZmlnIEJSMl9QQUNLQUdF
X0tWTV9VTklUX1RFU1RTX0NBTl9VU0VfS1ZNVE9PTAo+ID4gKyAgICAgYm9vbAo+ID4gKyAgICAg
ZGVmYXVsdCB5IGlmIChCUjJfYWFyY2g2NCB8fCBCUjJfcmlzY3YgfHwgQlIyX2FybSkgJiYgQlIy
X1BBQ0tBR0VfS1ZNVE9PTAoKa3ZtdG9vbCBpcyBhbHNvIHN1cHBvcnRlZCB3aXRoIEJSMl9yaXNj
diBhbmQgQlIyX2FybSBhcyB3ZWxsLgpFeGNsdWRpbmcgQlIyX2FybSBpcyBmaW5lIHdpdGggbWUK
YXMgaXQgaXMgZGVwcmVjYXRlZCBhcyB5b3UgbWVudGlvbmVkIGVhcmxpZXIuCgpUaGFua3MsCkpl
c3NlIFRhdWJlCgo+ID4gKwo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUwo+
ID4gICAgICAgYm9vbCAia3ZtLXVuaXQtdGVzdHMiCj4gPiAgICAgICBkZXBlbmRzIG9uIEJSMl9I
T1NUQVJDSCA9ICJ4ODZfNjQiIHx8ICFCUjJfeDg2XzY0Cj4gPiBAQCAtMjIsOCArMjcsOCBAQCBj
b25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFMKPiA+ICAgICAgIGRlcGVuZHMgb24gKEJS
Ml9QQUNLQUdFX0dMSUJDX1VUSUxTIHx8IFwKPiA+ICAgICAgICAgICAgICAgICAgIEJSMl9VQ0xJ
QkNfSU5TVEFMTF9VVElMUyB8fCBcCj4gPiAgICAgICAgICAgICAgICAgICBCUjJfVE9PTENIQUlO
X0VYVEVSTkFMX0xJQkNfVVRJTFNfQ09QWSkgIyBydW50aW1lIGdldGNvbmYKPiA+IC0gICAgIHNl
bGVjdCBCUjJfUEFDS0FHRV9RRU1VCj4gPiAtICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9T
WVNURU0gIyBydW50aW1lIGZvciBxZW11LXN5c3RlbS0kQVJDSAo+ID4gKyAgICAgc2VsZWN0IEJS
Ml9QQUNLQUdFX1FFTVUgaWYgIUJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTX0NBTl9VU0VfS1ZN
VE9PTAo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNIGlmICFCUjJfUEFD
S0FHRV9LVk1fVU5JVF9URVNUU19DQU5fVVNFX0tWTVRPT0wgIyBydW50aW1lIGZvciBxZW11LXN5
c3RlbS0kQVJDSAo+ID4gICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0NPUkVVVElMUyAjIHJ1bnRp
bWUgZm9yIHRpbWVvdXQKPiA+ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9CQVNIICMgcnVudGlt
ZQo+ID4gICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX05NQVAKPiA+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIGIvcGFja2FnZS9rdm0tdW5pdC10
ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawo+ID4gaW5kZXggZWZjM2M4NTlhYS4uY2Y5OTVmZjU0ZSAx
MDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsK
PiA+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKPiA+IEBA
IC00MCw2ICs0MCwxMyBAQCBLVk1fVU5JVF9URVNUU19DT05GX09QVFMgPVwKPiA+ICAgICAgIC0t
cHJvY2Vzc29yPSIkKEdDQ19UQVJHRVRfQ1BVKSIgXAo+ID4gICAgICAgLS1lbmRpYW49IiQoS1ZN
X1VOSVRfVEVTVFNfRU5ESUFOKSIKPiA+Cj4gPiArIyBUaGUgZGVmYXVsdCBydW5uZXIgaXMgUUVN
VSBidXQga3ZtdG9vbCBjYW4gYWxzbyBiZSB1c2VkCj4gPiAraWZlcSAoJChCUjJfUEFDS0FHRV9R
RU1VX1NZU1RFTSkseSkKPiA+ICtLVk1fVU5JVF9URVNUU19DT05GX09QVFMgKz0gLS10YXJnZXQ9
cWVtdQo+ID4gK2Vsc2UgaWZlcSAoJChCUjJfUEFDS0FHRV9LVk1UT09MKSx5KQo+ID4gK0tWTV9V
TklUX1RFU1RTX0NPTkZfT1BUUyArPSAtLXRhcmdldD1rdm10b29sCj4gPiArZW5kaWYKPiA+ICsK
PiA+ICBpZmVxICgkKEJSMl9BUk02NF9QQUdFX1NJWkVfNEspLHkpCj4gPiAgS1ZNX1VOSVRfVEVT
VFNfQ09ORl9PUFRTICs9IC0tcGFnZS1zaXplPTRrCj4gPiAgZWxzZSBpZmVxICgkKEJSMl9BUk02
NF9QQUdFX1NJWkVfMTZLKSx5KQo+Cj4gUmV2aWV3ZWQtYnk6IFRob21hcyBIdXRoIDxodXRoQHR1
eGZhbWlseS5vcmc+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
