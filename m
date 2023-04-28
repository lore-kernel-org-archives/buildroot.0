Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB14FC77B60
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 07:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6324C60E48;
	Fri, 28 Apr 2023 07:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6324C60E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ych5Gjzpp5ij; Fri, 28 Apr 2023 07:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B1106166C;
	Fri, 28 Apr 2023 07:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B1106166C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 118E81BF215
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 07:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF4AB60E48
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 07:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF4AB60E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GkQId0WcqnZM for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 07:59:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CFD560AE1
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CFD560AE1
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 07:59:29 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-94f1d0d2e03so1432682566b.0
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 00:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682668767; x=1685260767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8r8nGzgnydbraK2po29Vs8RzC3pOtTcf8pBCOVDHdiw=;
 b=lIzMR6lxvGZTVpIqlP1aqVhvDNJgELOjORV8bhhTTcATSKyMq/7lsyvZA0Z/72P+DP
 udpqNNKYNGK/btGeZdIuhhv/TfFWKBzl/W9BMz7j239H3MOvotKGXA58jDdKqSnvF5DF
 66HLdPvSVAZW8TzFgfGQBpLl4iapvI4kdWMl5U1pAyDGPmKucU4FbPNnF4wZOhB35AHf
 a/Geu+9/MFOCEP8b8qbN/D3Ld5nSDkauY7CkalLahiogHvLzvFEGxIxCawsDRhtYUw6Q
 q1dW8jse1BNI97V3a9RzQJX3yKSfLmHAuxOlJ0KjC/ky2f5EzTmgs0gf5WM/r2CHDbi8
 8zRQ==
X-Gm-Message-State: AC+VfDyWD7cwEQTQzZ+IKqWKcXuscfe5vMqNg8uHD2Lw8+3nTMuDqbEE
 gENywwD2dVzvdVdyvH42wOXtSzu5ELkW3g==
X-Google-Smtp-Source: ACHHUZ49xJl0X9nU4esHfHiSDInuEpwmavlki9BmOFsTsmYwi0whZdU3ZmilbkttmK7VlUodn2FuFQ==
X-Received: by 2002:a17:907:268e:b0:94e:d75b:5998 with SMTP id
 bn14-20020a170907268e00b0094ed75b5998mr3897450ejc.5.1682668767319; 
 Fri, 28 Apr 2023 00:59:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:627a:ae86:20c8:b204])
 by smtp.gmail.com with ESMTPSA id
 sd22-20020a1709076e1600b009572bd99281sm9324798ejc.224.2023.04.28.00.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 00:59:27 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 09:59:17 +0200
Message-Id: <20230428075920.3750005-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428075920.3750005-1-thomas@devoogdt.com>
References: <20230428075920.3750005-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 2/5] package/at-spi2-atk: remove package
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

at-spi2-atk has been merged into at-spi2-core with version 2.45.1.

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
v6: no change
v7: no change
---
 Config.in.legacy                              |  7 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 .../0001-meson-add-tests-option.patch         | 43 -------------------
 package/at-spi2-atk/Config.in                 | 22 ----------
 package/at-spi2-atk/at-spi2-atk.hash          |  5 ---
 package/at-spi2-atk/at-spi2-atk.mk            | 19 --------
 7 files changed, 7 insertions(+), 91 deletions(-)
 delete mode 100644 package/at-spi2-atk/0001-meson-add-tests-option.patch
 delete mode 100644 package/at-spi2-atk/Config.in
 delete mode 100644 package/at-spi2-atk/at-spi2-atk.hash
 delete mode 100644 package/at-spi2-atk/at-spi2-atk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 366b9d6949..db75899a9b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.05"
 
+config BR2_PACKAGE_AT_SPI2_ATK
+	bool "at-spi2-atk removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_AT_SPI2_CORE
+	help
+	  at-spi2-atk is now part of at-spi2-core.
+
 config BR2_PACAKGE_OPENFPGALOADER_CMSIS
 	bool "openfpgaloader cmsis option name fixed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d9e95a3d05..9206659428 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1632,7 +1632,6 @@ F:	support/testing/tests/package/test_avocado.py
 F:	support/testing/tests/package/test_python_aexpect.py
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
-F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
 F:	package/clang/
 F:	package/earlyoom/
diff --git a/package/Config.in b/package/Config.in
index eaac32a01a..70c5c2eea8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1554,7 +1554,6 @@ endmenu
 
 menu "Graphics"
 	source "package/assimp/Config.in"
-	source "package/at-spi2-atk/Config.in"
 	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
diff --git a/package/at-spi2-atk/0001-meson-add-tests-option.patch b/package/at-spi2-atk/0001-meson-add-tests-option.patch
deleted file mode 100644
index 3a2aefa090..0000000000
--- a/package/at-spi2-atk/0001-meson-add-tests-option.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 466d04a57b32417dbf2d5e818af1b7593af5f802 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 3 May 2020 10:29:36 +0200
-Subject: [PATCH] meson: add tests option
-
-Add tests option to allow the user to build at-spi2-atk without tests,
-it is especially useful as one of the test requires libxml-2.0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/at-spi2-atk/-/merge_requests/22]
----
- meson.build       | 4 +++-
- meson_options.txt | 4 ++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9fce5d6..61bc93d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -61,4 +61,6 @@ install_data('at-spi2-atk.desktop',
- 
- subdir('droute')
- subdir('atk-adaptor')
--subdir('tests')
-+if get_option('tests')
-+  subdir('tests')
-+endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 24c9228..a4abdc2 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -2,3 +2,7 @@ option('disable_p2p',
-        description: 'Disable peer-to-peer DBus connections',
-        type: 'boolean',
-        value: false)
-+option('tests',
-+       description: 'Whether to build tests',
-+       type: 'boolean',
-+       value: true)
--- 
-2.26.2
-
diff --git a/package/at-spi2-atk/Config.in b/package/at-spi2-atk/Config.in
deleted file mode 100644
index 9a7cfde0af..0000000000
--- a/package/at-spi2-atk/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_AT_SPI2_ATK
-	bool "at-spi2-atk"
-	depends on BR2_PACKAGE_XORG7 # at-spi2-core
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_USE_WCHAR # glib2
-	select BR2_PACKAGE_ATK
-	select BR2_PACKAGE_AT_SPI2_CORE
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  The At-Spi2 Atk package contains a library that bridges
-	  ATK to At-Spi2 D-Bus service.
-
-	  https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/
-
-comment "at-spi2-atk needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "at-spi2-atk depends on X.org"
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_XORG7
diff --git a/package/at-spi2-atk/at-spi2-atk.hash b/package/at-spi2-atk/at-spi2-atk.hash
deleted file mode 100644
index 9c564c32af..0000000000
--- a/package/at-spi2-atk/at-spi2-atk.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/at-spi2-atk/2.34/at-spi2-atk-2.34.2.sha256sum
-sha256  901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216fa363005e27f4f0  at-spi2-atk-2.34.2.tar.xz
-
-# locally calculated
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
deleted file mode 100644
index 232b577230..0000000000
--- a/package/at-spi2-atk/at-spi2-atk.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# at-spi2-atk
-#
-################################################################################
-
-AT_SPI2_ATK_VERSION_MAJOR = 2.34
-AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).2
-AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
-AT_SPI2_ATK_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
-AT_SPI2_ATK_LICENSE = LGPL-2.1+
-AT_SPI2_ATK_LICENSE_FILES = COPYING
-AT_SPI2_ATK_CPE_ID_VENDOR = gnome
-AT_SPI2_ATK_INSTALL_STAGING = YES
-AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
-AT_SPI2_ATK_CONF_OPTS = -Dtests=false
-
-$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
