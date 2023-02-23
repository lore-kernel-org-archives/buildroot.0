Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E746C64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A86D0405B8;
	Thu, 23 Feb 2023 22:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A86D0405B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U71morH4QtGI; Thu, 23 Feb 2023 22:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 027964059B;
	Thu, 23 Feb 2023 22:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027964059B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA9791BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9249081E30
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9249081E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9r-W--cl2LL for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:44:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66EC881E2A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66EC881E2A
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:44:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CEE040003;
 Thu, 23 Feb 2023 22:43:57 +0000 (UTC)
Date: Thu, 23 Feb 2023 23:43:56 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20230223234356.1ebf1e50@windsurf>
In-Reply-To: <20230223180847.2512056-2-vincent.stehle@arm.com>
References: <20230223180847.2512056-1-vincent.stehle@arm.com>
 <20230223180847.2512056-2-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677192237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2h8IxglO5q6nZI0emSyu0aRWKV4WfFuZsySEvGnNI/8=;
 b=RnS6s4yVwSwAPP5vj+4Q9cgQvXojadwHgX4IsdtSZlQNJlOtSn5rd3xf7oV0EZ2VRnWO9G
 i5ciVNyChwVVOcFn+49WC2CV3Vzc+xM5vPjhgJqL0Rlu0Tk8yJgNEIB1XQLslq5Zy8kAF9
 1k7baHT3EP1lzmJuxexENkzKaPZQbJMfpT3jGcK6XeYCdRsGfFwK4hrKh0H9DpVbbIB9UN
 hXdXO08qnfijuGb5wHLiUbnAbCJ43KPpHl8g86OnRx6YT3RLs0v+tszlJfgOwzb8T3+tjZ
 R9haea6VD9dlIXYOgQtKNmkQVfmHKFbsXA8UeKCWErgfRz7KUHHykLaWzGluXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RnS6s4yV
Subject: Re: [Buildroot] [PATCH 1/2] boot/boot-wrapper-aarch64: bump version
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

T24gVGh1LCAyMyBGZWIgMjAyMyAxOTowODo0NiArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBCdW1wIGJvb3Qtd3JhcHBlciB0byB0aGUgbGF0
ZXN0IHZlcnNpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50
LnN0ZWhsZUBhcm0uY29tPgo+IENjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25p
QGJvb3RsaW4uY29tPgo+IC0tLQo+ICBib290L2Jvb3Qtd3JhcHBlci1hYXJjaDY0L2Jvb3Qtd3Jh
cHBlci1hYXJjaDY0Lm1rIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKClNlcmllcyBhcHBsaWVkIHRvIG5leHQuIFRoYW5rcyEKClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
