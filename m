Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED6DE748FC
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 17:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E94640531;
	Mon,  2 Oct 2023 17:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E94640531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qy5uSpUKx0bP; Mon,  2 Oct 2023 17:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39AAE40B2E;
	Mon,  2 Oct 2023 17:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39AAE40B2E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2FC1BF947
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 17:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5423640B2E
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 17:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5423640B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nay7PB6NZ1xe for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 17:20:51 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52B2D40531
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 17:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52B2D40531
Received: from smtpclient.apple ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPA
 id nMb9qgzkceAUNnMb9qc0O7; Mon, 02 Oct 2023 19:20:47 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 2 Oct 2023 19:20:47 +0200
Message-Id: <9B60377C-1188-4453-9CB3-2B12E8D4FF2F@benettiengineering.com>
References: <20231002165345.346937-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231002165345.346937-1-fontaine.fabrice@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailer: iPhone Mail (21A351)
X-CMAE-Envelope: MS4xfDKr8zYzswWfm1h4rWv2LVItvnUi21FMaKbZAZZEwieULo0o7Jybg3WGPH6ZTU2EPOj4VCZVUyjFeeuqfyLuLhZWtug0NJmWqSHvNgP4+GpLCqRtRd1c
 KJmrB2FSR4/06R0g1TqvoxZ0PjWnHz7VO0zHWFRZv67AmqrKWz4oG0tTb89iRXnAB2f+hneDF/95Q76QN9USJa1JC8br2T0NLxqsY7R03d+LH37ofxdPpF51
 2yvoSYE3bnGOGR7r1cpH65PpzgtOEZrLlQzmwf1Kftw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696267247; bh=G2mGK8L3bKPl3CFMdezbL2am/hUApoHn9gnXKMieN/g=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=cyevLGw31bOy86CcJUhn6h71TFKDq6jX31AIuEJQj5G3t+Jru8di1NE69bfUqoul7
 HOHOJ9eCG7M7kkKMOhBsmVKR7aZddu4tkSozkMGKaKCIsVl2In4CTgBav4ZweoTEw6
 Mzj2dK9ndzvWvnUMaKUTWhEB3NoY2Rvn7/7uyRunm4YwlZvoJySrhHASmtCSiZ2pYu
 wAjnpkYW6Y1KrP2xkCOCgq+5HIXpLcol37PIcVQaKpH4RKsRHfxivjHHkJaZS6Nzdr
 +uaWM5yrHficOHMX/MX0MO4ugtT8HObYPRCPydyH765eFtr+6ISoKZ2evxleqkc+JR
 ZbQA2SNCju8NA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=cyevLGw3
Subject: Re: [Buildroot] [PATCH 1/1] package/libnvme: fix python build
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

SGkgRmFicmljZSwKCj4gSWwgZ2lvcm5vIDIgb3R0IDIwMjMsIGFsbGUgb3JlIDE4OjU0LCBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gaGEgc2NyaXR0bzoKPiAK
PiDvu79GaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZCBzaW5jZSB0aGUgYWRk
aXRpb24gb2YgdGhlIHBhY2thZ2UKPiBpbiBjb21taXQgY2Q3YmM2YjFjNDEwNTE0NzY1YzUxODIx
YmI4ZDg0M2YxMzZmZWE0YToKPiAKPiBQcm9ncmFtIHB5dGhvbjMgZm91bmQ6IFlFUyAoL2hvbWUv
YXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS02L291dHB1dC0xL2hvc3QvYmluL3B5dGhvbjMp
Cj4gUHJvZ3JhbSBzd2lnIGZvdW5kOiBOTwo+IAo+IC4uL291dHB1dC0xL2J1aWxkL2xpYm52bWUt
MS41L2xpYm52bWUvbWVzb24uYnVpbGQ6MTU6MTE6IEVSUk9SOiBQcm9ncmFtICdzd2lnJyBub3Qg
Zm91bmQgb3Igbm90IGV4ZWN1dGFibGUKPiAKPiBGaXhlczoKPiAtIGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm9yZy9yZXN1bHRzLzNjYjA1YjQ5MzllYjdkMWNlMDQ2MDA4OGMzNjU0MDJmZmNk
NmIxM2IKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJy
aWNlQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0
dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KClRoYW5rIHlvdSBmb3IgZml4aW5nCkdpdWxpbwoK
PiAtLS0KPiBwYWNrYWdlL2xpYm52bWUvbGlibnZtZS5tayB8IDIgKy0KPiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJudm1lL2xpYm52bWUubWsgYi9wYWNrYWdlL2xpYm52bWUvbGlibnZtZS5tawo+IGluZGV4
IDcxODg1ZTE5OGMuLmM4OTg0MDkzZDAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJudm1lL2xp
Ym52bWUubWsKPiArKysgYi9wYWNrYWdlL2xpYm52bWUvbGlibnZtZS5tawo+IEBAIC0xMSw3ICsx
MSw3IEBAIExJQk5WTUVfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiBMSUJOVk1FX0lOU1RBTExf
U1RBR0lORyA9IFlFUwo+IAo+IGlmZXEgKCQoQlIyX1BBQ0tBR0VfUFlUSE9OMykseSkKPiAtTElC
TlZNRV9ERVBFTkRFTkNJRVMgKz0gcHl0aG9uMwo+ICtMSUJOVk1FX0RFUEVOREVOQ0lFUyArPSBo
b3N0LXN3aWcgcHl0aG9uMwo+IExJQk5WTUVfQ09ORl9PUFRTICs9IC1EcHl0aG9uPWVuYWJsZWQK
PiBlbHNlCj4gTElCTlZNRV9DT05GX09QVFMgKz0gLURweXRob249ZGlzYWJsZWQKPiAtLQo+IDIu
NDAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
