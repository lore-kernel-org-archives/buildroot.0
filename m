Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10B3C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 715D5404D8;
	Sun, 24 Dec 2023 16:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 715D5404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LeGMK5730jip; Sun, 24 Dec 2023 16:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2893A40567;
	Sun, 24 Dec 2023 16:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2893A40567
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A72EA1BF86B
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DF8B415B5
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DF8B415B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMQ6BUZ7Yg4n for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:45:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71705415A6
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71705415A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61464826DF; Sun, 24 Dec 2023 16:45:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 17:18:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cadbdffd538bcb9cfd89b4907ea3ad878ac4e9fa
X-Git-Newrev: f6acde11ab639f5772ceeac51ff21ca7aadeca8d
X-Patchwork-Hint: ignore
Message-Id: <20231224164528.61464826DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/onevpl: rename package to libvpl
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
Content-Type: multipart/mixed; boundary="===============5259556003431175852=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5259556003431175852==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f6acde11ab639f5772ceeac51ff21ca7aadeca8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changed the package name and its github repo:
https://github.com/intel/libvpl/commit/44df6e08cc836ed65725ed344e7ec9ded5193874

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  5 +++
 DEVELOPERS                                         |  2 +-
 package/Config.in                                  |  2 +-
 .../0001-Don-t-force-fstack-protector.patch        |  0
 package/{onevpl => libvpl}/Config.in               | 12 +++---
 package/{onevpl/onevpl.hash => libvpl/libvpl.hash} |  2 +-
 package/libvpl/libvpl.mk                           | 44 ++++++++++++++++++++++
 package/onevpl-intel-gpu/Config.in                 | 14 +++----
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk       |  2 +-
 package/onevpl/onevpl.mk                           | 44 ----------------------
 10 files changed, 66 insertions(+), 61 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4689226290..d46bd97442 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,11 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_ONEVPL
+	bool "onevpl package was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBVPL
+
 config BR2_KERNEL_HEADERS_6_5
 	bool "kernel headers version 6.5.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index bad07d51aa..834be54eb1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -439,6 +439,7 @@ F:	package/libva/
 F:	package/libva-intel-driver/
 F:	package/libva-utils/
 F:	package/libvorbis/
+F:	package/libvpl/
 F:	package/libvpx/
 F:	package/libyuv/
 F:	package/linux-firmware/
@@ -449,7 +450,6 @@ F:	package/mjpg-streamer/
 F:	package/mpg123/
 F:	package/ntp/
 F:	package/nut/
-F:	package/onevpl/
 F:	package/onevpl-intel-gpu/
 F:	package/opus/
 F:	package/pciutils/
diff --git a/package/Config.in b/package/Config.in
index bc723fe018..28924f650e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1669,9 +1669,9 @@ menu "Graphics"
 	source "package/libva-intel-driver/Config.in"
 	source "package/libvdpau/Config.in"
 	source "package/libvips/Config.in"
+	source "package/libvpl/Config.in"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
-	source "package/onevpl/Config.in"
 	source "package/onevpl-intel-gpu/Config.in"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencv3/Config.in"
diff --git a/package/onevpl/0001-Don-t-force-fstack-protector.patch b/package/libvpl/0001-Don-t-force-fstack-protector.patch
similarity index 100%
rename from package/onevpl/0001-Don-t-force-fstack-protector.patch
rename to package/libvpl/0001-Don-t-force-fstack-protector.patch
diff --git a/package/onevpl/Config.in b/package/libvpl/Config.in
similarity index 75%
rename from package/onevpl/Config.in
rename to package/libvpl/Config.in
index a750e54d52..012f31b3be 100644
--- a/package/onevpl/Config.in
+++ b/package/libvpl/Config.in
@@ -1,11 +1,11 @@
-config BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+config BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	bool
 	default y if BR2_ARCH_IS_64
 	default y if BR2_arm
 
-config BR2_PACKAGE_ONEVPL
-	bool "onevpl"
-	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+config BR2_PACKAGE_LIBVPL
+	bool "libvpl"
+	depends on BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
@@ -21,7 +21,7 @@ config BR2_PACKAGE_ONEVPL
 
 	  https://github.com/oneapi-src/oneVPL
 
-comment "onevpl needs a toolchain w/ dynamic library, gcc >= 7, C++, threads"
-	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+comment "libvpl needs a toolchain w/ dynamic library, gcc >= 7, C++, threads"
+	depends on BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/onevpl/onevpl.hash b/package/libvpl/libvpl.hash
similarity index 83%
rename from package/onevpl/onevpl.hash
rename to package/libvpl/libvpl.hash
index 328fa94487..8f3ea64d2e 100644
--- a/package/onevpl/onevpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  978398c7bb1665a6ad7a1a15cc57dc0204608e56c88436e376b717320a9e63fd  onevpl-2023.4.0.tar.gz
+sha256  978398c7bb1665a6ad7a1a15cc57dc0204608e56c88436e376b717320a9e63fd  libvpl-2023.4.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
new file mode 100644
index 0000000000..3b0adaaf0f
--- /dev/null
+++ b/package/libvpl/libvpl.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# libvpl
+#
+################################################################################
+
+LIBVPL_VERSION = 2023.4.0
+LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
+LIBVPL_LICENSE = MIT
+LIBVPL_LICENSE_FILES = LICENSE
+LIBVPL_INSTALL_STAGING = YES
+LIBVPL_DEPENDENCIES = host-pkgconf
+
+LIBVPL_CONF_OPTS = \
+	-DBUILD_TOOLS=OFF \
+	-DINSTALL_EXAMPLE_CODE=OFF
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBVPL_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="-latomic"
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+LIBVPL_CONF_OPTS += -DENABLE_VA=ON
+LIBVPL_DEPENDENCIES += libva
+else
+LIBVPL_CONF_OPTS += -DENABLE_VA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBVPL_CONF_OPTS += -DENABLE_WAYLAND=ON
+LIBVPL_DEPENDENCIES += wayland wayland-protocols
+else
+LIBVPL_CONF_OPTS += -DENABLE_WAYLAND=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+LIBVPL_CONF_OPTS += -DENABLE_X11=ON
+LIBVPL_DEPENDENCIES += libxcb xlib_libX11
+else
+LIBVPL_CONF_OPTS += -DENABLE_X11=OFF
+endif
+
+$(eval $(cmake-package))
diff --git a/package/onevpl-intel-gpu/Config.in b/package/onevpl-intel-gpu/Config.in
index b1ab6624e5..740e954ee5 100644
--- a/package/onevpl-intel-gpu/Config.in
+++ b/package/onevpl-intel-gpu/Config.in
@@ -1,16 +1,16 @@
 config BR2_PACKAGE_ONEVPL_INTEL_GPU
 	bool "onevpl-intel-gpu"
 	depends on BR2_x86_64 # intel-mediadriver
-	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS # onevpl
-	depends on BR2_INSTALL_LIBSTDCPP # onevpl
-	depends on !BR2_STATIC_LIBS # onevpl
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # onevpl
+	depends on BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS # libvpl
+	depends on BR2_INSTALL_LIBSTDCPP # libvpl
+	depends on !BR2_STATIC_LIBS # libvpl
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libvpl
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
-	depends on BR2_TOOLCHAIN_HAS_THREADS # onevpl
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpl
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
 	select BR2_PACKAGE_INTEL_MEDIADRIVER # runtime
 	select BR2_PACKAGE_LIBVA
-	select BR2_PACKAGE_ONEVPL
+	select BR2_PACKAGE_LIBVPL
 	help
 	  Intel® oneVPL GPU Runtime is a Runtime implementation of
 	  oneVPL API for Intel Gen GPUs, starting with Tiger Lake.
@@ -19,7 +19,7 @@ config BR2_PACKAGE_ONEVPL_INTEL_GPU
 
 comment "onevpl-intel-gpu needs a toolchain w/ dynamic library, gcc >= 7, C++, NPTL"
 	depends on BR2_x86_64
-	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
index 55a68a7999..0a62ebbb6a 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -8,6 +8,6 @@ ONEVPL_INTEL_GPU_VERSION = 23.4.3
 ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
 ONEVPL_INTEL_GPU_LICENSE = MIT
 ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
-ONEVPL_INTEL_GPU_DEPENDENCIES = libva onevpl
+ONEVPL_INTEL_GPU_DEPENDENCIES = libva libvpl
 
 $(eval $(cmake-package))
diff --git a/package/onevpl/onevpl.mk b/package/onevpl/onevpl.mk
deleted file mode 100644
index 1a580d0636..0000000000
--- a/package/onevpl/onevpl.mk
+++ /dev/null
@@ -1,44 +0,0 @@
-################################################################################
-#
-# onevpl
-#
-################################################################################
-
-ONEVPL_VERSION = 2023.4.0
-ONEVPL_SITE = $(call github,oneapi-src,oneVPL,v$(ONEVPL_VERSION))
-ONEVPL_LICENSE = MIT
-ONEVPL_LICENSE_FILES = LICENSE
-ONEVPL_INSTALL_STAGING = YES
-ONEVPL_DEPENDENCIES = host-pkgconf
-
-ONEVPL_CONF_OPTS = \
-	-DBUILD_TOOLS=OFF \
-	-DINSTALL_EXAMPLE_CODE=OFF
-
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-ONEVPL_CONF_OPTS += \
-	-DCMAKE_CXX_FLAGS="-latomic"
-endif
-
-ifeq ($(BR2_PACKAGE_LIBVA),y)
-ONEVPL_CONF_OPTS += -DENABLE_VA=ON
-ONEVPL_DEPENDENCIES += libva
-else
-ONEVPL_CONF_OPTS += -DENABLE_VA=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
-ONEVPL_CONF_OPTS += -DENABLE_WAYLAND=ON
-ONEVPL_DEPENDENCIES += wayland wayland-protocols
-else
-ONEVPL_CONF_OPTS += -DENABLE_WAYLAND=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_XORG7),y)
-ONEVPL_CONF_OPTS += -DENABLE_X11=ON
-ONEVPL_DEPENDENCIES += libxcb xlib_libX11
-else
-ONEVPL_CONF_OPTS += -DENABLE_X11=OFF
-endif
-
-$(eval $(cmake-package))

--===============5259556003431175852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5259556003431175852==--
