Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E19C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 901BC40BC7;
	Mon, 31 Jul 2023 22:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 901BC40BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KNj3HAyACvn5; Mon, 31 Jul 2023 22:39:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58AC740609;
	Mon, 31 Jul 2023 22:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58AC740609
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8CF1BF378
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B639940331
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B639940331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6T5kXORAItKs for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:39:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C345940277
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C345940277
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35C781BF203;
 Mon, 31 Jul 2023 22:38:59 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:38:58 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230801003858.43eb3fb9@windsurf>
In-Reply-To: <20230512014056.2107657-1-christian@aperture.us>
References: <20230512014056.2107657-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690843140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3KRr7Uy7ActrdvVXFkXJgu3mPv1LqKa3lJSky00jfU=;
 b=FWcE8YA1bHlR2xAjoFqJnD+sEF6tWIAnsFY3sOmPU4Z7lVxZemCvkOMpR9QLrgm+Lvlws5
 4anB2cwz8nopnva0LaQe7qNEBujOHA86EKydTen1G7MRLDMEiPMo/L/jUsVhaMK1kUOBn+
 swJlKzuwYF3BbZFV55GO6uaGSmZFQKxUCqdb0oOWTukYwrVfGwCEGIHgY6f7GRzUdz4OE6
 u2s/4aFIJNl9t1L21bvj+tEeRQoNeA+BYS/yS4DLou4NtQ+OqtfDCbSxGN65H8WazlHWje
 mwUS8Gr15NmdbCkEo70RQC4EdEi/Q96W3FwWYB3dRl3Uo8ROYtW8ez2OW4O4ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FWcE8YA1
Subject: Re: [Buildroot] [PATCH v1 1/1] package/crio: new package
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>, Julien Olivain <ju.o@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

Thanks for the patch. See below some review.

On Thu, 11 May 2023 18:40:56 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

>  package/Config.in      |  1 +
>  package/crio/Config.in | 54 ++++++++++++++++++++++++++++
>  package/crio/crio.hash |  3 ++
>  package/crio/crio.mk   | 82 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 140 insertions(+)

Entry in DEVELOPERS file missing.

> diff --git a/package/crio/Config.in b/package/crio/Config.in
> new file mode 100644
> index 0000000000..35a38c587e
> --- /dev/null
> +++ b/package/crio/Config.in
> @@ -0,0 +1,54 @@
> +config BR2_PACKAGE_CRIO
> +	bool "crio"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2, __kernel_{u,}long_t
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve

uClibc has fexecve() now

> +	depends on BR2_USE_MMU # libgpgme, iproute2, fork()

	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme

is missing

> +	select BR2_PACKAGE_IPROUTE2
> +	select BR2_PACKAGE_IPTABLES

Neither of these are referenced in the .mk file. Are these runtime
dependencies? If so, please indicate this via a comment.

For this kind of package, a runtime test in support/testing/ would be
very good. You can ask Julien Olivain for help here :-)

> +config BR2_PACKAGE_CRIO_DRIVER_BTRFS
> +	bool "btrfs filesystem driver"
> +	depends on BR2_USE_MMU # btrfs-progs
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
> +	select BR2_PACKAGE_BTRFS_PROGS
> +	help
> +	  Build the btrfs filesystem driver.

Config.in comment missing.

> +
> +config BR2_PACKAGE_CRIO_DRIVER_DEVICEMAPPER
> +	bool "devicemapper filesystem driver"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
> +	depends on BR2_USE_MMU # lvm2
> +	depends on !BR2_STATIC_LIBS # lvm2
> +	select BR2_PACKAGE_LVM2
> +	help
> +	  Build the devicemapper filesystem driver.

Ditto.

> +
> +config BR2_PACKAGE_CRIO_DRIVER_OSTREE
> +	bool "ostree storage driver"
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libostree, libgpgme, libgpg-error
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libostree, libglib2
> +	depends on BR2_USE_WCHAR # libostree, libglib2
> +	depends on BR2_USE_MMU # libostree, e2fsprogs, libglib2, libgpgme

Don't need to duplicate the whole set of comments, it can be just:

	depends on .... # libostree

because all what you select is libostree

> +	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()

don't need to replicate this comment here

> +	depends on !BR2_TOOLCHAIN_USES_MUSL # libostree

This is enough.

> +	select BR2_PACKAGE_LIBOSTREE
> +	help
> +	  Build the ostree storage driver.

Config.in comment needed.

> +
> +endif
> +
> +comment "crio needs a glibc or musl toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
> +		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC

Needs to be adjusted as per the above comments.

> +################################################################################
> +#
> +# crio
> +#
> +################################################################################
> +
> +CRIO_VERSION = 1.27.0
> +CRIO_SITE = $(call github,cri-o,cri-o,v$(CRIO_VERSION))
> +CRIO_LICENSE = Apache-2.0
> +CRIO_LICENSE_FILES = LICENSE
> +
> +CRIO_CPE_ID_VENDOR = kubernetes
> +CRIO_CPE_ID_PRODUCT = cri-o
> +
> +CRIO_BUILD_TARGETS = cmd/crio cmd/crio-status
> +CRIO_DEPENDENCIES += libgpgme

Changed += to = here.

> +define CRIO_BUILD_PINNS
> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" STRIP="$(TARGET_STRIP)" \

Would $(TARGET_CONFIGURE_OPTS) work here to replace CC, CFLAGS, LDFLAGS
and STRIP?

> +		-C $(@D)/pinns ../bin/pinns
> +endef
> +CRIO_POST_BUILD_HOOKS += CRIO_BUILD_PINNS

Perhaps a short comment above define CRIO_BUILD_PINNS to explain why it
is needed, and not done by the normal build process?

> +
> +define CRIO_INSTALL_TARGET_CMDS
> +	$(HOST_GO_COMMON_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		DESTDIR=$(TARGET_DIR) PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc \
> +		OPT_CNI_BIN_DIR=$(TARGET_DIR)/opt/cni/bin install.bin-nobuild

There's no proper installation step with the Go build infrastructure?

> +	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni
> +	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni/net.d

These two lines are not needed. Intermediate directories are created...

> +	$(INSTALL) -D -m 644 $(@D)/contrib/cni/10-crio-bridge.conflist \
> +		$(TARGET_DIR)/etc/cni/net.d/10-crio-bridge.conflist

... by the -D option here.

> +endef
> +
> +define CRIO_INSTALL_INIT_SYSTEMD
> +	$(HOST_GO_COMMON_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		DESTDIR=$(TARGET_DIR) PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc \
> +		OPT_CNI_BIN_DIR=$(TARGET_DIR)/opt/cni/bin install.systemd
> +	$(SED) 's,/usr/local/bin,/usr/bin,g' \
> +		$(TARGET_DIR)/usr/lib/systemd/system/{crio,crio-wipe}.service

Meh, the service files are incorrectly generated during the build? Or
are they not generated and simply contain values that need to manually
be tweaked?

Could you rework your patch to address the above suggestions?

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
