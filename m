Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7437BC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2144560E14;
	Thu, 22 Aug 2024 18:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvxSekWqtjN0; Thu, 22 Aug 2024 18:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F49260E18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F49260E18;
	Thu, 22 Aug 2024 18:34:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46B351BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32F0B403DB
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2uuSN_BTDZW for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D24F7403D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D24F7403D0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D24F7403D0
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:34:28 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e13cda45037so1146471276.3
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 11:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724351667; x=1724956467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkFj66yc7eyU9opBnAjnIF12xRYDmiX8QR7aRqVFw70=;
 b=O4C6FbHeCBhouxN59Qb97WIIaEHLAuXaOdfl3HdxYxDF/r5G0urUDgkaGdLFHAPslN
 Iqnoei/SPvFxfvoeTdshVn6Zhnl74EyL30qIdllHP4yIzhujve2hO7otU7NlIunJDxGj
 nEmS6AHHPVPtMJLIX01GKsSQbmhDbwDGV3kgOsMG/Vni1Hnd6l5mEBoqb1t3TgjoZwI1
 EhPDNrKyLYdvO18wVLp90kw1RZ6pXuvvfiafZ+6tDX2g2XUff2HohMrr8+ZHUlO0CBdv
 qegGATkFobOmSLtSgqOpUctkFRb2I16hWVlkMnJnX94DPY2sojOnqB6AesfWBCZE636Z
 g6Mg==
X-Gm-Message-State: AOJu0Yzuu9yBQ6x+iJQwlRW9nmsN+V3j3y69eZwaWMBkkFxCYBJupQIA
 +PLimjOWRbTnEftf5dU6FOfW97o/CrPACMYgt+tVtjeJGKP3gh84lWDZaZfsbzRJpOtApXgSktp
 47PVX/jmCnQUihd+DPQwUBGcbHKvbLDFyiej/kQ==
X-Google-Smtp-Source: AGHT+IGxgy/fy/WGTEwVAq/WKsJOQZwSnryv477yUsp6OXJoH0csaVW7XcCqP5kCKQatQyxmatHH4tzTdc7tanUAexs=
X-Received: by 2002:a25:2e4d:0:b0:e16:6785:1a5b with SMTP id
 3f1490d57ef6-e16678521b6mr7228262276.14.1724351667528; Thu, 22 Aug 2024
 11:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240820191927.2126281-1-dario.binacchi@amarulasolutions.com>
 <20240820191927.2126281-2-dario.binacchi@amarulasolutions.com>
 <ZsT1U7uCuV50ciCd@landeda>
In-Reply-To: <ZsT1U7uCuV50ciCd@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 22 Aug 2024 20:34:16 +0200
Message-ID: <CABGWkvrq4Kjo_fvXAJQxaZHyRViVJOz_XdrNHOnJM5XEcMj3kA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724351667; x=1724956467;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkFj66yc7eyU9opBnAjnIF12xRYDmiX8QR7aRqVFw70=;
 b=eXGixx3KH1O6f9ADg6sMIXj+aK4eKogwkPFP9yCSBj7Ri634Ex0yDMJrZinUVhzSdi
 BDkWF/WYlagyRLqUcNgkFi9pPfPc/VqqQxhre2eOZh5qadgjokaLg+CG1wdSc8FdPEMH
 9vOPgViUCKtf7MepmzMQMGPp7dpVJBTqIobxI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eXGixx3K
Subject: Re: [Buildroot] [PATCH v2 1/3] package/tinyinit: new package
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCk9uIFR1ZSwgQXVnIDIwLCAyMDI0IGF0IDk6NTjigK9QTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBEYXJpbywgYWxsLAo+Cj4g
T24gMjAyNC0wOC0yMCAyMToxOSArMDIwMCwgRGFyaW8gQmluYWNjaGkgc3Bha2UgdGh1c2x5Ogo+
ID4gVGhpcyBwYWNrYWdlIGNvbnRhaW5zIGEgTGludXggaW5pdCBzY3JpcHQgc3VpdGFibGUgZm9y
IHJlc291cmNlLWxpbWl0ZWQKPiA+IHN5c3RlbXMgd2hpY2ggY2FuIGJlIHVzZWQgYXMgYW4gYWx0
ZXJuYXRpdmUgdG8gdGhlIG9uZSBwcm92aWRlZCBieQo+ID4gQnVzeWJveC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgdjEgLT4gdjI6Cj4gPiAgLSBSZW5hbWUgdGluaXQg
dG8gdGlueWluaXQuCj4gPiAgLSBQdXQgdGhlIHNjcmlwdCBpbnNpZGUgdGhlIHRpbnlpbml0IHBh
Y2thZ2Ugd2l0aG91dCB0aGUgbmVlZCB0byB1c2UKPiA+ICAgIGEgZ2l0aHViIHJlcG8uCj4KPiBE
aWQgeW91IGFjdHVhbGx5IGZvcmdvdCB0byBnaXQtYWRkIHRoYXQgZmlsZT8KClllcywgeW91J3Jl
IHJpZ2h0LCBJIHRvdGFsbHkgZm9yZ290IGFib3V0IGl0LgpJJ20gc29ycnkuCgo+Cj4gWy0tU05J
UC0tXQo+ID4gZGlmZiAtLWdpdCBhL3N5c3RlbS9Db25maWcuaW4gYi9zeXN0ZW0vQ29uZmlnLmlu
Cj4gPiBpbmRleCAzMThjNTM4ZWYxZDAuLjllMTVhNzg1ZjNmMCAxMDA2NDQKPiA+IC0tLSBhL3N5
c3RlbS9Db25maWcuaW4KPiA+ICsrKyBiL3N5c3RlbS9Db25maWcuaW4KPiA+IEBAIC0xNDUsNiAr
MTQ1LDExIEBAIGNvbW1lbnQgInN5c3RlbWQgaGlnaGx5IHJlY29tbWVuZHMgTGludXggPj0gNC4x
NSIKPiA+ICAgICAgIGRlcGVuZHMgb24gQlIyX0lOSVRfU1lTVEVNRAo+ID4gICAgICAgZGVwZW5k
cyBvbiAhQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzRfMTUKPiA+Cj4gPiArY29uZmln
IEJSMl9JTklUX1RJTllJTklUCj4gPiArICAgICBib29sICJ0aW55IGluaXQiCj4gPiArICAgICBz
ZWxlY3QgQlIyX1BBQ0tBR0VfVElOWUlOSVQKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9T
S0VMRVRPTl9JTklUX05PTkUgaWYgQlIyX1JPT1RGU19TS0VMRVRPTl9ERUZBVUxUCj4KPiBJJ20g
bm90IHN1cmUgaXQgd2FycmFudHMgYW4gZW50cnkgaW4gdGhhdCBpbml0IHNlbGVjdGlvbi4gSSB0
aGluawo+IGNvcm5lci1jYXNlcyBsaWtlIHRpbnktaW5pdCBzaG91bGQgYmUgdHJlYXRlZCBhcyAi
bm8gaW5pdCBzeXN0ZW0iIGFuZAo+IHRoZSAiTm9uZSIgZW50cnkgYmVsb3cgYmUgdXNlZCBpbnN0
ZWFkIChpbiBmYWN0LCBJIHdvdWxkIGV2ZW4gYXJndWUgaXQKPiBzaG91bGQgYmUgbGFiZWxsZWQg
IkN1c3RvbSIgcmF0aGVyIHRoYW4gIk5vbmUiLCBiZWNhdXNlIHRoYXQncyB3aGF0IGl0Cj4gcmVm
ZXJzIHRvOiB1c2luZyBhIGN1c3RvbSBpbml0IHN5c3RlbSkuCj4KPiBXZSBhbHJlYWR5IGhhdmUg
dGluaSBhcyBhIHRpbnkgaW5pdHN5c3RlbSAobW9zdGx5IGFpbWVkIGF0Cj4gY29udGFpbmVyLWJh
c2VkIHdvcmxvYWRzKSwgd2hpY2ggaXMgbm90IGluIHRoZSBsaXN0LCBhbmQgSSBiZWxpZXZlCj4g
dGluaXktaW5pdCBzaG91bGQgYWxzbyBiZSBjb25zZGVyZWQgc2ltaWxhcmx5Li4uCj4KPiBGdXJ0
aGVybW9yZSwgd2UgbmVlZCB0byBoYXZlIGFuIGVudHJ5IGluIHRoYXQgbGlzdCBvZiBpbml0IHN5
c3RlbSB3aGVuCj4gd2UgbmVlZCB0byBoYXZlIGluZnJhc3RydWN0dXJlIGZvciBpdDogaW5zdGFs
bCBpbml0IHNjcmlwdHMgZm9yCj4gc3lzdi1saWtlLCBzeXN0ZW1kIHVuaXRzIGZvciBzeXN0ZW1k
LCBvcGVucmMgInVuaXRzIiBmb3Igb3BlbnJjLiBGb3IKPiB0aW55LWluaXQgKGFzIGZvciB0aW5p
KSwgdGhlcmUgaXMgYWJzb2x1dGVseSBubyBuZWVkIGZvciBhbnkgaW5mcmEgYXQKPiBhbGwsIHNv
IHRoZXkgYXJlIGFscmVhZHkgcHJvcGVybHkgc2VydmVkIGJ5IHNlbGVjdGluZyB0aGUgIk5vbmUi
IGVudHJ5Cj4gKGFuZCBzZWxlY3RpbmcgdGhlIHByb3BlciBwYWNrYWdlKS4KCk9rLCB0aGFuayB5
b3UgZm9yIHlvdXIgZXhwbGFuYXRpb25zLgoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPgo+
IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4gIGNvbmZpZyBCUjJfSU5JVF9OT05FCj4g
PiAgICAgICBib29sICJOb25lIgo+ID4gICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1NLRUxFVE9O
X0lOSVRfTk9ORSBpZiBCUjJfUk9PVEZTX1NLRUxFVE9OX0RFRkFVTFQKPiA+IC0tCj4gPiAyLjQz
LjAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJ
R04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+
IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAg
ICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKCgoKLS0g
CgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzEx
MDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFz
b2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
