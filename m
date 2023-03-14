Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A1CC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 12:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B80E0418FD;
	Tue, 14 Mar 2023 12:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B80E0418FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQz5pkMKsItH; Tue, 14 Mar 2023 12:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4296C41913;
	Tue, 14 Mar 2023 12:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4296C41913
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B74551BF3D4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D07440AA3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D07440AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bV2cvNEVXOOW for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 12:41:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21949400A6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21949400A6
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 12:41:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A18540006;
 Tue, 14 Mar 2023 12:40:58 +0000 (UTC)
Date: Tue, 14 Mar 2023 13:40:58 +0100
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230314134058.73f5f35d@windsurf>
In-Reply-To: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
References: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678797659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lOx6g6NJXiaKT9LRojmDBxA/dZ4SP66sHBMPl0ENqA=;
 b=jEaXQlHwO+z6/MU+pfZ2IqmN1UKcMfTSO1z71x6WnKPOEsiQIpmymfyOwBMRM5aptvgy2r
 nbk3KBACdyecT/o/1Jo/K83RPVaLwzEHyQmlbNG1rsnu9Wm6icQL6HhpwUXSUBExLplcrL
 omq47bvzX7fGV0y4d3yFomMs6HKPDfM3DxTi4k7sLHRm2rDzBeRDTlayWfYqD0SVx0+JxP
 mCDF+mFOo/oULLf1qDS45TacQxD2qLyAJ0YbjkGVep/dXQ6gTSb0So+gf+tGE4wtQSB6Qd
 95Fihb6+FyaJw6lGP9r0CFsT5h8Gb6GnTMczRuwwCXzJe37Iw29IxfYg4FU+ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jEaXQlHw
Subject: Re: [Buildroot] [PATCH 1/4] package/uutils-coreutils: new package
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
Cc: Sebastian Weyer <sebatian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 14 Mar 2023 13:15:03 +0100
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> This package is an implementation of coreutils written completely in rust.
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>

Thanks for working on this!


> diff --git a/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch b/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
> new file mode 100644
> index 0000000000..0540d9becb
> --- /dev/null
> +++ b/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
> @@ -0,0 +1,29 @@
> +From cbec6b8ee3c4418f8f04760678ec655f05e79220 Mon Sep 17 00:00:00 2001
> +From: Sebastian Weyer <sebastian.weyer@smile.fr>
> +Date: Fri, 10 Mar 2023 10:52:00 +0100
> +Subject: [PATCH] GNUMakefile: remove dependency on build during install
> +
> +When we call install we already built the application so we don't want
> +to have to rebuild
> +
> +Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>

It would be good to add the upstream status of this patch here. Was it
sent upstream? If so, a link?


> diff --git a/package/uutils-coreutils/Config.in b/package/uutils-coreutils/Config.in
> new file mode 100644
> index 0000000000..76ce5b174d
> --- /dev/null
> +++ b/package/uutils-coreutils/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_UUTILS_COREUTILS
> +	bool "uutils-coreutils"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	help
> +	  uutils is an attempt at writing universal (as in
> +	  cross-platform) CLI utilities in Rust. While all programs have
> +	  been implemented, some options might be missing or different
> +	  behavior might be experienced.

We like to have a blank line followed by the URL of the project
homepage, at the end of the Config.in help text.

> diff --git a/package/uutils-coreutils/uutils-coreutils.hash b/package/uutils-coreutils/uutils-coreutils.hash
> new file mode 100644
> index 0000000000..b4855222fd
> --- /dev/null
> +++ b/package/uutils-coreutils/uutils-coreutils.hash
> @@ -0,0 +1,2 @@
> +#Locally generated

Nit: space after #

> +sha256  5bc773bcbc66851aa17979df44224c66c0b5323044c3c9cefb925b44ee9cd81b  uutils-coreutils-0.0.17.tar.gz

We also need a hash for the license file.

> diff --git a/package/uutils-coreutils/uutils-coreutils.mk b/package/uutils-coreutils/uutils-coreutils.mk
> new file mode 100644
> index 0000000000..37a647a1f0
> --- /dev/null
> +++ b/package/uutils-coreutils/uutils-coreutils.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# uutils-coreutils
> +#
> +################################################################################
> +
> +UUTILS_COREUTILS_VERSION = 0.0.17
> +UUTILS_COREUTILS_SITE = $(call github,uutils,coreutils,$(UUTILS_COREUTILS_VERSION))
> +UUTILS_COREUTILS_LICENSE = MIT
> +UUTILS_COREUTILS_LICENSE_FILES = LICENSE

There is no dependency on host-rustc ? How can the rust compiler be
available prior to building this package then ?

> +UUTILS_COREUTILS_BUILD_OPTS = PROFILE=release MULTICALL=y PREFIX=$(TARGET_DIR)
> +UUTILS_COREUTILS_INSTALL_OPTS = $(UUTILS_COREUTILS_BUILD_OPTS) install

Is PREFIX= needed at build time ?

> +
> +define UUTILS_COREUTILS_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(UUTILS_COREUTILS_BUILD_OPTS) -C $(@D)
> +endef
> +
> +define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
> +	$(TARGET_ENV) $(MAKE) $(UUTILS_COREUTILS_INSTALL_OPTS) -C $(@D)

I think we will prefer to not have BUILD_OPTS/INSTALL_OPTS but instead:

UUTILS_COREUTILS_MAKE_OPTS = \
	PROFILE=release \
	MULTICALL=y

define UUTILS_COREUTILS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		$(UUTILS_COREUTILS_MAKE_OPTS) -C $(@D)
endef

define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) \
		$(UUTILS_COREUTILS_MAKE_OPTS) -C $(@D) \
		PREFIX=$(TARGET_DIR) install
endef

(assuming PREFIX= is only needed at install time)

It does the same, but the above suggestion is a bit more idiomatic in
Buildroot.

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
