Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEB5C83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 13:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A92A401E1;
	Sat,  2 Sep 2023 13:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A92A401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dxh2_M8nj2w9; Sat,  2 Sep 2023 13:29:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8631540484;
	Sat,  2 Sep 2023 13:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8631540484
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D7221BF861
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 13:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCC76607C7
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 13:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCC76607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2x-aOQ0bI7h for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 13:29:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7606D60593
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 13:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7606D60593
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BB3E60002;
 Sat,  2 Sep 2023 13:28:59 +0000 (UTC)
Date: Sat, 2 Sep 2023 15:28:59 +0200
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230902152859.42d5673d@windsurf>
In-Reply-To: <20230830053654.1827435-1-alistair.francis@wdc.com>
References: <20230830053654.1827435-1-alistair.francis@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693661340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMcvPw15XeDg/t7HuI2zpEYp+dl0KiHIGd4/uaHPlxw=;
 b=nESnjvrrIzHZNBPokoRegaA0gtwFst42WePGQbroHW7DHZwOUuevc5ffnryro7/TsZoLiP
 8lO2XmQu2etCCIEidjJeznxQfmreb09W1vHwR6WPnbArpQrJj6Y/Zg5h/Muov9Vw+MC84L
 IxtYFS9FtOzZfYUVhZeZNWdlYjrm7px7Xb8qn4nVTDNJcGr+K9RtQ5/740EJ5k2Y96oR7A
 hcY3XzTzlwHt1J77+Dr+S6JL1LVhdtA0v07QaxTw7amq1ZkubACHe4iGvAK98sUTc8aAhf
 EFy+gEEjRgJcCcVjkdDsIdg8fd6jCzQM2TtmOWiaVtB/P6kT+MckTwB+rzh2fA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nESnjvrr
Subject: Re: [Buildroot] [PATCH v3] package/libspdm: new package
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

Hello Alistair,

On Wed, 30 Aug 2023 15:36:54 +1000
Alistair Francis <alistair23@gmail.com> wrote:

> Add the libspdm package (https://github.com/DMTF/libspdm).
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks for this new iteration, it looks much better. I had fixed a few
things and was getting ready to apply, but it actually doesn't build.
See below some details to help you prepare a v4.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9b500f3701..5b5556d492 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -122,6 +122,7 @@ F:	board/sifive/
>  F:	boot/opensbi/
>  F:	configs/hifive_unleashed_defconfig
>  F:	package/xen/
> +F:	package/libspdm/

Please respect alphabetic ordering.

>  
>  N:	Alvaro G. M <alvaro.gamez@hazent.com>
>  F:	package/dcron/
> diff --git a/package/Config.in b/package/Config.in
> index 54cddc3914..eda464262a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -193,6 +193,7 @@ menu "Development tools"
>  	source "package/jo/Config.in"
>  	source "package/jq/Config.in"
>  	source "package/libtool/Config.in"
> +	source "package/libspdm/Config.in"

Please respect alphabetic ordering. Also, I believe this package should
be in "Libraries -> Crypto", and not in "Development tools".

> diff --git a/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch b/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch
> new file mode 100644
> index 0000000000..420098be11
> --- /dev/null
> +++ b/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch
> @@ -0,0 +1,43 @@
> +From 7db883cdb3369cfaf9f0890b0eda503f47a5ffa3 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Fri, 11 Aug 2023 16:26:53 -0400
> +Subject: [PATCH] cryptlib_openssl: x509: Remove internal OpenSSL crypto
> + include
> +
> +The OpenSSL source code describes the crypto include as:
> +"Internal EC functions for other submodules: not for application use"
> + - https://github.com/openssl/openssl/blob/master/include/crypto/ec.h
> +
> +Using the internal APIS makes it difficult to use libspdm as a library
> +with other packages. So let's remove the uses of the internal API and
> +instead use the public API.
> +

Please add an "Upstream:" tag here and for all patches. Make sure to
run "make check-package" before submitting a patch, it will catch such
issues.

Here are the upstream tags:

0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch:Upstream: https://github.com/DMTF/libspdm/commit/7db883cdb3369cfaf9f0890b0eda503f47a5ffa3
0002-cryptlib_openssl-ecd-Allow-disabling-code.patch:Upstream: https://github.com/DMTF/libspdm/commit/e87687d72688e980b929920b7d77dca26fff169e
0003-cryptlib_openssl-ec-Remove-internal-OpenSSL-crypto-i.patch:Upstream: https://github.com/DMTF/libspdm/commit/567b1c8ea731fe42650d43ede50a105b772dc7aa
0004-CMakeLists.txt-Allow-disabling-EDDSA-support-from-co.patch:Upstream: https://github.com/DMTF/libspdm/pull/2330


> diff --git a/package/libspdm/Config.in b/package/libspdm/Config.in
> new file mode 100644
> index 0000000000..2d0f46da85
> --- /dev/null
> +++ b/package/libspdm/Config.in
> @@ -0,0 +1,19 @@
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

FAMILY, not FAMILLY.

> +	string
> +	default "arc" if BR2_arcle || BR2_arceb
> +	default "arm" if BR2_arm || BR2_armeb
> +	default "aarch64" if BR2_aarch64 || BR2_aarch64_be
> +	default "ia32" if BR2_i386
> +	default "riscv32" if BR2_riscv && BR2_RISCV_32
> +	default "riscv64" if BR2_riscv && BR2_RISCV_64
> +	default "x64" if BR2_x86_64

Also, use this to provide an ARCH_SUPPORTS variable. Like this:

config BR2_PACKAGE_LIBSPDM_CPU_FAMILY
        string
        default "arc"           if BR2_arcle || BR2_arceb
        default "arm"           if BR2_arm || BR2_armeb
        default "aarch64"       if BR2_aarch64 || BR2_aarch64_be
        default "ia32"          if BR2_i386
        default "riscv32"       if BR2_riscv && BR2_RISCV_32
        default "riscv64"       if BR2_riscv && BR2_RISCV_64
        default "x64"           if BR2_x86_64

config BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
        bool
        default y if BR2_PACKAGE_LIBSPDM_CPU_FAMILY != ""

config BR2_PACKAGE_LIBSPDM
        bool "libspdm"
        depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
        select BR2_PACKAGE_OPENSSL
        select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
        help
          libspdm is a sample implementation that follows
          the DMTF SPDM specifications

          https://github.com/DMTF/libspdm

However, here is the problem: it doesn't build on ARM. Indeed, while
libspdm itself is OK with building on ARM, its OpenSSL backend is not,
causing this build failure:

CMake Error at os_stub/cryptlib_openssl/CMakeLists.txt:25 (MESSAGE):
  Unknown ARCH

Two solutions here:

(1) Only support the architectures that are supported by the OpenSSL
    backend

(2) Also support the mbedtls backend, with the appropriate architecture
    dependencies.


> +LIBSPDM_INSTALL_STAGING = YES
> +
> +LIBSPDM_DEPENDENCIES = openssl
> +
> +LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILLY))
                                                                       ^^^^^^^ FAMILY

> +define LIBSPDM_INSTALL_STAGING_CMDS
> +	$(INSTALL) -m 0755 -t $(STAGING_DIR)/usr/lib/ $(@D)/lib/*
> +
> +	mkdir -p $(STAGING_DIR)/usr/include/libspdm/
> +	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/libspdm/
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib
> +	$(INSTALL) -D -m 0755 $(@D)/os_stub/spdm_crypt_ext_lib/*.h $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib

Please be consistent: always create the directory with mkdir -p, always
copy the files with cp -dpfr. So:

define LIBSPDM_INSTALL_STAGING_CMDS
        mkdir -p $(STAGING_DIR)/usr/lib
        cp -dpfr $(@D)/lib/* $(STAGING_DIR)/usr/lib/

        mkdir -p $(STAGING_DIR)/usr/include/libspdm/
        cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/libspdm/

        mkdir -p $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib
        cp -dpfr $(@D)/os_stub/spdm_crypt_ext_lib/*.h \
                $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib/
endef

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
