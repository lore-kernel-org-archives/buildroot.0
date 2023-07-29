Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325AAC00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2511081382;
	Sat, 29 Jul 2023 21:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2511081382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QYbJtQ1wEEJ; Sat, 29 Jul 2023 21:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 671A68133A;
	Sat, 29 Jul 2023 21:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 671A68133A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5D041BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC6E140350
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC6E140350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmlxIqWJ8vKR for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:40:14 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C15BA40165
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C15BA40165
Received: by mail.gandi.net (Postfix) with ESMTPSA id C508DE0003;
 Sat, 29 Jul 2023 21:40:11 +0000 (UTC)
Date: Sat, 29 Jul 2023 23:40:10 +0200
To: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>
Message-ID: <20230729234010.3c4c623d@windsurf>
In-Reply-To: <20230608090321.1213226-1-martin@geanix.com>
References: <20230608090321.1213226-1-martin@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690666812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4LPGsG4Wv1TfgfGbj/5YPlZYB2AmjW6tW0vZ7Y7r50=;
 b=mBPAAfso7pApOdQpHbUKhpJxhUPu/1aqfsGD0S/K/Nko/z7orzSJFVJDbx6BJ2k2E91yAd
 2mxjGNY0TWGuepaqrE52gKb0OZfROQ9QRFzvLfLY93HfhCt86HiZFgLEI5EQhnMP6p60Pw
 GqXoEYWDDH4eu99jG/hfejx76ftsOP2jjbABqCJ/j5nR+p9zf0xD2Mo1LxE2iITaL3xSQ/
 LsDJq7JVG/lWXGJGmB7fKwfnJs0eNFycPW3qBAQpvaPCaYxgQhYH9BiP3TTANBThcgq5XD
 ZdgSKVNYMA0skOBEhOc7RcZFBP4ZKwLs9RX4iHXiHVg1qMvecyR5ra3+Niy2QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mBPAAfso
Subject: Re: [Buildroot] [PATCH] package/python-flask-smorest: bump version
 to 0.42.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgOCBKdW4gMjAyMyAxMTowMzoyMSArMDIwMApNYXJ0aW4gSHVuZGViw7hsbCA8bWFy
dGluQGdlYW5peC5jb20+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hs
bCA8bWFydGluQGdlYW5peC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uLWZsYXNrLXNtb3Jl
c3QvcHl0aG9uLWZsYXNrLXNtb3Jlc3QuaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL3B5dGhvbi1m
bGFzay1zbW9yZXN0L3B5dGhvbi1mbGFzay1zbW9yZXN0Lm1rICAgfCA0ICsrLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
