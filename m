Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C46C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 14:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25E67415CA;
	Tue, 21 Jun 2022 14:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25E67415CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVbDf0Jhgs9m; Tue, 21 Jun 2022 14:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4EC3418FF;
	Tue, 21 Jun 2022 14:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4EC3418FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49DC71BF2CF
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 14:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23CA060B89
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 14:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23CA060B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngsDanw9tGHT for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 14:02:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0788360B31
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0788360B31
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 14:02:19 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2526F20000B;
 Tue, 21 Jun 2022 14:02:16 +0000 (UTC)
Date: Tue, 21 Jun 2022 16:02:16 +0200
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20220621160216.5f3d03fe@kmaincent-XPS-13-7390>
In-Reply-To: <CAN5uoS9ssQz6NBaRZ2avNiafm_dgYbp-3QL1p5p-LG02OxVd+g@mail.gmail.com>
References: <20220621130636.1100016-1-kory.maincent@bootlin.com>
 <CAN5uoS9XgxK9-A8-QKGCuifxXAS6-EUMHDJsfBrUdjYB3qcPdA@mail.gmail.com>
 <20220621154533.4f5e7c0e@kmaincent-XPS-13-7390>
 <CAN5uoS9ssQz6NBaRZ2avNiafm_dgYbp-3QL1p5p-LG02OxVd+g@mail.gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655820137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JztusPAPQFZ+HjB0XE0ETrmM0TIDn5VuUy4oYo5SrTE=;
 b=nJQcNBjs7otNgZP+JFSO1gMpVF1LfErudsezPixZMXW2/LB3ChXsWA82Iuqm5ZEnvk2Scc
 CuieoAb8tPsFcEgoctn7vhqtksS0YUZZR+DKNpyKZcajNv4BdcSs2EME0JjSbs0kWl3ADe
 ITHpwROb0Bca/q/EoJiEiDWO0eU97Av+buRdyN5JYFWvjP5BTXYRMYFhDkGMVAkEzNfY1v
 kPxnqRC0ZPGNnezTgLUxPQF9fDtZ7gDV2xg8GNPEfY7b303Dhs7/irf9UbhBzxf3enagqT
 qO/gIXi/fB38pebwBDoiky4zarXj2GZXkfIiqiYT52k4guA2bQAkMrXQT2MI1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nJQcNBjs
Subject: Re: [Buildroot] [PATCH] boot/optee-os: add support for custom
 tarball URL
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMSBKdW4gMjAyMiAxNTo1NDozMiArMDIwMApFdGllbm5lIENhcnJpZXJlIDxldGll
bm5lLmNhcnJpZXJlQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBPbiBUdWUsIDIxIEp1biAyMDIyIGF0
IDE1OjQ1LCBLw7ZyeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gSGVsbG8gRXRpZW5uZSwKPiA+Cj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXchCj4g
PiAgCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsgYi9ib290
L29wdGVlLW9zL29wdGVlLW9zLm1rCj4gPiA+ID4gaW5kZXggODhmMTRiNDhlNC4uY2M5MGNmZjJj
YiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9ib290L29wdGVlLW9zL29wdGVlLW9zLm1rCj4gPiA+ID4g
KysrIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+ID4gPiA+IEBAIC0xMywxNCArMTMsMjIg
QEAgZW5kaWYKPiA+ID4gPiAgT1BURUVfT1NfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gPiA+ID4g
IE9QVEVFX09TX0lOU1RBTExfSU1BR0VTID0gWUVTCj4gPiA+ID4KPiA+ID4gPiAtaWZlcSAoJChC
UjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9HSVQpLHkpCj4gPiA+ID4gK2lmZXEgKCQoT1BURUVf
T1NfVkVSU0lPTiksY3VzdG9tKSAgCj4gPiA+Cj4gPiA+IEl0IGxvb2tzIHN0cmFuZ2UgdG8gbWUg
dGhhdCAiY3VzdG9tIiBpcyBhIHJlc2VydmVkIHZlcnNpb24gaWRlbnRpZmllcgo+ID4gPiB3aGVu
IHVzaW5nIGEgY3VzdG9tIHRhcmJhbGwuCj4gPiA+IEknZCByYXRoZXIgdXNlOgo+ID4gPiAgICBp
ZmVxICgkKEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1RBUkJBTEwpLHkpICAKPiA+Cj4gPiBJ
IGhhdmUgY29waWVkIHRoZSBzYW1lIG1lY2hhbmlzbSBhcyBVLWJvb3QgYW5kIFRGLUEuCj4gPiBJ
IGRvbid0IGtub3cgd2hhdCdzIHRoZSBiZXR0ZXIgd2F5LCBpZiB5b3UgcHJlZmVyIHRoaXMgSSBj
YW4gY2hhbmdlIGl0Lgo+ID4gIAo+IAo+IEkgcmVhbGx5IHByZWZlciBteSBwcm9wb3NhbC4KPiBJ
cyAiY3VzdG9tIiBhIHJlc2VydmVkIHZlcnNpb24gaWRlbnRpZmllciBpbiBCdWlsZHJvb3QgY29u
ZmlndXJhdGlvbgo+IHN3aXRjaGVzPyBJIGNhbid0IHRlbGwgYnV0IGkgdGhpbmsgaXQnZCBiZSBh
IGJpdCBmcmFnaWxlLgoKQWxyaWdodC4gSWYgdGhlcmUgaXMgbm8gZ29vZCBleHBsYW5hdGlvbiBm
b3IgdGhlICJjdXN0b20iIHZlcnNpb24KaWRlbnRpZmllciBiZWZvcmUgdGhlIGVuZCBvZiB0aGUg
ZGF5cyB0aGVuIEkgd2lsbCBnbyBmb3IgeW91ciBwcm9wb3NhbCBpbiB0aGUKVjIuCgo+ID4gPiA+
ICtpZmVxICgkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVEFSQkFM
TF9MT0NBVElPTikpKSwpCj4gPiA+ID4gKyQoZXJyb3IgTm8gdGFyYmFsbCBsb2NhdGlvbiBzcGVj
aWZpZWQuIFBsZWFzZSBjaGVjawo+ID4gPiA+IEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1RB
UkJBTExfTE9DQVRJT04pKSAgCj4gPiA+Cj4gPiA+IFRoZXJlIGlzIGEgZXh0cmEgZW5kaW5nIHBh
cmVudGhlc2VzIHRvIGJlIHJlbW92ZWQgaW4gZWFjaCBvZiB0aGUgMiBhYm92ZQo+ID4gPiBsaW5l
cy4gIAo+ID4KPiA+IFRydWUsIGFuZCBURi1BIGhhcyB0aGUgc2FtZSBpc3N1ZSEgOikgIAo+IAo+
IE1heWJlIHlvdSBjYW4gZml4IGl0IGJ5IHRoZSB3YXkhCgpZZXMsIGZpeCBzZW50IQoKS8O2cnkK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
