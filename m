Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FAEC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 13:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E4DB417E2;
	Wed,  6 Apr 2022 13:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0AMrSjadawN; Wed,  6 Apr 2022 13:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF10417C7;
	Wed,  6 Apr 2022 13:30:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB31E1BF29A
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 13:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B976B4177E
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 13:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fkmDIWQjNCCy for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 13:30:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 730274173E
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 13:30:33 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id w127so2348290oig.10
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iVEwLvWWeC7no+5UP63JF2wBoAJcH01g5hwkyKn9xI0=;
 b=PXpQgUeWDjC8BJ2uk9NPeZ7+sQ5ZY/r+BlOH8g/fmaX0+3RhZMdPjGGv7ajJeoSbPS
 mGQUMAs+0c8/y0ob9/Ka0TJwAlJzgXp6sdVVza/lrriFuihoTZJ31EHyd72UuVa+yVir
 JcDytBFU4YHhXYH9goDSOXfP240IxwKVUQc4mx2Oki71HPyOETAA0MTDGN5PPB6DU2on
 9yk4acQI0fACI2JAsTIPEgNQYSxQfSPoF3NSAuwLctiTVCWxp7WpwClc4cclEVRpRcpl
 6C7iDOEpP1z4WeRN7LqJLIJsWbUaNiJLrUBUrRC4deYO0j80vnty4OcN6xWJw+KIF4lk
 1XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iVEwLvWWeC7no+5UP63JF2wBoAJcH01g5hwkyKn9xI0=;
 b=4zU8TOzB66HFn2R6qK2xcBolE3opWRoppv3DhTY3dhJeIKWVaqyHseneA4YBrvMlU2
 RJXw13ZzA2oD+WMysra9j5menROXLMx6r17Bg8Wil/Pk2HeVbHVa7s3OXISWwEQjG6Zb
 UHDJFNCDz4iGIOguD0c/Ab2r18E26Wd3tDzwIGDz8GhqyxLqiHg2mWt/3aDdjLvvSpS2
 RyNSWLJOks8/iuPUKrLqLgB9uo5eaFacPfEjkRYUSeBeBMVJaSAeoPDXJxy6uTsLCLLf
 PKFDkAZmHxX4zDPYPsjdAalPmqwYwb0zGRhdOWHvi27XwZGzhODe+lf5NI1MEUDc9iIn
 1hlg==
X-Gm-Message-State: AOAM533ggnO3lZNHn7JUiZP/0bqCmGbkEw9BdpWc8HuMwM0+3SmK2nEl
 dMuDOzv0pQ6ErC6znZrAFRLjQLJygAQ/V3IPU4vsYoP4
X-Google-Smtp-Source: ABdhPJwAskPPEPxV811t/PfUvGFGroW909iEG1D+bVm9C/NU+89HxYon51jCAU5lW2jFnas0teP+9+LGiYjcrqNwASM=
X-Received: by 2002:aca:f1d5:0:b0:2ec:eaab:eb9b with SMTP id
 p204-20020acaf1d5000000b002eceaabeb9bmr3472584oih.228.1649251832340; Wed, 06
 Apr 2022 06:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <DU0P251MB0779CD19DBCAA7F149788B41E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W83fzfin6_1KXV8BTy=AmcguoAK86mm4bFRrviFHBKmPbw@mail.gmail.com>
 <DU0P251MB07793F7BF68D17755B50F5F1E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <20220405181815.5dd6d85e@gmx.net>
 <GV1P251MB0771B70C2179F1A7FEFD76FBE3E79@GV1P251MB0771.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W81e46JtetOtwT-RX8sJzVmEL_YMZrp89KBn1GCGrJfbyg@mail.gmail.com>
 <DU0P251MB0779CECB98F51521C578D9F2E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
In-Reply-To: <DU0P251MB0779CECB98F51521C578D9F2E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 6 Apr 2022 15:30:20 +0200
Message-ID: <CAPi7W8353UEfJS3YOKxp8OnVQ-HKfBwaujzVn30Hx4jehTmwoA@mail.gmail.com>
To: Tim Hammer <Tim.Hammer@orolia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiA2IGF2ci4gMjAyMiDDoCAxNDo1OCwgVGltIEhhbW1lciA8VGltLkhhbW1lckBvcm9s
aWEuY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBXZWQsIEFwciAwNiwgMjAyMiBhdCAwOTowODo1OEFN
ICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gTGUgbWVyLiA2IGF2ci4gMjAyMiDD
oCAwMzo1OCwgVGltIEhhbW1lciA8VGltLkhhbW1lckBvcm9saWEuY29tPiBhIMOpY3JpdCA6Cj4g
PiA+Cj4gPiA+IE9uIFR1ZSwgQXByIDA1LCAyMDIyIGF0IDA2OjE4OjE1UE0gKzAyMDAsIFBldGVy
IFNlaWRlcmVyIHdyb3RlOgo+ID4gPiA+IEhlbGxvIFRpbSwKPiA+ID4gPgo+ID4gPiA+IE9uIFR1
ZSwgNSBBcHIgMjAyMiAxMjoxNToxNCArMDAwMCwgVGltIEhhbW1lciA8VGltLkhhbW1lckBvcm9s
aWEuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gT24gVHVlLCBBcHIgMDUsIDIwMjIgYXQg
MDg6MTk6MDhBTSArMDIwMCwgRmFicmljZSBGb250YWluZSB3cm90ZToKPiA+ID4gPiA+ID4gRGVh
ciBUaW0sCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IExlIG1hci4gNSBhdnIuIDIwMjIgw6AgMDU6
NTQsIFRpbSBIYW1tZXIgPFRpbS5IYW1tZXJAb3JvbGlhLmNvbT4gYSDDqWNyaXQgOgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT24gU3VuLCBBcHIgMDMsIDIwMjIgYXQgMTI6MDM6MThQTSAr
MDIwMCwgRmFicmljZSBGb250YWluZSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IFVzZSBpbnRlcm5h
bCBiaW5kIGFzIGRoY3AgZG9lc24ndCBidWlsZCBzaW5jZSBidW1wIG9mIGJpbmQgdG8gdmVyc2lv
bgo+ID4gPiA+ID4gPiA+ID4gOS4xNi4yNiBpbiBjb21taXQgOGFkZWFlYzhhZmFjYmM2ODBlZGVi
YWU5MTUyNGY2MTQ0OTI2YWM5MiBhbmQgdXBzdHJlYW0KPiA+ID4gPiA+ID4gPiA+IGRvZXNuJ3Qg
cGxhbiB0byBmaXggaXQgYW55IHRpbWUgc29vbjoKPiA+ID4gPiA+ID4gPiA+IGh0dHBzOi8vZ2l0
bGFiLmlzYy5vcmcvaXNjLXByb2plY3RzL2RoY3AvLS9pc3N1ZXMvMjMzI25vdGVfMjc2ODgzCj4g
PiA+ID4gPiA+ID4gPgo+IC4uLgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEhvd2V2
ZXIsIEkgYXNzdW1lIHRoYXQgQlVJTERfQ0MgYW5kIEJVSUxEX0NGTEFHUyBpbiBiaW5kLm1rIHNo
b3VsZAo+ID4gPiA+ID4gPiBhbHNvIGJlIHVwZGF0ZWQ/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBk
byBub3QgaGF2ZSB0aGUgaXNzdWUgYnVpbGRpbmcgYmluZCAoOS4xNi4yNiksIHRoZXJlIGxpYi9k
bnMvTWFrZWZpbGUuaW4gc2VlbXMgdG8gYmUgYmV0dGVyIHdyaXR0ZW46Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gICAgICBnZW46IGdlbi5jCj4gPiA+ID4gPiAgICAgJHtIT1NUQ0N9ICR7SE9TVF9DRkxB
R1N9IC1JJHt0b3Bfc3JjZGlyfS9saWIvaXNjL2luY2x1ZGUgXAo+ID4gPiA+ID4gICAgICR7SE9T
VF9MREZMQUdTfSAtbyAkQCAke3NyY2Rpcn0vZ2VuLmMKPiA+ID4gPiA+Cj4gPiA+ID4gPiBQZXJo
YXBzIHdlIHNob3VsZCBiZSBwYXRjaGluZyB0aGF0IGZpbGUgaW5zdGVhZCBvZiB0aGUgY29uZmln
Pwo+ID4gPiA+Cj4gPiA+ID4gU2VlIGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290
L3RyZWUvcGFja2FnZS9iaW5kLzAwMDEtY3Jvc3MucGF0Y2gKPiA+ID4gPgo+ID4gPiA+IFJlZ2Fy
ZHMsCj4gPiA+ID4gUGV0ZXIKPiA+ID4gPgo+ID4gPgo+ID4gPiBZZXMsIHRoYXQgcmVpbmZvcmNl
cyBteSB0aGlua2luZy4gVW5mb3J0dW5hdGVseSwgdGhlIGJ1bmRsZWQgYmluZCBpcyBub3QgdW56
aXBwZWQgdW50aWwgdGhlIGJ1aWxkIHN0ZXAKPiA+ID4gYW5kIEkgaGF2ZSBub3QgZmlndXJlZCBv
dXQgYSBnb29kIHdheSB0byBnZXQgdGhpcyBkaWZmIGluIHBsYWNlLgo+ID4gPiBQZXJoYXBzIHNv
bWVvbmUgd2l0aCBtb3JlIGV4cGVyaWVuY2UgY2FuIHNlZSB0aGUgc29sdXRpb24gdGhhdCBpcyBl
bHVkaW5nIG1lPwo+ID4KPiA+IE15IGJhZCwgSSBtYWRlIGEgdHlwbyBpbiBteSBmaXJzdCBtYWls
LCB5b3Ugc2hvdWxkIHVzZSAkKEhPU1RDQykgYW5kCj4gPiBub3QgJChIT1NUX0NDKS4KPgo+IFdv
dywgaG93IG1hbnkgdGltZXMgZGlkIEkgbG9vayBhdCB0aG9zZSBsaW5lcyBhbmQgbm90IHNlZSB0
aGUgZGlmZmVyZW5jZSEgOy0oCj4gVGhhbmtzIGZvciBjYXRjaGluZyB0aGF0IQo+Cj4gPiBQYXRj
aGluZyBiaW5kIGlzIG5vdCBuZWVkZWQuCj4gPiBJIGNhbiBzZW5kIHRoZSBwYXRjaCBvciBsZXQg
eW91IGhhbmRsZSBpdC4KPgo+IEkgYW0gc3RpbGwgY29uY2VybmVkIGFib3V0IG15IGFiaWxpdHkg
dG8gdmVyaWZ5LQo+IEkgYWRkZWQgImNvcnJlY3Rpb25zIiBmb3IgQlVJTERfQ0ZMQUdTICYgQlVJ
TERfTERGTEFHUyBzbyB0aG9zZSBtYXRjaCB0aGUgY2hhbmdlcyBpbiBiaW5kLm1rLAo+ICAgICAg
ICAgLURIQ1BfQklORF9FWFRSQV9DT05GSUcgPSBCVUlMRF9DQz0nJChUQVJHRVRfQ0MpJwo+ICAg
ICAgICAgKwo+ICAgICAgICAgK0RIQ1BfQklORF9FWFRSQV9DT05GSUcgPSBCVUlMRF9DQz0nJChI
T1NUQ0MpJwo+ICAgICAgICAgK0RIQ1BfQklORF9FWFRSQV9DT05GSUcgKz0gQlVJTERfQ0ZMQUdT
PSckKEhPU1RfQ0ZMQUdTKScKPiAgICAgICAgICtESENQX0JJTkRfRVhUUkFfQ09ORklHICs9IEJV
SUxEX0xERkxBR1M9JyQoSE9TVF9MREZMQUdTKScKPiBidXQgSSBhbSB1bnN1cmUgYWJvdXQgdGhl
IG90aGVycyB1c2VkIChCVUlMRF9DUFBGTEFHUywgQlVJTERfTElCUywgTEZTXyopLi4uCj4gICAg
ICAgICAke0JVSUxEX0NDfSAke0JVSUxEX0NGTEFHU30gLUkke3RvcF9zcmNkaXJ9L2xpYi9pc2Mv
aW5jbHVkZSBcCj4gICAgICAgICAke0xGU19DRkxBR1N9ICR7TEZTX0xERkxBR1N9IFwKPiAgICAg
ICAgICR7QlVJTERfQ1BQRkxBR1N9ICR7QlVJTERfTERGTEFHU30gLW8gJEAgJHtzcmNkaXJ9L2dl
bi5jIFwKPiAgICAgICAgICR7QlVJTERfTElCU30gJHtMRlNfTElCU30KPiBTaG91bGQgdGhvc2Ug
YmUgc2V0IHRvIGVtcHR5IHN0cmluZ3M/IE9yIGlzIGl0IHNhZmUgdG8gYXNzdW1lIHRoZXkgYXJl
IHVuZGVmaW5lZCBieSBkZWZhdWx0PwoKQlVJTERfQ1BQRkxBR1Mgc2hvdWxkIGJlIHNldCB0byBI
T1NUX0NQUEZMQUdTLgpJTUhPIGl0IGlzIHNhZmUgdG8gYXNzdW1lIHRoYXQgQlVJTERfTElCUyBh
bmQgTEZTXyogYXJlIGVtcHR5LgoKRmVlbCBmcmVlIHRvIHNlbmQgeW91ciBwYXRjaCB3aXRoIGEg
bGluayB0byB0aGUgYXV0b2J1aWxkZXIgZmFpbHVyZSBzdWNoIGFzOgoKRml4ZXM6CiAtIGh0dHA6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzdhNWNkZjMwODgxZDIwODgwNzk3NmNm
OTg5NjBjNWZlMmFiZmVkNTAKCkFybm91dCBvciB0aGUgb3RoZXJzIHdpbGwgbWFrZSBhIHNlY29u
ZCByZXZpZXcgYW5kIHNwb3QgYW55IHJlbWFpbmluZyBpc3N1ZXMuCgo+Cj4gPgo+IC4uLgo+ID4K
PiA+IEJlc3QgUmVnYXJkcywKPiA+Cj4gPiBGYWJyaWNlCj4KPiAuVGltCj4gVGltIEQuIEhhbW1l
cgo+IHRpbS5oYW1tZXJAb3JvbGlhLmNvbQo+Cj4KCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
