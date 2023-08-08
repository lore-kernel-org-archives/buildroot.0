Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E864FC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 17:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 755B74057F;
	Tue,  8 Aug 2023 17:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 755B74057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dN81dlyBHcDr; Tue,  8 Aug 2023 17:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F2D440C0E;
	Tue,  8 Aug 2023 17:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F2D440C0E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 101351BF59C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDF7960BA2
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDF7960BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4ElUdfjJyXn for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 17:23:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A64896074C
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 17:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A64896074C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 927C684AE3; Tue,  8 Aug 2023 17:23:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 19:15:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3f32fab3d85c4e8e45f170d7b720bf9f6404962f
X-Git-Newrev: c50e9c21f0444b064bc257fcc0d3073fee945623
X-Patchwork-Hint: ignore
Message-Id: <20230808172341.927C684AE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/onevpl: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c50e9c21f0444b064bc257fcc0d3073fee945623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../onevpl/0001-Don-t-force-fstack-protector.patch | 32 ++++++++++++++++
 package/onevpl/Config.in                           | 27 ++++++++++++++
 package/onevpl/onevpl.hash                         |  3 ++
 package/onevpl/onevpl.mk                           | 43 ++++++++++++++++++++++
 6 files changed, 107 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9915143a04..eb703d52c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -417,6 +417,7 @@ F:	package/mjpg-streamer/
 F:	package/mpg123/
 F:	package/ntp/
 F:	package/nut/
+F:	package/onevpl/
 F:	package/opus/
 F:	package/pciutils/
 F:	package/perl-crypt-openssl-guess/
diff --git a/package/Config.in b/package/Config.in
index e12ee34e9f..58e653dcd9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1642,6 +1642,7 @@ menu "Graphics"
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
index 0000000000..a750e54d52
--- /dev/null
+++ b/package/onevpl/Config.in
@@ -0,0 +1,27 @@
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
+	# libva support needs a libdrm with intel driver
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
index 0000000000..c9ca1e6c04
--- /dev/null
+++ b/package/onevpl/onevpl.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4411543519486a2450f6f5af06a077596e7888a551768594e9dfa2a46b23b6f5  onevpl-2023.3.1.tar.gz
+sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/onevpl/onevpl.mk b/package/onevpl/onevpl.mk
new file mode 100644
index 0000000000..2033f755c0
--- /dev/null
+++ b/package/onevpl/onevpl.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# onevpl
+#
+################################################################################
+
+ONEVPL_VERSION = 2023.3.1
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
