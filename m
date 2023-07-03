Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58236C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54C460AAD;
	Mon,  3 Jul 2023 19:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E54C460AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id caqU9JDoV3VX; Mon,  3 Jul 2023 19:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E3A4607FE;
	Mon,  3 Jul 2023 19:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E3A4607FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABA671BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DA77405C4
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DA77405C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gk4vXxw4701k for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:09:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 078FC405B7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 078FC405B7
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:09:19 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B89A2240003;
 Mon,  3 Jul 2023 19:09:16 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:09:15 +0200
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20230703210915.1a409e96@windsurf>
In-Reply-To: <20230703105819.flmwndqvctpjuolz@zenon.in.qult.net>
References: <20230703105819.flmwndqvctpjuolz@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688411357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tijjixEoGzviNUr3TT6ajbumcGYLdzlHncz5xbPftP8=;
 b=SRnSQEjeZXuwYlwv57YoIwxqsgERQc41ko2DHRcxw7sQFYIG8cJrfAnyJ4jufZGoBjMz0f
 i43N7iNWHnIOj4zRWsoZ55McbjhquGdFFRQkPS5jTht0NuynKsobL2a2Soc6T2HevEE15A
 sPUPmJlaih4R8wI8e8j7kdkQPnn93JHYD7xgzQPAJsXBP17GztMwwXDnnxZ8Bh5DiCfIke
 N42fvD84gaomhqrjPZbBcl/LCrFysXVbyraIwlMDTJXFinXfZh8NhWYxBie0bXmfOBTm4E
 0TQ1gELWX0CHf8tbMUCnVTE/C8RUDFNpCPpbFG8SVKwTFhKLrqzcazlyciFkqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SRnSQEje
Subject: Re: [Buildroot] [PATCH] package/iproute2: add optional dependency
 on libbpf
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSWduYWN5LAoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghCgpPbiBNb24sIDMgSnVsIDIwMjMg
MTI6NTg6MTkgKzAyMDAKSWduYWN5IEdhd8SZZHpraSA8aWduYWN5Lmdhd2VkemtpQGdyZWVuLWNv
bW11bmljYXRpb25zLmZyPiB3cm90ZToKCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElCQlBGKSx5
KQo+ICtJUFJPVVRFMl9ERVBFTkRFTkNJRVMgKz0gbGliYnBmCj4gK2VuZGlmCgpDb3VsZCB5b3Ug
dGVzdCBhbiBpbXByb3ZlZCB2ZXJzaW9uIHRoYXQgcGFzc2VzIExJQkJQRl9GT1JDRT1vbiBpbiB0
aGUKZW5hYmxlZCBjYXNlIGFuZCBMSUJCUEZfRk9SQ0U9b2ZmIGluIHRoZSBkaXNhYmxlZCBjYXNl
PwoKQWNjb3JkaW5nIHRvIHRoZSBjb25maWd1cmUgc2NyaXB0OgoKY2hlY2tfZm9yY2VfbGliYnBm
X29uKCkKewogICAgIyBpZiBzZXQgTElCQlBGX0ZPUkNFPW9uIGJ1dCBubyBsaWJicGYgc3VwcG9y
dCwganVzdCBleGlzdCB0aGUgY29uZmlnCiAgICAjIHByb2Nlc3MgdG8gbWFrZSBzdXJlIHdlIGRv
bid0IGJ1aWxkIHdpdGhvdXQgbGliYnBmLgogICAgaWYgWyAiJExJQkJQRl9GT1JDRSIgPSBvbiBd
OyB0aGVuCiAgICAgICAgZWNobyAiICBMSUJCUEZfRk9SQ0U9b24gc2V0LCBidXQgY291bGRuJ3Qg
ZmluZCBhIHVzYWJsZSBsaWJicGYiCiAgICAgICAgZXhpdCAxCiAgICBmaQp9CgpjaGVja19saWJi
cGYoKQp7CiAgICAjIGlmIHNldCBMSUJCUEZfRk9SQ0U9b2ZmLCBkaXNhYmxlIGxpYmJwZiBlbnRp
cmVseQogICAgaWYgWyAiJExJQkJQRl9GT1JDRSIgPSBvZmYgXTsgdGhlbgogICAgICAgIGVjaG8g
Im5vIgogICAgICAgIHJldHVybgogICAgZmkKCk9mIGNvdXJzZSwgYm90aCB0aGUgZW5hYmxlZCBh
bmQgZGlzYWJsZWQgY2FzZSBuZWVkIHRvIGJlIHZlcmlmaWVkCmJlZm9yZSBzdWJtaXR0aW5nIHYy
IDotKQoKVGhhbmtzIGEgbG90IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25l
ciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcg
YW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
