Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74740C636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D59DE40120;
	Tue,  7 Feb 2023 16:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D59DE40120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRj6JT-aodiZ; Tue,  7 Feb 2023 16:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2BBA40168;
	Tue,  7 Feb 2023 16:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2BBA40168
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2274A1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE08681DCB
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE08681DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oGUt4wZ4Gvfs for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:26:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E30181D70
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E30181D70
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:26:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D1C82000B;
 Tue,  7 Feb 2023 16:26:16 +0000 (UTC)
Date: Tue, 7 Feb 2023 17:26:15 +0100
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230207172615.48ac9871@windsurf>
In-Reply-To: <20221128123418.2197-6-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
 <20221128123418.2197-6-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675787176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uG/37oi5REsagEkAdwIcJilm+xBTol/gDEESkp6gs9c=;
 b=R84m6nM8fb5JYA5N6PfVfv1csSVUAdHya97OaJ9krd2hHfAVXjbm7QjdyIEnjVxKj/fKZn
 OIgHGXs1oNXgbqZ9QdUwa3arv0Z/ABlVUzJD5dvVaNAVcIM0TmdrjeFb/RzvlQPkD1QG4y
 roG2n9npJThOs/93VSrskthJ4JSPL5yRY5llBAhG79+IHthHrjGmxZGf6HPimzvtLPUon3
 pJKi0QsTihCnG++p1+FgcoK9YUProl9UU87znYWvvrIFI0JBbITZwQeT+gdjtd+ABgNUzl
 uM0nhBAy9PQXBtM9kytQjiRkOMtRIH/Ri6ZQfx9fqcqUhN2nTVj30ldbGNFiGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R84m6nM8
Subject: Re: [Buildroot] [PATCH/next 6/6] package/micromamba: new package
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

Hello,

On Mon, 28 Nov 2022 12:34:18 +0000
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Thanks for this submission. Could you clarify what is the motivation
for this package? Indeed having a package manager on the target feels a
bit strange in the context of Buildroot. Buildroot is normally there
precisely to generate a ready-to-use rootfs, not a rootfs which then
downloads random stuff from the Internet.

Of course, we do have npm or pip, but really their usage is not
recommended.


> diff --git a/package/micromamba/Config.in b/package/micromamba/Config.in
> new file mode 100644
> index 0000000000..998809f452
> --- /dev/null
> +++ b/package/micromamba/Config.in
> @@ -0,0 +1,43 @@
> +config BR2_PACKAGE_MICROMAMBA_ARCH_SUPPORTS
> +	bool
> +	# See libmamba/include/mamba/core/context.hpp
> +	default y if BR2_arm && (BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A)
> +	default y if BR2_aarch64
> +	default y if BR2_i386
> +	default y if BR2_powerpc64
> +	default y if BR2_powerpc64le
> +	default y if BR2_s390x
> +	default y if BR2_x86_64
> +	depends on BR2_USE_MMU # fork()

Always a bit annoying to have architecture-specific things in something
that isn't hardware-related in the first place, but OK.

> +config BR2_PACKAGE_MICROMAMBA
> +	bool "micromamba"
> +	depends on BR2_PACKAGE_MICROMAMBA_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # fmt, reproc

libarchive also needs wchar, spdlog as well (through fmt, admittedly)

> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
> +	select BR2_PACKAGE_LIBARCHIVE
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
> +	select BR2_PACKAGE_YAML_CPP
> +	select BR2_PACKAGE_SPDLOG
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBSOLV
> +	select BR2_PACKAGE_REPROC
> +	select BR2_PACKAGE_TL_EXPECTED
> +	select BR2_PACKAGE_CLI11
> +	select BR2_PACKAGE_FMT
> +	select BR2_PACKAGE_TERMCOLOR

These select should be sorted alphabetically to look a bit nicer.

> +	help
> +	  micromamba is a small, pure-C++ reimplementation of
> +	  mamba/conda. It strives to be a full replacement for mamba and
> +	  conda.
> +
> +	  https://github.com/mamba-org/mamba
> +
> +comment "micromamba needs a toolchain w/ wchar, threads, C++, gcc >= 8"
> +	depends on BR2_PACKAGE_MICROMAMBA_ARCH_SUPPORTS
> +	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
> diff --git a/package/micromamba/micromamba.hash b/package/micromamba/micromamba.hash
> new file mode 100644
> index 0000000000..e584c3bd28
> --- /dev/null
> +++ b/package/micromamba/micromamba.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  7303d983b49a1a52b302ceae355af1c05afef3a07aa3ad6dd27c36d64c43f991  micromamba-1.0.0.tar.gz
> +sha256  41fd98a468e39d319911bd94f4e65d6ad6a7ea66559dd5aa4112f138ff9b629a  LICENSE
> diff --git a/package/micromamba/micromamba.mk b/package/micromamba/micromamba.mk
> new file mode 100644
> index 0000000000..188864444c
> --- /dev/null
> +++ b/package/micromamba/micromamba.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# micromamba
> +#
> +################################################################################
> +
> +MICROMAMBA_VERSION = 1.0.0
> +MICROMAMBA_SITE = $(call github,mamba-org,mamba,micromamba-$(MICROMAMBA_VERSION))
> +MICROMAMBA_LICENSE = BSD-3-Clause
> +MICROMAMBA_LICENSE_FILES = LICENSE
> +MICROMAMBA_DEPENDENCIES = \
> +	$(BR2_PYTHON3_HOST_DEPENDENCY) \
> +	cli11 \
> +	fmt \
> +	json-for-modern-cpp \
> +	libarchive \
> +	libcurl \
> +	libsolv \
> +	openssl \
> +	reproc \
> +	spdlog \
> +	termcolor \
> +	tl-expected \
> +	yaml-cpp
> +
> +MICROMAMBA_CONF_OPTS = -DBUILD_LIBMAMBA=ON -DBUILD_MICROMAMBA=ON
> +
> +# See libmamba/include/mamba/core/context.hpp
> +ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +MICROMAMBA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -D___ARM_ARCH_6__"
> +else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +MICROMAMBA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -D__ARM_ARCH_7__"
> +endif

This is really a bug in the mamba code, because these defines are
normally provided by the compiler. For example, an ARMv7 compiler
defines:

#define __ARM_ARCH 7
#define __ARM_ARCH_7A__ 1

So mamba could use that instead.

But one could even wonder why it really matters to define a different
MAMBA_PLATFORM name:

#ifdef ___ARM_ARCH_6__
        static const char MAMBA_PLATFORM[] = "linux-armv6l";
#elif __ARM_ARCH_7__
        static const char MAMBA_PLATFORM[] = "linux-armv7l";
#else

It is really crazy that this is the *only* thing that causes mamba to
have an architecture dependency. Why is that even needed in the first
place?

> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +MICROMAMBA_CONF_OPTS += -DBUILD_STATIC=ON -DMICROMAMBA_LINKAGE=FULL_STATIC
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +MICROMAMBA_CONF_OPTS += -DBUILD_SHARED=ON -DBUILD_STATIC=ON
> +else # BR2_SHARED_LIBS
> +MICROMAMBA_CONF_OPTS += -DBUILD_SHARED=ON
> +endif

Please pass BUILD_STATIC=OFF and BUILD_SHARED=OFF explicitly in the
appropriate cases.

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
