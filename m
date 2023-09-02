Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8FFC71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24FEA4052D;
	Sat,  2 Sep 2023 15:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24FEA4052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPdhjO9aGT0U; Sat,  2 Sep 2023 15:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73304404AF;
	Sat,  2 Sep 2023 15:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73304404AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8F001BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80437416C4
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80437416C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bye4kzAsyAKs for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:50:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F25841621
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F25841621
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21FE91BF203;
 Sat,  2 Sep 2023 15:50:19 +0000 (UTC)
Date: Sat, 2 Sep 2023 17:50:18 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230902175018.249805c8@windsurf>
In-Reply-To: <20230827145956.3204254-1-ju.o@free.fr>
References: <20230827145956.3204254-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693669820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wvAQhOaeMlSrM1iVo/klzVru6V03WESZ50rslR734Q=;
 b=ajRKcBFQk02xeaavdBa+8vtTWWnblY2ioOF5XZaKjXt5iBHM54PXkjfdlvSwC8J/aV4vua
 FDzgg1+mWdxG/UINOVru1+ZXEn8th6d+eLcrv3WtApQowVNLIRTb42gMRLBzy2RmwTkzKw
 GjO39kcyYvvi3gFuo8dsTEIaBsCcDLbeN8DvCFfMYlpJwGAGfWzC+yK3c5e7WNeZMtkt1C
 y8nV/8+m1nA4C5L8Bdtob5uM0K5sLH+U+LMhlOBD4dek+HmvqmOustpzvUvfWjEEKGGvZ3
 EvvVk8F11vATrd/SURflclo0yTJsbBjVyubN9zX/xns6e8nDB1kTTiA8y+emQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ajRKcBFQ
Subject: Re: [Buildroot] [PATCH next 1/3] boot/edk2: bump to version
 edk2-stable202308
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
Cc: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyNyBBdWcgMjAyMyAxNjo1OTo1NCArMDIwMApKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPiB3cm90ZToKCj4gRm9yIGNoYW5nZSBsb2cgc2luY2UgdmVyc2lvbiBlZGsyLXN0YWJs
ZTIwMjMwNSwgc2VlOgo+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3JlbGVh
c2VzL3RhZy9lZGsyLXN0YWJsZTIwMjMwOAo+IAo+IFRoZSBtYWluIG1vdGl2YXRpb25zIG9mIHRo
aXMgYnVtcCBhcmUgdGhlIFJJU0MtViBRRU1VIFZpcnQgc3VwcG9ydAo+IGltcHJvdmVtZW50cyAo
bm90IHlldCBzdXBwb3J0ZWQgaW4gQnVpbGRyb290KS4KPiAKPiBDYzogRGljayBPbHNzb24gPGhp
QHNlbnppbGxhLmlvPgo+IENjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAtLS0K
PiBQYXRjaCBzZXJpZXMgdGVzdGVkIG9uIGJyYW5jaCBuZXh0IGF0IGNvbW1pdCA3YjAyY2E4IHdp
dGggY29tbWFuZHM6CgpTZXJpZXMgYXBwbGllZCB0byBuZXh0LCB0aGFua3MhCgpUaG9tYXMKLS0g
ClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
