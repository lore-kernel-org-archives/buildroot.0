Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD96CCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 23:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6107D616EB;
	Wed, 15 Oct 2025 23:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5pwe2FyBo_B; Wed, 15 Oct 2025 23:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85605616EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85605616EC;
	Wed, 15 Oct 2025 23:06:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A17A5968
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87DCB616EC
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNwT54axsZrT for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 23:06:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5ADD4616EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ADD4616EB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ADD4616EB
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:06:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 21A05B978FA9; Wed, 15 Oct 2025 21:57:59 +0200 (CEST)
Message-ID: <9c33b3bf-8740-4682-bca4-4efc9f952069@rnout.be>
Date: Wed, 15 Oct 2025 21:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251015190519.1073379-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251015190519.1073379-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1760558279; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=yB38bhkVgFTIeEZG4bXU6seGGvx438kk2hvd7ebc74M=;
 b=gVoWZ8ksafO7bEIVQMgYBYVJIf4p/MYRNkMZ3lPF7Q+YntJAQcMA5nV8dH/M+47vlD24Lg
 xbXFnuAz84xiGwsVez1E4jUf4b7f2Y1k5Be0gM7aPuRKCSh88DcIAeW9ReTAihldohz2GP
 mTj5nmGucAlML5jr/mkBjHWjZDZ4OluRlJ781tf+rREp/s2TIjblfG+0go9pss24bf+TVb
 hAuPgnRTeBzY5KgRpXOVYkPbHIvbCbNk2lZuWVJYmvP33pJnxfYMFa14vuFMmLMUzHhakp
 5saNkhnqEqQYp71VvTqAGYZ/ATgTwuu97XxQDW7yg0I7bQXCs75JhBqCwqpuFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=gVoWZ8ks
Subject: Re: [Buildroot] [PATCH 1/1] package/lesstif: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2025 21:05, Bernd Kuhls wrote:
> lesstif received its last release in 2009, the homepage was last
> updated in 2013: https://lesstif.sourceforge.net
> 
> The last update on the project trackers was in 2015:
> https://sourceforge.net/projects/lesstif/support
> 
> Debian removed lesstif in 2013:
> https://wiki.debian.org/lesstif2motifTransition
> 
> The package is causing build errors since the default version of gcc was
> bumped to 14.x with buildroot commit 1e1fafa1f0f5069418e92f702c2a66db6408a634:
> 
> CutPaste.c:1031:25: error: assignment to 'long int *' from incompatible
>   pointer type 'char *' [-Wincompatible-pointer-types]
> 
> Instead of fixing an unmaintained package we remove it from buildroot,
> no other package depends on it.
> 
> Fixes:
> https://autobuild.buildroot.net/results/798/798ccab7b69754fb9b73b84e31d91bece8e7a2b4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy             |  6 ++++++
>   package/Config.in            |  1 -
>   package/lesstif/Config.in    | 11 ----------
>   package/lesstif/lesstif.hash |  3 ---
>   package/lesstif/lesstif.mk   | 42 ------------------------------------
>   5 files changed, 6 insertions(+), 57 deletions(-)
>   delete mode 100644 package/lesstif/Config.in
>   delete mode 100644 package/lesstif/lesstif.hash
>   delete mode 100644 package/lesstif/lesstif.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index f3558c0f3a..ced3bab9c7 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_LESSTIF
> +	bool "lesstif has been removed"
> +	select BR2_LEGACY
> +	help
> +	  lesstif is unmaintained and has been removed
> +
>   config BR2_KERNEL_HEADERS_6_16
>   	bool "kernel headers version 6.16.x are no longer supported"
>   	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index e9906b066e..1ae92409c4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1740,7 +1740,6 @@ menu "Graphics"
>   	source "package/lcms2/Config.in"
>   	source "package/lensfun/Config.in"
>   	source "package/leptonica/Config.in"
> -	source "package/lesstif/Config.in"
>   	source "package/libart/Config.in"
>   	source "package/libavif/Config.in"
>   	source "package/libdecor/Config.in"
> diff --git a/package/lesstif/Config.in b/package/lesstif/Config.in
> deleted file mode 100644
> index 654ee6f1a0..0000000000
> --- a/package/lesstif/Config.in
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -config BR2_PACKAGE_LESSTIF
> -	bool "lesstif"
> -	depends on BR2_USE_MMU # fork()
> -	depends on BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_XLIB_LIBXT
> -	select BR2_PACKAGE_XLIB_LIBXEXT
> -	select BR2_PACKAGE_FREETYPE
> -	help
> -	  lesstif is the Hungry Programmers' version of OSF/Motif
> -
> -	  http://lesstif.sourceforge.net/
> diff --git a/package/lesstif/lesstif.hash b/package/lesstif/lesstif.hash
> deleted file mode 100644
> index 31a394dbbc..0000000000
> --- a/package/lesstif/lesstif.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally computed:
> -sha256  eb4aa38858c29a4a3bcf605cfe7d91ca41f4522d78d770f69721e6e3a4ecf7e3  lesstif-0.95.2.tar.bz2
> -sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING.LIB
> diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
> deleted file mode 100644
> index 378c594e3b..0000000000
> --- a/package/lesstif/lesstif.mk
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -################################################################################
> -#
> -# lesstif
> -#
> -################################################################################
> -
> -LESSTIF_VERSION = 0.95.2
> -LESSTIF_SOURCE = lesstif-$(LESSTIF_VERSION).tar.bz2
> -LESSTIF_SITE = http://downloads.sourceforge.net/project/lesstif/lesstif/$(LESSTIF_VERSION)
> -LESSTIF_INSTALL_STAGING = YES
> -LESSTIF_DEPENDENCIES = \
> -	xlib_libXt \
> -	xlib_libXext \
> -	freetype
> -LESSTIF_LICENSE = LGPL-2.0+
> -LESSTIF_LICENSE_FILES = COPYING.LIB
> -LESSTIF_CONF_OPTS = \
> -	--with-gnu-ld \
> -	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config \
> -	--enable-production=yes \
> -	--enable-build-tests=no \
> -	--no-recursion
> -
> -# Reduces the buggy makefile to the smallest possible (and working) thing
> -define LESSTIF_NOMAN2HTML
> -	echo "all:" > $(@D)/doc/Makefile
> -	echo "" >> $(@D)/doc/Makefile
> -	echo "install:" >> $(@D)/doc/Makefile
> -	echo "" >> $(@D)/doc/Makefile
> -	echo "clean:" >> $(@D)/doc/Makefile
> -endef
> -
> -# Prevents to copy ac_find_motif.m4 on target, it would else
> -# be created at $(TARGET_DIR)/$(HOST_DIR)/share/aclocal/ac_find_motif.m4
> -define LESSTIF_FIXACLOCAL
> -	sed -i -e "/install-data-am: install-aclocalDATA/d" $(@D)/scripts/autoconf/Makefile
> -endef
> -
> -LESSTIF_POST_CONFIGURE_HOOKS += LESSTIF_NOMAN2HTML
> -LESSTIF_POST_CONFIGURE_HOOKS += LESSTIF_FIXACLOCAL
> -
> -$(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
