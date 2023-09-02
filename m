Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BF0EC873D
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC32A83B98;
	Thu,  7 Sep 2023 15:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC32A83B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3B8MbKGiDOb; Thu,  7 Sep 2023 15:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2422C827DD;
	Thu,  7 Sep 2023 15:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2422C827DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA1FD1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2142441DBC
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2142441DBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Audsz_UFccQj for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB35B41E5D
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB35B41E5D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A418686A21; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 11:49:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6aa1bc31678ff9f8013084fda34b9f941cc63fc3
X-Git-Newrev: d5a7f213ab94d986133760122105adda76676823
X-Patchwork-Hint: ignore
Message-Id: <20230907145134.A418686A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vulkan-tools: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5a7f213ab94d986133760122105adda76676823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use $(VULKAN_HEADERS_VERSION) for VULKAN_TOOLS_VERSION as the vulkan packages
need to all be the same version.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/vulkan-tools/Config.in         | 17 ++++++++++++
 package/vulkan-tools/vulkan-tools.hash |  3 +++
 package/vulkan-tools/vulkan-tools.mk   | 47 ++++++++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 413054ab84..eba7c4aa34 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -29,6 +29,7 @@
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/firewalld/
 F:	package/vulkan-loader/
+F:	package/vulkan-tools/
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/package/Config.in b/package/Config.in
index 41ff89726c..b21a2f8c65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ comment "Graphic libraries"
 	source "package/tk/Config.in"
 	source "package/vulkan-headers/Config.in"
 	source "package/vulkan-loader/Config.in"
+	source "package/vulkan-tools/Config.in"
 
 comment "Other GUIs"
 	source "package/qt5/Config.in"
diff --git a/package/vulkan-tools/Config.in b/package/vulkan-tools/Config.in
new file mode 100644
index 0000000000..54fa539dab
--- /dev/null
+++ b/package/vulkan-tools/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_VULKAN_TOOLS
+	bool "vulkan-tools"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vullan-loader
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+
+	help
+	  The Khronos official Vulkan Tools and Utilities.
+
+	  https://github.com/KhronosGroup/Vulkan-Tools
+
+comment "vulkan-tools needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/vulkan-tools/vulkan-tools.hash b/package/vulkan-tools/vulkan-tools.hash
new file mode 100644
index 0000000000..24c0697784
--- /dev/null
+++ b/package/vulkan-tools/vulkan-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8c77d02694d0516ae2ba3f3718745647e87e788ef93faabb2e3674ff32608010  vulkan-tools-1.3.262.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/vulkan-tools/vulkan-tools.mk b/package/vulkan-tools/vulkan-tools.mk
new file mode 100644
index 0000000000..68f7c1c04d
--- /dev/null
+++ b/package/vulkan-tools/vulkan-tools.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# vulkan-tools
+#
+################################################################################
+
+VULKAN_TOOLS_VERSION = $(VULKAN_HEADERS_VERSION)
+VULKAN_TOOLS_SITE = $(call github,KhronosGroup,Vulkan-Tools,v$(VULKAN_TOOLS_VERSION))
+VULKAN_TOOLS_LICENSE = Apache-2.0
+VULKAN_TOOLS_LICENSE_FILES = LICENSE.txt
+
+VULKAN_TOOLS_DEPENDENCIES = \
+	vulkan-headers \
+	vulkan-loader
+
+VULKAN_TOOLS_CONF_OPTS += \
+	-DBUILD_CUBE=OFF \
+	-DBUILD_ICD=OFF \
+	-DBUILD_VULKANINFO=ON \
+	-DINSTALL_ICD=OFF
+
+ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+VULKAN_TOOLS_DEPENDENCIES += directfb
+VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=ON
+else
+VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXCB),y)
+VULKAN_TOOLS_DEPENDENCIES += libxcb
+VULKAN_TOOLS_CONF_OPTS += \
+	-DBUILD_WSI_XCB_SUPPORT=ON \
+	-DBUILD_WSI_XLIB_SUPPORT=ON
+else
+VULKAN_TOOLS_CONF_OPTS += \
+	-DBUILD_WSI_XCB_SUPPORT=OFF \
+	-DBUILD_WSI_XLIB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+VULKAN_TOOLS_DEPENDENCIES += wayland
+VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=ON
+else
+VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
