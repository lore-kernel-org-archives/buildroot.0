Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17B2C43334
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 21:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D1D86105E;
	Fri, 10 Jun 2022 21:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFydx0xnVCc1; Fri, 10 Jun 2022 21:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF33860BE7;
	Fri, 10 Jun 2022 21:40:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1ABC1BF3E0
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 21:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFD19410AB
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 21:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_fLVf233DwZ for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 21:40:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A249B40E46
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 21:40:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m24so159641wrb.10
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 14:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8fZ4f+bpEIjgXnFiWzQ3QDSFKRXxIAiaP4VzgliACj4=;
 b=GinSP5y2VnEr/waJwF1xScnHA6tPAMtVTtiIvy3I91LPqe19U1X9yi0PF6lTyUpjkj
 f2OkfDu1gnvHlFZ/TMVWFQcXsVpQvpp17X8B898PqA1N+TEf6E8h1GqGia0WeKrk9tYu
 msuJOf72p2q3YrpodMoa751bAjmsrw/FdPcA3GAzXRSeAL1rQhg1LDeJvc/9Hf2mCKz1
 uFByosbqw3qK8kpX4egyHb+i3ZhvqaG7tUVDY/0QX8yYntTnHXdywIsbMyDsdPRcgyH8
 HoTVC5tPs3h6vTOVSCFFNvI1HzKddjdsL4vAVPzOMkQ1PSUF4TCrYRH8j7NOFpK36kpc
 VyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8fZ4f+bpEIjgXnFiWzQ3QDSFKRXxIAiaP4VzgliACj4=;
 b=cJS5JoFB1/Cm4Xm7e4bQUl3ryDuOFg+1Ze7MpnwpJpArYYKGxta13m35XnFB3Ji59B
 kL5mKOHQVJ9l2Bhhy7Qoe3YlZVOINF98Nn3dFRfQ3B7pVLS2sCVJhPhjV9FhVTY/z0RB
 82tNGndkPd6Uuv4hzG3Xwix7d87Y1OXqS6etGfRF72dUL2FRXT4F3HvqLRSk61MsXCS0
 oXOmhUfwsTO2K8NUukA1M+sdURZWflmhVo7u0vz/7uGkFwnQGflkeHAMPjG0hidOUIIh
 UARDiQlkV68kmjN4HALZmYZe9aWBBP2hG2wk8uAwXcIVmlg48kzmPmRHZdl476OKZvKO
 P/2g==
X-Gm-Message-State: AOAM531kHUrzvOE2DF4NrQjIkO4xs3Flis18FlBAsniMptEtP0Ainf3d
 B096OF1ri5zc5flr6TppE6YVvlYC8Ow=
X-Google-Smtp-Source: ABdhPJx36eqJ7Z+rKVk7+0mgNmnHd35R+034bR9USsHHqVsQxMKHVPMn3ybPdYaoN/x9YoD1thJYWQ==
X-Received: by 2002:adf:fd0a:0:b0:219:ea8d:c09e with SMTP id
 e10-20020adffd0a000000b00219ea8dc09emr4063189wrr.13.1654897224576; 
 Fri, 10 Jun 2022 14:40:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d4-20020adffbc4000000b00219b4c01712sm467254wrs.92.2022.06.10.14.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 14:40:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Jun 2022 23:37:41 +0200
Message-Id: <20220610213741.3849566-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmediaart: bump to version 1.9.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop all patches (already in version)
- unit_tests option has been renamed tests:
  https://gitlab.gnome.org/GNOME/libmediaart/-/commit/1b0be1d5bea76c1d02a7afebc431844e933ed4a8

https://gitlab.gnome.org/GNOME/libmediaart/-/blob/1.9.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-meson-add-introspection-option.patch | 87 -------------------
 .../0002-meson-add-unit_tests-option.patch    | 48 ----------
 ...t-meson.build-replace-shared_library.patch | 35 --------
 package/libmediaart/libmediaart.hash          |  4 +-
 package/libmediaart/libmediaart.mk            |  4 +-
 5 files changed, 4 insertions(+), 174 deletions(-)
 delete mode 100644 package/libmediaart/0001-meson-add-introspection-option.patch
 delete mode 100644 package/libmediaart/0002-meson-add-unit_tests-option.patch
 delete mode 100644 package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch

diff --git a/package/libmediaart/0001-meson-add-introspection-option.patch b/package/libmediaart/0001-meson-add-introspection-option.patch
deleted file mode 100644
index 2b849040fe..0000000000
--- a/package/libmediaart/0001-meson-add-introspection-option.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From ee7d8736af172cd5ad71a0bd511c39daf401e3f6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 5 Oct 2021 23:35:26 +0200
-Subject: [PATCH] meson: add introspection option
-
-Add introspection option
-
-Fix #3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/libmediaart/-/merge_requests/14]
----
- libmediaart/meson.build | 42 +++++++++++++++++++++--------------------
- meson_options.txt       |  2 ++
- 2 files changed, 24 insertions(+), 20 deletions(-)
-
-diff --git a/libmediaart/meson.build b/libmediaart/meson.build
-index 56e00ab..2f44e63 100644
---- a/libmediaart/meson.build
-+++ b/libmediaart/meson.build
-@@ -41,28 +41,30 @@ libmediaart = shared_library(
-   install: true,
- )
- 
--gir_args = [
--  '--quiet',
--  '-DLIBMEDIAART_COMPILATION',
--]
-+if get_option('introspection')
-+  gir_args = [
-+    '--quiet',
-+    '-DLIBMEDIAART_COMPILATION',
-+  ]
- 
--libmediaart_gir_and_typelib = gnome.generate_gir(libmediaart,
--  sources: libmediaart_sources + libmediaart_introspection_sources + libmediaart_public_headers,
--  nsversion: libmediaart_api_version,
--  namespace: 'MediaArt',
--  identifier_prefix: 'MediaArt',
--  symbol_prefix: 'media_art',
--  includes: ['Gio-2.0', 'GObject-2.0'],
--  header: 'libmediaart/mediaart.h',
--  export_packages: 'libmediaart-' + libmediaart_api_version,
--  extra_args: gir_args,
--  install: true
--)
-+  libmediaart_gir_and_typelib = gnome.generate_gir(libmediaart,
-+    sources: libmediaart_sources + libmediaart_introspection_sources + libmediaart_public_headers,
-+    nsversion: libmediaart_api_version,
-+    namespace: 'MediaArt',
-+    identifier_prefix: 'MediaArt',
-+    symbol_prefix: 'media_art',
-+    includes: ['Gio-2.0', 'GObject-2.0'],
-+    header: 'libmediaart/mediaart.h',
-+    export_packages: 'libmediaart-' + libmediaart_api_version,
-+    extra_args: gir_args,
-+    install: true
-+  )
- 
--libmediaart_vapi = gnome.generate_vapi('libmediaart-' + libmediaart_api_version,
--  sources: libmediaart_gir_and_typelib[0],
--  packages: 'gio-2.0',
--  install: true)
-+  libmediaart_vapi = gnome.generate_vapi('libmediaart-' + libmediaart_api_version,
-+    sources: libmediaart_gir_and_typelib[0],
-+    packages: 'gio-2.0',
-+    install: true)
-+endif
- 
- libmediaart_dep = declare_dependency(
-   link_with: libmediaart,
-diff --git a/meson_options.txt b/meson_options.txt
-index 3ef49ba..b8c51b1 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,5 +1,7 @@
- option('image_library', type: 'combo', choices: ['auto', 'gdk-pixbuf', 'qt4', 'qt5'],
-        description: 'Which image processing backend to use')
-+option('introspection', type : 'boolean', value : 'true',
-+       description : 'Enable / disable the GObject-Introspection integration')
- option('gtk_doc',
-   type: 'boolean',
-   value: 'false',
--- 
-2.33.0
-
diff --git a/package/libmediaart/0002-meson-add-unit_tests-option.patch b/package/libmediaart/0002-meson-add-unit_tests-option.patch
deleted file mode 100644
index 3519ff1984..0000000000
--- a/package/libmediaart/0002-meson-add-unit_tests-option.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 01d94777d9d1906750db0e27e2e7b8f228ae4343 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Oct 2021 23:45:53 +0200
-Subject: [PATCH] meson: add unit_tests option
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:  not sent yet (waiting feedback on first patch)]
----
- meson_options.txt |  2 ++
- tests/meson.build | 14 ++++++++------
- 2 files changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index b8c51b1..1172f93 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -2,6 +2,8 @@ option('image_library', type: 'combo', choices: ['auto', 'gdk-pixbuf', 'qt4', 'q
-        description: 'Which image processing backend to use')
- option('introspection', type : 'boolean', value : 'true',
-        description : 'Enable / disable the GObject-Introspection integration')
-+option('unit_tests', type : 'boolean', value : 'true',
-+       description : 'Enable / disable unit tests')
- option('gtk_doc',
-   type: 'boolean',
-   value: 'false',
-diff --git a/tests/meson.build b/tests/meson.build
-index 28834c0..02c96a1 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -1,7 +1,9 @@
--mediaart_test = executable('mediaart-test',
--  'mediaarttest.c',
--  dependencies: libmediaart_dep,
--)
-+if get_option('unit_tests')
-+  mediaart_test = executable('mediaart-test',
-+    'mediaarttest.c',
-+    dependencies: libmediaart_dep,
-+  )
- 
--test('mediaart', mediaart_test,
--     env: 'G_TEST_SRCDIR=' + meson.current_source_dir())
-+  test('mediaart', mediaart_test,
-+       env: 'G_TEST_SRCDIR=' + meson.current_source_dir())
-+endif
--- 
-2.33.0
-
diff --git a/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch b/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
deleted file mode 100644
index d4b377d327..0000000000
--- a/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2272d762436a3b0d2e4fef8fb4f1669814904620 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Dec 2021 20:14:54 +0100
-Subject: [PATCH] libmediaart/meson.build: replace shared_library
-
-Replace shared_library by library call to avoid the following build
-failure when building statically:
-
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
-__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
-
-Fixes:
- - http://autobuild.buildroot.org/results/18d26882a68dcf8f09b3e3d25636454a12939310
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libmediaart/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libmediaart/meson.build b/libmediaart/meson.build
-index 2f44e63..1fd3b99 100644
---- a/libmediaart/meson.build
-+++ b/libmediaart/meson.build
-@@ -30,7 +30,7 @@ marshal = gnome.genmarshal('marshal',
- 
- libmediaart_dependencies = [glib, gio_unix, gobject, image_library]
- 
--libmediaart = shared_library(
-+libmediaart = library(
-   'mediaart-' + libmediaart_api_version,
-   libmediaart_sources, marshal[0], marshal[1],
-   version: libmediaart_ltversion,
--- 
-2.33.0
-
diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index d7115b20d4..ebc914526b 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.5.sha256sum:
-sha256  07def5a42c482ae71d3e1f77a4d0fdc337f74226059a65284d6d5a241f0e9cd6  libmediaart-1.9.5.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.6.sha256sum:
+sha256  c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17  libmediaart-1.9.6.tar.xz
 
 # Locally computed:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 77665fd95b..c66fa0ccad 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMEDIAART_VERSION_MAJOR = 1.9
-LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).5
+LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).6
 LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
 LIBMEDIAART_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
@@ -13,7 +13,7 @@ LIBMEDIAART_LICENSE = LGPL-2.1+
 LIBMEDIAART_LICENSE_FILES = COPYING.LESSER
 LIBMEDIAART_INSTALL_STAGING = YES
 LIBMEDIAART_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
-LIBMEDIAART_CONF_OPTS = -Dunit_tests=false
+LIBMEDIAART_CONF_OPTS = -Dtests=false
 LIBMEDIAART_LDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
