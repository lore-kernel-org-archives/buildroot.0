Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB60C001DE
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 16:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43FC240CA5;
	Tue,  8 Aug 2023 16:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43FC240CA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13xjEi6USCa3; Tue,  8 Aug 2023 16:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EF8A40C49;
	Tue,  8 Aug 2023 16:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EF8A40C49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52F2B1BF5A5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 393E161127
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 393E161127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IyE3YIuG-Is for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 16:49:54 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E01E660B5A
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 16:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E01E660B5A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B7B8240009;
 Tue,  8 Aug 2023 16:49:51 +0000 (UTC)
Date: Tue, 8 Aug 2023 18:49:51 +0200
To: =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez via buildroot <buildroot@buildroot.org>
Message-ID: <20230808184951.2a5299c0@windsurf>
In-Reply-To: <20230808143115.290604-1-clement.ramirez@bootlin.com>
References: <20230808143115.290604-1-clement.ramirez@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691513392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmhHhKZJ1Pdd1cJhIJzmkpuBCHxXpA+c0Ay3xtSGNG4=;
 b=Jw3VKiisjZmX1KtTt+cr9n+ZxHcKxgDGHCbw/umiyb+fdNFLAO6EsKUcSE4SUgeX3Vqzq6
 MVS6rCslfnJvBCYDb0aTn3ah4Ayr81ATkfR2/ztwhao3T/ZpOUyNrG01XUjHcjp0y7RWB5
 P8qsB8spovw/grRGEgzIA2MXHdN99ZnrSucyyhG6x3Yw3TFwFUj2QicbslL72kvCw1jG5X
 LB7rj6HSKCEhxgB2KF+gx3cSo/SIt6juUd29wOqp26I3EwyZBRjOabhvOIgFNK9L6FuS2u
 kAZPNQIonvCA1BFlEw6fZuBNLvCwmgVRMcAuZVR/TrES1Ki51gp4S62lcymzFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jw3VKiis
Subject: Re: [Buildroot] [PATCH 1/1] package/chocolate-doom: add VENDOR AND
 PRODUCT CPE IDs
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
Cc: Rodrigo Rebello <rprebello@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAgOCBBdWcgMjAyMyAxNjozMToxNSArMDIwMApDbMOpbWVudCBSYW1pcmV6IHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gY3BlOjIuMzphOmNo
b2NvbGF0ZS1kb29tOmNob2NvbGF0ZV9kb29tIGlzIGEgdmFsaWQgaWRlbnRpZmllciBmb3IKPiB0
aGlzIHBhY2thZ2U6Cj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvcHJvZHVjdHMvY3BlL3NlYXJjaC9y
ZXN1bHRzP25hbWluZ0Zvcm1hdD0yLjMma2V5d29yZD1jaG9jb2xhdGUtZG9vbQo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IFJhbWlyZXogPGNsZW1lbnQucmFtaXJlekBib290bGluLmNvbT4K
PiAtLS0KPiAgcGFja2FnZS9jaG9jb2xhdGUtZG9vbS9jaG9jb2xhdGUtZG9vbS5tayB8IDIgKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRo
YW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
