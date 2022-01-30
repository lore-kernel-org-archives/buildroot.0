Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FA1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 17:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4365F60E86;
	Sun, 30 Jan 2022 17:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUqJruWjimXp; Sun, 30 Jan 2022 17:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C87660E83;
	Sun, 30 Jan 2022 17:40:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1711BF335
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1830683F8E
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X6RshHreYoka for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 17:40:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5584C83F8F
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 17:40:42 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s9so21031686wrb.6
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 09:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ih72IjtgeXLAcohKMvsKEP8A9JlOTbDhs5N2RNP3D80=;
 b=Supv8bzgvbllhcDCncbofB5GJIghMQJf9BWolyv+kGVaHtrW8qsH7yuOWzkR19y0Nq
 BEBZJMffAsIT1JO/E1RJP4GdYg5rR30iQOANuVPbiTGnK94Mut/Lyo/XQPvq5p922+AL
 vcZ76WjyP2tT6ESfX/RgUFY42OpgoqWVsTK2LS/hAXF/22FJHl5WbSY07SML8Ps1rD3J
 2FNsmZ2D9DwYpk789obXlguM6W4vqz56gnibdtTcvkmgIjrZFJybJN5wYWAQuR9ppegu
 OTsD3ZGwEQM1/cGOrSnlBvvd4j5ztBu+8ZQ+DdbQQMdlb5FL416oLI7Ofl/20IhyC5+N
 wVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ih72IjtgeXLAcohKMvsKEP8A9JlOTbDhs5N2RNP3D80=;
 b=A4HytIkDo1HcKN4Z0eLZkyr7znQO0GCMsu4fD/VkXSng6UfT2TPPDVOD/uzyTIlwdc
 7xPEI+WpebixTkW4JDycmYvUYpRexS6/y9aUH8e4l+OSzkYvLX2cBY4MkzLEK9x5tdTQ
 g3FvLI8n2HTtuXDRfCu//2Svwr+QOsRauQp6Sp5Geyy5V3vcFzwrRRoOtiDVy3LEMTVU
 Tcg0U5FjL6t7JbB+hijftrN2A5UQ3uOR4u/aKTMjSTvdWjFqrsBc90c0lxj6eB27G2dr
 3MaApfB/4rv57tV516ujvj44xy9H5b6XjmT0jvgWwlMtNAhOiQK8F2Pezk9/tf0X9wEs
 VLjQ==
X-Gm-Message-State: AOAM532cK+rX9UsxMWc7pU/qf8FpZBWSPhUbwrAQbMkpvYENYezHhKet
 mAuhRg33VVxF2QPyjAP82jxV1ZdMj3E=
X-Google-Smtp-Source: ABdhPJyTzYULfAjVwwFFPeU9CFDnmf5SHgv4GR/890Wj+avc0yb+wAQs3tYLYogNlavExPu8OL9zmQ==
X-Received: by 2002:a05:6000:16c9:: with SMTP id
 h9mr14536306wrf.272.1643564440441; 
 Sun, 30 Jan 2022 09:40:40 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id d4sm11517650wri.39.2022.01.30.09.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 09:40:39 -0800 (PST)
Message-ID: <400c4077-1e25-a5fd-592e-cbf149d7a626@gmail.com>
Date: Sun, 30 Jan 2022 18:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
 <20220129224651.1282263-3-romain.naour@gmail.com>
 <20220130150243.5795f1fa@windsurf>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220130150243.5795f1fa@windsurf>
Subject: Re: [Buildroot] [PATCH 3/5] package/efl: rework eeze handling in
 Kconfig
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

SGVsbG8gVGhvbWFzLAoKTGUgMzAvMDEvMjAyMiDDoCAxNTowMiwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IE9uIFNhdCwgMjkgSmFuIDIwMjIgMjM6NDY6NDkgKzAxMDAKPiBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IHdyb3RlOgo+IAo+PiBDb21taXQgWzFdIGFk
ZGVkIGVlemUgZGVwZW5kZW5jeSB1c2luZyAiZGVwZW5kcyBvbiIgdG8gc2V2ZXJhbCBlZmwKPj4g
b3B0aW9ucyAoZHJtLCBsaWJtb3VudCkgaW5zdGVhZCBvZiBzZWxlY3RpbmcgZWV6ZSBhbmQgcHJv
cGFnYXRlIHRoZQo+PiB1ZGV2IHJldmVyc2UgZGVwZW5kZW5jeS4KPiAKPiBJIGRvIGFncmVlIHdp
dGggY2hhbmdpbmcgZnJvbSBhICJkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0VGTF9FRVpFIiB0byBh
Cj4gImRlcGVuZHMgQlIyX1BBQ0tBR0VfSEFTX1VERVYiICsgInNlbGVjdCBCUjJfUEFDS0FHRV9F
RkxfRUVaRSIuCj4gSG93ZXZlci4uLgo+IAo+PiBUaGUgZGVwZW5kZW5jeSBiZXR3ZWVuIGVlemUs
IGxpYmlucHV0LCBlZmwgZHJtIHJlcXVpcmVzIHRvIGFkZCBhIG5ldwo+PiBsaWJpbnB1dCBvcHRp
b24uCj4gCj4gLi4uIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIGp1c3RpZmljYXRpb24uIENvdWxk
IHlvdSBjbGFyaWZ5LiBFdmVuCj4gYWZ0ZXIgcmVhZGluZyBQQVRDSCA0LzUsIEkgZG9uJ3QgZ2V0
IHRoZSByZWxhdGlvbnNoaXAuIFBBVENIIDQvNSBjb3VsZAo+IGhhdmUgYmVlbiBkb25lIChJIGd1
ZXNzIHVzaW5nIHRoZSBzYW1lIHByaW5jaXBsZSBvZiAiZGVwZW5kcyBvbgo+IEJSMl9QQUNLQUdF
X0VGTF9FRVpFIi4KCkFGQUlLLCBlZmwgZHJtIG5lZWRzIGxpYmlucHV0IChlbHB1dCkgdGhhdCBy
ZXF1aXJlcyB1ZGV2IChlZXplKS4KVW50aWwgbm93IHdlIGRvbid0IGhhdmUgYSBsaWJpbnB1dCBv
cHRpb24gdG8gZGlzYWJsZSBpdCB3aGVuIGVlemUgaXMgYWxzbyBkaXNhYmxlZC4KCj4gCj4+IFJl
d29yayBlZXplIGhhbmRsaW5nIHRvIHVzZSBzZWxlY3QgQlIyX1BBQ0tBR0VfRUZMX0VFWkUgc2lu
Y2UgdGhlCj4+IHVzZXIgaXMgYWxyZWFkeSBhd2FyZSBvZiB0aGUgdWRldiBkZXBlbmRlbmN5IChC
UjJfUEFDS0FHRV9IQVNfVURFVikuCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3Ugc2F5
IHRoZSB1c2VyIGlzIGFscmVhZHkgYXdhcmUgb2YgdGhlIHVkZXYKPiBkZXBlbmRlbmN5PyBUaGFu
a3MgdG8gdGhlIGNvbW1lbnRzPwoKSSBtZWFuIGlmIGVlemUgY2FuIGJlIHNlbGVjdGVkLCBpdCBt
ZWFucyB0aGF0IHRoZSB1c2VkIGVpdGhlciBzZWxlY3RlZCBzeXN0ZW1kCm9yIGV1ZGV2LgoKPiAK
Pj4gIGNvbW1lbnQgImVmbCdzIGxpYm1vdW50IHN1cHBvcnQgbmVlZHMgdWRldiAvZGV2IG1hbmFn
ZW1lbnQgKGVlemUpIgo+IAo+IFJlbW92ZSB0aGUgImVlemUiIGJldHdlZW4gcGFyZW50aGVzaXMg
aGVyZSBJIGJlbGlldmUuCj4gCj4+IC0JZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfRUZMX0VFWkUK
Pj4gKwlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9IQVNfVURFVgo+PiAgCj4+ICBjb25maWcgQlIy
X1BBQ0tBR0VfRUZMX0hBU19SRUNPTU1FTkRFRF9DT05GSUcKPj4gIAlib29sCj4+IEBAIC0xNzMs
NyArMTc0LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0VGTF9XQVlMQU5ECj4+ICAJZGVwZW5kcyBv
biBCUjJfUEFDS0FHRV9XQVlMQU5ECj4+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19U
SFJFQURTICMgRXZhcyBEUk0gRW5naW5lIC0+IGxpYmRybQo+PiAgCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfTUVTQTNEX09QRU5HTF9FR0wgIyBFdmFzIERSTSBFbmdpbmUKPj4gLQlkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX0VGTF9FRVpFICMgZWZsIGRybQo+PiArCWRlcGVuZHMgb24gQlIyX1BBQ0tB
R0VfSEFTX1VERVYgIyBlZmwgZHJtIChlZXplKQo+PiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0Vf
RUZMX09QRU5HTEVTICMgT3BlbkdMIEVTIHdpdGggRUdMIHN1cHBvcnQgb25seQo+PiAgCWRlcGVu
ZHMgb24gQlIyX0VOQUJMRV9MT0NBTEUgIyBlZmwtZHJtIDwtIGVmbC1lbHB1dCA8LSBsaW5wdXQK
Pj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRUZMX0RSTQo+PiBAQCAtMTgyLDcgKzE4Myw3IEBAIGNv
bmZpZyBCUjJfUEFDS0FHRV9FRkxfV0FZTEFORAo+PiAgY29tbWVudCAiV2F5bGFuZCBzdXBwb3J0
IG5lZWRzIHVkZXYgL2RldiBtYW5hZ2VtZW50IChlZXplKSwgT3BlbkdMIEVTIHcvIEVHTCwgdGhy
ZWFkcywgbG9jYWxlcyIKPiAKPiBEaXR0by4KPiAKPj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X1dBWUxBTkQKPj4gIAlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8ICFC
UjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VHTCBcCj4+IC0JCXx8ICFCUjJfUEFDS0FHRV9FRkxf
T1BFTkdMRVMgfHwgIUJSMl9QQUNLQUdFX0VGTF9FRVpFIFwKPj4gKwkJfHwgIUJSMl9QQUNLQUdF
X0VGTF9PUEVOR0xFUyB8fCAhQlIyX1BBQ0tBR0VfSEFTX1VERVYgXAo+PiAgCQl8fCAhQlIyX0VO
QUJMRV9MT0NBTEUKPj4gIAo+PiAgY2hvaWNlCj4+IEBAIC0yMTUsOSArMjE2LDEwIEBAIGVuZGNo
b2ljZSAjIE9wZW5HTCBzdXBwb3J0Cj4+ICAKPj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9FRkxfRFJN
Cj4+ICAJYm9vbCAiRXZhcyBEUk0gRW5naW5lIgo+PiAtCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0Vf
RUZMX0VFWkUKPj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19VREVWIChlZXplKQo+IAo+
IERvZXMgdGhpcyBsaW5lIHJlYWxseSBwYXJzZXMgY29ycmVjdGx5Pwo+IAo+PiAgCWRlcGVuZHMg
b24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGxpYmRybQo+PiAgCWRlcGVuZHMgb24gQlIy
X1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FR0wgIyByZXF1aXJlIGxpYmdibSBmcm9tIG1lc2EzZAo+
PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9FRkxfRUVaRQo+PiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9M
SUJEUk0KPj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCSU5QVVQgIyBGb3IgZWxwdXQKPj4gIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfTElCWEtCQ09NTU9OCj4+IEBAIC0yMzIsNyArMjM0LDcgQEAgY29u
ZmlnIEJSMl9QQUNLQUdFX0VGTF9EUk0KPj4gIAo+PiAgY29tbWVudCAiRXZhcyBEUk0gRW5naW5l
IG5lZWRzIHVkZXYgL2RldiBtYW5hZ2VtZW50IChlZXplKSwgbWVzYTNkIHcvIEVHTCBzdXBwb3J0
LCB0aHJlYWRzIgo+IAo+IFJlbW92ZSB0aGUgImVlemUiIGJldHdlZW4gcGFyZW50aGVzaXMuCgpC
ZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gVGhhbmtzIQo+IAo+IFRob21hcwo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
