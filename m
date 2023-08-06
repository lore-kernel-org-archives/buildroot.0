Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54015C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 13:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAED340322;
	Sun,  6 Aug 2023 13:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAED340322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYqpCdeLajIr; Sun,  6 Aug 2023 13:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 653BB4011A;
	Sun,  6 Aug 2023 13:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 653BB4011A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 919001BF3C0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0322D60EE8
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0322D60EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDm9J0ZG4Ukn for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 13:56:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 656DD605EC
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 13:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 656DD605EC
Received: by mail.gandi.net (Postfix) with ESMTPSA id B950C40008;
 Sun,  6 Aug 2023 13:56:07 +0000 (UTC)
Date: Sun, 6 Aug 2023 15:56:06 +0200
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230806155606.53d6f567@windsurf>
In-Reply-To: <20230724014832.2207166-2-alistair.francis@wdc.com>
References: <20230724014832.2207166-1-alistair.francis@wdc.com>
 <20230724014832.2207166-2-alistair.francis@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691330168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uq3dbkc79UsFX8B4T/HoIHZ3uNvcjoHjL0+qsr/waME=;
 b=h7ypDvJHg8DWEYlwe6RAnOmYwRTZYYvPr+B5ceUqk+QmV6/qEwvnVZiXcreoqgBUUtaVha
 XmWB69deUeLqyVupjyG5HIUCuBSpCjKP4t7kOnMOSIZnffKNc3NKeS0UOVLh3RVOdwFZNM
 NFQdoTnBoRfCbuZSqD/ot8R1pcsHVjjmjMzweYcC0P3JgPydDVnt83eJTz4Adi0yztmAbH
 bPu0Ge2YF2QmbPVpqVgluWIB+3Il7EB+nKB6cmowjFdQdhWb+VjZ7lw+oekeM73cxq9Z8d
 Tcj8U08/trouofE0Fee0T+mtkwGK25QOh8Eg1q2vXY7sWe+dIihaQCcn7DIpfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h7ypDvJH
Subject: Re: [Buildroot] [PATCH v2 2/2] package/libspdm: Initial commit
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 24 Jul 2023 11:48:32 +1000
Alistair Francis <alistair23@gmail.com> wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Commit title should be:

	package/libspdm: new package

> ---
>  package/Config.in            |  1 +
>  package/libspdm/Config.in    | 20 ++++++++++++
>  package/libspdm/libspdm.hash |  3 ++
>  package/libspdm/libspdm.mk   | 59 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 83 insertions(+)
>  create mode 100644 package/libspdm/Config.in
>  create mode 100644 package/libspdm/libspdm.hash
>  create mode 100644 package/libspdm/libspdm.mk

A new entry in the DEVELOPERS file is needed.

> diff --git a/package/libspdm/Config.in b/package/libspdm/Config.in
> new file mode 100644
> index 0000000000..b732662842
> --- /dev/null
> +++ b/package/libspdm/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_LIBSPDM
> +	bool "libspdm"
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	help
> +	  libspdm is a sample implementation that follows
> +	  the DMTF SPDM specifications
> +
> +	  https://github.com/DMTF/libspdm
> +
> +config BR2_PACKAGE_LIBSPDM_CPU_FAMILLY
> +	string
> +	default "arc" if BR2_arcle || BR2_arceb
> +	default "arm" if BR2_arm || BR2_armeb
> +	default "aarch64" if BR2_aarch64 || BR2_aarch64_be
> +	default "ia32" if BR2_i386
> +	default "riscv32" if BR2_riscv && BR2_RISCV_32
> +	default "riscv64" if BR2_riscv && BR2_RISCV_64
> +	default "x64" if BR2_x86_64
> +	default BR2_ARCH  # Yes, this should work...\

Are all CPU families really supported? Usually, when a package needs to
know the CPU family/platform, it is a very strong sign that the package
has some architecture-specific stuff, and that some of our "special"
architectures will not be supported.

According to the CMakeLists.txt, I'm pretty correct:


if(ARCH STREQUAL "x64")
    MESSAGE("ARCH = x64")
elseif(ARCH STREQUAL "ia32")
    MESSAGE("ARCH = ia32")
elseif(ARCH STREQUAL "arm")
    MESSAGE("ARCH = arm")
elseif(ARCH STREQUAL "aarch64")
    MESSAGE("ARCH = aarch64")
elseif(ARCH STREQUAL "riscv32")
    MESSAGE("ARCH = riscv32")
elseif(ARCH STREQUAL "riscv64")
    MESSAGE("ARCH = riscv64")
elseif(ARCH STREQUAL "arc")
    MESSAGE("ARCH = arc")
elseif(ARCH STREQUAL "nios2")
    MESSAGE("ARCH = nios2")
else()
    MESSAGE(FATAL_ERROR "Unknown ARCH")
endif()

Your package will fail to build on any other architectures than the
ones listed here.

> diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
> new file mode 100644
> index 0000000000..daf6639808
> --- /dev/null
> +++ b/package/libspdm/libspdm.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# libspdm
> +#
> +################################################################################
> +
> +LIBSPDM_VERSION = 3.0.0
> +LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
> +LIBSPDM_LICENSE = BSD-3-Clause
> +LIBSPDM_LICENSE_FILES = LICENSE.md
> +
> +LIBSPDM_INSTALL_STAGING = YES
> +LIBSPDM_INSTALL_TARGET = YES

This line is not needed, it's the default.

> +
> +LIBSPDM_DEPENDENCIES += openssl

Just =, not +=.

> +
> +LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILLY))
> +
> +LIBSPDM_CONF_OPTS = \
> +	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
> +	-DTOOLCHAIN=NONE \
> +	-DTARGET=Release \
> +	-DCRYPTO=openssl \
> +	-DENABLE_BINARY_BUILD=1 \
> +	-DCOMPILED_LIBCRYPTO_PATH=/usr/lib/ \
> +	-DCOMPILED_LIBSSL_PATH=/usr/lib/ \
> +	-DDISABLE_TESTS=1 \
> +	-DLINK_FLAGS=$(STAGING_DIR)
> +
> +define LIBSPDM_INSTALL_STAGING_CMDS
> +	$(INSTALL) -m 0755 -t $(STAGING_DIR)/usr/lib/ $(@D)/lib/*
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/library
> +	$(INSTALL) -D -m 0755 $(@D)/include/library/* $(STAGING_DIR)/usr/include/libspdm/library
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/internal
> +	$(INSTALL) -D -m 0755 $(@D)/include/internal/*.h $(STAGING_DIR)/usr/include/libspdm/internal/
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/hal/library/cryptlib
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/hal/library/requester
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/hal/library/responder
> +	$(INSTALL) -D -m 0755 $(@D)/include/hal/*.h $(STAGING_DIR)/usr/include/libspdm/hal/
> +	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/*.h $(STAGING_DIR)/usr/include/libspdm/hal/library/
> +	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/cryptlib/* $(STAGING_DIR)/usr/include/libspdm/hal/library/cryptlib/
> +	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/requester/* $(STAGING_DIR)/usr/include/libspdm/hal/library/requester/
> +	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/responder/* $(STAGING_DIR)/usr/include/libspdm/hal/library/responder/
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/industry_standard
> +	$(INSTALL) -D -m 0755 $(@D)/include/industry_standard/* $(STAGING_DIR)/usr/include/libspdm/industry_standard
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib
> +	$(INSTALL) -D -m 0755 $(@D)/os_stub/spdm_crypt_ext_lib/*.h $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib

This seems very verbose. If you're copying all files/directories of
$(@D)/include/* to $(STAGING_DIR)/usr/include/libspdm, why not:

	mkdir -p $(STAGING_DIR)/usr/include/libspdm/
	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/libspdm/

> +endef
> +
> +define LIBSPDM_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/* $(TARGET_DIR)/usr/lib/

This is not good, as it could create a file called "lib" in
$(TARGET_DIR)/usr if $(TARGET_DIR)/usr/lib doesn't already exist. So:

	mkdir -p $(TARGET_DIR)/usr/lib
	cp -dpfr $(@D)/lib/* $(TARGET_DIR)/usr/lib/

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
