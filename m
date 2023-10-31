Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75266C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26387428B8;
	Tue, 31 Oct 2023 12:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26387428B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GvW3mEsOm8O; Tue, 31 Oct 2023 12:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3608242250;
	Tue, 31 Oct 2023 12:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3608242250
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0320B1BF31A
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBB234178F
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB234178F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mDAGq6xWSXo5 for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:43:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BD3841720
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BD3841720
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4994E0005;
 Tue, 31 Oct 2023 12:43:18 +0000 (UTC)
Date: Tue, 31 Oct 2023 13:43:17 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20231031134317.4ce2349e@windsurf>
In-Reply-To: <20231020114236.4129636-3-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698756199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w14BZZwrFaQctUqiwF8aS7eMhIJvCogntkE6t7HPZ5o=;
 b=gT0/q8JLqjkSexoYdeStXn24+TZZlfrmhxIJZVS/YcbFJtsmkBdObPlQL48bQKb4cB/38e
 ioF8UcsiRlg1f77dixBTVX7QDbXGeG61hAnfoMg3VIpApm+0DW8618p/9uq7z3Oqf07lby
 lszkc63q0s476I2M0xdLQI7eLwyPuos2MqLd62u5OqP7xFs7HXN+szt4qmyTmUmroKvwFs
 Fs5PjwpG61CJQXaNLs0nhXtKED0w2HBy+M9ELSkhWWuNVo2de2l3U5rTCyTj7ipidEbNh4
 pxI7lHny/PxEKuAT7ysN0Qmaw6kLP7W5+8jgr+tJgwaXKnTKDcoHWqY8j2G6Ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gT0/q8JL
Subject: Re: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 20 Oct 2023 12:42:29 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:


> diff --git a/package/newlib-bare-metal/Config.in.host b/package/newlib-bare-metal/Config.in.host
> new file mode 100644
> index 0000000000..be92a1d6a6
> --- /dev/null
> +++ b/package/newlib-bare-metal/Config.in.host
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_HOST_NEWLIB_BARE_METAL
> +	bool "host newlib-bare-metal"
> +	help
> +	  Build the newlib C library for a bare-metal toolchain
> +
> +if BR2_PACKAGE_HOST_NEWLIB_BARE_METAL
> +
> +config BR2_PACKAGE_HOST_NEWLIB_BARE_METAL_VERSION
> +	string
> +	default "4.1.0"
> +
> +endif #BR2_PACKAGE_HOST_NEWLIB_BARE_METAL

Like the other packages: this Config.in is useless, so it can be
dropped.

> diff --git a/package/newlib-bare-metal/newlib-bare-metal.hash b/package/newlib-bare-metal/newlib-bare-metal.hash
> new file mode 100644
> index 0000000000..1a681ecf77
> --- /dev/null
> +++ b/package/newlib-bare-metal/newlib-bare-metal.hash
> @@ -0,0 +1,8 @@
> +# Locally calculated
> +sha256  f296e372f51324224d387cc116dc37a6bd397198756746f93a2b02e9a5d40154  newlib-4.1.0.tar.gz
> +
> +# Hashes for license files locally calculated
> +sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> +sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
> +sha256  f3b7f3e4426b1fa6f60198dae7adfedd94b77b28db2d108adc0253575011e0ff  COPYING.LIBGLOSS
> +sha256  422aa40293093fb54fc66e692a0d68fd0b24ed5602e5d1d33ad05ba3909057e9  COPYING.NEWLIB
> diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
> new file mode 100644
> index 0000000000..a42e04877a
> --- /dev/null
> +++ b/package/newlib-bare-metal/newlib-bare-metal.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# newlib-bare-metal
> +#
> +################################################################################
> +
> +HOST_NEWLIB_BARE_METAL_VERSION = \
> +	$(call qstrip,$(BR2_PACKAGE_HOST_NEWLIB_BARE_METAL_VERSION))
> +ifeq ($(HOST_NEWLIB_BARE_METAL_VERSION),)
> +HOST_NEWLIB_BARE_METAL_VERSION = 4.1.0
> +endif

Just hardcode the version number.

> +
> +HOST_NEWLIB_BARE_METAL_SITE = ftp://sourceware.org/pub/newlib
> +HOST_NEWLIB_BARE_METAL_SOURCE = newlib-$(HOST_NEWLIB_BARE_METAL_VERSION).tar.gz
> +HOST_NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
> +
> +HOST_NEWLIB_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
> +HOST_NEWLIB_BARE_METAL_LICENSE_FILES = COPYING \
> +	COPYING.LIB \
> +	COPYING.LIBGLOSS \
> +	COPYING.NEWLIB
> +
> +NEWLIB_ARCH = \
> +	$(call qstrip,$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
> +
> +HOST_NEWLIB_BARE_METAL_CONF_OPTS = \
> +	--target=$(NEWLIB_ARCH)-elf \
> +	CC_FOR_TARGET=$(HOST_DIR)/bin/$(NEWLIB_ARCH)-elf-gcc \
> +	AR_FOR_TARGET=$(HOST_DIR)/bin/$(NEWLIB_ARCH)-elf-ar \
> +	RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(NEWLIB_ARCH)-elf-ranlib \

Same comment as on the gcc patch on whether
BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH should carry the
architecture name, or the full tuple. Preference for the latter on my
side.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
