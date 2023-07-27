Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60223EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 07:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6EF983B12;
	Thu, 27 Jul 2023 07:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6EF983B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Al5Z80VUoc1l; Thu, 27 Jul 2023 07:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A5EE83A9C;
	Thu, 27 Jul 2023 07:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A5EE83A9C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 915AE1BF83A
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 07:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 605EF408CA
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 07:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 605EF408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ojlDRwBrlQC for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 07:13:10 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30478401A1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 07:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30478401A1
Received: by mail.gandi.net (Postfix) with ESMTPSA id E24BA2000C;
 Thu, 27 Jul 2023 07:13:06 +0000 (UTC)
Date: Thu, 27 Jul 2023 09:13:06 +0200
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20230727091306.119a3ac6@windsurf>
In-Reply-To: <20230608175016.1341416-1-salvador.joseluis@gmail.com>
References: <20220724143533.GV2641@scaer>
 <20230608175016.1341416-1-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690441987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14cxoTUBe/VAyJCKfMyFfxnlJnWOPJUMc4JTvqNhHPg=;
 b=LR/L4CI9LbiOxViuXcna3YpGcvYQEggY8HNH2W0oUqLhRlXklHIqKqugGca+NKpQyy3iuy
 q7A4wHxbZP5u+5ItG7alyaSkAgT4CMgnODOzHgAukxfBjUKEyfBiVe77fyzc1SybFmjSjZ
 u5NXckKOZ4fKMPMkxRsYtq+RtpsXt2Fyr+1lrFZBddtaSmXsLjppB4AkSkIguimunD9yOX
 quHHT/AImSkABX72Dwwq5eybZsNt8l+OFr9g3fCsYw4Bb/4UqhlLG7P9qqKt2g7F8SrXcf
 mJdS5EKrMmWlWiodMVIVd88FYG5W1QDWc0T+pHHF935APcuRXkan9aC8aSvdlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LR/L4CI9
Subject: Re: [Buildroot] [PATCH] package/zfs: not using kernel-module infra
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
Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgOCBKdW4gMjAyMyAxOTo1MDoxNiArMDIwMApKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1
Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IHpmcyBhbHJlYWR5IGJ1
aWxkcyB0aGUga2VybmVsIG1vZHVsZSBmcm9tIHRoZSBhdXRvdG9vbHMgaW5mcmFzdHJ1Y3R1cmUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5q
b3NlbHVpc0BnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvemZzL0NvbmZpZy5pbiB8IDEgKwo+
ICBwYWNrYWdlL3pmcy96ZnMubWsgICAgfCA1ICsrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
