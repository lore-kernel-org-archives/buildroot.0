Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6262CCA0FF7
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 09:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C69560D58;
	Sat,  2 Sep 2023 09:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C69560D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RO5rZfK4OlxS; Sat,  2 Sep 2023 09:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BC6960BB0;
	Sat,  2 Sep 2023 09:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC6960BB0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6A01BF21A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 09:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25C1E81242
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 09:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25C1E81242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-hTdShyPpqi for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 09:59:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B35E81239
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 09:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B35E81239
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13FC686882; Sat,  2 Sep 2023 09:59:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 11:49:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 028403c47ce297776558173f9833fe64ad2f058f
X-Git-Newrev: c6b2a5049ecd9b4c6ba500d9c4793e68e86c36f8
X-Patchwork-Hint: ignore
Message-Id: <20230902095901.13FC686882@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5base: add vulkan
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6b2a5049ecd9b4c6ba500d9c4793e68e86c36f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Notes:
  - eglfs/vulkan is only implemented for eglfs_viv
    (see stub implementation for QEglFSDeviceIntegration::createPlatformVulkanInstance()
    in src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp and
    real implementation for QEglFSVivIntegration::createPlatformVulkanInstance()
    in src/plugins/platforms/eglfs/deviceintegration/eglfs_viv/qeglfsvivintegration.cpp)
  - or for xcb (see QXcbIntegration::createPlatformVulkanInstance()
    in src/plugins/platforms/xcb/qxcbintegration.cpp)
Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/Config.in  | 10 ++++++++++
 package/qt5/qt5base/qt5base.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index b876f1948e..0c7ed41c46 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -180,6 +180,16 @@ config BR2_PACKAGE_QT5BASE_OPENGL_LIB
 
 endif
 
+config BR2_PACKAGE_QT5BASE_VULKAN
+	bool "Vulkan support"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  This option enables Vulkan support.
+
 config BR2_PACKAGE_QT5BASE_LINUXFB
 	bool "linuxfb support"
 
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 028236d2ed..cc29f5523f 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -206,6 +206,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-opengl
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_VULKAN),y)
+QT5BASE_CONFIGURE_OPTS += -feature-vulkan
+QT5BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
+else
+QT5BASE_CONFIGURE_OPTS += -no-feature-vulkan
+endif
+
 QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
 QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
