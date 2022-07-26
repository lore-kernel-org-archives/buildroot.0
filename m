Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08968C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 901E784751;
	Tue, 26 Jul 2022 17:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 901E784751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3ofp64Wy3VV; Tue, 26 Jul 2022 17:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEB6483F7C;
	Tue, 26 Jul 2022 17:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB6483F7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FA8F1BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6306D40614
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6306D40614
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZvQBOdksOtj for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:11:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 013E04013C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 013E04013C
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:11:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D14B1BF206;
 Tue, 26 Jul 2022 17:11:34 +0000 (UTC)
Date: Tue, 26 Jul 2022 19:11:33 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220726191133.26dba919@windsurf>
In-Reply-To: <20220724234718.676572-1-christian@paral.in>
References: <20220724234718.676572-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658855494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8aQlWZ130biaX8iy91kiOgvS7ya55/V4bFk1xtbnjU=;
 b=BoQvS97XngqFKG8HuOyH/rxchGT8oERqFHVP8wXvJt7/u3pcsTetT9hr1pwMeck/48V98b
 P4mARvGM9kqcR87Q7C6pXJuOL1jT/l6Vh0WajNdf6nIXHp+E+LP2+TPf1t89tgzs4fV7FC
 lCJiYiVswYE6oYQ/lPSb4qPgn+/vrNCnpNoT3KAnGZYY6dyAqh8CSYsdaht4IJyJE93LMG
 noG1EL9C8AN0QT5tnZARPiAXvndw6vxwfPvRlGc1AnrZIj1YFk+r4N2+FMCJ+oXyF5blwW
 ynkRl2QuwGcZzhAN/SplWiI0lk2OkIzf+eTCXDKrM7G0NK4jsJzmb3Eg+9zZ6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BoQvS97X
Subject: Re: [Buildroot] [RFC PATCH v1 1/1] package/android-tools: update to
 version 5.1.1.r38
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian!

On Sun, 24 Jul 2022 16:47:18 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Update to latest 5.1.1.r38 from 4.2.2.
> 
> Dropped old patches and added several compat patches.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Really great to see this updated!


> diff --git a/package/android-tools/0001-Use-pkgconfig-to-find-libs.patch b/package/android-tools/0001-Use-pkgconfig-to-find-libs.patch
> new file mode 100644
> index 0000000000..46f770d989
> --- /dev/null
> +++ b/package/android-tools/0001-Use-pkgconfig-to-find-libs.patch
> @@ -0,0 +1,221 @@
> +From 247ef2711dbc9f9d8ee18c3d53b1745be45a8767 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Mon, 11 Jul 2022 06:20:03 -0700
> +Subject: [PATCH] Use pkgconfig to find libs

This patch is doing much more than using pkg-config to find libs.

> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---
> + debian/makefiles/adb.mk        |  4 +--
> + debian/makefiles/adbd.mk       | 48 ++--------------------------------
> + debian/makefiles/ext4_utils.mk | 42 ++++++++++-------------------
> + debian/makefiles/fastboot.mk   | 11 +++-----
> + 4 files changed, 22 insertions(+), 83 deletions(-)
> +
> +diff --git a/debian/makefiles/adb.mk b/debian/makefiles/adb.mk
> +index 89cd51d..b2e2a60 100644
> +--- a/debian/makefiles/adb.mk
> ++++ b/debian/makefiles/adb.mk
> +@@ -59,12 +59,12 @@ CFLAGS += -I$(SRCDIR)/system/core/adb
> + CFLAGS += -I$(SRCDIR)/system/core/include
> + CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> + 
> +-LIBS += libcutils.a -lpthread -lcrypto
> ++LIBS += -lpthread `pkg-config --libs libcrypto libselinux`

Use $(PKG_CONFIG) preferably.

> + 
> + all: adb
> + 
> + adb: libcutils.a $(adb_OBJS)
> +-	$(CC) -o $@ $(LDFLAGS) $(adb_OBJS) $(LIBS)
> ++	$(CC) -o $@ $(LDFLAGS) $(adb_OBJS) libcutils.a $(LIBS)

Not related to pkg-config.

> + libcutils.a: $(libcutils_OBJS)
> + 	$(AR) rcs $@ $(libcutils_OBJS)
> +diff --git a/debian/makefiles/adbd.mk b/debian/makefiles/adbd.mk
> +index 5882d43..682fc06 100644
> +--- a/debian/makefiles/adbd.mk
> ++++ b/debian/makefiles/adbd.mk
> +@@ -62,45 +62,6 @@ libcutils_SRC_FILES += klog.c
> + libcutils_SRC_FILES += properties.c
> + libcutils_OBJS := $(libcutils_SRC_FILES:.c=.o)
> + 
> +-VPATH += $(SRCDIR)/external/libselinux/src
> +-libselinux_SRC_FILES += booleans.c
> +-libselinux_SRC_FILES += canonicalize_context.c
> +-libselinux_SRC_FILES += disable.c
> +-libselinux_SRC_FILES += enabled.c
> +-libselinux_SRC_FILES += fgetfilecon.c
> +-libselinux_SRC_FILES += fsetfilecon.c
> +-libselinux_SRC_FILES += getenforce.c
> +-libselinux_SRC_FILES += getfilecon.c
> +-libselinux_SRC_FILES += getpeercon.c
> +-libselinux_SRC_FILES += lgetfilecon.c
> +-libselinux_SRC_FILES += load_policy.c
> +-libselinux_SRC_FILES += lsetfilecon.c
> +-libselinux_SRC_FILES += policyvers.c
> +-libselinux_SRC_FILES += procattr.c
> +-libselinux_SRC_FILES += setenforce.c
> +-libselinux_SRC_FILES += setfilecon.c
> +-libselinux_SRC_FILES += context.c
> +-libselinux_SRC_FILES += mapping.c
> +-libselinux_SRC_FILES += stringrep.c
> +-libselinux_SRC_FILES += compute_create.c
> +-libselinux_SRC_FILES += compute_av.c
> +-libselinux_SRC_FILES += avc.c
> +-libselinux_SRC_FILES += avc_internal.c
> +-libselinux_SRC_FILES += avc_sidtab.c
> +-libselinux_SRC_FILES += get_initial_context.c
> +-libselinux_SRC_FILES += checkAccess.c
> +-libselinux_SRC_FILES += sestatus.c
> +-libselinux_SRC_FILES += deny_unknown.c
> +-
> +-libselinux_SRC_FILES += callbacks.c
> +-libselinux_SRC_FILES += check_context.c
> +-libselinux_SRC_FILES += freecon.c
> +-libselinux_SRC_FILES += init.c
> +-libselinux_SRC_FILES += label.c
> +-libselinux_SRC_FILES += label_file.c
> +-libselinux_SRC_FILES += label_android_property.c
> +-libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)

Not related to pkg-config.

> + VPATH += $(SRCDIR)/system/extras/ext4_utils
> + libext4_utils_SRC_FILES += make_ext4fs.c
> + libext4_utils_SRC_FILES += ext4fixup.c
> +@@ -133,14 +94,13 @@ CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
> + CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
> + CFLAGS += -I$(SRCDIR)/system/core/fs_mgr/include
> + CFLAGS += -I$(SRCDIR)/hardware/libhardware/include
> +-CFLAGS += -I$(SRCDIR)/external/libselinux/include

Ditto.

> + CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> + 
> +-LIBS += liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a -lpthread -lbsd -lpcre -lresolv -lcrypto
> ++LIBS += liblog.a libfs_mgr.a libcutils.a libext4_utils.a -lpthread -lresolv `pkg-config --libs libcrypto libselinux libpcre`

$(PKG_CONFIG)

> + 
> + all: adbd
> + 
> +-adbd: liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a $(adbd_OBJS)
> ++adbd: liblog.a libfs_mgr.a libcutils.a libext4_utils.a $(adbd_OBJS)

Not related to pkg-config. You need a separate patch for the
"unbundling" of libselinux.

> + 	$(CC) -o $@ $(LDFLAGS) $(adbd_OBJS) $(LIBS)
> + 
> + liblog.a: $(liblog_OBJS)
> +@@ -152,10 +112,6 @@ libfs_mgr.a: $(fs_mgr_OBJS)
> + libcutils.a: $(libcutils_OBJS)
> + 	$(AR) rcs $@ $(libcutils_OBJS)
> + 
> +-libselinux.a: $(libselinux_OBJS)
> +-	export CFLAGS="-DANDROID -DHOST"
> +-	$(AR) rcs $@ $(libselinux_OBJS)

Move to a separate patch.

> +-
> + libext4_utils.a: $(libext4_utils_OBJS)
> + 	$(AR) rcs $@ $(libext4_utils_OBJS)
> + 
> +diff --git a/debian/makefiles/ext4_utils.mk b/debian/makefiles/ext4_utils.mk
> +index cc713a3..2848b89 100644
> +--- a/debian/makefiles/ext4_utils.mk
> ++++ b/debian/makefiles/ext4_utils.mk
> +@@ -47,46 +47,35 @@ libsparse_SRC_FILES += sparse_err.c
> + libsparse_SRC_FILES += sparse_read.c
> + libsparse_OBJS := $(libsparse_SRC_FILES:.c=.o)
> + 
> +-VPATH += $(SRCDIR)/external/libselinux/src
> +-libselinux_SRC_FILES += callbacks.c
> +-libselinux_SRC_FILES += check_context.c
> +-libselinux_SRC_FILES += freecon.c
> +-libselinux_SRC_FILES += init.c
> +-libselinux_SRC_FILES += label.c
> +-libselinux_SRC_FILES += label_file.c
> +-libselinux_SRC_FILES += label_android_property.c
> +-libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)

Move to a separate patch.

> +-
> + CFLAGS += -std=gnu11
> + CFLAGS += -DANDROID
> + CFLAGS += -DHOST
> + CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
> + CFLAGS += -I$(SRCDIR)/system/core/include
> + CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
> +-CFLAGS += -I$(SRCDIR)/external/libselinux/include
> + CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> + 
> ++LIBS += libext4_utils.a libsparse.a `pkg-config --libs libselinux libpcre zlib`

$(PKG_CONFIG)

> ++
> + all: make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg
> + 
> +-make_ext4fs: libext4_utils.a libsparse.a libselinux.a $(make_ext4fs_OBJS)
> +-	$(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS) \
> +-		libext4_utils.a libsparse.a libselinux.a -lz -lpcre
> ++make_ext4fs: libext4_utils.a libsparse.a $(make_ext4fs_OBJS)
> ++	$(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS) $(LIBS)
> + 
> +-ext2simg: libext4_utils.a libselinux.a libsparse.a $(ext2simg_OBJS)
> +-	$(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) \
> +-		libext4_utils.a libselinux.a libsparse.a -lz -lpcre
> ++ext2simg: libext4_utils.a libsparse.a $(ext2simg_OBJS)
> ++	$(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) $(LIBS)
> + 
> + ext4fixup: libext4_utils.a libsparse.a $(ext4fixup_OBJS)
> +-	$(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) libext4_utils.a libsparse.a -lz
> ++	$(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) $(LIBS)
> + 
> +-simg2img: libsparse.a $(simg2img_OBJS)
> +-	$(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) libsparse.a -lz
> ++simg2img: libext4_utils.a libsparse.a $(simg2img_OBJS)
> ++	$(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) $(LIBS)
> + 
> +-img2simg: libsparse.a $(img2simg_OBJS)
> +-	$(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) libsparse.a -lz
> ++img2simg: libext4_utils.a libsparse.a $(img2simg_OBJS)
> ++	$(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) $(LIBS)
> + 
> +-simg2simg: libsparse.a $(simg2simg_OBJS)
> +-	$(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) libsparse.a -lz
> ++simg2simg: libext4_utils.a libsparse.a $(simg2simg_OBJS)
> ++	$(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) $(LIBS)

Ditto.

> + 
> + libext4_utils.a: $(libext4_utils_OBJS)
> + 	$(AR) rcs $@ $(libext4_utils_OBJS)
> +@@ -94,11 +83,8 @@ libext4_utils.a: $(libext4_utils_OBJS)
> + libsparse.a: $(libsparse_OBJS)
> + 	$(AR) rcs $@ $(libsparse_OBJS)
> + 
> +-libselinux.a: $(libselinux_OBJS)
> +-	$(AR) rcs $@ $(libselinux_OBJS)
> +-

Ditto.

> + clean:
> + 	$(RM) $(make_ext4fs_OBJS) $(ext2simg_OBJS) $(ext4fixup_OBJS) \
> + 		$(simg2img_OBJS) $(img2simg_OBJS) $(simg2simg_OBJS) \
> +-		$(libext4_utils_OBJS) $(libsparse_OBJS) $(libselinux_OBJS) \
> ++		$(libext4_utils_OBJS) $(libsparse_OBJS) \

And again.

> + 		make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg *.a
> +diff --git a/debian/makefiles/fastboot.mk b/debian/makefiles/fastboot.mk
> +index 2c1d481..7319b7f 100644
> +--- a/debian/makefiles/fastboot.mk
> ++++ b/debian/makefiles/fastboot.mk
> +@@ -65,12 +65,12 @@ CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
> + CFLAGS += -I$(SRCDIR)/external/libselinux/include
> + CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> + 
> +-LIBS += libzipfile.a libext4_utils.a libsparse.a libselinux.a -lz -lpcre
> ++LIBS += `pkg-config --libs libselinux libpcre zlib`

$(PKG_CONFIG)

etc. for the rest of the patch.


> diff --git a/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch b/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
> deleted file mode 100644
> index 35f6c8a3be..0000000000
> --- a/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
> +++ /dev/null
> @@ -1,264 +0,0 @@
> -[PATCH] Fix adbd for non-Ubuntu systems
> -
> -Remove glib/dbus dependencies and partially restore services.c to be
> -closer to the original source code in order to run on systems without
> -sudo.
> -
> -Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

So this is no longer needed?


> diff --git a/package/android-tools/0004-Fix-build-issue-with-musl.patch b/package/android-tools/0004-Fix-build-issue-with-musl.patch
> deleted file mode 100644
> index 964eb87a6d..0000000000
> --- a/package/android-tools/0004-Fix-build-issue-with-musl.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -[PATCH] Fix build issue with musl

Just to make sure: did you build test the target package with glibc,
uClibc and musl?


> diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
> index bc76d545c1..4a5ec8ab98 100644
> --- a/package/android-tools/Config.in
> +++ b/package/android-tools/Config.in
> @@ -5,11 +5,18 @@ config BR2_PACKAGE_ANDROID_TOOLS
>  	# and adb/adbd can't be built on noMMU systems, and fastboot
>  	# has some complicated dependencies, we simply make the whole
>  	# package not available on noMMU platforms.
> -	depends on BR2_USE_MMU
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # uses fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
> +	depends on !BR2_STATIC_LIBS # libselinux
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
>  	select BR2_PACKAGE_ANDROID_TOOLS_ADBD if \
>  	      !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT && \
>  	      !BR2_PACKAGE_ANDROID_TOOLS_ADB
> +	select BR2_PACKAGE_LIBCAP
> +	select BR2_PACKAGE_LIBSELINUX
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_ZLIB

These are now needed by all tools?

>  	help
>  	  This package contains the fastboot and adb utilities, that
>  	  can be used to interact with target devices using of these
> @@ -36,30 +43,18 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
>  
>  config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
>  	bool "fastboot"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
> -	depends on !BR2_STATIC_LIBS # libselinux
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
>  	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS

I suppose this "good kernel headers" thing is still needed?

> -	select BR2_PACKAGE_LIBSELINUX
> -	select BR2_PACKAGE_ZLIB
>  	help
>  	  This option will build and install the fastboot utility for
>  	  the target, which can be used to reflash other target devices
>  	  implementing the fastboot protocol.
>  
> -comment "fastboot needs a toolchain w/ threads, dynamic library, gcc >= 5"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> -
>  comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
>  	depends on !BR2_arc
>  	depends on !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
>  
>  config BR2_PACKAGE_ANDROID_TOOLS_ADB
>  	bool "adb"
> -	depends on BR2_USE_MMU # uses fork()
> -	select BR2_PACKAGE_OPENSSL
> -	select BR2_PACKAGE_ZLIB
>  	help
>  	  This option will build and install the adb utility for the
>  	  target, which can be used to interact with other target
> @@ -67,9 +62,6 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADB
>  
>  config BR2_PACKAGE_ANDROID_TOOLS_ADBD
>  	bool "adbd"
> -	depends on BR2_USE_MMU # uses fork()
> -	select BR2_PACKAGE_OPENSSL
> -	select BR2_PACKAGE_ZLIB
>  	help
>  	  This option will build and install the adbd utility for the
>  	  target, which can be used to interact with a host machine
> @@ -77,6 +69,6 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADBD
>  
>  endif
>  
> -comment "android-tools needs a toolchain w/ threads"
> -	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "android-tools needs a toolchain w/ threads, dynamic library, gcc >= 5"

depends on BR2_USE_MMU is missing here

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
> index 898ddb2199..c3be568627 100644
> --- a/package/android-tools/Config.in.host
> +++ b/package/android-tools/Config.in.host
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_ANDROID_TOOLS
>  	bool "host android-tools"
>  	select BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB if \
>  		!BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
> +	select BR2_PACKAGE_HOST_PKGCONF

Not needed. We don't select BR2_PACKAGE_HOST_PKGCONF in general.

>  	help
>  	  This package contains the fastboot and adb utilities, that
>  	  can be used to interact with target devices using of these
> diff --git a/package/android-tools/android-tools.hash b/package/android-tools/android-tools.hash
> index 27602fb2f7..e087b2dd79 100644
> --- a/package/android-tools/android-tools.hash
> +++ b/package/android-tools/android-tools.hash
> @@ -1,4 +1,4 @@
>  # locally computed
> -sha256	9bfba987e1351b12aa983787b9ae4424ab752e9e646d8e93771538dc1e5d932f  android-tools_4.2.2+git20130218.orig.tar.xz
> -sha256	73c3078de3e44d8a3cadf7a360863c63155d9d558c2f0933cf38ad901a3f5998  android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz
> +sha256  fbd859d0457a414dc82244745fa110a5d4cf998a4a8c95f835477a89fca61ccc  android-tools_5.1.1.r38.orig.tar.xz
> +sha256  ac45a1ed9003bf23a2fddde7b48efdb46fca910c1228f3f3c265de25b9305aa7  android-tools_5.1.1.r38-1.1.debian.tar.xz
>  sha256  170c5939bf8c8eed1db8f66f2d6155e8c1a3e799e390b55e7aad253195b1ebf5  debian/copyright
> diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
> index 3d5c76a322..a558141f7a 100644
> --- a/package/android-tools/android-tools.mk
> +++ b/package/android-tools/android-tools.mk
> @@ -5,14 +5,39 @@
>  ################################################################################
>  
>  ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
> -ANDROID_TOOLS_VERSION = 4.2.2+git20130218
> +ANDROID_TOOLS_VERSION = 5.1.1.r38
>  ANDROID_TOOLS_SOURCE = android-tools_$(ANDROID_TOOLS_VERSION).orig.tar.xz
> -ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-3ubuntu41.debian.tar.gz
> +ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-1.1.debian.tar.xz
>  HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)
>  ANDROID_TOOLS_LICENSE = Apache-2.0
>  ANDROID_TOOLS_LICENSE_FILES = debian/copyright
> -ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
> -HOST_ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
> +ANDROID_TOOLS_DEPENDENCIES = host-pkgconf libcap libselinux openssl pcre zlib
> +HOST_ANDROID_TOOLS_DEPENDENCIES = host-openssl host-pkgconf host-zlib
> +
> +# Target android_arch selection
> +ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_ARCH_IS_64),y)

BR2_arm and BR2_ARCH_IS_64 both enabled is not possible.

> +ANDROID_TOOLS_ANDROID_ARCH = arm64
> +else
> +ANDROID_TOOLS_ANDROID_ARCH = arm
> +endif
> +else ifeq ($(BR2_mips),y)
> +ANDROID_TOOLS_ANDROID_ARCH = mips
> +else ifeq ($(BR2_mips64),y)
> +ANDROID_TOOLS_ANDROID_ARCH = mips64
> +else
> +ANDROID_TOOLS_ANDROID_ARCH = x86
> +endif

What about the zillion other architectures that we support?

> +
> +ANDROID_TOOLS_TARGET_MAKE_ENV = \
> +	$(TARGET_MAKE_ENV) \
> +	android_arch=linux-$(ANDROID_TOOLS_ANDROID_ARCH)
> +
> +# Host android_arch: use generic x86 AndroidConfig.h
> +# The AndroidConfig.h not contain any arch-specific code

But if the AndroidConfig.h does not contain any arch-specific code, why
do we bother specifying a "correct" android_arch value for the target
package?

> +ANDROID_TOOLS_HOST_MAKE_ENV = \
> +	$(HOST_MAKE_ENV) \
> +	android_arch=linux-x86

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
