Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399F8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 15:47:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFDC960E73
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 15:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFDC960E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A6E680E88;
	Wed,  3 Nov 2021 15:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tm8bDX0xgdkw; Wed,  3 Nov 2021 15:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A20C80EC7;
	Wed,  3 Nov 2021 15:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF85F1BF2A5
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 15:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE63940422
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 15:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m7KBMN1cwWTy for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 15:47:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AA1C40416
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 15:47:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 03A8140007;
 Wed,  3 Nov 2021 15:47:02 +0000 (UTC)
Date: Wed, 3 Nov 2021 16:47:01 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211103164701.13a2973d@windsurf>
In-Reply-To: <20211103073656.1689919-3-herve.codina@bootlin.com>
References: <20211103073656.1689919-1-herve.codina@bootlin.com>
 <20211103073656.1689919-3-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/ulog: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Nov 2021 08:36:53 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> +ULOG_VERSION = 0389d243352255f6182326dccdae3d56dadc078f
> +ULOG_SITE = $(call github,Parrot-Developers,ulog,$(ULOG_VERSION))
> +ULOG_LICENSE = Apache-2.0
> +ULOG_LICENSE_FILES = COPYING
> +ULOG_DEPENDENCIES = host-alchemy
> +ULOG_INSTALL_STAGING = YES
> +
> +define ULOG_BUILD_CMDS
> +	$(ALCHEMY_TARGET_CONFIGURE_ENV) \
> +	$(ALCHEMY_MAKE) libulog

Please indent the continuation line.

> +define ULOG_INSTALL_STATIC_LIBS
> +	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libulog.a $(strip $(1))/usr/lib/
> +endef

I am not entirely sure we need to $(strip ...) the $(1) argument here
and in other macros. We have several other places in Buildroot for
similar situations where we don't strip $(1). (Note: this is not a very
important comment.)

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
