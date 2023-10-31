Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB2FC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 925EE42247;
	Tue, 31 Oct 2023 12:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 925EE42247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qHfwxkkT3x3M; Tue, 31 Oct 2023 12:42:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE6B542224;
	Tue, 31 Oct 2023 12:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE6B542224
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44FC51BF31A
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06F3361379
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06F3361379
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HqRspcXl4w_k for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:41:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92C7F61376
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92C7F61376
Received: by mail.gandi.net (Postfix) with ESMTPSA id 728331C0002;
 Tue, 31 Oct 2023 12:41:53 +0000 (UTC)
Date: Tue, 31 Oct 2023 13:41:52 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20231031134152.792af099@windsurf>
In-Reply-To: <20231020114236.4129636-2-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698756113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BBzZ+8dCBx+NKUg7aejrTHNRRKT6Lz1Q+4VveOGb/U=;
 b=ikmHrsU6RTMOnJdkg/fDmBQqL9EaJXfTbaa2LDrQF7ywpisgoQVTOx07euLEZz6K8SxPiS
 HtqLprZDIHUDJEQwHagOopJ4WZpgrDkmZiOBns/9uuV97P6rQunb8Qg0pv94JKQ74lVLC0
 4yZ73C82Kv2MvpfGqxpxgr0cNduUTnz+b2XdKYV/F+NLDHuPQ0l5SZW2z6JGdk1sUivkSo
 Kjl2YSaskr8zIOeSat/jUD9FbLP7QNUAzWeIcUbawTKcbcjlcpBA8IFdWd3LWgdSSXPcO+
 LQuN8PhgPGZ0m7y4Znqk6Y01yx/siXdUyQdFoiUscC6XFQopTKpShobi2/78Ng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ikmHrsU6
Subject: Re: [Buildroot] [PATCH v6 02/10] package/gcc-bare-metal: new package
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

On Fri, 20 Oct 2023 12:42:28 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/gcc-bare-metal/Config.in.host b/package/gcc-bare-metal/Config.in.host
> new file mode 100644
> index 0000000000..ca7735340c
> --- /dev/null
> +++ b/package/gcc-bare-metal/Config.in.host
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_HOST_GCC_BARE_METAL
> +	bool "host gcc-bare-metal"
> +	help
> +	  Build GCC for a bare-metal toolchain
> +
> +if BR2_PACKAGE_HOST_GCC_BARE_METAL
> +
> +config BR2_PACKAGE_HOST_GCC_BARE_METAL_VERSION
> +	string
> +	default "13.2.0"

Both of these options are useless, they should be dropped.


> diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
> new file mode 100644
> index 0000000000..5c5c28fa7e
> --- /dev/null
> +++ b/package/gcc-bare-metal/gcc-bare-metal.hash

Symlink to package/gcc/gcc.hash ?


> diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
> new file mode 100644
> index 0000000000..fe6f931008
> --- /dev/null
> +++ b/package/gcc-bare-metal/gcc-bare-metal.mk
> @@ -0,0 +1,68 @@
> +################################################################################
> +#
> +# gcc-bare-metal
> +#
> +################################################################################
> +
> +HOST_GCC_BARE_METAL_VERSION = \
> +	$(call qstrip,$(BR2_PACKAGE_HOST_GCC_BARE_METAL_VERSION))
> +ifeq ($(HOST_GCC_BARE_METAL_VERSION),)
> +HOST_GCC_BARE_METAL_VERSION = 13.2.0
> +endif

Just harcode the version.

> +
> +HOST_GCC_BARE_METAL_SITE = \
> +	https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
> +HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
> +
> +HOST_GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
> +HOST_GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
> +
> +HOST_GCC_BARE_METAL_DEPENDENCIES = \
> +	host-binutils-bare-metal \
> +	host-gmp \
> +	host-mpc \
> +	host-mpfr \
> +	host-isl
> +
> +# gcc doesn't support in-tree build, so we create a 'build'
> +# subdirectory in the gcc sources, and build from there.
> +define GCC_BARE_METAL_CONFIGURE_SYMLINK
> +	mkdir -p $(@D)/build
> +	ln -sf ../configure $(@D)/build/configure
> +endef
> +
> +HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += GCC_BARE_METAL_CONFIGURE_SYMLINK
> +HOST_GCC_BARE_METAL_SUBDIR = build
> +
> +HOST_GCC_BARE_METAL_MAKE_OPTS = \
> +	$(HOST_GCC_COMMON_MAKE_OPTS) \
> +	all-gcc \
> +	all-target-libgcc
> +
> +HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
> +
> +GCC_BARE_METAL_ARCH = \
> +	$(call qstrip,$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))

From a patch sequencing perspective, this is a bit weird because
BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH does not even
exist yet. But I don't have a very good suggestion on how to handle
this, so it's fine as is.

Should the variable be named HOST_GCC_BARE_METAL_ARCH, for consistency
with the other variables?

> +HOST_GCC_BARE_METAL_CONF_OPTS = \
> +	--target=$(GCC_BARE_METAL_ARCH)-elf \

I'm wondering if BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
shouldn't be the full tuple, instead of assuming it's also going to end
in -elf. Whenever we've assumed things like this, it sometimes turned
out to be wrong. So I would suggest that
BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH carry the full
tuple instead.

> +	--disable-initfini_array \
> +	--disable-__cxa_atexit \
> +	--disable-libstdcxx-pch \
> +	--with-newlib \
> +	--disable-threads \
> +	--enable-plugins \
> +	--with-gnu-as \
> +	--disable-libitm \
> +	--without-long-double-128 \
> +	--without-headers \
> +	--enable-languages=c \
> +	--disable-multilib \
> +	--with-gmp=$(HOST_DIR) \
> +	--with-mpc=$(HOST_DIR) \
> +	--with-mpfr=$(HOST_DIR) \
> +	--with-isl=$(HOST_DIR) \
> +	AR_FOR_TARGET=$(O)/host/bin/$(GCC_BARE_METAL_ARCH)-elf-ar \
> +	RANLIB_FOR_TARGET=$(O)/host/bin/$(GCC_BARE_METAL_ARCH)-elf-ranlib

$(HOST_DIR) instead of $(O)/host/bin

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
