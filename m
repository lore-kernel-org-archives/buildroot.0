Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0C2C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 21:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1BA2408A3;
	Sun, 11 Dec 2022 21:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1BA2408A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cp-LpTxNkUy7; Sun, 11 Dec 2022 21:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E941F402E2;
	Sun, 11 Dec 2022 21:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E941F402E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BE401BF309
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 375E54047B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 375E54047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nu4wMLCj6s_o for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 21:22:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2E7140463
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2E7140463
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 21:22:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2706B60004;
 Sun, 11 Dec 2022 21:22:30 +0000 (UTC)
Date: Sun, 11 Dec 2022 22:22:29 +0100
To: =?UTF-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>
Message-ID: <20221211222229.678a56dc@windsurf>
In-Reply-To: <CAB0FRssQAoVA9syt1SM3mwafto722J3rxWXeHwiVRsWFmCyBPw@mail.gmail.com>
References: <20221206171719.747581-1-gadiyar@ti.com>
 <20221206171719.747581-3-gadiyar@ti.com>
 <20221211210933.19fb5199@windsurf>
 <CAB0FRssQAoVA9syt1SM3mwafto722J3rxWXeHwiVRsWFmCyBPw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670793751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2S3haDhNWD0XROm/2WckILdntvJuRP6qcX55T4/DSqs=;
 b=nIm4a97Xk5JaXYZNtewPspe8rHv1CND4UW7Ayc+U6Id3MoVyAHromL534luGeYNCedN2Lt
 1Ihoof3/ZqCXGqCC8mBlOckG5OH79oqgbXIeDecZJiPUlmua0lHUVbSmqBKUhRw96IRgGo
 sWTQy/OY7G3hFiB6bxYLYilyR15pqkmzh8kQ6KOsK7dXxh++q02GlhDxkrkS+MqQyEmcn9
 4I/I4ebtVlMwEK/beWpGLbThEQKuqTXGBc+8KaEal+gpfq6NgTgIQ9cKR7T9S6lPZpy+kV
 C1dALwwMeCsG40DXbLVRgubXMNvvwQGk4UsN8zc7HsSitcHIINsoRY/upt8T1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nIm4a97X
Subject: Re: [Buildroot] [PATCH v7 2/3] boot/ti-k3-image-gen: add new package
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Anand Gadiyar via buildroot <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxMSBEZWMgMjAyMiAyMTo0MToxMSArMDEwMApGcmFuw6dvaXMgUGVycmFkIDxmcmFu
Y29pcy5wZXJyYWRAZ2Fkei5vcmc+IHdyb3RlOgoKPiBzZWUKPiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIxMjExMjAzODI2LjMxMTc3ODQt
MS1mcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmcvCj4gdGhpcyBwYXRjaCBkb2VzIHRoaXMgcmV3b3Jr
LgoKVGhhbmtzLCBidXQgaXQgbmVlZHMgdG8gYmUgaW50ZWdyYXRlZCBpbiBhIHY4IG9mIHRoZSBw
YXRjaCBzZXJpZXMuCgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93
bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
