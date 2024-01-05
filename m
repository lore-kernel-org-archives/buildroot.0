Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43578C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 09:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6BA983DD1;
	Fri,  5 Jan 2024 09:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BA983DD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLrOeUKhAmkS; Fri,  5 Jan 2024 09:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D92383DCC;
	Fri,  5 Jan 2024 09:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D92383DCC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EBE01BF306
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 09:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FF3061442
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 09:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FF3061442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLEaH85KGYQ8 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 09:11:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 560466143F
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 09:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 560466143F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F755240006;
 Fri,  5 Jan 2024 09:11:06 +0000 (UTC)
Date: Fri, 5 Jan 2024 10:11:05 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240105101105.6a181dcd@windsurf>
In-Reply-To: <CACXRmJirxfxvBcAV0cyzw+CmOzC7F4sSSOv0Po8zLxMaCndrfQ@mail.gmail.com>
References: <CACXRmJirxfxvBcAV0cyzw+CmOzC7F4sSSOv0Po8zLxMaCndrfQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704445867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53WrzwrVNNd5TReaU2bXMQWcRyLYWgwH2DhD2nMNGKw=;
 b=UVHeIoPNDizmoPpEp7aVBS92szgOcfl3+/zarZcbEcatg372zobIHK7lglUYhoUS/G6hcH
 HNuW2xtURpePdtRmeGSdgxyJa268H6VeoWQ8JR334RRuWh6z/Llf5/fxqKx+SssSfrG6mQ
 5+E4UPqICHn6eKAjfn9nr+VZnYxINWis6voi0GSfKUTBni4dosARSyWcTtXaHq/x7umnxH
 +E2D5In/RRe6p+2TXLEBwekCzm7Zqtu1xlkGAfB28PgQfIP/WZb+XZ5G+zf9Pq6qBANshn
 wMK6xi++m08+T3Ew+K3P8BR0O2LRdZgEWiP4/r37S+++Ooas5qbNo0w43hca2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UVHeIoPN
Subject: Re: [Buildroot] bump webkitgtk
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Fri, 5 Jan 2024 10:06:54 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> I have an open patch series to bump webkitgtk, which has been open for a while.
> https://patchwork.ozlabs.org/project/buildroot/list/?series=381656
> 
> The patches have been tested and acknowledged by Adrian. Ideally, the
> series will get merged before the 2024.02 window, which is the next
> LTS. What do you think?

I agree. We have lots of webkitgtk patches, including some fixes (some
of which haven't been looked at by Adrian I believe).

> I also saw that cairo is outdated, for which I also have a patch.
> (https://patchwork.ozlabs.org/project/buildroot/patch/20240102090933.64969-1-thomas.devoogdt@barco.com/)
> That one is a bit more tricky since the build system has been changed
> upstream. So I can use an additional pair of eyes to check that one.

I also saw this patch. My initial reaction is that I would have
preferred a staged approach, where we first bump to a version that
supports autotools and meson in one patch, then switch from autotools
to meson in one patch (without bumping), then bump again to whatever
latest version. This would have made review slightly easier. However, I
agree this is quite a bit of additional work, on top of very good work
you've already done, so I think we should just bite the bullet and look
at what you did, even if it's in a single patch.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
