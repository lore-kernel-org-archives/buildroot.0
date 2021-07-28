Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6ACC4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:03:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204F96101B
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 204F96101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B58B640195;
	Wed, 28 Jul 2021 21:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZV3AwKlzICGQ; Wed, 28 Jul 2021 21:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B143340520;
	Wed, 28 Jul 2021 21:03:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7898E1BF2AF
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59FB56FB22
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjyNhJUasRip for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 21:03:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47AAF608B5
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 21:03:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 802C520004;
 Wed, 28 Jul 2021 21:02:59 +0000 (UTC)
Date: Wed, 28 Jul 2021 23:02:56 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20210728230256.69091b92@windsurf>
In-Reply-To: <20210428041216.22955-1-fido_max@inbox.ru>
References: <20210428041216.22955-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 1/2] package/libosmium: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Maxim,

On Wed, 28 Apr 2021 07:12:14 +0300
Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> A fast and flexible C++ library for working with OpenStreetMap data.
> Libosmium works on Linux, macOS and Windows.
> 
> https://osmcode.org/libosmium/
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Sorry for the long delay in getting to this package submission, but
there's one good news: I finally applied it!

I found the CMake machinery to not be very clear to understand in terms
of what are the mandatory vs. optional dependencies.

> +ifeq ($(BR2_PACKAGE_BZIP2),y)
> +LIBOSMIUM_DEPENDENCIES += bzip2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGEOS),y)
> +LIBOSMIUM_DEPENDENCIES += libgeos
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGDAL),y)
> +LIBOSMIUM_DEPENDENCIES += libgdal
> +endif

This package doesn't exist in Buildroot I'm afraid, so I dropped this.

Also, I've added optional dependencies on zlib, expat, lz4, to match
with the optional dependencies that we have in Buildroot, and which
libosmium can use.

Do not hesitate to check the final commit and see if it works for you.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
