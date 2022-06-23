Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D42CC43334
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 13:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D751A813B0;
	Thu, 23 Jun 2022 13:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D751A813B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41Vd7l3asXTh; Thu, 23 Jun 2022 13:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAFB18473B;
	Thu, 23 Jun 2022 13:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAFB18473B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00F751BF405
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 13:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8FC78473B
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 13:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8FC78473B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6MOGlGLCgLJx for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 13:12:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C6083E2E
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24C6083E2E
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 13:12:17 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id AFFE3D70C8
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 13:06:53 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5BC4120009;
 Thu, 23 Jun 2022 13:06:46 +0000 (UTC)
Date: Thu, 23 Jun 2022 15:06:46 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220623150646.42c41949@kmaincent-XPS-13-7390>
In-Reply-To: <20220623020757.7852c97c@windsurf>
References: <20220622083433.1201789-1-kory.maincent@bootlin.com>
 <20220623020757.7852c97c@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655989607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JX9fdOzIndwBU5+RH/oQDAU6xdaN7zUJiKY5ZbxN6lg=;
 b=E9DXjxELj8TVqLCjlJrsq9mmoQjShhaUzCYa9Kl2MdmwUSSMOx4dANqfBD0yI/MwMC33Um
 4PfcI7wRM3zVONzj8h6KrQOJtr7DWjktJLipjnp/C7AvBbyh7nrdOmY5/RRHlA4ft193xl
 B8Xa/cYGG37FTnZ5sSmC+5lOLw6Rd76ySW3pqnf2EaumYg5Ugk0hB2UrjKSWLeMyDoSRGb
 FubkAm5Yky+C5/sBjOAg/Br+lnuJWsmtnK+CwfMGNcv21cV0WgTL7tuIGbAq6npXn1AHGD
 zjW46N6x717cqcZ82ty6MuTcCG2Syylr9ulzxvQEZjKxoYbgVL+wKzTLyIRb8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E9DXjxEL
Subject: Re: [Buildroot] [PATCH v2] boot/optee-os: add support for custom
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
Cc: etienne.carriere@linaro.org, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gVGh1LCAyMyBKdW4gMjAyMiAwMjowNzo1NyArMDIwMApUaG9tYXMg
UGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8s
Cj4gCj4gT24gV2VkLCAyMiBKdW4gMjAyMiAxMDozNDozMyArMDIwMAo+IGtvcnkubWFpbmNlbnRA
Ym9vdGxpbi5jb20gd3JvdGU6Cj4gCj4gPiAtaWZlcSAoJChCUjJfVEFSR0VUX09QVEVFX09TX0NV
U1RPTV9HSVQpLHkpCj4gPiAraWZlcSAoJChCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9UQVJC
QUxMKSx5KQo+ID4gKyMgSGFuZGxlIGN1c3RvbSBVLUJvb3QgdGFyYmFsbHMgYXMgc3BlY2lmaWVk
IGJ5IHRoZSBjb25maWd1cmF0aW9uICAKPiAKPiBJIGZvbGxvd2VkIHRoZSBkaXNjdXNzaW9uIG9u
IHRoZSB2MSB3aGV0aGVyIHdlIHNob3VsZCB0ZXN0IHRoZSB2ZXJzaW9uCj4gdG8gYmUgImN1c3Rv
bSIgb3Igd2hldGhlciB3ZSBzaG91bGQgdGVzdAo+IEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9N
X1RBUkJBTEw9PXkuIEkgaW5pdGlhbGx5IHRob3VnaCB0aGVyZSB3YXMgYQo+IHJlYXNvbiBmb3Ig
dGVzdGluZyB2ZXJzaW9uPT1jdXN0b20sIGJ1dCBJIHdhcyBub3QgYWJsZSB0byBmaW5kIHdoeSwg
YW5kCj4gc29tZSBwYWNrYWdlcyAobGludXggZm9yIGV4YW1wbGUpIGRvIG5vdCB0ZXN0IHZlcnNp
b249PWN1c3RvbS4KPiAKPiBTbyBJIGFncmVlIHRoYXQgdGVzdGluZyBCUjJfVEFSR0VUX09QVEVF
X09TX0NVU1RPTV9UQVJCQUxMPT15IGlzIGEKPiBiZXR0ZXIgc29sdXRpb24sIHdoaWNoIGlzIHdo
YXQgeW91IGhhdmUgZG9uZSBoZXJlLgo+IAo+IEhvd2V2ZXIsIEkgd291bGQgaWRlYWxseSBsaWtl
IHRoaXMgdG8gYmUgY29uc2lzdGVudCB0aHJvdWdob3V0IHRoZQo+IHRyZWUsIHdoaWNoIG1lYW5z
IHdlIHNob3VsZCBjaGFuZ2UgdGhlIGZvbGxvd2luZyBvbmVzOgo+IAo+IGJvb3QvYXJtLXRydXN0
ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUubWs6aWZlcQo+ICgkKEFSTV9UUlVTVEVE
X0ZJUk1XQVJFX1ZFUlNJT04pLGN1c3RvbSkKPiBib290L2FybS10cnVzdGVkLWZpcm13YXJlL2Fy
bS10cnVzdGVkLWZpcm13YXJlLm1rOmlmZXEKPiAoJChBUk1fVFJVU1RFRF9GSVJNV0FSRV9WRVJT
SU9OKSxjdXN0b20pIGJvb3QvYmFyZWJveC9iYXJlYm94Lm1rOmlmZXEKPiAoJCQoJCgxKV9WRVJT
SU9OKSxjdXN0b20pIGJvb3Qvb3BlbnNiaS9vcGVuc2JpLm1rOmlmZXEKPiAoJChPUEVOU0JJX1ZF
UlNJT04pLGN1c3RvbSkgYm9vdC91Ym9vdC91Ym9vdC5tazppZmVxICgkKFVCT09UX1ZFUlNJT04p
LGN1c3RvbSkKCk9rLCBJIHdpbGwgc2VuZCBwYXRjaGVzIHRvIGhhdmUgY29uc2lzdGVuY3kgaW4g
dGhlc2UgcGFja2FnZXMuCgpSZWdhcmRzLApLw7ZyeQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
