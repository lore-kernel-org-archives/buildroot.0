Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C429CEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78D2460FD5;
	Mon, 10 Jul 2023 16:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78D2460FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGKq25BGDpqM; Mon, 10 Jul 2023 16:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C52FB60FBB;
	Mon, 10 Jul 2023 16:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C52FB60FBB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C25C1BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 032E741761
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032E741761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fV1Aax_-4szw for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:12:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B25C44175B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B25C44175B
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:12:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D1AD1BF208;
 Mon, 10 Jul 2023 16:12:49 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:12:47 +0200
To: =?UTF-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <20230710181247.29206ab0@windsurf>
In-Reply-To: <20230707171529.1924168-1-nerv@dawncrow.de>
References: <20230707171529.1924168-1-nerv@dawncrow.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689005570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwXSHodtzB/4i7LlNquOqxmSmtFGOPo2Qrlrtmpps5c=;
 b=GiXD/b4SH91lPUi3jslLJ/BDDLyEaeU98QRrERsSmKXkyxOm74LrZWn9HSDUUqRcLxWY5b
 N3id/1Z2pjvpxDheSJXL3+avzz9LGs+IdNKTfFpbuGl63BYKDjDR6LRRzVpXUumOA3ZhgY
 7i3c6ZZ7O3NOpneI0FbFa8bLqYiPxjfA4135ZnBKaRJcOP9vSA+MEqgsWkGDzeF40NmbZs
 xrA0W4i5tIdQ35q/+xgUs/ZSUBozBMKvkByJLVyS6zzQl9/GZek2XKxI3za9n6sYru2hdH
 PatwuEl4jXXFU5Apch64h0TwybuY9QQLWXmlqVSTCHnphDQr+1nuBRbACL6jHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GiXD/b4S
Subject: Re: [Buildroot] [PATCH] package/libkrb5: bump to 1.21
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

T24gRnJpLCAgNyBKdWwgMjAyMyAxOToxNToyOSArMDIwMApBbmRyw6kgWndpbmcgPG5lcnZAZGF3
bmNyb3cuZGU+IHdyb3RlOgoKPiBUaGUgaGFzaCBvZiB0aGUgTk9USUNFIGZpbGUgaGFzIGNoYW5n
ZWQgZHVlIHRvOgo+IAo+ICAtIFVwZGF0ZSBpbiBjb3B5cmlnaHQgeWVhcgo+IAo+ICAtIEFkZGl0
aW9uIG9mIGEgQlNELTItQ2xhdXNlIGxpY2Vuc2UsIHNvIG5vIGNoYW5nZSBmcm9tIHRoYXQgcGVy
c3BlY3RpdmUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgWndpbmcgPG5lcnZAZGF3bmNyb3cu
ZGU+Cj4gLS0tCj4gIHBhY2thZ2UvbGlia3JiNS9saWJrcmI1Lmhhc2ggfCA0ICsrLS0KPiAgcGFj
a2FnZS9saWJrcmI1L2xpYmtyYjUubWsgICB8IDUgKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtz
LgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
