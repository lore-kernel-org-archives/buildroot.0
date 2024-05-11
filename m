Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AF0C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FE1242342;
	Sat, 11 May 2024 20:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COdgLJfQYjqq; Sat, 11 May 2024 20:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BEBC42350
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BEBC42350;
	Sat, 11 May 2024 20:08:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2FEA1BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0401400FB
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVJyPeYR6-fa for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37500400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37500400E5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37500400E5
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:08:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB4741C0008;
 Sat, 11 May 2024 20:08:10 +0000 (UTC)
Date: Sat, 11 May 2024 22:08:09 +0200
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <20240511220809.5d62155e@windsurf>
In-Reply-To: <20240219213402.186876-1-kadambini.nema@gmail.com>
References: <20240212002607.12158-1-kadambini.nema@gmail.com>
 <20240219213402.186876-1-kadambini.nema@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715458091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQLfM13nb4ebER9qXCl6eoP+zEgiYVTO4duQyRDHJ9s=;
 b=ZlbA9IwNh5Y6UPLnjlldpFMg+t/WYJ4WAVXgpII0eiWSkTQyT6bWyuauGVTYoi7RiIvzk4
 OYvecistcjKbN6oXIFwNIxix1+qOs83dPdVL2wT6MR9D1mSV97T7BF2oFJHJBBgjEmw0kc
 vRDAfeX0H2tx3AjBCjttmWJAKgWIDICMzS8QWHQ9ow70gMC/QOr3uiXtw9o7aVxmD1N4Y8
 hX+XJoblP+/5XSSZ7sfqHPaMmZdRuKadG+KeLUn1MlVuHDLN9AiwYYmf7O0xJGZVhyL9dD
 O1HWpWtNNnuv8+rjwgZF5gX8AqvPHdZbWj49oK9Las1kJF2ZFr9zvBegVKuo9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZlbA9IwN
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kadambini,

Thanks, I applied your patch, with a number of changes, see below.

On Mon, 19 Feb 2024 13:34:02 -0800
Kadambini Nema <kadambini.nema@gmail.com> wrote:

> diff --git a/package/ustreamer/Config.in b/package/ustreamer/Config.in
> new file mode 100644
> index 0000000000..52c511e22d
> --- /dev/null
> +++ b/package/ustreamer/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_USTREAMER
> +	bool "ustreamer"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 # V4L2_EVENT_SOURCE_CHANGE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC

I'm not sure why this dependency was needed. It built fine for sparc,
which normally causes problems with libatomic.

> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_LIBBSD
> +	select BR2_PACKAGE_LIBGPIOD

libgpiod is not a mandatory dependency, so I dropped this. And in fact,
with a select BR2_PACKAGE_LIBGPIOD, you should have added a depends on
BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8, which is inherited from libgpiod.

The BR2_USE_WCHAR dependency from libbsd was missing.

Overall, the result is:

+       bool "ustreamer"
+       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 # V4L2_EVENT_SOURC
E_CHANGE
+       depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
+       depends on !BR2_STATIC_LIBS # libbsd
+       depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
+       depends on BR2_USE_WCHAR # libbsd
+       select BR2_PACKAGE_JPEG
+       select BR2_PACKAGE_LIBBSD
+       select BR2_PACKAGE_LIBEVENT



> +	help
> +	  Lightweight and fast MJPEG-HTTP streamer
> +
> +	  https://github.com/pikvm/ustreamer
> +
> +comment "ustreamer needs a toolchain w/ threads, headers >= 3.16, dynamic library"

This was missing depends on so that it only appears when relevant, i.e:

+comment "ustreamer needs a toolchain w/ headers >= 3.16, threads, dynamic library, wchar"
+       depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 || \
+               !BR2_TOOLCHAIN_HAS_THREADS || \
+               BR2_STATIC_LIBS || \
+               !BR2_USE_WCHAR


> diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
> new file mode 100644
> index 0000000000..71de097a22
> --- /dev/null
> +++ b/package/ustreamer/ustreamer.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# ustreamer
> +#
> +################################################################################
> +
> +USTREAMER_VERSION = 5.51
> +USTREAMER_SITE = $(call github,pikvm,ustreamer,refs/tags)
> +USTREAMER_SOURCE = v$(USTREAMER_VERSION).tar.gz

This is not how the github macro is meant to be used. It's supposed to
be used like this:

+USTREAMER_VERSION = 5.51
+USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))

> +USTREAMER_SUBDIR = ustreamer

This is not used, so I dropped it.

> +USTREAMER_LICENSE = GPL-3.0-or-later

We don't use the SPDX identifier for this case, we use:

+USTREAMER_LICENSE = GPL-3.0+

> +USTREAMER_LICENSE_FILES = LICENSE
> +USTREAMER_DEPENDENCIES = jpeg libevent libbsd libgpiod

I dropped libgpiod here.

> +USTREAMER_CONF_ENV = "CFLAGS=$(TARGET_CFLAGS)"

This was not used anywhere, so I dropped.

> +
> +define USTREAMER_BUILD_CMDS
> +	$(MAKE)  $(if $(BR2_PACKAGE_SYSTEMD),WITH_SYSTEMD=1, ) WITH_PTHREAD_NP=1  WITH_SETPROCTITLE=1 HAS_PDEATHSIG=1 $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef

The systemd case was not working, because you were not adding a
dependency on systemd, so nothing was making sure that systemd would
get built before ustream. I also added handling libgpiod as an optional
dependency. Overall it looks like this now:

+USTREAMER_MAKE_OPTS = \
+       $(TARGET_CONFIGURE_OPTS) \
+       WITH_PTHREAD_NP=1 \
+       WITH_SETPROCTITLE=1 \
+       HAS_PDEATHSIG=1
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+USTREAMER_MAKE_OPTS += WITH_SYSTEMD=1
+USTREAMER_DEPENDENCIES += systemd
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
+USTREAMER_MAKE_OPTS += WITH_GPIO=1
+USTREAMER_DEPENDENCIES += libgpiod
+endif
+
+define USTREAMER_BUILD_CMDS
+       $(TARGET_MAKE_ENV) $(MAKE) $(USTREAMER_MAKE_OPTS) -C $(@D)
+endef

Applied with all those changes!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
