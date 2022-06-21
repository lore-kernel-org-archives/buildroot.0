Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F64C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 13:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D222F40BCA;
	Tue, 21 Jun 2022 13:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D222F40BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBSPvwu3iPJT; Tue, 21 Jun 2022 13:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA62940590;
	Tue, 21 Jun 2022 13:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA62940590
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 971901BF2CF
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 13:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F98A83F6C
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 13:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F98A83F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTuW99gxOOzB for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 13:45:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 505A982D96
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 505A982D96
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 13:45:37 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E8C0160007;
 Tue, 21 Jun 2022 13:45:33 +0000 (UTC)
Date: Tue, 21 Jun 2022 15:45:33 +0200
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20220621154533.4f5e7c0e@kmaincent-XPS-13-7390>
In-Reply-To: <CAN5uoS9XgxK9-A8-QKGCuifxXAS6-EUMHDJsfBrUdjYB3qcPdA@mail.gmail.com>
References: <20220621130636.1100016-1-kory.maincent@bootlin.com>
 <CAN5uoS9XgxK9-A8-QKGCuifxXAS6-EUMHDJsfBrUdjYB3qcPdA@mail.gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655819134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTjIcf1IxB4yA5tVi3FN2hWq8eDgNpRoFHY4cAXB+24=;
 b=bdQbFS+PIhrvPNgGah4N0aRDF/XCjVDQQwvDz3JxloC6isEQ+YOEOV62FumviT8XGvosrF
 Hnd5giy3f9oz5mOCpz82o184IZxn/mZQlH6+uh7U4DsdIJ8ztyF3l/M/2BLAwd4UXRSju0
 mM1doHec8cO+eYT1MW2L8778ZaAlpd+vTaQzR0nP/9o7RLl/i8zWux/bA4c9I9IwHLQlnO
 BKbr++WmUi/KjgxHnT/QdPnCiFV8kCLQDe76cpv3ar1pGfJhMAblrzbYlSRt2p2VGPZ+KV
 uNF6WwlaVy23jb/vZoZktxcz2Ns0KpHE488BNrPlW6BErzW5aM8gxri2cYBefw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bdQbFS+P
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

SGVsbG8gRXRpZW5uZSwKClRoYW5rcyBmb3IgdGhlIHJldmlldyEKCj4gPiBkaWZmIC0tZ2l0IGEv
Ym9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tayBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsKPiA+
IGluZGV4IDg4ZjE0YjQ4ZTQuLmNjOTBjZmYyY2IgMTAwNjQ0Cj4gPiAtLS0gYS9ib290L29wdGVl
LW9zL29wdGVlLW9zLm1rCj4gPiArKysgYi9ib290L29wdGVlLW9zL29wdGVlLW9zLm1rCj4gPiBA
QCAtMTMsMTQgKzEzLDIyIEBAIGVuZGlmCj4gPiAgT1BURUVfT1NfSU5TVEFMTF9TVEFHSU5HID0g
WUVTCj4gPiAgT1BURUVfT1NfSU5TVEFMTF9JTUFHRVMgPSBZRVMKPiA+Cj4gPiAtaWZlcSAoJChC
UjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9HSVQpLHkpCj4gPiAraWZlcSAoJChPUFRFRV9PU19W
RVJTSU9OKSxjdXN0b20pICAKPiAKPiBJdCBsb29rcyBzdHJhbmdlIHRvIG1lIHRoYXQgImN1c3Rv
bSIgaXMgYSByZXNlcnZlZCB2ZXJzaW9uIGlkZW50aWZpZXIKPiB3aGVuIHVzaW5nIGEgY3VzdG9t
IHRhcmJhbGwuCj4gSSdkIHJhdGhlciB1c2U6Cj4gICAgaWZlcSAoJChCUjJfVEFSR0VUX09QVEVF
X09TX0NVU1RPTV9UQVJCQUxMKSx5KQoKSSBoYXZlIGNvcGllZCB0aGUgc2FtZSBtZWNoYW5pc20g
YXMgVS1ib290IGFuZCBURi1BLgpJIGRvbid0IGtub3cgd2hhdCdzIHRoZSBiZXR0ZXIgd2F5LCBp
ZiB5b3UgcHJlZmVyIHRoaXMgSSBjYW4gY2hhbmdlIGl0LgoKPiA+ICtpZmVxICgkKGNhbGwgcXN0
cmlwLCQoQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVEFSQkFMTF9MT0NBVElPTikpKSwpCj4g
PiArJChlcnJvciBObyB0YXJiYWxsIGxvY2F0aW9uIHNwZWNpZmllZC4gUGxlYXNlIGNoZWNrCj4g
PiBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OKSkgIAo+IAo+IFRo
ZXJlIGlzIGEgZXh0cmEgZW5kaW5nIHBhcmVudGhlc2VzIHRvIGJlIHJlbW92ZWQgaW4gZWFjaCBv
ZiB0aGUgMiBhYm92ZQo+IGxpbmVzLgoKVHJ1ZSwgYW5kIFRGLUEgaGFzIHRoZSBzYW1lIGlzc3Vl
ISA6KQoKS8O2cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
