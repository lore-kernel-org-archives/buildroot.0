Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32394C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFEE38266A;
	Tue, 21 Feb 2023 08:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEE38266A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHPea9yjE77O; Tue, 21 Feb 2023 08:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB3F829EE;
	Tue, 21 Feb 2023 08:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB3F829EE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C992C1BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A410740A59
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A410740A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUlKk27dadXt for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:39:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C86640A04
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C86640A04
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:39:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6967EC0016;
 Tue, 21 Feb 2023 08:39:24 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:39:23 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20230221093923.76ea5ef7@windsurf>
In-Reply-To: <20230216100751.446662-1-vincent.stehle@arm.com>
References: <20230216100751.446662-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676968764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWrT8yh8BEK4wrl1BAfm0JAxSycuJe8scRbKJTIMKpo=;
 b=pyNUGnw3lN5yDBi3/DK0zRni+qPscGRhv4AH388csV1z2fETWLCEvStrU0Qyg2wfIHVoxa
 d2NY3F+z/AFqO7xkdCM8xC+DUE954YaeDjHA5NvTc3jXJPm9YWTrgvU3gn7Bc+ccO3JBR2
 XmX1NCsuc4b/k0+hcjphgVS+8r6pRXqtEoFUqlXPyJEJLC03oCpiQ5dznRib1zVL+cKAqu
 OsYEuh7pGsd5DyX4lJwXhZ+QRdomFod2cyUTF/h5a5xFmrd8JnvyRZun8RH4dHNvl2rXPU
 InF8JdeDT+Wjy6/wEOpEch4HCcG7vcg0JIXZZObDqY/nQamN3dmdG81oqvrqRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pyNUGnw3
Subject: Re: [Buildroot] [PATCH 1/2] configs/qemu_arm_ebbr: bump linux to
 6.1.12 and u-boot to 2023.01
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxNiBGZWIgMjAyMyAxMTowNzo1MCArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiAtIEJ1bXAgTGludXgga2VybmVsIHZlcnNpb24g
dG8gNi4xLjEyLgo+IC0gQnVtcCBVLUJvb3QgdmVyc2lvbiB0byAyMDIzLjAxIGFuZCBmb2xsb3cg
Q09ORklHX1NZU19URVhUX0JBU0UgcmVuYW1pbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2Vu
dCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IENjOiBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gLS0tCj4gIGJvYXJkL3FlbXUvYXJtLWViYnIvdS1ib290
LmZyYWdtZW50IHwgMiArLQo+ICBjb25maWdzL3FlbXVfYXJtX2ViYnJfZGVmY29uZmlnICAgICB8
IDYgKysrLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKQm90aCBhcHBsaWVkIHRvIG5leHQsIHRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBl
dGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
