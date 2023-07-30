Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C79C00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C5DB6101A;
	Sun, 30 Jul 2023 20:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C5DB6101A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAWCE4t80wkN; Sun, 30 Jul 2023 20:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9A460FA1;
	Sun, 30 Jul 2023 20:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C9A460FA1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA6AD1BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90C7581A2B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90C7581A2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhGIXNu0t26z for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:42:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F70181A29
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F70181A29
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28B7940003;
 Sun, 30 Jul 2023 20:42:09 +0000 (UTC)
Date: Sun, 30 Jul 2023 22:42:09 +0200
To: =?UTF-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <20230730224209.73cd9f8a@windsurf>
In-Reply-To: <20230730105929.2296954-1-nerv@dawncrow.de>
References: <20230730105929.2296954-1-nerv@dawncrow.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690749735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MmoHG8oL7u/aihP+8WGOx7VG3OcWOF6LLGWgf/GqKDs=;
 b=aJjiWlwIb8u3QrJuFgmPIz67ztKSc5gyhMJ8r7rcnG+IFyCB+lqNFyP6148Awzd8hngF7m
 yIFlqxlO5IRsFVwQiiblnQORu/BtxfkSv924zWpQ0bW/sJsioDobDAvboFTW9wkoo/Tsyr
 DM16BHtIHNKnOpxFTMkWN/Gd4GETGaYhn21LsWOvkT7HTw/W/tzrW8ZXYa6aOz+EcdaTzQ
 hqfTsHTq+ZrzKzfJNi3imLsApIzroIuDvNk/NY9Q4zEBLoT94CLZYp+2da18pV0SF9wZbN
 Mwu1+iNGfvOi5us4MWWJJimFawPYqEwXcGo6XBkXyviYK4mbtQayLGO0nCNq4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aJjiWlwI
Subject: Re: [Buildroot] [PATCH] package/wine: bump to version 8.0.2
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

T24gU3VuLCAzMCBKdWwgMjAyMyAxMjo1OToyOSArMDIwMApBbmRyw6kgWndpbmcgPG5lcnZAZGF3
bmNyb3cuZGU+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgWndpbmcgPG5lcnZAZGF3
bmNyb3cuZGU+Cj4gLS0tCj4gIHBhY2thZ2Uvd2luZS93aW5lLmhhc2ggfCAyICstCj4gIHBhY2th
Z2Uvd2luZS93aW5lLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
