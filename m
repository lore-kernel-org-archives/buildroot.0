Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9018C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 22:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1006F60F86;
	Sat, 14 Jan 2023 22:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1006F60F86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkLJZRC2ZqE4; Sat, 14 Jan 2023 22:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43D7F60F69;
	Sat, 14 Jan 2023 22:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43D7F60F69
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39E941BF3AA
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 22:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2043D40979
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 22:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2043D40979
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n51od1p0WBa9 for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 22:04:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D3EE40948
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D3EE40948
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 22:04:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 67362FF803;
 Sat, 14 Jan 2023 22:04:28 +0000 (UTC)
Date: Sat, 14 Jan 2023 23:04:27 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230114230427.1ccfc5ac@windsurf>
In-Reply-To: <VI1P190MB0493F59C8F6F866D287232FC9FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493F59C8F6F866D287232FC9FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673733868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZz0Fwl7TpbfAyJMjxiceZlgbvdqPiqeRi76WghzNHg=;
 b=WdE6+j98bRTliPCc6P3DW20691h49r4KkRmlAoMsOCMBZHTDml4yj6FYJvtcbGKiwGZmEQ
 FwTxdO5u1KgbRNuWMNLmMHuRZVBoEQ7IUp08YvP7z8zQSl2sKJZTVlfWk2lB8MW4Hm/Hz7
 UhCLIvPerNpJ12WNy3UKXAs6xsOO4eJtM+nQhIOKzzCZotO6iL+7mQV/0xYcI7gLRXn5bW
 fR5cukeCFEYe9/35TJleL7nFTyFc9QpwZzeZ/qu9mz8ftHJv/3/NyIOJyjN5Zv/TthhPaV
 48t/rGULHvQKuL6DjHZZkb249uORoLActB9UtMA+xy0O8VSRw/Ch5GzaAfDJhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WdE6+j98
Subject: Re: [Buildroot] [PATCH 2/3] package/freescale-imx/imx-gpu-viv: add
 IMX8 framebuffer support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Lang Daniel <d.lang@abatec.at>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxMCBKYW4gMjAyMyAwOTozMzoxNCArMDAwMApMYW5nIERhbmllbCB2aWEgYnVpbGRy
b290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEFjY29yZGluZyB0byBtZXRh
LWZyZWVzY2FsZSBbMF0gdGhlIGZyYW1lYnVmZmVyIG91dHB1dCBjYW4gYmUgZW5hYmxlZCBvbgo+
IElNWDggYnkgdXNpbmcgdGhlIHdheWxhbmQgbGlicmFyaWVzIHRvZ2V0aGVyIHdpdGggZWdsLnBj
Lgo+IAo+IFRlc3RlZCBvbiBhbiBpbXg4bW4gYnkgcnVubmluZyBrbXNjdWJlLiBFR0wgYW5kIEdM
RVMgc3VwcG9ydCBkZXRlY3RlZC4KCkluZGVlZC4gSSd2ZSBzZWVuIHNvbWV0aGluZyBzaW1pbGFy
IG9uIHRoZSBWaXZhbnRlIGJpbmFyaWVzIHVzZWQgb24KU1RNMzJNUDEgcGxhdGZvcm1zLCB3aGVy
ZSB0aGUgImZyYW1lYnVmZmVyIiBsaWJzIGFyZSBsaW5rZWQgYWdhaW5zdApsaWJ3YXlsYW5kIGV2
ZW4gdGhvdWdoIHRoZXkgZG9uJ3QgdXNlIGl0LgoKPiAtIyBMaWJyYXJpZXMgYXJlIGxpbmtlZCBh
Z2FpbnN0IGxpYmRybSwgZXhjZXB0IGZyYW1lYnVmZmVyIG91dHB1dCBvbiBBUk0KPiArIyBMaWJy
YXJpZXMgYXJlIGxpbmtlZCBhZ2FpbnN0IGxpYmRybSBhbmQgd2F5bGFuZCwgZXhjZXB0IGZyYW1l
YnVmZmVyIG91dHB1dCBvbiBBUk0KPiDCoGlmbmVxICgkKElNWF9HUFVfVklWX0xJQl9UQVJHRVQp
JChCUjJfYXJtKSxmYnkpCj4gLUlNWF9HUFVfVklWX0RFUEVOREVOQ0lFUyArPSBsaWJkcm0KPiAt
ZW5kaWYKPiAtCj4gLWlmZXEgKCQoSU1YX0dQVV9WSVZfTElCX1RBUkdFVCksd2F5bGFuZCkKPiAt
SU1YX0dQVV9WSVZfREVQRU5ERU5DSUVTICs9IHdheWxhbmQKPiArSU1YX0dQVV9WSVZfREVQRU5E
RU5DSUVTICs9IGxpYmRybSB3YXlsYW5kCj4gwqBlbmRpZgo+IMKgCj4gwqBkZWZpbmUgSU1YX0dQ
VV9WSVZfRVhUUkFDVF9DTURTCj4gwqDigILigILigILigILigIIkKGNhbGwgTlhQX0VYVFJBQ1Rf
SEVMUEVSLCQoSU1YX0dQVV9WSVZfRExfRElSKS8kKElNWF9HUFVfVklWX1NPVVJDRSkpCj4gwqBl
bmRlZgo+IMKgCj4gLWlmZXEgKCQoSU1YX0dQVV9WSVZfTElCX1RBUkdFVCksZmIpCj4gK2lmZXEg
KCQoSU1YX0dQVV9WSVZfTElCX1RBUkdFVCkkKEJSMl9hcm0pLGZieSkKPiArSU1YX0dQVV9WSVZf
QkFDS0VORF9ESVIgPSBmYgo+IMKgZGVmaW5lIElNWF9HUFVfVklWX0ZJWFVQX1BLR0NPTkZJRwo+
IMKg4oCC4oCC4oCC4oCC4oCCbG4gLXNmIGVnbF9saW51eGZiLnBjICQoQEQpL2dwdS1jb3JlL3Vz
ci9saWIvcGtnY29uZmlnL2VnbC5wYwo+IMKgZW5kZWYKPiAtZWxzZSBpZmVxICgkKElNWF9HUFVf
VklWX0xJQl9UQVJHRVQpLHdheWxhbmQpCj4gK2Vsc2UKPiArIyBGcmFtZWJ1ZmZlciBvdXRwdXQg
b24gSU1YOCAoQVJNNjQpIHVzZXMgZWdsLnBjCj4gKyMgYW5kIHRoZSBzYW1lIGxpYnJhcmllcyBh
cyB0aGUgd2F5bGFuZCBiYWNrZW5kLgo+ICtJTVhfR1BVX1ZJVl9CQUNLRU5EX0RJUiA9IHdheWxh
bmQKPiAraWZlcSAoJChJTVhfR1BVX1ZJVl9MSUJfVEFSR0VUKSx3YXlsYW5kKQo+IMKgZGVmaW5l
IElNWF9HUFVfVklWX0ZJWFVQX1BLR0NPTkZJRwo+IMKg4oCC4oCC4oCC4oCC4oCCbG4gLXNmIGVn
bF93YXlsYW5kLnBjICQoQEQpL2dwdS1jb3JlL3Vzci9saWIvcGtnY29uZmlnL2VnbC5wYwo+IMKg
ZW5kZWYKPiDCoGVuZGlmCj4gK2VuZGlmCgpPbiB0aGlzIHNlY29uZCBwYXJ0IEknbSBhIGJpdCBj
b25mdXNlZCBiZWNhdXNlIGluIHRoZSAiZmIiIGNhc2Ugb24KQVJNNjQgeW91J3JlIGRvbid0IGhh
dmUgYW55IGVnbC5wYyBwa2djb25maWcgZml4dXAuIEFyZSB5b3Ugc3VyZSB0aGlzCmlzIG5vcm1h
bD8KCkluZGVlZCB0aGUgY29kZSB5b3UgaGF2ZSBkb2VzIHRoaXM6CgppZiBmcmFtZWJ1ZmZlciBv
dXRwdXQgYW5kIEFSTToKCWluc3RhbGwgZWdsLnBjIGFzIGEgc3ltbGluayB0byBlZ2xfbGludXhm
Yi5wYwplbHNlOgoJaWYgd2F5bGFuZCBvdXRwdXQ6CgkJaW5zdGFsbCBlZ2wucGMgYXMgYSBzeW1s
aW5rIHRvIGVnbF93YXlsYW5kLnBjCgp3aGljaCBtZWFucyB0aGF0IGluIHRoZSBmcmFtZWJ1ZmZl
ciBjYXNlIG9uIEFSTTY0LCB5b3UncmUgbm90Cmluc3RhbGxpbmcgYW55IGVnbC5wYyBzeW1saW5r
LiBJcyB0aGlzIHJlYWxseSBPSz8KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
