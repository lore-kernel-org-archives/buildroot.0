Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A5ECD8CB1
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 19:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 465AC4157A;
	Tue, 10 Oct 2023 19:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 465AC4157A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKoa-1lvGdsI; Tue, 10 Oct 2023 19:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C6E941527;
	Tue, 10 Oct 2023 19:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C6E941527
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0E191BF32B
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 19:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A38F81E93
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 19:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A38F81E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5rojEF2kPz2 for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 19:05:45 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67D5381E62
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 19:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67D5381E62
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so1003436066b.3
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 12:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696964743; x=1697569543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCyRW8ccwJ2YfXSbF5LgFKwfdBj6e+9DD37dm7zLMEE=;
 b=HLAmZsw9Rp87TPMf6wS1P9cYoaigRMWVMJ0uIE51fkvSoRBCtl538XmOUvLrW9qXc8
 ATGQhx3Lh8DdAj2xPYgLpg+NR3JLIOq6gR2Kc99/WnZYOe/YnNZ+TT5uzV0gS1ilZ785
 0Egp5h27P4RfTQF5gkv7GWA0KcmvbP+D/0roR7/GbhRidQbiOdmDaFWSyV0PUEe3qNzR
 Q75q8+XLDZVr+UqjqLPqdj/HHw8negbzl/fbaoJuaa9nPp2+tqx0siVKPND85ZtJ/hQk
 mL/MN/F4TSawfjiGE7wJmEsOTFSS4ruvyyHfTsfSEhGGRlZe11/JCg0uSdN+RRTQPtjO
 f2mA==
X-Gm-Message-State: AOJu0YzyMwZF1+vnz/8KlVvNrgs/LuXm8XYQ/6g/TvhA/QhuaAG55hJe
 Swlxqe/7PzYg7ai2OhS9RKFEYTnoTj6m01kg0/A7K2A1fhQ=
X-Google-Smtp-Source: AGHT+IFsvMbw3/7CqGM4y6bjRXDWoHZg6Q4qQWRbBnBkwoW2gC+izW+R+5BQ1JHB98AT7VWkPwZ7lmzZLoaDRcxvfjY=
X-Received: by 2002:a17:907:1dd7:b0:9ae:48df:2235 with SMTP id
 og23-20020a1709071dd700b009ae48df2235mr16288880ejc.55.1696964743203; Tue, 10
 Oct 2023 12:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAN=fXj3uioP_fhczziposSJ1A-t+QzE0kyYj8D5AqZVd8Gmt-A@mail.gmail.com>
 <e5f26a18-911b-1cc3-770f-1fdff91bc2e8@mind.be>
In-Reply-To: <e5f26a18-911b-1cc3-770f-1fdff91bc2e8@mind.be>
From: Charles Hardin <ckhardin@gmail.com>
Date: Tue, 10 Oct 2023 12:05:31 -0700
Message-ID: <CAN=fXj0cBh=sScwv9ZAzxKj-cAJay9_h0VNEEAT5skZUK1W-9w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696964743; x=1697569543; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCyRW8ccwJ2YfXSbF5LgFKwfdBj6e+9DD37dm7zLMEE=;
 b=cNh9wua6p9f8MC309HteSEOmQ7QoBPZwLhJ8bYIPWLqzAONwUgnp/jA52rxVyohBIF
 A/siBbe29aB1T2fqXKL+Gv56DbaW4uXIGyWqbv7bJgbm3PYU7p6I0dOjpwv9QYIGmp4i
 z9lpwIXvZtAdBsqdTFLEfyvUO6xQCnqu/5pTG5/bNOn2R3zvfxcoR1MDAZZU/q9bkSdo
 qAm09N06KedS6M0oToiq6lhBeZoKo+ZEoNfgBGr4NQDx9uyIMPDPOu75mRmPL6uf2DTs
 ayhLfQ6Je2Ki46NPCJWxYtn0/0xB+jUemYmo4PYQkm2rxTHZixRjxEZfsy0m10EJuocK
 Osgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cNh9wua6
Subject: Re: [Buildroot] [RFC] Per-package and relocatable SDKs problem?
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
Cc: Charles Hardin <charles.hardin@chargepoint.com>,
 Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0CgpPbiBUdWUsIE9jdCAxMCwgMjAyMyBhdCAxMToxMOKAr0FNIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPiAgIEhpIENoYXJsZXMsCj4KPiBP
biAwOS8xMC8yMDIzIDIzOjM3LCBDaGFybGVzIEhhcmRpbiB3cm90ZToKPiA+IEZvciB0aGUgY3Vy
aW91cywKPiA+Cj4gPiBXZSBoYXZlIGRpc2NvdmVyZWQgYSBwcm9ibGVtIGluIHRoYXQgdGhlIHBl
ci1wYWNrYWdlIGJ1aWxkIG9mIHRoZSBob3N0Cj4gPiBkaXJlY3RvcnkgaXMgZG9pbmcgYW4gcnN5
bmMgdG8gZmluYWxpemUgdGhlIHRyZWUgZnJvbSB0aGUgbGFzdAo+ID4gcGVyLXBhY2thZ2UgZGly
ZWN0b3J5IGluIHRoZSBkZXBlbmRlbmN5IGNoYWluIChpbiBvdXIgY2FzZSBiZWxvdyB0aGlzCj4g
PiBpcyBxdDV0b29scykuIFRoaXMgbWVhbnMgdGhhdCBzZXZlcmFsIHRleHQgZmlsZXMgbGlrZSB0
aGUgb25lIGJlbG93Cj4gPiAoc2hhc3VtKSBjb250YWluIHRoZSBwZXItcGFja2FnZSBkaXJlY3Rv
cnkgcGF0aCBpbiB0aGVtLgo+ID4KPiA+IEZvciBleGFtcGxlIC0gYSBwZXItcGFja2FnZSBidWls
ZCBhbmQgY2hlY2sgdGhlIEJVSUxEIGRpcmVjdG9yeSB0bwo+ID4gY2hlY2sgdGhlIHNoYXN1bSBz
Y3JpcHQKPiA+Cj4gPiAgICAgICQgaGVhZCAtNSBob3N0L2Jpbi9zaGFzdW0KPiA+ICAgICAgIyEv
aG9tZS91YnVudHUvZW1iLXBsYXRmb3JtLWJ1aWxkL2ZhbGNvbi91Y2IvcGVyLXBhY2thZ2UvcXQ1
dG9vbHMvaG9zdC9iaW4vcGVybAo+ID4gICAgICAgICAgZXZhbCAnZXhlYwo+ID4gL2hvbWUvdWJ1
bnR1L2VtYi1wbGF0Zm9ybS1idWlsZC9mYWxjb24vdWNiL3Blci1wYWNrYWdlL3F0NXRvb2xzL2hv
c3QvYmluL3BlcmwKPiA+IC1TICQwICR7MSsiJEAifScKPiA+ICAgICAgICAgICAgICBpZiAwOyAj
IF4gUnVuIG9ubHkgdW5kZXIgYSBzaGVsbAo+ID4gICAgICAjIXBlcmwKPiA+ICAgICAgLi4uIHNu
aXAgc25pcCAuLi4KPiA+Cj4gPiBUaGlzIHdvcmtzIGluIHRoZSBidWlsZCBwYXRoIGJ1dCB3aWxs
IGZhaWwgd2hlbiB0aGUgU0RLIGlzIG1hZGUgYW5kCj4gPiByZWxvY2F0ZWQgYmVjYXVzZSB0aGUg
cmVsb2NhdGUtc2RrLnNoIHNjcmlwdCBkb2Vzbid0IGhhbmRsZQo+ID4gcGVyLXBhY2thZ2UgcGF0
aHMuCj4gPgo+ID4gICAgICAjIE1ha2Ugc3VyZSBmaWxlIHVzZXMgdGhlIHJpZ2h0IGxhbmd1YWdl
Cj4gPiAgICAgIGV4cG9ydCBMQ19BTEw9Qwo+ID4gICAgICAjIFJlcGxhY2UgdGhlIG9sZCBwYXRo
IHdpdGggdGhlIG5ldyBvbmUgaW4gYWxsIHRleHQgZmlsZXMKPiA+ICAgICAgZ3JlcCAtbHIgIiR7
T0xEUEFUSH0iIC4gfCB3aGlsZSByZWFkIC1yIEZJTEUgOyBkbwo+ID4gICAgICAgICAgaWYgZmls
ZSAtYiAtLW1pbWUtdHlwZSAiJHtGSUxFfSIgfCBncmVwIC1xICdedGV4dC8nICYmIFsKPiA+ICIk
e0ZJTEV9IiAhPSAiJHtMT0NGSUxFfSIgXQo+ID4gICAgICAgICAgdGhlbgo+ID4gICAgICAgICAg
ICAgIHNlZCAtaSAic3wke09MRFBBVEh9fCR7TkVXUEFUSH18ZyIgIiR7RklMRX0iCj4gPiAgICAg
ICAgICBmaQo+ID4gICAgICBkb25lCj4gPgo+ID4KPiA+IFRoZSBPTERQQVRIIGlzIHRoZSBvbGQg
bG9jYXRpb24gb2YgdGhlIGRpcmVjdG9yeSB3aXRob3V0IHRoZSBjb25jZXB0Cj4gPiBvZiB0aGUg
cGVyLXBhY2thZ2UgcGF0aHMgaW4gdGhlIHRyZWUuIFNvLCBpcyB0aGlzIHNvbWV0aGluZyB0aGF0
IGlzCj4gPiBrbm93bj8gVHJpZWQgc2VhcmNoaW5nIHRoZSBtYWlsaW5nIGxpc3QgYW5kIGNvbW1p
dHMgYW5kIGRpZG4ndCBzZWUgYQo+ID4gcmVmZXJlbmNlIHRvIHRoaXMgcHJvYmxlbSBzbyB3YXMg
YSBiaXQgY3VyaW91cy4KPgo+ICAgSSBiZWxpZXZlIHRoYXQgc2hvdWxkIGJlIGZpeGVkIGJ5IFsx
XS4KPgo+ICAgQXBwYXJlbnRseSBub2JvZHkgZWxzZSBlbmNvdW50ZXJlZCB0aGlzIHByb2JsZW0g
dXAgdG8gbm93IGJlY2F1c2UgdGhhdCBwYXRjaAo+IG5ldmVyIHJlY2VpdmVkIGFueSBBY2tlZC1i
eSBvciBUZXN0ZWQtYnkgOi0pCj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQKPgo+IFsxXQo+IGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjEy
MjcxNTQzMDAuMTA1NTYtMS1icmFuZG9uLm1haWVyQGNvbGxpbnMuY29tLwo+CgpDb25maXJtZWQg
LSB0aGlzIGZpeGVkIHRoZSBwcm9ibGVtLiBUaGFua3MuCgpBcHBsaWVkIHRoZSBwYXRjaCBmb3Ig
b3VyIHByb2plY3QgLSBob3BlZnVsbHkgaXQgZ2V0J3MgbWVyZ2VkIGludG8gbWFpbmxpbmUuCgo+
Cj4KPiA+Cj4gPiBDaGFybGVzCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
