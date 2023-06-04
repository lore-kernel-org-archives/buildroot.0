Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02F0C7EE23
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 20:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7F77402A6;
	Sun,  4 Jun 2023 20:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7F77402A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Eg8ZxARjrrl; Sun,  4 Jun 2023 20:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 411EB41737;
	Sun,  4 Jun 2023 20:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 411EB41737
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F32A41BF5DF
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 20:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAD4981F78
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 20:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD4981F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixxrKXcWNKVk for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 20:10:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79D0081F7E
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79D0081F7E
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 20:10:24 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout04.t-online.de (Postfix) with SMTP id 48B113005;
 Sun,  4 Jun 2023 22:10:21 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd87.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q5u3P-2H5SnB0; Sun, 4 Jun 2023 22:10:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:45852)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q5u3P-0007FC-0w;
 Sun, 04 Jun 2023 22:10:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 22:10:18 +0200
Message-Id: <20230604201019.2674652-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1685909419-4FFF6F7B-9F04C916/0/0 CLEAN NORMAL
X-TOI-MSGID: aba177d6-289e-44fd-b4cc-d6b99551d1a4
Subject: [Buildroot] [PATCH/next 1/2] package/onevpl: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-Don-t-force-fstack-protector.patch   | 32 ++++++++++++++
 package/onevpl/Config.in                      | 26 +++++++++++
 package/onevpl/onevpl.hash                    |  3 ++
 package/onevpl/onevpl.mk                      | 43 +++++++++++++++++++
 6 files changed, 106 insertions(+)
 create mode 100644 package/onevpl/0001-Don-t-force-fstack-protector.patch
 create mode 100644 package/onevpl/Config.in
 create mode 100644 package/onevpl/onevpl.hash
 create mode 100644 package/onevpl/onevpl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cfb294ea7e..818b5a2ecd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -413,6 +413,7 @@ F:	package/minidlna/
 F:	package/mjpg-streamer/
 F:	package/monero/
 F:	package/nut/
+F:	package/onevpl/
 F:	package/p2pool/
 F:	package/perl-crypt-openssl-guess/
 F:	package/perl-crypt-openssl-random/
diff --git a/package/Config.in b/package/Config.in
index d838227f86..a52f40a019 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1634,6 +1634,7 @@ menu "Graphics"
 	source "package/libvips/Config.in"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
+	source "package/onevpl/Config.in"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
diff --git a/package/onevpl/0001-Don-t-force-fstack-protector.patch b/package/onevpl/0001-Don-t-force-fstack-protector.patch
new file mode 100644
index 0000000000..14948e28cc
--- /dev/null
+++ b/package/onevpl/0001-Don-t-force-fstack-protector.patch
@@ -0,0 +1,32 @@
+From 682a9eabc71c2e33ebbbba2e75d0ba7caa08c7c8 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 8 May 2023 20:03:22 +0200
+Subject: [PATCH] Don't force -fstack-protector
+
+This allows the environment to decide whether SSP should be used or
+not, for example to support toolchains that don't have SSP support.
+
+Upstream: Not applicable
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ cmake/CompileOptions.cmake | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/cmake/CompileOptions.cmake b/cmake/CompileOptions.cmake
+index 9923f1c..5b24622 100644
+--- a/cmake/CompileOptions.cmake
++++ b/cmake/CompileOptions.cmake
+@@ -54,9 +54,6 @@ else()
+       add_definitions("-D_FORTIFY_SOURCE=2")
+     endif()
+   endif()
+-  if(NOT MINGW)
+-    add_compile_options("-fstack-protector-strong")
+-  endif()
+   if(NOT MINGW)
+     add_link_options("-Wl,-z,relro,-z,now,-z,noexecstack")
+   endif()
+-- 
+2.39.2
+
diff --git a/package/onevpl/Config.in b/package/onevpl/Config.in
new file mode 100644
index 0000000000..65a34185e3
--- /dev/null
+++ b/package/onevpl/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+	bool
+	default y if BR2_ARCH_IS_64
+	default y if BR2_arm
+
+config BR2_PACKAGE_ONEVPL
+	bool "onevpl"
+	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	help
+	  oneAPI Video Processing Library (oneVPL) dispatcher,
+	  tools, and examples
+
+	  https://github.com/oneapi-src/oneVPL
+
+comment "onevpl needs a toolchain w/ dynamic library, gcc >= 7, C++, threads"
+	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/onevpl/onevpl.hash b/package/onevpl/onevpl.hash
new file mode 100644
index 0000000000..405c4ebe53
--- /dev/null
+++ b/package/onevpl/onevpl.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6378539dfd15c08aad4b7756c0dd694430c789a0aa2ebaf4352de18e59ab54e9  onevpl-2023.3.0.tar.gz
+sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/onevpl/onevpl.mk b/package/onevpl/onevpl.mk
new file mode 100644
index 0000000000..abf94da0e2
--- /dev/null
+++ b/package/onevpl/onevpl.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# onevpl
+#
+################################################################################
+
+ONEVPL_VERSION = 2023.3.0
+ONEVPL_SITE = $(call github,oneapi-src,oneVPL,v$(ONEVPL_VERSION))
+ONEVPL_LICENSE = MIT
+ONEVPL_LICENSE_FILES = LICENSE
+ONEVPL_INSTALL_STAGING = YES
+ONEVPL_DEPENDENCIES = host-pkgconf
+
+ONEVPL_CONF_OPTS = \
+	-DINSTALL_EXAMPLE_CODE=OFF
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ONEVPL_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="-latomic"
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+ONEVPL_CONF_OPTS += -DENABLE_VA=ON
+ONEVPL_DEPENDENCIES += libva
+else
+ONEVPL_CONF_OPTS += -DENABLE_VA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+ONEVPL_CONF_OPTS += -DENABLE_WAYLAND=ON
+ONEVPL_DEPENDENCIES += wayland wayland-protocols
+else
+ONEVPL_CONF_OPTS += -DENABLE_WAYLAND=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+ONEVPL_CONF_OPTS += -DENABLE_X11=ON
+ONEVPL_DEPENDENCIES += libxcb xlib_libX11
+else
+ONEVPL_CONF_OPTS += -DENABLE_X11=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
