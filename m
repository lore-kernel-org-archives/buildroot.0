Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22C5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 12:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4745240C9E;
	Wed, 22 Jun 2022 12:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4745240C9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5fPvUJc520U; Wed, 22 Jun 2022 12:36:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A90D40500;
	Wed, 22 Jun 2022 12:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A90D40500
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A45F1BF3EF
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 12:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5247A8456C
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 12:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5247A8456C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0RUNbvHiV83p for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 12:36:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A898684541
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A898684541
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 12:36:20 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3EEFD60002;
 Wed, 22 Jun 2022 12:36:18 +0000 (UTC)
Date: Wed, 22 Jun 2022 14:36:17 +0200
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20220622143617.649fb05a@kmaincent-XPS-13-7390>
In-Reply-To: <CAN5uoS8OHpbtwOY8N0a0ECGO-7LU6VWA1v57ECTZBYNtnWWBXw@mail.gmail.com>
References: <20220622083433.1201789-1-kory.maincent@bootlin.com>
 <CAN5uoS8OHpbtwOY8N0a0ECGO-7LU6VWA1v57ECTZBYNtnWWBXw@mail.gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655901378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9i+vkaNtd7Rvjw+bDOLQ2qGLZW8hqVNI/yGW5tBdcho=;
 b=SZbg9xlJfW67Ab1Bv3LsIUD1euAVrmBuwIplMdCNrSFBlsZEKq7sFjKOtvkNt9P4A8d4PH
 UILRfnhTvWQHHDbIdb7HFRMktABF2UF3tOQ5zwfbJqtAB7cDY4/HkXuVvWe7ub/Qw6mNst
 w8yyf4RGquw673NV84pclmZIxW2kriDMbW6QDC3a75Lkrnd0oP/AnYl1prERTRfQy1iW19
 VkfTkyvcjLuQ3JLlgACTg21syywSq+1TPevN91VnbjbLuaHESvB/uVf2gI02sI0SSNoK+9
 RqBeEfHKXJaN+fhIgGob7rLAxGmCFD2sbfMT8ZUbpu1y0UCzxrZQ1vFy+qpFCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SZbg9xlJ
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRXRpZW5uZSwKCk9uIFdlZCwgMjIgSnVuIDIwMjIgMTI6Mjk6MDUgKzAyMDAKRXRpZW5u
ZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8ub3JnPiB3cm90ZToKCj4gPiAraWZl
cSAoJChCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9UQVJCQUxMKSx5KQo+ID4gK2lmZXEgKCQo
Y2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9O
KSksKSAgCj4gCj4gSGVyZSB3ZSBleHBlY3QgYSB0YXJiYWxsIGZpbGUgcGF0aC4gU2luY2UgdGhl
IGNvbmZpZyBzd2l0Y2ggaXMgZGVmYXVsdAo+IHBvcHVsYXRlZCB3aXRoIGEgc3RyaW5nLCBJIHRo
aW5rIHRoaXMgc2hvdWxkIHRlc3QgZmlsZSBwcmVzZW5jZSByYXRoZXIKPiB0aGFuIHN0cmluZyBl
eGlzdGVuY2U6CgpObywgd2UgY2FuIGFsc28gdXNlIHRhcmJhbGwgd2ViIFVSTCwgdGhlbiB0aGUg
d2lsZGNhcmQgZnVuY3Rpb24gd29uJ3Qgd29yayBpbgpjYXNlIG9mIHdlYiBVUkwuCgpSZWdhcmRz
LAoKS8O2cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
