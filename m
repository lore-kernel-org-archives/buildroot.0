Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CB6C77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 08:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FDD161666;
	Fri, 28 Apr 2023 08:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FDD161666
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jn6BadSWh9_M; Fri, 28 Apr 2023 07:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2FDD61678;
	Fri, 28 Apr 2023 07:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2FDD61678
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 390E61BF215
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 07:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1377140647
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 07:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1377140647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSknSjhOkyZP for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 07:59:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6EEA40018
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6EEA40018
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 07:59:31 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-507bdc5ca2aso16805330a12.3
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 00:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682668769; x=1685260769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=APnSbZLR5MBYhhu9nW8/HU9WtxKMjRpDasI8UGbpDOA=;
 b=cd0j6+9Io3rCSx/8BUMohaMJ51Chl9iPFwesn253mfYW4VaJx7Kbvqb7X1vP6x/KUa
 P0FRGySV5ybclvX2a4AKDnYJTsW28BaiucxOvs+SlM2lpEJ65TqbHdfaireLijAjuHon
 iASI+Fl/5ZKcehNTyDhncGZ5TmP9eEi9kQYXYH/w5b1KOCCuAfec7jnTo5srJh9Vu728
 8y+ZLppY1in6F+xcrOxiRMcupjf5ppciR5pvFPaViYpxMn6pS0r3nQEaFhr14zc4X+aV
 qxIszdl92t3MuWwc2OQrbNI3aJg8Futi5jkS0zwih26XmC+gcx/Skw4Vt9Q4al1l2S0Y
 WmGQ==
X-Gm-Message-State: AC+VfDxT8XSlUH7S9RiQseu/ewZDFHDeCjLrH94+MmkRHproKeYtl10Y
 /o7K1p6GYRTLgIj6u5i5JOOi1CKyJcqKhA==
X-Google-Smtp-Source: ACHHUZ7XqH1lf7xusEm3fZ24mFvFV3Q3KqQxtwMxSqGG5R2IFfLlGyRR0kKbm29zulnpjV5xss3Oeg==
X-Received: by 2002:a17:907:988:b0:953:42c0:86e7 with SMTP id
 bf8-20020a170907098800b0095342c086e7mr3625471ejc.4.1682668768972; 
 Fri, 28 Apr 2023 00:59:28 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:627a:ae86:20c8:b204])
 by smtp.gmail.com with ESMTPSA id
 sd22-20020a1709076e1600b009572bd99281sm9324798ejc.224.2023.04.28.00.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 00:59:28 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 09:59:18 +0200
Message-Id: <20230428075920.3750005-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428075920.3750005-1-thomas@devoogdt.com>
References: <20230428075920.3750005-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 3/5] package/atk: remove package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 James Knight <james.knight@collins.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Daniel Lang <d.lang@abatec.at>

atk has been merged into at-spi2-core with version 2.45.1.

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NEWS
https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
---
v3:
 - rebased on https://patchwork.ozlabs.org/project/buildroot/list/?series=336254
 - needed to fix the webkitgtk 2.38.5 compilation
   (https://patchwork.ozlabs.org/project/buildroot/patch/20230220090923.2155635-2-thomas.devoogdt@barco.com/)
v5: rebased + grouped patches
v6: added change to atkmm2_28
v7: no change
---
 Config.in.legacy               |  7 +++++++
 package/Config.in              |  1 -
 package/atk/Config.in          | 14 --------------
 package/atk/atk.hash           |  5 -----
 package/atk/atk.mk             | 25 -------------------------
 package/atkmm/Config.in        |  8 ++++----
 package/atkmm/atkmm.mk         |  2 +-
 package/atkmm2_28/Config.in    |  8 ++++----
 package/atkmm2_28/atkmm2_28.mk |  2 +-
 package/libglade/Config.in     |  2 +-
 package/libglade/libglade.mk   |  2 +-
 package/libgtk2/Config.in      |  2 +-
 package/libgtk2/libgtk2.mk     |  2 +-
 package/libgtk3/Config.in      |  2 +-
 package/libgtk3/libgtk3.mk     |  2 +-
 15 files changed, 23 insertions(+), 61 deletions(-)
 delete mode 100644 package/atk/Config.in
 delete mode 100644 package/atk/atk.hash
 delete mode 100644 package/atk/atk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index db75899a9b..d86a7e6363 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.05"
 
+config BR2_PACKAGE_ATK
+	bool "atk removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_AT_SPI2_CORE
+	help
+	  atk is now part of at-spi2-core.
+
 config BR2_PACKAGE_AT_SPI2_ATK
 	bool "at-spi2-atk removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 70c5c2eea8..6a92573d39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1555,7 +1555,6 @@ endmenu
 menu "Graphics"
 	source "package/assimp/Config.in"
 	source "package/at-spi2-core/Config.in"
-	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
 	source "package/atkmm2_28/Config.in"
 	source "package/bayer2rgb-neon/Config.in"
diff --git a/package/atk/Config.in b/package/atk/Config.in
deleted file mode 100644
index d9371b879b..0000000000
--- a/package/atk/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_ATK
-	bool "atk"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  The ATK accessibility toolkit, needed to build GTK+-2.x.
-
-	  https://gitlab.gnome.org/GNOME/atk
-
-comment "atk needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/atk/atk.hash b/package/atk/atk.hash
deleted file mode 100644
index d8cd69ff1f..0000000000
--- a/package/atk/atk.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum
-sha256  ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36  atk-2.38.0.tar.xz
-
-# Hash for license file
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
deleted file mode 100644
index 2820fb486d..0000000000
--- a/package/atk/atk.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# atk
-#
-################################################################################
-
-ATK_VERSION_MAJOR = 2.38
-ATK_VERSION = $(ATK_VERSION_MAJOR).0
-ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
-ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
-ATK_LICENSE = LGPL-2.0+
-ATK_LICENSE_FILES = COPYING
-ATK_INSTALL_STAGING = YES
-ATK_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
-
-ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-ATK_CONF_OPTS += -Dintrospection=true
-ATK_DEPENDENCIES += gobject-introspection
-else
-ATK_CONF_OPTS += -Dintrospection=false
-endif
-
-ATK_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
-
-$(eval $(meson-package))
diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index 1f370356ea..571d7e69ad 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM
 	bool "atkmm (latest)"
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
-	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
-	depends on BR2_USE_MMU # atk/glibmm -> libglib2
-	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
-	select BR2_PACKAGE_ATK
+	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_LIBSIGC
 
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 7ceb87b047..da763c8386 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -11,6 +11,6 @@ ATKMM_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM_VERSION_MAJOR)
 ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 ATKMM_LICENSE_FILES = COPYING COPYING.tools
 ATKMM_INSTALL_STAGING = YES
-ATKMM_DEPENDENCIES = atk glibmm libsigc host-pkgconf
+ATKMM_DEPENDENCIES = at-spi2-core glibmm libsigc host-pkgconf
 
 $(eval $(meson-package))
diff --git a/package/atkmm2_28/Config.in b/package/atkmm2_28/Config.in
index 2340465b20..e88073b87a 100644
--- a/package/atkmm2_28/Config.in
+++ b/package/atkmm2_28/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM2_28
 	bool "atkmm (2.28.x)"
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
-	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
-	depends on BR2_USE_MMU # atk/glibmm -> libglib2
-	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
-	select BR2_PACKAGE_ATK
+	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM2_66
 	select BR2_PACKAGE_LIBSIGC2
 
diff --git a/package/atkmm2_28/atkmm2_28.mk b/package/atkmm2_28/atkmm2_28.mk
index dc57363cf5..b56da61ec0 100644
--- a/package/atkmm2_28/atkmm2_28.mk
+++ b/package/atkmm2_28/atkmm2_28.mk
@@ -11,6 +11,6 @@ ATKMM2_28_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM2_28_VERSION_MA
 ATKMM2_28_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 ATKMM2_28_LICENSE_FILES = COPYING COPYING.tools
 ATKMM2_28_INSTALL_STAGING = YES
-ATKMM2_28_DEPENDENCIES = atk glibmm2_66 libsigc2 host-pkgconf
+ATKMM2_28_DEPENDENCIES = at-spi2-core glibmm2_66 libsigc2 host-pkgconf
 
 $(eval $(meson-package))
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index c97c9becd2..8d0d26f159 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGLADE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_LIBXML2
 	help
 	  Libglade allows you to load glade interface files in a program
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 21aed60605..af73d8bd00 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -9,7 +9,7 @@ LIBGLADE_VERSION = $(LIBGLADE_VERSION_MAJOR).4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = https://download.gnome.org/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
 LIBGLADE_INSTALL_STAGING = YES
-LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
+LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 at-spi2-core libxml2
 LIBGLADE_LICENSE = LGPL-2.0+
 LIBGLADE_LICENSE_FILES = COPYING
 
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index c75c37fb63..f2888b2f51 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 859925e8d3..608c263e4d 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -23,7 +23,7 @@ LIBGTK2_CONF_ENV = \
 
 LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 
-LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk \
+LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango at-spi2-core \
 	gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)
 
 LIBGTK2_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 82ca68d2da..34b8d49eb3 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 18a8a9fa42..bdd54dcdc8 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -14,7 +14,7 @@ LIBGTK3_CPE_ID_VENDOR = gnome
 LIBGTK3_CPE_ID_PRODUCT = gtk
 LIBGTK3_INSTALL_STAGING = YES
 
-LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango \
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 at-spi2-core libglib2 cairo pango \
 	gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
