Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4CBC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 05:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC15C60F24;
	Thu,  9 Nov 2023 05:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC15C60F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6WJ7rQtzVs5; Thu,  9 Nov 2023 05:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0487860F1B;
	Thu,  9 Nov 2023 05:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0487860F1B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF3771BF4E3
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 05:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E59D60F1B
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 05:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E59D60F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpyTpz2dDPoC for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 05:04:37 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8410860F10
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 05:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8410860F10
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7781bc3783fso30458285a.1
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 21:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699506276; x=1700111076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=spIbeDLpgEYV61e6c6AeRFVNjGbZQbiZNb0fvzWie/c=;
 b=j495wx1KEv76WQBwcXNrEkMpvZ3KZBSV2IMoITSRn5QXEqAJ7PonsOXrwsWCSSXhtv
 6l6z9equTR/quhTWdDjVwFZ5i3KTyv8Ld6MOPBB42HHrX4R8k1YIC0UPjeGialChp7Ue
 9vu1W57onJbiCQflWdJfNOKhGK33SpM38ucXItaIofAqkxxuyfSzlwWbJiWIeK2PX1mH
 qS+I4W1af02TsgGaCRVbYaErKa844tHJARUoe67HvCTuK0OLsXsYwSV2lmxffwvSvvxM
 Y4NWXr09go7I4Wc9lWydR9htmOrcsqQV0aOb4oG28Thco6CiEs0ILsRlN2ZwBhxA8gr/
 1RoA==
X-Gm-Message-State: AOJu0YxniPz3npi2E2B93nxDOXUYuu58/WUgNwlk0g9W+CAl65oU65Oh
 zZxNuM5p796zYRXuBIrLdFWVJoieJcVgVnCYoBw=
X-Google-Smtp-Source: AGHT+IGxS8Ze+tVC4ad/Ea6djsn9dnAEdBFSGIscY/sD/NBLF59HnSpu0A5429GUCj6YlDFZu05xxJWbfVY+wyHi6Gw=
X-Received: by 2002:a05:620a:2488:b0:76e:889d:855d with SMTP id
 i8-20020a05620a248800b0076e889d855dmr3889627qkn.67.1699506275923; Wed, 08 Nov
 2023 21:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20230722073533.3072853-1-bernd@kuhls.net>
 <20230819145155.GC1778688@scaer>
In-Reply-To: <20230819145155.GC1778688@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 8 Nov 2023 22:04:23 -0700
Message-ID: <CADvTj4rMoT3gwG8WULn_zpcQX7sQwT4wSejCyWXtZeYoHUuivQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699506276; x=1700111076; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=spIbeDLpgEYV61e6c6AeRFVNjGbZQbiZNb0fvzWie/c=;
 b=l4DyViKv9NrH6FGrcBBi/IF24oPzfn3xkwiUQgtkVdc+6ntXXS8C5cxYHLQcdrPXL+
 YkEil6PGCf82XhpnrXI4lB4MbTB8v4qUpWpMC9LKd604E5zcgSGNyfifAFDvZz2XylbV
 eD1l5VaCcbU+W0iHsXzAflQdnWwgimhHP+xfl4fb9B2xt9e01aqUcMYC0ObP4ms9LxQu
 GpUK+q1j7k3hW7foHiOBkKnxWCfPKOUYsGM94vuWgEJiRP2m0fDruk06MR9jc2SDz5j5
 I3XujevFjgIerdUZa6iwHxJk90HuWJqsyYo/6i2X31qNP/das3D94v3rvbzvOqI5Xwva
 dJBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l4DyViKv
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 1.2.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBBdWcgMTksIDIwMjMgYXQgODo1MuKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEJlcm5kLCBBbGwsCj4KPiArSmFtZXMgd2hvIHBy
ZXZpb3VzbHkgbG9va2VkIGF0IGEgbG90IG9mIG1lc29uIGNoYW5nZXMKPgo+IE9uIDIwMjMtMDct
MjIgMDk6MzUgKzAyMDAsIEJlcm5kIEt1aGxzIHNwYWtlIHRodXNseToKPiA+IFJlbGVhc2Ugbm90
ZXM6IGh0dHBzOi8vbWVzb25idWlsZC5jb20vUmVsZWFzZS1ub3Rlcy1mb3ItMS0yLTAuaHRtbAo+
Cj4gVW5mb3J0dW5hdGVseSwgd2UndmUgaGFkIHRvIHJldmVydCB0aGlzIGNoYW5nZSwgYXMgaXQg
Y2F1c2VkIHVuZm9yZXNlZW4KPiBicmVha2FnZSB0aGF0IGlzIG5vdCBlYXNpbHkgZml4ZWQuCj4K
PiBTcGVjaWZpY2FsbHksIHRoZSB3YXkgdGhlIGxpYnJhcnkgc2VhcmNoIHBhdGhzIGFyZSBmb3Jj
ZWQgaW50byB0aGUgbGluawo+IHN0ZXAgZm9yIG5hdGl2ZSBidWlsZHMsIGxpa2Ugd2UndmUgc2Vl
biBpbiBob3N0LXFlbXUuCj4KPiBTbywgbGV0J3MgdHJ5IHRvIGJ1bXAgbGF0ZXIsIHdoZW4gd2Ug
Y2FuIGhhdmUgYSBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvbgo+IHdoeSB0aGUgY2hhbmdlIHdhcyBt
YWRlIGFuZCBob3cgd2UgY2FuIGZpeCBpdC4KPgo+IE9uZSBsZWFkIGNvdWxkIGJlIHRvIHVkbmVy
c3RhbmQgd2h5IHNvbWUgbGlicyBhcmUgbGlua2VkIGJ5IGZ1bGwgYXB0aAo+IHdoaWxlIG90aGVy
cyBhcmUgbGlua2VkIGJ5IG5hbWU6Cj4KPiAgICAgL3BhdGgvdG8vaG9zdC9saWIvbGliZ2lvLTIu
MC5zbyAtTCAvcGF0aC90by9ob3N0L2xpYi8gLWxnbW9kdWxlLTIuMAo+Cj4gU28sIGlmIHlvdSBv
ciBKYW1lcyBjb3VsZCBsb29rIGludG8gdGhhdCBhbmQgdGFrZSB0aGUgbWF0dGVyIHdpdGgKPiB1
cHN0cmVhbSBhcyBhIGZvbGxvdyB1cCB0byBSb21haW4ncyBhbmQgb3RoZXJzJyByZXBvcnRzIFsw
XSBbMV0sIHRoYXQKPiB3b3VsZCBiZSBhd2Vzb21lLgo+Cj4gWzBdIGh0dHBzOi8vZ2l0aHViLmNv
bS9tZXNvbmJ1aWxkL21lc29uL2lzc3Vlcy8xMTkxNCNpc3N1ZWNvbW1lbnQtMTY3ODA5MDU2Ngo+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vbWVzb25idWlsZC9tZXNvbi9pc3N1ZXMvMTIxNDAKClRo
ZXJlJ3Mgc29tZSB0ZXN0IGNvZGUgaGVyZSB0aGF0IG1heSBmaXggdGhlIGlzc3VlLCBJIGFtIHVu
YWJsZSB0byByZXByb2R1Y2UKdGhlIGlzc3VlIG15c2VsZiwgc28gd291bGQgYmUgZ29vZCBpZiBz
b21lb25lIHdobyBjYW4gcmVwcm9kdWNlIGl0IGNhbiB0ZXN0OgpodHRwczovL2dpdGh1Yi5jb20v
bWVzb25idWlsZC9tZXNvbi9pc3N1ZXMvMTE5MTQjaXNzdWVjb21tZW50LTE3NjQ4ODAzMzgKCj4K
PiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL21lc29uL21lc29uLmhh
c2ggfCA0ICsrLS0KPiA+ICBwYWNrYWdlL21lc29uL21lc29uLm1rICAgfCAyICstCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbWVzb24vbWVzb24uaGFzaCBiL3BhY2thZ2UvbWVzb24vbWVzb24u
aGFzaAo+ID4gaW5kZXggY2IzNmI2NzRmYS4uMDJmYTE1MzVlZiAxMDA2NDQKPiA+IC0tLSBhL3Bh
Y2thZ2UvbWVzb24vbWVzb24uaGFzaAo+ID4gKysrIGIvcGFja2FnZS9tZXNvbi9tZXNvbi5oYXNo
Cj4gPiBAQCAtMSw0ICsxLDQgQEAKPiA+ICAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVj
a2luZyBwZ3Agc2lnbmF0dXJlCj4gPiAtIyBodHRwczovL2dpdGh1Yi5jb20vbWVzb25idWlsZC9t
ZXNvbi9yZWxlYXNlcy9kb3dubG9hZC8xLjEuMS9tZXNvbi0xLjEuMS50YXIuZ3ouYXNjCj4gPiAt
c2hhMjU2ICBkMDRiNTQxZjk3Y2E0MzlmYjgyZmFiN2QwZDQ4MDk4OGJlNGJkNGU2MjU2M2E1Y2Ez
NWZhZGI1NDAwNzI3YjFjICBtZXNvbi0xLjEuMS50YXIuZ3oKPiA+ICsjIGh0dHBzOi8vZ2l0aHVi
LmNvbS9tZXNvbmJ1aWxkL21lc29uL3JlbGVhc2VzL2Rvd25sb2FkLzEuMi4wL21lc29uLTEuMi4w
LnRhci5nei5hc2MKPiA+ICtzaGEyNTYgIDFjMGI2MzRmZTZiNmE3MDcyZTM5ODY0N2YxYmYzOTIw
NDg1NzcwNjhhNWM5MmFlNDRkMDQwODVkYWIwZGVkNmYgIG1lc29uLTEuMi4wLnRhci5nego+ID4g
IHNoYTI1NiAgY2ZjNzc0OWI5NmY2M2JkMzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYz
ZWIwMDM0MTdiYzUyM2QzMCAgQ09QWUlORwo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzb24v
bWVzb24ubWsgYi9wYWNrYWdlL21lc29uL21lc29uLm1rCj4gPiBpbmRleCA1MDNhY2E4YzI1Li44
ZWFiZTEwOGM0IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9tZXNvbi9tZXNvbi5tawo+ID4gKysr
IGIvcGFja2FnZS9tZXNvbi9tZXNvbi5tawo+ID4gQEAgLTQsNyArNCw3IEBACj4gPiAgIwo+ID4g
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPgo+ID4gLU1FU09OX1ZFUlNJT04gPSAxLjEuMQo+
ID4gK01FU09OX1ZFUlNJT04gPSAxLjIuMAo+ID4gIE1FU09OX1NJVEUgPSBodHRwczovL2dpdGh1
Yi5jb20vbWVzb25idWlsZC9tZXNvbi9yZWxlYXNlcy9kb3dubG9hZC8kKE1FU09OX1ZFUlNJT04p
Cj4gPiAgTUVTT05fTElDRU5TRSA9IEFwYWNoZS0yLjAKPiA+ICBNRVNPTl9MSUNFTlNFX0ZJTEVT
ID0gQ09QWUlORwo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+
IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
