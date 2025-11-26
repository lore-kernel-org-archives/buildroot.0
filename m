Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE9FD0EE29
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 07:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1899D83E98;
	Wed, 26 Nov 2025 07:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mMbaQVWMJC5; Wed, 26 Nov 2025 07:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2670B83E77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2670B83E77;
	Wed, 26 Nov 2025 07:08:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BC352A9
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12523405F5
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpIOOg5wm5nq for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 07:08:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04D54405F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04D54405F4
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04D54405F4
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:08:01 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id D16C2BDE098C;
 Wed, 26 Nov 2025 08:07:56 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 26 Nov 2025 07:07:56 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Rustam Abdullaev <rustamabd@gmail.com>
Cc: buildroot <buildroot@buildroot.org>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <mailman.15362.1763026615.1650107.buildroot@buildroot.org>
References: <mailman.15362.1763026615.1650107.buildroot@buildroot.org>
Message-ID: <d6ae4d621431428881e6f014304cf11e@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1764140878; bh=ljTHLJFX26vmEyJ8gCaPubtIyQYuhJRHm1vjiZHaRVo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=0rrWzDfkmCA/suWE8YzqwQIubVJhOk3IR1QT8Uk6xZnDUXrVxa1ruIzLIyyXEYFj5
 XSDZ4eYq24tneRBawxjNSzLDR6Aq2hCdKatl1SKkgsQhlZShFZGm8V0UvoTYAxcpLc
 PU2e8Rx3qOLUEVWq70MCYc6zZbUsZvKh0Dh/Tb3w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=0rrWzDfk
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: introduce
 BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Rustam,

you should add your remark about glibc upward compatibility to the patch 
description. It helps to understand the context ...

Further remarks below:

On 2025-11-12 17:43, Rustam Abdullaev wrote:
> 
> This change makes it possible to update kernel headers in the external
> toolchain with the headers from the current kernel.
> 
> It is important to have matching kernel headers when building packages
> that make use of kernel features such as seccomp, as they depend on
> system call definitions in linux/unistd.h. A typical example of this is
> openssh - building it with the official ARM GNU toolchain and kernel 
> 6.x
> results in a non-working sshd.
> 
> Signed-off-by: Rustam Abdullaev <rustamabd@gmail.com>
> ---
>  package/linux-headers/linux-headers.mk               |  3 ++-
>  toolchain/Config.in                                  |  6 ++++++
>  toolchain/helpers.mk                                 |  4 +---
>  toolchain/toolchain-buildroot/Config.in              |  2 --
>  toolchain/toolchain-external/Config.in               |  9 +++++++++
>  .../toolchain-external/pkg-toolchain-external.mk     | 12 +++++++++++-
>  6 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/package/linux-headers/linux-headers.mk 
> b/package/linux-headers/linux-headers.mk
> index e2a0b7a7c9..d738bd3e9b 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -5,7 +5,8 @@
>  
> ################################################################################
> 
>  # This package is used to provide Linux kernel headers for the
> -# internal toolchain backend.
> +# internal toolchain backend and for external toolchains that need
> +# updated kernel headers.
> 
>  # Set variables depending on whether we are using headers from a 
> kernel
>  # build or a standalone header package.
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index b3cbec8377..c02d77c08e 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -69,6 +69,12 @@ source "toolchain/toolchain-external/Config.in"
>  # so put it here instead
>  source "package/gdb/Config.in.host"
> 
> +# Linux headers can be used by both internal and external toolchains
> +if BR2_TOOLCHAIN_BUILDROOT || 
> BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
> +source "package/linux-headers/Config.in.host"
> +source "package/linux-headers/Config.in"
> +endif
> +
>  comment "Toolchain Generic Options"
> 
>  # https://sourceware.org/bugzilla/show_bug.cgi?id=27597
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 08ee6060b0..b5cf2b7971 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -165,11 +165,9 @@ copy_toolchain_sysroot = \
>  # $2: sysroot directory
>  # $3: kernel version string, in the form: X.Y
>  # $4: test to do for the latest kernel version, 'strict' or 'loose'
> -#     always 'strict' if this is not the latest version.
>  #
>  check_kernel_headers_version = \
> -	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3) \
> -		$(if $(BR2_TOOLCHAIN_HEADERS_LATEST),$(4),strict); \
> +	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3) $(4) ; \

Do not remove the check completely, but test for 
BR2_PACKAGE_LINUX_HEADERS additionally, similar to 
toolchain/toolchain-external/pkg-toolchain-external.mk

>  	then \
>  		exit 1; \
>  	fi
> diff --git a/toolchain/toolchain-buildroot/Config.in 
> b/toolchain/toolchain-buildroot/Config.in
> index 64f7892f98..ebebe263db 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -104,8 +104,6 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
>  	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
> 
> -source "package/linux-headers/Config.in.host"
> -source "package/linux-headers/Config.in"
>  source "package/musl/Config.in"
>  source "package/uclibc/Config.in"
>  source "package/glibc/Config.in"
> diff --git a/toolchain/toolchain-external/Config.in 
> b/toolchain/toolchain-external/Config.in
> index c1c159cb8e..d364f92a95 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -157,4 +157,13 @@ config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
>  	  Copy the gdbserver provided by the external toolchain to the
>  	  target.
> 
> +config BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
> +	bool "Update kernel headers"
> +	select BR2_PACKAGE_LINUX_HEADERS
> +	help
> +	  Select this option to update the kernel headers in the
> +	  external toolchain with headers from the kernel being built.
> +	  This is useful when the external toolchain has older kernel
> +	  headers than the kernel being built.
> +

This approach probably works only for glibc toolchains, so the option 
should depend on BR2_TOOLCHAIN_EXTERNAL_GLIBC (or 
BR2_TOOLCHAIN_USES_GLIBC).

With (internal) uClibc and musl I had occasional problems updating 
kernel versions while not rebuilding the toolchain ...

>  endif # BR2_TOOLCHAIN_EXTERNAL
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk 
> b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index c37f3500d9..6527601773 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -557,19 +557,29 @@ $(2)_POST_EXTRACT_HOOKS += \
>  	TOOLCHAIN_EXTERNAL_MOVE
>  endif
> 
> +ifeq ($$(BR2_PACKAGE_LINUX_HEADERS),y)
> +$(2)_DEPENDENCIES += linux-headers
> +endif
> +
>  # Checks for an already installed toolchain: check the toolchain
>  # location, check that it is usable, and then verify that it
>  # matches the configuration provided in Buildroot: ABI, C++ support,
>  # kernel headers version, type of C library and all C library 
> features.
> +# Also updates the kernel headers in the toolchain, if requested.
>  define $(2)_CONFIGURE_CMDS
>  	$$(Q)$$(call check_cross_compiler_exists,$$(TOOLCHAIN_EXTERNAL_CC))
>  	$$(Q)$$(call 
> check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC),"$$(TOOLCHAIN_EXTERNAL_CFLAGS)")
>  	$$(Q)SYSROOT_DIR="$$(call 
> toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
> +	if test "$$(BR2_PACKAGE_LINUX_HEADERS)" = "y" ; then \
> +		echo "Updating kernel headers in the external toolchain..." ; \
> +		rsync -a $$(STAGING_DIR)/usr/include/ \
> +			$$$${SYSROOT_DIR}/usr/include/ ; \
> +	fi ; \

Not a good idea. This might work when the kernel headers are processed 
initially, but once you upgrade the kernel patch level, you will copy a 
lot of unrelated headers into your toolchain include directory.

The kernel uses INSTALL_HDR_PATH to determine the install location for 
the headers. This variable is set in linux-headers.mk and you should 
adapt the INSTALL_STAGING_CMDS there.

>  	$$(call check_kernel_headers_version,\
>  		$$(BUILD_DIR),\
>  		$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC)),\
>  		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)),\
> -		$$(if $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),loose,strict)); \
> +		$$(if $$(or 
> $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),$$(BR2_PACKAGE_LINUX_HEADERS)),loose,strict)); 
> \
>  	$$(call check_gcc_version,$$(TOOLCHAIN_EXTERNAL_CC),\
>  		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
>  	if test "$$(BR2_arm)" = "y" ; then \
> --
> 2.39.5

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
