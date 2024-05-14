Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94ABC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 23:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E24F741880;
	Tue, 14 May 2024 23:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ex72b64yrT-o; Tue, 14 May 2024 23:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC0C541889
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC0C541889;
	Tue, 14 May 2024 23:39:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 185391BF25B
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 23:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04C9E80ED4
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 23:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usXH0OL2QZCu for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 23:38:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A98FC80EAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A98FC80EAE
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A98FC80EAE
 for <buildroot@buildroot.org>; Tue, 14 May 2024 23:38:58 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51f74fa2a82so7387383e87.0
 for <buildroot@buildroot.org>; Tue, 14 May 2024 16:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715729936; x=1716334736;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1g/gWsDWCppWWjNVHBz0FfJxSgtIWNYDszEAmA7wic=;
 b=TnfO07FkVsEgjootXbS2TAIBAIQpmNUekjLuQ7vhEPKx7mMzWuapmA+nUIxVDruxgE
 QwT+Gn4KDQ6wEqsHjh7qjIQDLfbbvhWH6GsUC54Pz/jDfULnpAwobC8xuPkadC1vZ+/B
 uAGQxoczMnmwRx7gWynuF7n2RVFK1U/sdi3WlG1v0qFfsKS+iFe40+riFbbYuyjGYL/B
 u0ZvPrK/07TAWcjfIHkEAwOm3wHlqdngkMxcqQhqfkrGkyODuyz1tlWPUd8uoaT/nPPG
 wQhQOS882JFdBcFOKIyiqA+wcPcDtVUc1HUdMvQBI0UlCjk+GI7YPvznOj8qH6KYp/n6
 d6+Q==
X-Gm-Message-State: AOJu0Yw2+q2sF3AmyUWBIDsjGywuef+h+SulcE3hccQtXmquUB4OctTT
 6lnWZDnqUBf3lyh51YMbAey9Sma+e1aHoj5MaUwgKG+SwIHTUWzvqI9fTmpf35oGDgKfEJjtPna
 SK+U=
X-Google-Smtp-Source: AGHT+IERkl7VEdecORefckKnYOkqYSLtpMpIcvhfqas5N3CKZl3A2UntI2g2GCZxR53BUuq/te/4hw==
X-Received: by 2002:a05:6512:789:b0:51f:621:fdaa with SMTP id
 2adb3069b0e04-5220fc7bd97mr11575409e87.18.1715729935075; 
 Tue, 14 May 2024 16:38:55 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad5fdsm2331183e87.24.2024.05.14.16.38.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 16:38:54 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e538a264e0so67212481fa.1
 for <buildroot@buildroot.org>; Tue, 14 May 2024 16:38:53 -0700 (PDT)
X-Received: by 2002:a2e:7004:0:b0:2e1:f05f:6424 with SMTP id
 38308e7fff4ca-2e51fe530bemr125400491fa.15.1715729933452; Tue, 14 May 2024
 16:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240307015107.2908128-1-christian@aperture.us>
 <20240514102318.1cdeba18@windsurf>
 <CA+h8R2peXHHtzBXdg-uW7bptT8mmGY+kgzbvPNFW9MQy3xOJhQ@mail.gmail.com>
In-Reply-To: <CA+h8R2peXHHtzBXdg-uW7bptT8mmGY+kgzbvPNFW9MQy3xOJhQ@mail.gmail.com>
Date: Tue, 14 May 2024 16:38:41 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rgJ1AKsqBCAFkf8xRaf+8EmnMmh9uKj+nwq_WphWECbQ@mail.gmail.com>
Message-ID: <CA+h8R2rgJ1AKsqBCAFkf8xRaf+8EmnMmh9uKj+nwq_WphWECbQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1715729936; x=1716334736; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1g/gWsDWCppWWjNVHBz0FfJxSgtIWNYDszEAmA7wic=;
 b=DQLcI9ZoavWv4J6OF1DsDgWW3njXd6hpVMmUa/rpLnoQ+3A3GS+KghcrTSSlR7vqV3
 R6bg6uOJbc8Za7/E9ytm3MnHhzzMHaBEK3OTja9Ord1PC20hoUnq2jO3TlF83g+tEvyn
 X5bDSt6wsW7BpAHcvKd9H9mUE9LOiZsilz1ZcJdf872xyDCGpnRvZnD7EaxTD1mPzje+
 U6LzE910Z9ye1v0uVQvJV4fkcClYHXXrmDChQTGYjPFVMIcUpAwiGSGVdQfjlvUU92Kj
 mCfsCdLE/eP12hYW4EOeT0YrtAqs/1yn5GsiF3DlZcCDmk5RJWkNP6TaKJ/6SC4GLWTq
 xG+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=DQLcI9Zo
Subject: Re: [Buildroot] [PATCH v1 1/3] package/go-bootstrap-stage2: bump
 version to go1.19.13
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gVHVlLCBNYXkgMTQsIDIwMjQgYXQgNDozOeKAr0FNIENocmlzdGlhbiBT
dGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDE0LCAy
MDI0LCAxOjIz4oCvQU0gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGlu
LmNvbT4gd3JvdGU6Cj4+Cj4+IEkgZG9uJ3QgdGhpbmsgaXQncyB0aGlzIHBhdGNoIGNhdXNpbmcg
dGhlIGlzc3VlLCBidXQgd2UgaGF2ZSBhIEdvIGJ1aWxkCj4+IGZhaWx1cmUgaW4gb3VyIEdpdGxh
YiBDSToKPj4KPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
am9icy82ODMzMzA3ODIzCj4+Cj4+IENvdWxkIHlvdSBoYXZlIGEgbG9vaz8KPgo+IFRoaXMgbG9v
a3MgbGlrZSB3ZSBuZWVkIHRvIHBhc3MgLWJ1aWxkdmNzPWZhbHNlIHRvIEdvLiBJJ2xsIGhhdmUg
YSBsb29rIGF0IHN1Ym1pdHRpbmcgYSBwYXRjaCBmb3IgdGhpcy4KCkkgZm91bmQgdGhpcyBjb21t
aXQgaW4gR28gd2hpY2ggZml4ZWQgJiBhZGRlZCBhIHRlc3QgdG8gZW5zdXJlIHRoYXQKLWJ1aWxk
dmNzPWZhbHNlIGlzIHNldCB3aGVuIEdPUk9PVF9CT09UU1RSQVAgaXMgc2V0ICh3aGljaCBpdCB3
YXMgaW4KdGhlIGZhaWxpbmcgam9iKS4KCmNvbW1pdCA0MmE0NjIwNmI5N2NhN2NmNDI0NmQzYzEy
MzBhNzBjZjQyYWQ1YmIwCkF1dGhvcjogQnJ5YW4gQy4gTWlsbHMgPGJjbWlsbHNAZ29vZ2xlLmNv
bT4KRGF0ZTogICBGcmkgU2VwIDkgMTc6Mjk6MTIgMjAyMiAtMDQwMAoKICAgIGNtZC9nbzogb21p
dCBWQ1Mgc3RhbXBpbmcgZHVyaW5nIGJvb3RzdHJhcAoKICAgIGNtZC9kaXN0IGNhbid0IGVhc2ls
eSBoYXJkLWNvZGUgLWJ1aWxkdmNzPWZhbHNlIGJlY2F1c2Ugbm90IGFsbAogICAgdmVyc2lvbnMg
b2YgY21kL2dvIHN1cHBvcnRlZCBmb3IgYm9vdHN0cmFwcGluZyByZWNvZ25pemUgdGhhdCBmbGFn
LgoKICAgIEhvd2V2ZXIsIHdlIGRvbid0IHdhbnQgdG8gc3RhbXAgdGhlIGJvb3RzdHJhcCBiaW5h
cmllczogdGhlIHN0YW1waW5nCiAgICBpcyByZWR1bmRhbnQgd2l0aCB0aGUgVkVSU0lPTiBmaWxl
IHdyaXR0ZWQgZHVyaW5nIGJvb3RzdHJhcHBpbmcgKHdoaWNoCiAgICBpcyB3aHkgaXQgaXMgbm9y
bWFsbHkgb21pdHRlZCBmb3Igc3RhbmRhcmQtbGlicmFyeSBwYWNrYWdlcyBhbmQKICAgIGNvbW1h
bmRzKSwgYW5kIGl0IG1heSBhbHNvIGludGVyZmVyZSB3aXRoIGJ1aWxkaW5nIHRoZSBHbyByZXBv
IGZyb20gYQogICAgc291cmNlIHRhcmJhbGwgb3IgemlwIGZpbGUuCgogICAgRml4ZXMgIzU0ODUy
LgoKICAgIENoYW5nZS1JZDogSWYyMjNmMDk0YWYxMzdjNGMyMDJkNmJmNjIyNjE5YmQyZGEzOTdl
YzQKICAgIFJldmlld2VkLW9uOiBodHRwczovL2dvLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2Mv
Z28vKy80MzI0MzUKClNlZTogaHR0cHM6Ly9naXRodWIuY29tL2dvbGFuZy9nby9jb21taXQvNDJh
NDYyMDZiOTdjYTdjZjQyNDZkM2MxMjMwYTcwY2Y0MmFkNWJiMAoKSG93ZXZlciBpdCBzZWVtcyB0
aGF0IGJvb3RzdHJhcCBzdGVwIGlzIGZhaWxpbmcgZHVlIHRvIC1idWlsZHZjcz1mYWxzZQpub3Qg
YmVpbmcgc2V0LgoKSSB3aWxsIHRyeSB0byBkZWJ1ZyBmdXJ0aGVyLiBUaGlzIGNvdWxkIGJlIGEg
R28gcmVncmVzc2lvbi4KCkJlc3QgcmVnYXJkcywKQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
