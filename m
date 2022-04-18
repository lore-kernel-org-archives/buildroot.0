Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9C6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 15:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D97B83E1B;
	Mon, 18 Apr 2022 15:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pl472PhN7VHG; Mon, 18 Apr 2022 15:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E59848378C;
	Mon, 18 Apr 2022 15:20:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 138FF1BF358
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 15:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F403E40B9A
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 15:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjdexCxNQoOu for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 15:20:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DD4C403C2
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 15:20:24 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 437B3FF807;
 Mon, 18 Apr 2022 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650295220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a2742Xd/XHw/OWPJlUBQjuFRHFbn0R2SjXVTFxRpeX8=;
 b=XmM1W/wbYX93pnP9Xj6oYQz2HG+CQSZ7NI+090O/kDA4+ueNE+SUVuXPHwzgUZqm/xwRmR
 jEKRIfns+fe1CrjGn2uRb0RO7aEI1Rfq9Av+TNrfGT6zgkU4fppJMQrxQOqR030DRIUvln
 RKFSfolAwbsqZa72eOgxyv6dICBysVGcFPiPeqBLn6/ZerHvaMOgFkBDv6gBUqtyZ3/njY
 0urrtutuELyJ7/jiCGYY0V0ZPZ+Dm6AeqHgoSxhfrsfMnCCuTO1RWczep2kePSGaMpArWV
 YYDieOVZhIKFwLg/9mcOJaOzHXaQtuI+PYypkg0GaTniVDbZ7B9mSe/WfA4zoQ==
Date: Mon, 18 Apr 2022 17:20:18 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220418172018.607608a7@bootlin.com>
In-Reply-To: <20220417213601.78389ca7@windsurf>
References: <20220414203059.1818820-1-fontaine.fabrice@gmail.com>
 <20220415083657.357a65ce@bootlin.com>
 <20220417213601.78389ca7@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/php-apcu: needs threads
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Herve Codina via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBGYWJyaWNlLAoKT24gU3VuLCAxNyBBcHIgMjAyMiAyMTozNjowMSArMDIwMApU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4g
SGVsbG8gSGVydsOpLAo+IAo+IE9uIEZyaSwgMTUgQXByIDIwMjIgMDg6MzY6NTcgKzAyMDAKPiBI
ZXJ2ZSBDb2RpbmEgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3Rl
Ogo+IAo+ID4gQWNrZWQuICAKPiAKPiBJZiB5b3Ugd2FudCB5b3VyIEFja2VkLWJ5IHRvIGJlIHJl
Y29yZGVkIGJ5IHBhdGNod29yaywgaXQgbmVlZHMgdG8gYmUgYQo+IGZ1bGwgQWNrZWQtYnk6LCBm
b2xsb3dlZCBieSB5b3VyIG5hbWUgYW5kIGUtbWFpbC4KPiAKPiBUaG9tYXMKCkFja2VkLWJ5OiBI
ZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KCkhlcnbDqQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
