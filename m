Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2090EC001E0
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C95C8612B2;
	Wed, 26 Jul 2023 21:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C95C8612B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgaOZ1l9JaPM; Wed, 26 Jul 2023 21:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2EFD612BD;
	Wed, 26 Jul 2023 21:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2EFD612BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 400AA1BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 092B34013F
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 092B34013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytwFItf0Eilg for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:33:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8B7640120
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8B7640120
Received: by mail.gandi.net (Postfix) with ESMTPSA id C32E0FF803;
 Wed, 26 Jul 2023 21:33:07 +0000 (UTC)
Date: Wed, 26 Jul 2023 23:33:06 +0200
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20230726233306.0589faf8@windsurf>
In-Reply-To: <20230608175323.1344936-1-salvador.joseluis@gmail.com>
References: <20230608175323.1344936-1-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690407188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kj0VkX019QG0ucRz8Chl3HgeIi5BlPLZWSoebAt6uok=;
 b=dgMPLwWA0HY2gwz7RnZPc3oe3NpbiiI48qz2ufY9miSsLGVl4IlC5zCG9wdy+taN1OAKXG
 5xuCvh915jSAFRIdZa5Zz4v0apoJWprBpIzK4MlLtshdTG1W9PW9lNKQuXfO5G9DGHtd4j
 0n3Gel3Df7X4N/pjqIpvYkU9A00PeJqX+WXqchZsj88VajMhNb92S9ChXj62FOQ8M0uLYB
 A+Wsq3ykneGeIJ9rGnwiAwh08VsOST8TEBrIOcZReLsb0dCM3Js6AbdkvU3GlIHRK8JL8j
 4sCCdql/+Bm5qgl0a8tAZAh3oKA5XND/3fdoG+v7yA+SvcxSZcGyC3GBw9kNUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dgMPLwWA
Subject: Re: [Buildroot] [PATCH] package/zfs: bump version to 2.1.12
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgOCBKdW4gMjAyMyAxOTo1MzoyMyArMDIwMApKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1
Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFJlbW92ZWQgYmFja3Bv
cnRlZCBwYXRjaDoKPiAtIDAwMDEtcmVtb3ZhbC1vZi1MZWdhY3lWZXJzaW9uLWJyb2tlLWF4X3B5
dGhvbl9kZXYubTQucGF0Y2gKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9y
IFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KPiAtLS0KPiAgLi4uTGVnYWN5VmVy
c2lvbi1icm9rZS1heF9weXRob25fZGV2Lm00LnBhdGNoIHwgMTM0IC0tLS0tLS0tLS0tLS0tLS0t
LQo+ICBwYWNrYWdlL3pmcy96ZnMuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQg
Ky0KPiAgcGFja2FnZS96ZnMvemZzLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAy
ICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMzcgZGVsZXRpb25zKC0p
Cj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3pmcy8wMDAxLXJlbW92YWwtb2YtTGVnYWN5
VmVyc2lvbi1icm9rZS1heF9weXRob25fZGV2Lm00LnBhdGNoCgpBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
