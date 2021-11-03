Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AC1C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 15:50:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E688261076
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 15:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E688261076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BFD540150;
	Wed,  3 Nov 2021 15:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4UKu9Z9ypZn; Wed,  3 Nov 2021 15:50:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADE7540142;
	Wed,  3 Nov 2021 15:50:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB6FB1BF2A5
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 15:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A761C40150
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 15:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozBiN8E61VzZ for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 15:50:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7973E40003
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 15:50:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 04E0E4000F;
 Wed,  3 Nov 2021 15:50:01 +0000 (UTC)
Date: Wed, 3 Nov 2021 16:50:00 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211103165000.2b694680@windsurf>
In-Reply-To: <20211103073656.1689919-5-herve.codina@bootlin.com>
References: <20211103073656.1689919-1-herve.codina@bootlin.com>
 <20211103073656.1689919-5-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/libshdata: new package
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

Hello,

On Wed,  3 Nov 2021 08:36:55 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> The libshdata library provides lock free shared-memory tools.
> 
> https://github.com/Parrot-Developers/libshdata
> 
> The provided patch was submitted upstream.
> https://github.com/Parrot-Developers/libshdata/issues/1

This should rather go in the patch itself.


> diff --git a/package/libshdata/Config.in b/package/libshdata/Config.in
> new file mode 100644
> index 0000000000..730fb34dff
> --- /dev/null
> +++ b/package/libshdata/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_LIBSHDATA
> +	bool "libshdata"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libfutils
> +	depends on BR2_INSTALL_LIBSTDCPP # libfutils
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libfutils
> +	select BR2_PACKAGE_LIBFUTILS
> +	help
> +	  This library provides lock free shared-memory tools
> +
> +	  https://github.com/Parrot-Developers/libshdata
> +
> +comment "libshdata needs a toolchain w/ C++, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

This needs to go *after* the if ... endif block, or the indentation of
the if ... endif block is broken in menuconfig. Also, you need to
account for the HAS_SYNC_4 and HAS_ATOMIC dependencies.


> +define LIBSHDATA_BUILD_CMDS
> +	$(ALCHEMY_TARGET_CONFIGURE_ENV) \
> +	$(call ALCHEMY_TARGET_CONFIGURE_SDKS, libfutils) \
> +	$(LIBSHDATA_CONF_ENV) \
> +	$(ALCHEMY_MAKE) $(LIBSHDATA_TARGETS)

Indentation.

> +endef
> +
> +define LIBSHDATA_INSTALL_STATIC_LIBS
> +	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libshdata.a $(strip $(1))/usr/lib/
> +	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libshdata-section-lookup.a $(strip $(1))/usr/lib/
> +endef
> +
> +define LIBSHDATA_INSTALL_HEADERS
> +	cp -Raf $(@D)/include/* $(strip $(1))/usr/include/
> +endef
> +
> +ifeq ($(BR2_STATIC_LIBS),)
> +define LIBSHDATA_INSTALL_SHARED_LIBS
> +	$(INSTALL) -m 755 $(@D)/alchemy-out/staging/usr/lib/libshdata.so* $(strip $(1))/usr/lib/

Sot here are two separate static libraries, but only one shared library ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
