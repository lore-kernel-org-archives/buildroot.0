Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFAAC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DC1D43727;
	Wed, 10 Jan 2024 21:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DC1D43727
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtrfJ-1By4aX; Wed, 10 Jan 2024 21:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F6FA436D7;
	Wed, 10 Jan 2024 21:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F6FA436D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C13201BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A34B42414
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A34B42414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKaBsUwYXRM2 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:35:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1684C41E25
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1684C41E25
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBED640005;
 Wed, 10 Jan 2024 21:35:00 +0000 (UTC)
Date: Wed, 10 Jan 2024 22:34:59 +0100
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240110223459.42764e0d@windsurf>
In-Reply-To: <20230424074012.3099559-1-aperez@igalia.com>
References: <20230423214014.2963361-1-aperez@igalia.com>
 <20230424074012.3099559-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704922501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dczETDkA+M+kMq0s7i8BLzrjG/73dMQ8speu1BO4hFw=;
 b=As/StMPLoJSYcKGhDlM7+d494Mj5Mn5uPGbTlYw299rhiTrVKdbVoT4yFlWSQksXdU3Dfc
 DaL0QN02QFRGZ9B/1wKrO89ZDqupmGBUF+glFKsQccX0muSDDVcRbRH4nzgwSscQeL1zb/
 9J7eKbRkwkA6lp6tpG0jIHBoJsWODQ1+B9wJ3MwawOPRUD1mlNEz0hcAH7LBHYuxsSsnUr
 9d7qCZNlEpmNc97tjAqpx4HP3oGlUQUCJ4SSYaNXVBkc3CTn0P6K2GmW2BwuF4Xzlhv287
 Y9idcQoro/zvkeKG4xv2ZHplkIDyDGQSzgY5L8KSLbka1WXnX/o1gBZtwxOhyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=As/StMPL
Subject: Re: [Buildroot] [PATCH v2] package/sunxi-mali-utgard: support the
 wayland driver
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 24 Apr 2023 10:40:12 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Add a choice to allow using the Wayland variant of the r6p2 Mali driver.
> When selected, the package is marked as provider for libgbm as
> libMali.so includes the symbols and a libgbm.so symlink is installed;
> and both BR2_PACKAGE_HAS_{LIBGBM,LIBEGL_WAYLAND} are selected
> accordingly.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
> Changes v1 -> v2:
>   - Make Wayland support depend on version r6p2 (suggested by
>     Giulio Benetti).

Thanks, I have applied, with two changes. See below.


> +config BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
> +	bool "wayland"
> +	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
> +	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	select BR2_PACKAGE_HAS_LIBGBM

	select BR2_PACKAGE_WAYLAND

was missing here. Indeed, you have "wayland" in the <pkg>_DEPENDENCIES,
but you didn't select it, causing a build failure.

> -	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
> +	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM)/*.so* \

I have introduced an intermediate SUNXI_MALI_UTGARD_PLATFORM which
contains the qstripped value of BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM,
to keep things a bit nicer and aligned with what the package was
already doing for other variables.

Thanks a lot for this contribution, and sorry for the huge delay!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
