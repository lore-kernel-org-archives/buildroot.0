Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6998C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 20:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 688DC60F82;
	Mon,  2 May 2022 20:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TgjBqtNAXx6G; Mon,  2 May 2022 20:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38BD360EF8;
	Mon,  2 May 2022 20:55:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE2671BF963
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 20:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB00E415E1
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 20:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new); dkim=neutral
 reason="invalid (public key: DNS error: query timed out)"
 header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MS-Epwv89tOO for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 20:54:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10A19415E0
 for <buildroot@buildroot.org>; Mon,  2 May 2022 20:54:45 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u3so20985743wrg.3
 for <buildroot@buildroot.org>; Mon, 02 May 2022 13:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MS10p0TfO1zRrhGNo+jl7zwCgQzKj5iM/cGOgn7MSYo=;
 b=KoAszEMJqeMQwzdTuDZB1jemYG8V9yJfYXklgeJ8RZNzLHaOdRj1PdQDK0n2N9arxg
 T8abGNhAu8Rufu3CgObDv5t4VVG4YiASqwGlxY7PjY/nPMHtmjdQfLoU011CmQ9jlUks
 ITq0dll5evlom/O+6NhsdRR+rkw4+YRWU0qmQnczOxcJT6iPOoOOzl174GVGQ3amEQVq
 8HCOEAJ13RfWzY36p5unldkDmEOCucCcMbI84GJ0sZMqFsfDEV2L3ZArKTlz4fS3qk0X
 hH7QHHmu4Wv0ziCVkCVZ1SH7Vh/962ei1zp5VysyzO7uQ92Q3orkYXuTO/cTLJ8gVtGU
 p8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MS10p0TfO1zRrhGNo+jl7zwCgQzKj5iM/cGOgn7MSYo=;
 b=C7nCPtbcUEt1w6KBMxPzgHIKqqt3tG9IbTmBazUXFXCNNcx+8t4paNQLHLbnhaWIik
 YnQnP+phLLS2Q9+Ima8AkK5anennJs1G/P6INVfMfzn4kkSddIGTgZyg06QwjdHU+1AV
 kXwz+AGRrH8OkJuKtlp2YpV0qh5Fe9CJgJt5CuR07/jVooYkc2nz1scoNwGVbNYlwH5S
 daDt5RHP3yF72Jz5avnrrVncIj08vOwf4cu5ppDLmIJ8v3RCcyzMy2vDp8jDQg2Z7ZED
 jhwJqNMS3l80mpAH4xg+Q0O3hDW56/5z9mRHXyz1FRK1DvKI6psAUfbxjBpMYP0BeFMK
 tEAg==
X-Gm-Message-State: AOAM531YWtE9q3k81BY39zFZPasVa83sblvPGcay3OPdYxkLQjyet/55
 NLgWz9auZuJS+J8SbFEtLgp2QabNHO821Q==
X-Google-Smtp-Source: ABdhPJyC1u4Gl4VpBNrYsLUDSKEeU5BoUP/Q9MKDyj23QoEBUGWZ4Ch5ne2EHEvJU+kCbR9mHqwgdA==
X-Received: by 2002:a17:906:4fcc:b0:6e0:3269:2054 with SMTP id
 i12-20020a1709064fcc00b006e032692054mr12197778ejw.117.1651524367983; 
 Mon, 02 May 2022 13:46:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o16-20020aa7d3d0000000b0042617ba63a4sm7094404edr.46.2022.05.02.13.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 13:46:07 -0700 (PDT)
Message-ID: <58246deb-7d8a-75e4-b04e-257208e9b456@mind.be>
Date: Mon, 2 May 2022 22:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220426212026.712081-1-fontaine.fabrice@gmail.com>
 <20220426235740.1b2543d1@windsurf>
 <CAPi7W83tNKtcnNyPGWQ5Gdi_UM42gM+SCV5chzJ7W06JFYTpdg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAPi7W83tNKtcnNyPGWQ5Gdi_UM42gM+SCV5chzJ7W06JFYTpdg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptodev-linux: needs
 CONFIG_CRYPTO_USER_API_AEAD
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNy8wNC8yMDIyIDIyOjE1LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IExlIG1hci4g
MjYgYXZyLiAyMDIyIMOgIDIzOjU3LCBUaG9tYXMgUGV0YXp6b25pCj4gPHRob21hcy5wZXRhenpv
bmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPj4KPj4gT24gVHVlLCAyNiBBcHIgMjAyMiAyMzoy
MDoyNiArMDIwMAo+PiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+PiBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX0FFQUQgaXMgbmVlZGVkIHRv
IGZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkCj4+PiBmYWlsdXJlOgo+Pj4KPj4+IEVSUk9SOiBtb2Rw
b3N0OiAiY3J5cHRvX2FsbG9jX3NrY2lwaGVyIiBbL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9p
bnN0YW5jZS0yL291dHB1dC0xL2J1aWxkL2NyeXB0b2Rldi1saW51eC0xLjEyLy4vY3J5cHRvZGV2
LmtvXSB1bmRlZmluZWQhCj4+PiBFUlJPUjogbW9kcG9zdDogInNjYXR0ZXJ3YWxrX21hcF9hbmRf
Y29weSIgWy9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9idWls
ZC9jcnlwdG9kZXYtbGludXgtMS4xMi8uL2NyeXB0b2Rldi5rb10gdW5kZWZpbmVkIQo+Pj4gRVJS
T1I6IG1vZHBvc3Q6ICJjcnlwdG9fYWhhc2hfZmluYWwiIFsvaG9tZS9hdXRvYnVpbGQvYXV0b2J1
aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEvYnVpbGQvY3J5cHRvZGV2LWxpbnV4LTEuMTIvLi9jcnlw
dG9kZXYua29dIHVuZGVmaW5lZCEKPj4+IEVSUk9SOiBtb2Rwb3N0OiAiY3J5cHRvX2FlYWRfZW5j
cnlwdCIgWy9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9idWls
ZC9jcnlwdG9kZXYtbGludXgtMS4xMi8uL2NyeXB0b2Rldi5rb10gdW5kZWZpbmVkIQo+Pj4gRVJS
T1I6IG1vZHBvc3Q6ICJjcnlwdG9fYWVhZF9zZXRrZXkiIFsvaG9tZS9hdXRvYnVpbGQvYXV0b2J1
aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEvYnVpbGQvY3J5cHRvZGV2LWxpbnV4LTEuMTIvLi9jcnlw
dG9kZXYua29dIHVuZGVmaW5lZCEKPj4+IEVSUk9SOiBtb2Rwb3N0OiAiY3J5cHRvX3NrY2lwaGVy
X2RlY3J5cHQiIFsvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEv
YnVpbGQvY3J5cHRvZGV2LWxpbnV4LTEuMTIvLi9jcnlwdG9kZXYua29dIHVuZGVmaW5lZCEKPj4+
IEVSUk9SOiBtb2Rwb3N0OiAiY3J5cHRvX2Rlc3Ryb3lfdGZtIiBbL2hvbWUvYXV0b2J1aWxkL2F1
dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1aWxkL2NyeXB0b2Rldi1saW51eC0xLjEyLy4v
Y3J5cHRvZGV2LmtvXSB1bmRlZmluZWQhCj4+PiBFUlJPUjogbW9kcG9zdDogImNyeXB0b19za2Np
cGhlcl9zZXRrZXkiIFsvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTIvb3V0cHV0
LTEvYnVpbGQvY3J5cHRvZGV2LWxpbnV4LTEuMTIvLi9jcnlwdG9kZXYua29dIHVuZGVmaW5lZCEK
Pj4+IEVSUk9SOiBtb2Rwb3N0OiAiY3J5cHRvX2FlYWRfZGVjcnlwdCIgWy9ob21lL2F1dG9idWls
ZC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9idWlsZC9jcnlwdG9kZXYtbGludXgtMS4x
Mi8uL2NyeXB0b2Rldi5rb10gdW5kZWZpbmVkIQo+Pj4gRVJST1I6IG1vZHBvc3Q6ICJjcnlwdG9f
YWVhZF9zZXRhdXRoc2l6ZSIgWy9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9v
dXRwdXQtMS9idWlsZC9jcnlwdG9kZXYtbGludXgtMS4xMi8uL2NyeXB0b2Rldi5rb10gdW5kZWZp
bmVkIQo+Pgo+PiBBcmUgeW91IHN1cmUgb2YgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZXNl
IGZ1bmN0aW9ucyBhbmQKPj4gQ09ORklHX0NSWVBUT19VU0VSX0FQSV9BRUFEID8KPj4KPj4gY3J5
cHRvX2FlYWRfZW5jcnlwdCgpIGlzIGltcGxlbWVudGVkIGluIGNyeXB0by9hZWFkLmMsIHdoaWNo
IGlzIGJ1aWx0Cj4+IHdoZW4gQ09ORklHX0NSWVBUT19BRUFEMj15Lgo+Pgo+PiBjcnlwdG9fc2tj
aXBoZXJfc2V0a2V5KCkgaXMgaW1wbGVtZW50ZWQgaW4gY3J5cHRvL3NrY2lwaGVyLmMsIHdoaWNo
IGlzCj4+IGJ1aWx0IHdoZW4gQ09ORklHX0NSWVBUT19TS0NJUEhFUjI9eS4KPj4KPj4gQ1JZUFRP
X1VTRVJfQVBJX0FFQUQgZW5hYmxlcyBhIHVzZXItc3BhY2UgaW50ZXJmYWNlLCBidXQgaGVyZSB3
ZSdyZQo+PiB0YWxraW5nIGFib3V0IGEga2VybmVsLWxldmVsIGludGVyZmFjZS4KPj4KPj4gQ291
bGQgeW91IGNsYXJpZnk/Cj4gCj4gSSdtIGZhciBmcm9tIGJlaW5nIGEga2VybmVsIG9yIGNyeXB0
b2Rldi1saW51eCBleHBlcnQgYnV0IGhlcmUgaXMgd2FzCj4gbXkgcmVhc29ubmluZzoKPiAgICAt
IENPTkZJR19DUllQVE9fQUVBRDIgYW5kIENPTkZJR19DUllQVE9fU0tDSVBIRVIyIGFyZSBoaWRk
ZW4gb3B0aW9ucwo+IHRoYXQgY2FuJ3QgYmUgZW5hYmxlZCBieSBLQ09ORklHX0VOQUJMRV9PUFQu
Cj4gICAgLSBGcm9tIG15IHVuZGVyc3RhbmRpbmcgY3J5cHRvZGV2LWxpbnV4IGFsbG93cyAidXNl
cnNwYWNlCj4gYXBwbGljYXRpb25zIHRvIHRha2UgYWR2YW50YWdlIG9mIGhhcmR3YXJlIGFjY2Vs
ZXJhdG9ycyIuIFNvLCBJCj4gYXNzdW1lZCB0aGF0IGNyeXB0b2Rldi1saW51eCBuZWVkZWQgc29t
ZSBzb3J0IG9mIHVzZXJzcGFjZSBBUEkgb24gdGhlCj4ga2VybmVsLiBIb3dldmVyLCBJIGRpZG4n
dCBmaW5kIGEgbG90IG9mIGluZm9ybWF0aW9uIGFib3V0IHRoaXMgc3ViamVjdAo+IG9uIGNyeXB0
b2Rldi1saW51eCB3ZWJzaXRlLiBJdCBzZWVtcyB0aGF0IHNvbWUgcHJvamVjdHMgcG9pbnRlZCBv
dXQKPiB0aGF0IENSWVBUT19VU0VSX0FQSV9BRUFEIHNob3VsZCBiZSBlbmFibGVkIChlLmcuCj4g
aHR0cHM6Ly9naXRodWIuY29tL3NjYWxld2F5L2tlcm5lbC10b29scy9pc3N1ZXMvMTQ4KS4gSW5k
ZWVkLAo+IENSWVBUT19VU0VSX0FQSV9BRUFEIHdpbGwgc2VsZWN0IENPTkZJR19DUllQVE9fe0FF
QUQsU0tDSVBIRVJ9IChhbmQgc28KPiBDT05GSUdfQ1JZUFRPX3tBRUFELFNLQ0lQSEVSfTIpLgo+
IAo+IEhvd2V2ZXIsIGFzIEkgc2FpZCwgSSBjb3VsZCBiZSB0b3RhbGx5IHdyb25nLCBwZXJoYXBz
IHNlbGVjdGluZwo+IENSWVBUT19VU0VSX0FQSV9BRUFEIGlzIG5vdCBjb3JyZWN0IChldmVuIGlm
IGl0IGZpeGVzIHRoZSBidWlsZAo+IGZhaWx1cmUpLgo+IEhvcGVmdWxseSwgc29tZW9uZSB3aXRo
IG1vcmUga25vd2xlZGdlIG9mIGNyeXB0b2Rldi1saW51eCBzaG91bGQgYmUKPiBhYmxlIHRvIGZp
bmQgdGhlIGNvcnJlY3QgZml4LgoKICBJJ3ZlIHN1bW1hcml6ZWQgdGhpcyBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UgYW5kIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJu
b3V0Cgo+IAo+Pgo+PiBUaG9tYXMKPj4gLS0KPj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIg
YW5kIENFTywgQm9vdGxpbgo+PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwo+PiBodHRwczovL2Jvb3RsaW4uY29tCj4gCj4gQmVzdCBSZWdhcmRzLAo+
IAo+IEZhYnJpY2UKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
