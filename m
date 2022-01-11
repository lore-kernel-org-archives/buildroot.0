Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75011C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 208496FB2B;
	Tue, 11 Jan 2022 21:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWLx4Dew3RT0; Tue, 11 Jan 2022 21:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AD546FB29;
	Tue, 11 Jan 2022 21:14:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A19731BF989
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 901966FB29
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diQRY1tWTG6f for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:14:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E30D60D71
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:14:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id ABAEE82BCC; Tue, 11 Jan 2022 21:08:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:14:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baf74fe3df91e7b2d53a5533d06057965423ba7e
X-Git-Newrev: bdb8cbb15c8f55da9a2d98ed206f8dfb10f2c8e3
X-Patchwork-Hint: ignore
Message-Id: <20220111210816.ABAEE82BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gstreamer1-mm: drop
 package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bdb8cbb15c8f55da9a2d98ed206f8dfb10f2c8e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gstreamer1-mm is not compatible with glibmm-2.68 API and not actively
maintained anymore (one commit during the last 3 years):
https://gitlab.gnome.org/GNOME/gstreamermm/-/issues/17
https://gitlab.gnome.org/GNOME/gstreamermm/-/commits/master

As this is the only package that doesn't support glibmm-2.68 and because
it can't be easily patched, drop it to avoid the following build failure
raised since commit dddb65efbdf2c7952f22a1e51009f17f1676db4a:

Package 'giomm-2.4', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/3479688334765fbbe4cb9620f4d3596f7d710404

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  7 ++++
 package/gstreamer1/Config.in                       |  1 -
 .../0001-Fix-build-against-glib-2-68.patch         | 44 ----------------------
 package/gstreamer1/gstreamer1-mm/Config.in         | 29 --------------
 .../gstreamer1/gstreamer1-mm/gstreamer1-mm.hash    |  6 ---
 package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk  | 24 ------------
 6 files changed, 7 insertions(+), 104 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b3e8d5a6d8..6c6aca5ac9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_GSTREAMER1_MM
+	bool "gstreamer1-mm package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it is not actively
+	  maintained anymore and does not support glibmm-2.68 API.
+
 config BR2_KERNEL_HEADERS_5_14
 	bool "kernel headers version 5.14.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index a2a15397e9..8fe8a34395 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -2,7 +2,6 @@
 source "package/gstreamer1/gstreamer1/Config.in"
 
 if BR2_PACKAGE_GSTREAMER1
-source "package/gstreamer1/gstreamer1-mm/Config.in"
 source "package/gstreamer1/gst1-plugins-base/Config.in"
 source "package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
diff --git a/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch b/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
deleted file mode 100644
index 3ffdbb9cbf..0000000000
--- a/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0c0b5f8cef3b1f0a06f56c34340e210e0f23d1b0 Mon Sep 17 00:00:00 2001
-From: Dominique Leuenberger <dimstar@opensuse.org>
-Date: Tue, 13 Jul 2021 10:32:30 +0000
-Subject: [PATCH] Fix build against glib 2.68
-
-volatile has been misused in the past
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/gstreamermm/-/merge_requests/4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- gstreamer/gstreamermm/register.h                    | 2 +-
- tests/integration/test-integration-seekonstartup.cc | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gstreamer/gstreamermm/register.h b/gstreamer/gstreamermm/register.h
-index db66d172..a7ab3a63 100644
---- a/gstreamer/gstreamermm/register.h
-+++ b/gstreamer/gstreamermm/register.h
-@@ -110,7 +110,7 @@ register_mm_type(const gchar * type_name)
-     /* The typedef for GType may be gulong or gsize, depending on the
-      * system and whether the compiler is c++ or not. The g_once_init_*
-      * functions always take a gsize * though ... */
--    static volatile gsize gonce_data = 0;
-+    static gsize gonce_data = 0;
-     if (g_once_init_enter (&gonce_data)) {
-         GTypeInfo info;
- 
-diff --git a/tests/integration/test-integration-seekonstartup.cc b/tests/integration/test-integration-seekonstartup.cc
-index 247ac499..cd43a125 100644
---- a/tests/integration/test-integration-seekonstartup.cc
-+++ b/tests/integration/test-integration-seekonstartup.cc
-@@ -18,7 +18,7 @@ RefPtr<Glib::MainLoop> mainloop;
- RefPtr<Bus> bus;
- RefPtr<Pipeline> pipeline;
- RefPtr<Pad> sink_pad;
--static volatile gint counter;
-+static gint counter;
- bool prerolled = false;
- gboolean was_check = 0;
- 
--- 
-GitLab
-
diff --git a/package/gstreamer1/gstreamer1-mm/Config.in b/package/gstreamer1/gstreamer1-mm/Config.in
deleted file mode 100644
index 3225e394f4..0000000000
--- a/package/gstreamer1/gstreamer1-mm/Config.in
+++ /dev/null
@@ -1,29 +0,0 @@
-config BR2_PACKAGE_GSTREAMER1_MM
-	bool "gstreamer1-mm"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # glibmm -> libsigc
-	depends on BR2_INSTALL_LIBSTDCPP # glibmm
-	depends on BR2_USE_WCHAR # glibmm -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # glibmm -> libglib2
-	select BR2_PACKAGE_GLIBMM
-	select BR2_PACKAGE_GSTREAMER1_CHECK
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	help
-	  gstreamermm provides C++ bindings for the GStreamer streaming
-	  multimedia library (http://gstreamer.freedesktop.org). With
-	  gstreamermm it is possible to	develop applications that work
-	  with multimedia in C++.
-
-	  gstreamermm is developed over glibmm, libsigc++ and libxml++
-	  and the functionalities they provide. This means that, among
-	  other things, referencing and unreferencing of GObjects is
-	  handled automatically via glibmm's automatic pointer class,
-	  Glib::RefPtr, and libsigc++'s slots are used for callbacks and
-	  signals.
-
-	  https://gstreamer.freedesktop.org/bindings/cplusplus.html
-
-comment "gstreamer1-mm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash b/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash
deleted file mode 100644
index 425cf05f39..0000000000
--- a/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gstreamermm/1.10/gstreamermm-1.10.0.sha256sum
-sha256 be58fe9ef7d7e392568ec85e80a84f4730adbf91fb0355ff7d7c616675ea8d60 gstreamermm-1.10.0.tar.xz
-
-# Locally computed
-sha256 7c78a8d7fc6781d51402d5a6036bedda9cffb0e5d28757e25d54d6eacbb1949f  COPYING
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.examples
diff --git a/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk b/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk
deleted file mode 100644
index 539c9df1cb..0000000000
--- a/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# gstreamer1-mm
-#
-################################################################################
-
-GSTREAMER1_MM_VERSION_MAJOR = 1.10
-GSTREAMER1_MM_VERSION = $(GSTREAMER1_MM_VERSION_MAJOR).0
-GSTREAMER1_MM_SITE = http://ftp.gnome.org/pub/gnome/sources/gstreamermm/$(GSTREAMER1_MM_VERSION_MAJOR)
-GSTREAMER1_MM_SOURCE = gstreamermm-$(GSTREAMER1_MM_VERSION).tar.xz
-GSTREAMER1_MM_LICENSE = LGPL-2.1+ (library), GPL-2.0 (examples)
-GSTREAMER1_MM_LICENSE_FILES = COPYING COPYING.examples
-GSTREAMER1_MM_INSTALL_STAGING = YES
-GSTREAMER1_MM_DEPENDENCIES += \
-	glibmm \
-	gstreamer1 \
-	gst1-plugins-base
-
-GSTREAMER1_MM_CONF_OPTS += \
-	--disable-gl \
-	--enable-unittests=no \
-	--disable-deprecated-api
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
