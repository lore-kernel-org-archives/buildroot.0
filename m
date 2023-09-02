Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05663EC873D
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6B03831E3;
	Thu,  7 Sep 2023 15:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6B03831E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1X9l2mWIvrE; Thu,  7 Sep 2023 15:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE85783EE1;
	Thu,  7 Sep 2023 15:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE85783EE1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8FF1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B4E541E57
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B4E541E57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A78OqizAs5aB for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADB5141E5E
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADB5141E5E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9958986A1E; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 11:49:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a95d65e495ccfbf8bd91c8f9a41bd12574a937cb
X-Git-Newrev: 6aa1bc31678ff9f8013084fda34b9f941cc63fc3
X-Patchwork-Hint: ignore
Message-Id: <20230907145134.9958986A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vulkan-loader: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6aa1bc31678ff9f8013084fda34b9f941cc63fc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use $(VULKAN_HEADERS_VERSION) for VULKAN_LOADER_VERSION as the vulkan packages
need to all be the same version.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/vulkan-loader/Config.in          | 14 ++++++++++
 package/vulkan-loader/vulkan-loader.hash |  3 +++
 package/vulkan-loader/vulkan-loader.mk   | 45 ++++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index db0ea49f90..413054ab84 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -28,6 +28,7 @@
 
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/firewalld/
+F:	package/vulkan-loader/
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/package/Config.in b/package/Config.in
index 5449884809..41ff89726c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ comment "Graphic libraries"
 	source "package/sdl2_ttf/Config.in"
 	source "package/tk/Config.in"
 	source "package/vulkan-headers/Config.in"
+	source "package/vulkan-loader/Config.in"
 
 comment "Other GUIs"
 	source "package/qt5/Config.in"
diff --git a/package/vulkan-loader/Config.in b/package/vulkan-loader/Config.in
new file mode 100644
index 0000000000..9c215dc9ce
--- /dev/null
+++ b/package/vulkan-loader/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_VULKAN_LOADER
+	bool "vulkan-loader"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_VULKAN_HEADERS
+	help
+	  The Khronos official Vulkan ICD desktop loader.
+
+	  https://github.com/KhronosGroup/Vulkan-Loader
+
+comment "vulkan-loader needs a toolchain w/ C++, dynamic library, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/vulkan-loader/vulkan-loader.hash b/package/vulkan-loader/vulkan-loader.hash
new file mode 100644
index 0000000000..e09ecda8a9
--- /dev/null
+++ b/package/vulkan-loader/vulkan-loader.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3bbaa5ee64058a89949eb777de66ce94bfe3141892514172cfc9451c756802d5  vulkan-loader-1.3.262.tar.gz
+sha256  43c0a37e6a0fa7ff3c843b3ec5a4fac84b712558ddac103fbd4c1649662a9ece  LICENSE.txt
diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
new file mode 100644
index 0000000000..f6dd9d0ac3
--- /dev/null
+++ b/package/vulkan-loader/vulkan-loader.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# vulkan-loader
+#
+################################################################################
+
+VULKAN_LOADER_VERSION = $(VULKAN_HEADERS_VERSION)
+VULKAN_LOADER_SITE = $(call github,KhronosGroup,Vulkan-Loader,v$(VULKAN_LOADER_VERSION))
+VULKAN_LOADER_LICENSE = Apache-2.0
+VULKAN_LOADER_LICENSE_FILES = LICENSE.txt
+VULKAN_LOADER_INSTALL_STAGING = YES
+
+VULKAN_LOADER_DEPENDENCIES = host-pkgconf vulkan-headers
+
+VULKAN_LOADER_CONF_OPTS += \
+	-DASSEMBLER_WORKS=FALSE \
+	-DBUILD_WSI_SCREEN_QNX_SUPPORT=OFF \
+	-DLOADER_CODEGEN=OFF
+
+ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+VULKAN_LOADER_DEPENDENCIES += directfb
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=ON
+else
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXCB),y)
+VULKAN_LOADER_DEPENDENCIES += libxcb
+VULKAN_LOADER_CONF_OPTS += \
+	-DBUILD_WSI_XCB_SUPPORT=ON \
+	-DBUILD_WSI_XLIB_SUPPORT=ON
+else
+VULKAN_LOADER_CONF_OPTS += \
+	-DBUILD_WSI_XCB_SUPPORT=OFF \
+	-DBUILD_WSI_XLIB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+VULKAN_LOADER_DEPENDENCIES += wayland
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=ON
+else
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
