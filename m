Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39A7C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 02:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CAC460BEA;
	Tue,  7 Jun 2022 02:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Jpc_2AHjTeO; Tue,  7 Jun 2022 02:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CF0960B4F;
	Tue,  7 Jun 2022 02:41:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8CF31BF476
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 02:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB85D83EAB
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 02:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xicD4k0hibwT for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 02:41:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA76083E9B
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 02:41:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso1903122wms.3
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 19:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JaKvW/56pM3UgKFkMNkwSLUfmq3bThaMJcAW/LglD6o=;
 b=OGjdXEhlyvUWiSH6QR8pGpR9yn+zlhUm1UzTQMxALsJaSoSOlKuTtcv5Z3g31z/xbf
 TxDDI1nVtjWiFYQWegdFVyj1fDyTdhIZUgA65aJgNoWo+GukHDJGPUI34JTm8uUy/lJF
 3lGsXITA/jooVVaIqxssJZGkaaGVm2Np6BcJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JaKvW/56pM3UgKFkMNkwSLUfmq3bThaMJcAW/LglD6o=;
 b=VXOg7ZsQKqNagXIfx7X8q/tIzUlHd0CE6E5dEgspc1FomAdUaER0COKUJD/u41D7r4
 cz2ScCiNyPXKxBeLS3nHrccqO6TaoukbRZXHfF90WnzbE8YvIsyhGLrGu80EFAhdXE9y
 KoZMu3vRxYOF8DNth4j3Bnmla50VepjIVBGsoipcO65Hk4hseTR5rf9LGpBplrnfzstb
 jqyGgeQHHz0qFnr2VmMiuZ8a5Doejr/rTmc9nzl0f8h3F9O5n4aGppRu7siZv2FBEz3J
 K7f/3YlXfUyrY+o7+VimaBoueR1xFhsRWy2qYajYdolk2w3y6me9uikt35HiAEtKevSn
 Z7Sw==
X-Gm-Message-State: AOAM533gxK9+HNGO4vt/Ew/LoMQcHZYMzkqp6AzTrf4uFowJA5MJs6vw
 bhwvZ3eh+GiTx8Ag6gZXBbwJ25tPlR+AxGovg8Q=
X-Google-Smtp-Source: ABdhPJwTq6iEkN3Ddw4UZ3FlKagLgeNJfnazmIqW7eh/G4TIFFy8P376dFX6l8AHEsWlNZ947+PUCyKbMmqu7IJE0vM=
X-Received: by 2002:a05:600c:4e43:b0:397:7493:5f02 with SMTP id
 e3-20020a05600c4e4300b0039774935f02mr26709085wmq.34.1654569701858; Mon, 06
 Jun 2022 19:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
 <20220605194259.2928568-6-thomas.petazzoni@bootlin.com>
 <2e10038a-fd1d-8608-3178-5b0e6b0ae419@gmail.com>
In-Reply-To: <2e10038a-fd1d-8608-3178-5b0e6b0ae419@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Jun 2022 02:41:29 +0000
Message-ID: <CACPK8XdwphRFhAL6rajeT217h-Fqe1FJNUAX-G23J+tjdp6Tfw@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [Buildroot] [PATCH 5/7] arch/Config.in.powerpc: disable some
 variants on ppc64le
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
Cc: Cyril Bur <cyrilbur@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCA2IEp1biAyMDIyIGF0IDA5OjQ2LCBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gVGhvbWFzLAo+Cj4gTGUgMDUvMDYvMjAyMiDDoCAy
MTo0MiwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IGEgw6ljcml0IDoKPiA+IEZvbGxv
d2luZyBjb21taXQKPiA+IGU1OWIzYWNjMzYwM2U1NWZiYWVjMjU0MDYyNThlYzljYTk2MjM1NjQg
KCJ0b29sY2hhaW4vZ2xpYmM6IFJlc3RyaWN0Cj4gPiBwcGM2NGxlIHN1cHBvcnQgdG8gcG93ZXI4
IiksIHdoZW4gc2VsZWN0aW5nIHBwYzY0bGUgYXMgdGhlCj4gPiBhcmNoaXRlY3R1cmUsIGl0IGlz
IHBvc3NpYmxlIHRvIGVuZCB1cCB3aXRoIGEgc2VsZWN0aW9uIGZvciB3aGljaCBubyBDCj4gPiBs
aWJyYXJ5IGlzIHByb3ZpZGVkLgo+ID4KPiA+IEluZGVlZDoKPiA+Cj4gPiAgLSBnbGliYyBvbmx5
IHN1cHBvcnRzIFBvd2VyOAo+ID4gIC0gdWNsaWJjIGhhcyBubyBzdXBwb3J0IGZvciBwcGM2NGxl
IGF0IGFsbAo+ID4gIC0gbXVzbCBvbmx5IHN1cHBvcnRzIHBwYzY0bGUgcHJvY2Vzc29ycyB0aGF0
IGhhdmUgQWx0aXZlYyBzdXBwb3J0Cj4gPgo+ID4gVGhlcmVmb3JlLCB0aGlzIGNvbW1pdCBhZGRz
ICJkZXBlbmRzIG9uICFCUjJfcG93ZXJwYzY0bGUiIHRvIHRob3NlCj4gPiBQb3dlclBDIGFyY2hp
dGVjdHVyZSB2YXJpYW50cyBmb3Igd2hpY2ggbm8gQyBsaWJyYXJ5IHN1cHBvcnQgZXhpc3RzLgo+
ID4KPiA+IEZpeGVzOgo+ID4KPiA+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jl
c3VsdHMvM2Y2ZmIxYzJkNTY0OGU3OGY3ODU2YmRlYTMxNzFiNWE4OWRmYTJmOS8KPgo+IE5vdCBy
ZWxhdGVkIHRvIHRoaXMgcGF0Y2ggYnV0IGl0IHNlZW1zIHRoYXQgdUNsaWJjLW5nIG9ubHkgc3Vw
cG9ydCBwb3dlcnBjCj4gKEJSMl9wb3dlcnBjKSB3aXRob3V0IEFMVElWRUMgc3VwcG9ydCAoIUJS
Ml9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQykuCj4KPiBBcyBzb29uIGFzIEJSMl9QT1dFUlBDX0NQ
VV9IQVNfQUxUSVZFQyBpcyBzZXQsIHRoZSB1Y2xpYmMtbmcgYnVpbGQgZHVlIGEKPiBjb25mbGlj
dGluZyB0eXBlcyBmb3IgJ2VsZl92cnJlZ190JzoKPgo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzLzA4NC8wODRiZDFkZjVjZjEwYzgxNjQ2ZDZlZGYwMWY1MzQ3YTM1ZmM5
ZTZiL2J1aWxkLWVuZC5sb2cKPgo+IFRoaXMgd2FzIG5vdCBub3RpY2VkIGJ5IFRvb2xjaGFpbi1i
dWlsZGVyIHByb2plY3Qgc2luY2UgaXQgb25seSBidWlsZCBwb3dlcnBjCj4gY29uZmlndXJhdGlv
biB3aXRob3V0IGFsdGl2ZWMgc3VwcG9ydCAoZTMwMGMzLCA0NDBmcCwgZTUwMG1jKS4KPgo+IGh0
dHBzOi8vdG9vbGNoYWlucy5ib290bGluLmNvbS9kb3dubG9hZHMvcmVsZWFzZXMvdG9vbGNoYWlu
cy9wb3dlcnBjLWUzMDBjMy9mcmFnbWVudHMvcG93ZXJwYy1lMzAwYzMtLXVjbGliYy0tYmxlZWRp
bmctZWRnZS0yMDIwLjA4LTEuZnJhZwo+Cj4gU3VycHJpc2luZ2x5LCBpdCBhbHNvIGZhaWwgd2l0
aCBwb3dlcjQgYW5kIHBvd2VyNSB3aGVyZQo+IEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQyBp
cyBub3Qgc2V0IGJ1dCB3aXRoIHRoZSBzYW1lIGVycm9yLgoKVGhlc2UgYXJlIDY0IGJpdCBtYWNo
aW5lcywgYW5kIHVjbGliYyBkb2Vzbid0IHN1cHBvcnQgcHBjNjQgYmlnIG9yCmxpdHRsZSBlbmRp
YW4uCgo+Cj4gSXQgc2VlbXMgYnJva2VuIHNpbmNlIGFsd2F5cywgd2Ugc2hvdWxkIHJlc3RyaWN0
IHVDbGliYy1uZyB0byBhbGwga25vdyB3b3JraW5nCj4gY29uZmlndXJhdGlvbi4KCldlIHNob3Vs
ZCBkaXNhYmxlIDMyIGJpdCB1c2Vyc3BhY2UgZm9yIHRoZSA2NGJpdCBDUFVzLiBXaGlsZSB0aGV5
IGNhbgpydW4gYSAzMiBiaXQgdXNlcnNwYWNlIHdpdGggYW4gYXBwcm9wcmlhdGUga2VybmVsLCBp
dCBkb2Vzbid0IG1ha2UKc2Vuc2UgdG8gZXhwb3NlIHRoYXQgb3B0aW9uLgoKVGhlIG9wdGlvbnMg
YXJlOgogLSAzMiBiaXQgYmlnIGVuZGlhbgogLSAzMiBiaXQgbGl0dGxlIGVuZGlhbgogLSA2NCBi
aXQgYmlnIGVuZGlhbiAocG93ZXI0IG9ud2FyZHMsIGFuZCBvdGhlciBub24tSUJNIENQVXMpCiAt
IDY0IGJpdCBsaXR0bGUgZW5kaWFuIChwb3dlcjggb253YXJkcywgYW5kIG90aGVyIG5vbi1JQk0g
Q1BVcykKClBvd2VyOCBhbmQgb253YXJkcyBjYW4gcnVuIGJpZyBlbmRpYW4sIGJ1dCBpdCdzIG5v
dCBjb21tb24uIFJIRUwsClN1U2UsIFVidW50dSBidWlsZCBsaXR0bGUgZW5kaWFuIG9ubHkuCgpJ
IGhhdmUgaGFkIGEgZmV3IGdvZXMgYXQgd3JpdGluZyBzb21lIGtjb25maWcgdG8gZXhwcmVzcyB0
aGlzLCBidXQgSQpkaWRuJ3QgZ2V0IHNvbWV0aGluZyB0aGF0IHdhcyB3b3J0aCBwb3N0aW5nLiBU
aG9tYXMnIHBhdGNoIGhhcyBnb25lIGluCnRoZSB0cmVlLCBhbmQgdGhpcyBpbXByb3ZlcyB0aGUg
c2l0dWF0aW9uIGEgbGl0dGxlLCBidXQgdGhlcmUncyBzdGlsbAp0aGUgY2FzZSBvZiBiZWluZyBh
YmxlIHRvIHNlbGVjdCAzMiBiaXQgZm9yIHRoZSA2NCBiaXQgQ1BVcy4KCldlIGNvdWxkIGFkZCAi
ZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NCIgdG8gdGhlIDY0IGJpdCBDUFVzPwoKPgo+IEJlc3Qg
cmVnYXJkcywKPiBSb21haW4KPgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6
em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvQ29u
ZmlnLmluLnBvd2VycGMgfCAxMCArKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4ucG93ZXJwYyBi
L2FyY2gvQ29uZmlnLmluLnBvd2VycGMKPiA+IGluZGV4IDI3MmY2NmY0ZTcuLmM0OGVkZDNiYjQg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjCj4gPiArKysgYi9hcmNoL0Nv
bmZpZy5pbi5wb3dlcnBjCj4gPiBAQCAtMTQsNiArMTQsOCBAQCBjaG9pY2UKPiA+ICAgICAgICAg
U3BlY2lmaWMgQ1BVIHZhcmlhbnQgdG8gdXNlCj4gPiAgY29uZmlnIEJSMl9nZW5lcmljX3Bvd2Vy
cGMKPiA+ICAgICAgIGJvb2wgImdlbmVyaWMiCj4gPiArICAgICAjIE5vIEMgbGlicmFyeSBzdXBw
b3J0cyB0aGlzIHZhcmlhbnQgb24gcHBjNjRsZQo+ID4gKyAgICAgZGVwZW5kcyBvbiAhQlIyX3Bv
d2VycGM2NGxlCj4gPiAgY29uZmlnIEJSMl9wb3dlcnBjXzQwMQo+ID4gICAgICAgYm9vbCAiNDAx
Igo+ID4gICAgICAgZGVwZW5kcyBvbiAhQlIyX0FSQ0hfSVNfNjQKPiA+IEBAIC02NCw4ICs2Niwx
MiBAQCBjb25maWcgQlIyX3Bvd2VycGNfNjA0ZQo+ID4gICAgICAgZGVwZW5kcyBvbiAhQlIyX0FS
Q0hfSVNfNjQKPiA+ICBjb25maWcgQlIyX3Bvd2VycGNfNjIwCj4gPiAgICAgICBib29sICI2MjAi
Cj4gPiArICAgICAjIE5vIEMgbGlicmFyeSBzdXBwb3J0cyB0aGlzIHZhcmlhbnQgb24gcHBjNjRs
ZQo+ID4gKyAgICAgZGVwZW5kcyBvbiAhQlIyX3Bvd2VycGM2NGxlCj4gPiAgY29uZmlnIEJSMl9w
b3dlcnBjXzYzMAo+ID4gICAgICAgYm9vbCAiNjMwIgo+ID4gKyAgICAgIyBObyBDIGxpYnJhcnkg
c3VwcG9ydHMgdGhpcyB2YXJpYW50IG9uIHBwYzY0bGUKPiA+ICsgICAgIGRlcGVuZHMgb24gIUJS
Ml9wb3dlcnBjNjRsZQo+ID4gIGNvbmZpZyBCUjJfcG93ZXJwY183NDAKPiA+ICAgICAgIGJvb2wg
Ijc0MCIKPiA+ICAgICAgIGRlcGVuZHMgb24gIUJSMl9BUkNIX0lTXzY0Cj4gPiBAQCAtMTE4LDgg
KzEyNCwxMiBAQCBjb25maWcgQlIyX3Bvd2VycGNfZTY1MDAKPiA+ICAgICAgIHNlbGVjdCBCUjJf
UE9XRVJQQ19DUFVfSEFTX0FMVElWRUMKPiA+ICBjb25maWcgQlIyX3Bvd2VycGNfcG93ZXI0Cj4g
PiAgICAgICBib29sICJwb3dlcjQiCj4gPiArICAgICAjIE5vIEMgbGlicmFyeSBzdXBwb3J0cyB0
aGlzIHZhcmlhbnQgb24gcHBjNjRsZQo+ID4gKyAgICAgZGVwZW5kcyBvbiAhQlIyX3Bvd2VycGM2
NGxlCj4gPiAgY29uZmlnIEJSMl9wb3dlcnBjX3Bvd2VyNQo+ID4gICAgICAgYm9vbCAicG93ZXI1
Igo+ID4gKyAgICAgIyBObyBDIGxpYnJhcnkgc3VwcG9ydHMgdGhpcyB2YXJpYW50IG9uIHBwYzY0
bGUKPiA+ICsgICAgIGRlcGVuZHMgb24gIUJSMl9wb3dlcnBjNjRsZQo+ID4gIGNvbmZpZyBCUjJf
cG93ZXJwY19wb3dlcjYKPiA+ICAgICAgIGJvb2wgInBvd2VyNiIKPiA+ICAgICAgIHNlbGVjdCBC
UjJfUE9XRVJQQ19DUFVfSEFTX0FMVElWRUMKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
