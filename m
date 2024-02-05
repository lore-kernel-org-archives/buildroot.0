Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AF6C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C190940135;
	Mon,  5 Feb 2024 17:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C190940135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COOTUYkN75px; Mon,  5 Feb 2024 17:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8610C40162;
	Mon,  5 Feb 2024 17:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8610C40162
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01A321BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE86D60AC3
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE86D60AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8okkRF512FnI for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:49:46 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B729E606E6
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B729E606E6
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33929364bdaso2931564f8f.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 09:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707155384; x=1707760184;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2udClbaEHptUKU9dSHey5487NthanTT30A2SZ7crxk=;
 b=j9pgpnWMBJsc7nrb9IaLv4kBolL2w5QuZJj4uGu/qKD/R8Mw9C7iVwz4xMk7thXcIX
 9xeJw+cHKftBdS6gM539FxBPVMMOPY9buO/8Rdk3ULYZUOUKDZQTrihTLqesDUR9z5Qx
 pz9r1RCPqN+H9kVWdmuERzCu+BvJFLjj1YfP8GwAjWIZtcZ5LjR22I5/uhJ9JRakSnH2
 d3U4XgPcoS8TZj0Mn0uNpRUiFMlGLWJ1FObUyHpMIx+wml1DVQiI5x4ysFCJgo/sgJhS
 TnUX4PWEDaQdYBQKfs69agtRdGxQoNwIzSzAc/wjm2Kxb0yDxB8IH4BUd5Xlr2NpkB61
 q3IQ==
X-Gm-Message-State: AOJu0YwpJPRDJLm4jo6+Msb5uyTHNdp1YuXVwJDFJUmN1qKa64HgJ8Rw
 6SET5AOML+AWyPFdRL69hcqTOVUdo7Fnsh763sEQt/r7aeMuyF5U4I4erweo+lguJqUx1RR/oTl
 zw79Kce+up2d+hzxkElxKBRSxnzZXHAhk4zoItA==
X-Google-Smtp-Source: AGHT+IFcg1i/NK1GSvvMnQsyBS1QgGb8+nRoo5fGB5tw2KoGdWdc15VK3RuiWpQKbA76Jnqqn+ZEOIyYRE97GkLBNrY=
X-Received: by 2002:a5d:44c4:0:b0:33b:305c:9de7 with SMTP id
 z4-20020a5d44c4000000b0033b305c9de7mr170782wrr.50.1707155383712; Mon, 05 Feb
 2024 09:49:43 -0800 (PST)
MIME-Version: 1.0
References: <20240113201532.121274-1-ju.o@free.fr> <Zazvzc8l00sd25pH@landeda>
In-Reply-To: <Zazvzc8l00sd25pH@landeda>
From: Romain NAOUR <romain.naour@smile.fr>
Date: Mon, 5 Feb 2024 18:49:32 +0100
Message-ID: <CAK-B9HS8LSjJCS2vQjAqrzn8aQMNUHGm-C=CfSg04r8kjpSY0g@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707155384; x=1707760184;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n2udClbaEHptUKU9dSHey5487NthanTT30A2SZ7crxk=;
 b=0tAT3Chyg7q9Wgb1Ipo2mB0gc0Ns/clcE6QtG+hZUQedRYBSWuo84NNd4AmxaFmBy7
 HOVUT/4airHztjcLn+w+y9cni/MV+HE3J3Ika/8MBitbyr9bDfdTkGq4DsN4R4hxkEvR
 WrAw0HjLzFnKJQW5imAjc95KlsuQIh2xIS+mcKXsc38tZM/wEKqz+65ktoqNOMnYQeGs
 XSa6EurXgYo5b8B4z6mo/ETfm2SClUFvWwPnUCNSslWDC24vN6nAD/ZpzDXWUOnhXtJ4
 1VD5ywQqVd4BypeJnV2M3V27tMKsPnEjvBptDCgcYYVutYHpc7EeTjaobS7nJA0Z85HF
 jXCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0tAT3Chy
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add netcat runtime test
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBBbGwsCgpPbiBTdW4sIEphbiAyMSwgMjAyNCBhdCAxMToyMOKAr0FNIFlh
bm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEp1bGllbiwg
QWxsLAo+Cj4gT24gMjAyNC0wMS0xMyAyMToxNSArMDEwMCwgSnVsaWVuIE9saXZhaW4gc3Bha2Ug
dGh1c2x5Ogo+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4K
Pgo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpJdCBzZWVtcyB0aGlzIHRlc3QgaXMgZmFp
bGluZyBpbiBnaXRsYWItY2kgZm9yIHNvbWUgcmVhc29uOgpodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzYwOTM4NTQ2NjQKCmNhbiB5b3UgaGF2ZSBhIGxv
b2s/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4K
Pgo+ID4gLS0tCj4gPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCj4gPiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZXRjYXQu
cHkgfCA0MSArKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5z
ZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X25ldGNhdC5weQo+ID4KPiA+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIv
REVWRUxPUEVSUwo+ID4gaW5kZXggOTRhODljNjNkNS4uZDI1ZjMxZjBmZiAxMDA2NDQKPiA+IC0t
LSBhL0RFVkVMT1BFUlMKPiA+ICsrKyBiL0RFVkVMT1BFUlMKPiA+IEBAIC0xNzkxLDYgKzE3OTEs
NyBAQCBGOiAgICAgIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHo0LnB5Cj4g
PiAgRjogICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2x6b3AucHkKPiA+ICBG
OiAgIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbXRvb2xzLnB5Cj4gPiAgRjog
ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25jZHUucHkKPiA+ICtGOiAgIHN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmV0Y2F0LnB5Cj4gPiAgRjogICBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzLnB5Cj4gPiAgRjogICBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzLwo+ID4gIEY6ICAgc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9vY3RhdmUucHkKPiA+IGRpZmYgLS1naXQgYS9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25ldGNhdC5weSBiL3N1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmV0Y2F0LnB5Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uYjNlZmE0YzQwYgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4g
KysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZXRjYXQucHkKPiA+IEBA
IC0wLDAgKzEsNDEgQEAKPiA+ICtpbXBvcnQgb3MKPiA+ICtpbXBvcnQgdGltZQo+ID4gKwo+ID4g
K2ltcG9ydCBpbmZyYS5iYXNldGVzdAo+ID4gKwo+ID4gKwo+ID4gK2NsYXNzIFRlc3ROZXRDYXQo
aW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiA+ICsgICAgY29uZmlnID0gaW5mcmEuYmFzZXRlc3Qu
QkFTSUNfVE9PTENIQUlOX0NPTkZJRyArIFwKPiA+ICsgICAgICAgICIiIgo+ID4gKyAgICAgICAg
QlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUz15Cj4gPiArICAgICAgICBCUjJfUEFDS0FH
RV9ORVRDQVQ9eQo+ID4gKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15Cj4gPiArICAg
ICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gPiArICAgICAgICAiIiIK
PiA+ICsKPiA+ICsgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+ID4gKyAgICAgICAgY3Bpb19maWxl
ID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8iKQo+
ID4gKyAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFybXY1IiwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9wdGlvbnM9WyItaW5pdHJkIiwgY3Bpb19maWxlXSkKPiA+ICsgICAgICAg
IHNlbGYuZW11bGF0b3IubG9naW4oKQo+ID4gKwo+ID4gKyAgICAgICAgc2VsZi5hc3NlcnRSdW5P
aygibmMgLS12ZXJzaW9uIikKPiA+ICsKPiA+ICsgICAgICAgIGluX2ZpbGUgPSAiaW5wdXQuYmlu
Igo+ID4gKyAgICAgICAgb3V0X2ZpbGUgPSAib3V0cHV0LmJpbiIKPiA+ICsgICAgICAgIHBvcnQg
PSAxMjM0NQo+ID4gKwo+ID4gKyAgICAgICAgY21kID0gZiJkZCBpZj0vZGV2L3VyYW5kb20gb2Y9
e2luX2ZpbGV9IGJzPTFrIGNvdW50PTFrIgo+ID4gKyAgICAgICAgc2VsZi5hc3NlcnRSdW5Payhj
bWQpCj4gPiArCj4gPiArICAgICAgICBjbWQgPSBmIm5jIC1sIC1wIHtwb3J0fSA+IHtvdXRfZmls
ZX0gJiIKPiA+ICsgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kKQo+ID4gKwo+ID4gKyAgICAg
ICAgdGltZS5zbGVlcCgxKQo+ID4gKwo+ID4gKyAgICAgICAgY21kID0gZiJjYXQge2luX2ZpbGV9
IHwgbmMgLWMgMTI3LjAuMC4xIHtwb3J0fSIKPiA+ICsgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2so
Y21kKQo+ID4gKwo+ID4gKyAgICAgICAgY21kID0gZiJjbXAge2luX2ZpbGV9IHtvdXRfZmlsZX0i
Cj4gPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkKPiA+IC0tCj4gPiAyLjQzLjAKPiA+
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4g
LS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4g
fCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAg
IHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
