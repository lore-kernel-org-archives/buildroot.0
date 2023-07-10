Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DC4EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E87361005;
	Mon, 10 Jul 2023 16:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E87361005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HqV4gl0YRkVD; Mon, 10 Jul 2023 16:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F63460FC0;
	Mon, 10 Jul 2023 16:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F63460FC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 763461BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FE6F60FCF
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FE6F60FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zD4x-IE2hpHG for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:10:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E7B960FFA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E7B960FFA
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:10:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E4B660008;
 Mon, 10 Jul 2023 16:10:48 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:10:46 +0200
To: =?UTF-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <20230710181046.766f8830@windsurf>
In-Reply-To: <20230707144939.1543141-1-nerv@dawncrow.de>
References: <20230707144939.1543141-1-nerv@dawncrow.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689005448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ply0Y9x46a5SJXwBqy92SGv0Nx7jukJO9GOVImwyvp0=;
 b=EyhqNOmx+PVMw7+/I8x8Gk+C5w5yeFE/LpXDp/XS55b/rY82y05pRU6lbfL4g9uFVMK2SK
 00PYk0oHkA3GUoyZol0bIijBXZHL+MzXB4XKxgpbdBrGBGrqhiVlHtXe6LRsbZLw0zRAvI
 P922r94IIL/OHoVhpTgrVKnMSMh+2YhAspoElWaEUSxZnhpH+UP7wSL2CCj29/Nt50SeIM
 wYMfMRWXUd6jfsGTP+xkhcb6WC9p71aDkizflt81CyhthWaf31PcPMdWss8KviXhw6H5rq
 h7Yq6/Qli53rymhfjqdRrT+XyXW8byXkf32JqwuS2wbu7Zp7jWvRmry8XQ28FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EyhqNOmx
Subject: Re: [Buildroot] [PATCH] package/wine: bump to version 8.0.1
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

T24gRnJpLCAgNyBKdWwgMjAyMyAxNjo0OTozOSArMDIwMApBbmRyw6kgWndpbmcgPG5lcnZAZGF3
bmNyb3cuZGU+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgWndpbmcgPG5lcnZAZGF3
bmNyb3cuZGU+Cj4gLS0tCj4gIHBhY2thZ2Uvd2luZS93aW5lLmhhc2ggfCAyICstCj4gIHBhY2th
Z2Uvd2luZS93aW5lLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
