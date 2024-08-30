Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAB9CA1003
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 15:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06A5B84503;
	Fri, 30 Aug 2024 15:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dj1NWir4tuUY; Fri, 30 Aug 2024 15:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC9EB8450A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC9EB8450A;
	Fri, 30 Aug 2024 15:32:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 900A31BF2B3
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 15:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A74F61412
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 15:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sA3u6F3w5qTB for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 15:32:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31E1B611EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E1B611EA
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31E1B611EA
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 15:32:21 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8696e9bd24so238896966b.0
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 08:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031940; x=1725636740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVGJsBsxFLOcJZBexvXqaQsai65rzp7NcC8fxBTwNGs=;
 b=K11Rfre/d11wUuyiIO/63jVVBHG8mZhUmcLsTnWL10EGporzcQxOjT73BilQZpOnNY
 ZUczCHvPtWhLCpxU5Y70bJ62Q0tD62SE5z8b+2cikgv8OvtsJ37whuAuhiYTJ88Woe+l
 pOabnWi319lgD4Dvb4yda2IGXpfvGndNDr+HJWMXbZ/Cx1Wdt0+GlFmrX5YXZSiVtshX
 LyiN+c8o6sv0vejMWzGRlXFU6h6kBCg1s/RzMBNgk1QVVnXVhqCNgWgNKMpS9Vc8QSSm
 YQa31qY0Qh9BWKpeReXqFAunhswFiyVhYTAIH8FrNgifMOGz/lxo/hNHsV7k377YYDHu
 7o/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeONNKk9qvR/avdp4gcc9Ec7iMsCiX5JwX0dKbHuc6Tr0a0z/R187IQXyGrfOC84cJYx19LS1Em84=@buildroot.org
X-Gm-Message-State: AOJu0Yy7y0CSArGAksg+o4LrQBVYmhemkJj3qdXopamQKjl8A86hiqkz
 x4sQZ30vP8xdisVetCnB7UoefuTDxe/FS63eWj9XxKkMd0kv/+BG7OdQBg194kKZ6QBkXuNkqk0
 GL4o+Pt5+/gaUR1aet7BDL1JlSTbPMXgOxCbOuA==
X-Google-Smtp-Source: AGHT+IHyo3b6Eo2xiorAxtsF+LUB3nOynjeaV8GUgVKWI+baBUx6Z5NQOzHZgPQySYEyiJaMKyBt7YtvTnZR4faqjVs=
X-Received: by 2002:a17:906:f589:b0:a86:8f2c:5cfa with SMTP id
 a640c23a62f3a-a897f789236mr520844266b.14.1725031939425; Fri, 30 Aug 2024
 08:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf> <87r0a994or.fsf@dell.be.48ers.dk>
 <20240828154253.206391b0@windsurf> <87ttf47nr6.fsf@dell.be.48ers.dk>
 <20240829234416.4131264b@windsurf> <87le0e32jm.fsf@dell.be.48ers.dk>
 <20240830172920.0ede0f66@windsurf>
In-Reply-To: <20240830172920.0ede0f66@windsurf>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 30 Aug 2024 17:32:07 +0200
Message-ID: <CAOf5uw=AF5kUu6B5EOhMLug-eG+d-GM4BAY=6RRNZACaG0wQ1Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725031940; x=1725636740;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVGJsBsxFLOcJZBexvXqaQsai65rzp7NcC8fxBTwNGs=;
 b=CUVsD9LpNLlqZna+heGYqbgAQ3Nzbd28i8jiomrshlhHMyIdc5DUXNM32QDvBGMEYM
 AOmWSJ5LXn3Muiw/T4KH/7l/ig+FQMzUYzQZUabQkBDn+ZrAmCI9neaEQid1QAaXgTtd
 bpifeQJRLerLuuQ+HXPtx3KjSQ2Wo8YGCS0to=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=CUVsD9Lp
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzCgpPbiBGcmksIEF1ZyAzMCwgMjAyNCBhdCA1OjI54oCvUE0gVGhvbWFzIFBldGF6
em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBQZXRl
ciwKPgo+IE9uIEZyaSwgMzAgQXVnIDIwMjQgMDk6MTQ6MzcgKzAyMDAKPiBQZXRlciBLb3JzZ2Fh
cmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+Cj4gPiBEb2VzIHN1Y2ggYSB0b29sIGV4
aXN0PyBJIGFtIG5vdCBhd2FyZSBvZiBvbmUuIElmIHNvLCBtYXliZSB3ZSBzaG91bGQKPiA+IHJl
Y29tbWVuZCB0aGF0IGluc3RlYWQgb2YgZGQgZm9yIHdyaXRpbmcgc2RjYXJkLmltZyBmcm9tIHRo
ZSBob3N0Pwo+Cj4gSSdtIG5vdCBhd2FyZSBvZiBhbnkgdG9vbCBsaWtlIHRoaXMuCj4KPiA+Cj4g
PiBBbnl3YXksIEkgZmluZCBibWFwIGEgYml0IGhhbGYtYmFrZWQsIEUuRy4gcmF0aGVyIHRoYW4g
d2FzdGluZyB0aW1lIChhbmQKPiA+IHNwYWNlKSBjb21wcmVzc2luZyBhbmQgZGVjb21wcmVzc2lu
ZyBhbGwgdGhlIGhvbGVzIHRoYXQgYXJlIHRoZW4ganVzdAo+ID4gaWdub3JlZCBpdCB3b3VsZCBt
YWtlIG1vcmUgc2Vuc2UgdG8gaGF2ZSBhIGZpbGUgZm9ybWF0IGVuY29kaW5nIHRoZQo+ID4gaG9s
ZXMgKEUuRy4gdGFyIC0tc3BhcnNlIG9yIHNvbWV0aGluZyBjdXN0b20pLCB0aGVuIG9wdGlvbmFs
bHkgY29tcHJlc3MKPiA+IHRoYXQgZm9yIHRyYW5zbWlzc2lvbiBhbmQgaGF2ZSBzb21ldGhpbmcg
c21hbGwgYW5kIHNpbXBsZSAoRS5HLiBub3QgaW4KPiA+IHB5dGhvbikgb24gdGhlIGhvc3QvdGFy
Z2V0IHRvIHdyaXRlIGl0IHRvIGEgZGV2aWNlLgo+Cj4gVGhlIEFuZHJvaWQgc3BhcnNlIGltYWdl
IGZvcm1hdCBsb29rcyBsaWtlIHRvIGJlIHdoYXQgeW91IHdhbnQuCj4gU2VlIGh0dHBzOi8vMm5l
dC5jby51ay90dXRvcmlhbC9hbmRyb2lkLXNwYXJzZS1pbWFnZS1mb3JtYXQuIFRoZXJlIGFyZSBz
b21lCj4gQy9DKysgdG9vbHMgYXQgaHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5jb20vcGxh
dGZvcm0vc3lzdGVtL2NvcmUvKy9tYXN0ZXIvbGlic3BhcnNlLwo+IHRvIGdlbmVyYXRlL21hbmlw
dWxhdGUgQW5kcm9pZCBzcGFyc2UgaW1hZ2VzLgo+CgpBcyBJIG1lbnRpb24gc29tZSB0aW1lIGFn
byBhbmRyb2lkIHNwYXJzZSBmb3JtYXQgY2FuIGJlIGdlbmVyYXRlIHdpdGgKZ2VuaW1hZ2UuY2Zn
CgppbWFnZSBzZGNhcmQtc3BhcnNlLmltZyB7CiAgICBhbmRyb2lkLXNwYXJzZSB7CiAgICAgICAg
aW1hZ2UgPSBzZGNhcmQuaW1nCiAgICB9Cn0KCk5vdGhpbmcgbmVlZHMgdG8gYmUgY2hhbmdlZC4g
RmFzdGJvb3Qgc2hvdWxkIGFibGUgdG8gaGFuZGxlIGl0CgpNaWNoYWVsCgo+IFRob21hcwo+IC0t
Cj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290
bGluLmNvbQoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCkNvLUZvdW5kZXIgJiBD
aGllZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcwCm1pY2hhZWxAYW1hcnVs
YXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQW1hcnVs
YSBTb2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBO
TApULiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQp3d3cuYW1h
cnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
