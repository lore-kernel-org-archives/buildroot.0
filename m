Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11999C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F4CF60BFF;
	Sun, 11 Dec 2022 20:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F4CF60BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fezgYVPpvuJk; Sun, 11 Dec 2022 20:20:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB85C60BF2;
	Sun, 11 Dec 2022 20:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB85C60BF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 592151BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32BA640235
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32BA640235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMLLDLUDv9pq for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:20:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC58B401EC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC58B401EC
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:20:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 20413FF808;
 Sun, 11 Dec 2022 20:20:43 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:20:43 +0100
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20221211212043.77418b3c@windsurf>
In-Reply-To: <20221203183638.1293234-1-salvador.joseluis@gmail.com>
References: <20221203183638.1293234-1-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670790044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ex5ZQdg7Nq7Jf8lLAROxhNd9SAS+9sm16VKRC4vM4w=;
 b=GspIy/PhGYdLDPP/VQv6SQPR1gHvie7jTna4b1BZxxlEinq7PWC+AwN17YYwNW1vXkPZuL
 l1Q50PvvL9hg0qPC6ExpFdMd0TymjQVm6EJa++YV5rRry2LSy3jNMnJpbE/qh8qo5evsRJ
 JenSSnrri4XmW8O8zrjnQf9JhDsjQ1Umj1vtpIi0BtnN8m1kGYsJqWsnpjcCmwMOw8XEb0
 YwtgGF4jBpHV+8cKmuzpBWYAyozjfvpm86jW34IxIoCPnCtP7k44kZGNSI4+ueMFDRZQOq
 31GW0HRrd6C9Xf6qxZl2vbaFjSJzQTkHefGdTs3a1awfpVPHn7+I/VZZACBGHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GspIy/Ph
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.1.7
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

T24gU2F0LCAgMyBEZWMgMjAyMiAxOTozNjozOCArMDEwMApKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1
Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6
IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgo+
IC0tLQo+ICBwYWNrYWdlL3pmcy96ZnMuaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL3pmcy96ZnMu
bWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0
YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
