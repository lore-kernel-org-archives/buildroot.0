Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5F2C52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 19:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEDD840D17;
	Thu,  8 Aug 2024 19:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ef_14V_Jo4Oj; Thu,  8 Aug 2024 19:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25CF940D2B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25CF940D2B;
	Thu,  8 Aug 2024 19:39:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0C61BF2A3
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AE4460B43
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqjMQwVJP0Dh for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F39960A68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F39960A68
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24E5B848C5; Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 19:08:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f7a5f0374e51812b17b08d5e45d544d70bb974e
X-Git-Newrev: dbd1dce67dd2deacaea726dd3380cc348c602cfc
X-Patchwork-Hint: ignore
Message-Id: <20240808193950.24E5B848C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: bump version to
 3.24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbd1dce67dd2deacaea726dd3380cc348c602cfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add `"download_fuchsia_deps": False` to the dot-gclient file as this is
for linux, not fuchsia, so the dependencies are not necessary.

Also, change various paths in flutter-engine.mk to ensure that the package
builds correctly.

Remove patch
0005-skip-configuration-dependency-if-unit-tests-are-disa.patch which
is upstream.

Tested with tests.package.test_flutter.TestFlutter.test_run

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uration-dependency-if-unit-tests-are-disa.patch | 32 ----------------------
 package/flutter-engine/dot-gclient                 |  3 +-
 package/flutter-engine/flutter-engine.mk           | 10 +++----
 3 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch b/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
deleted file mode 100644
index 125bfc6910..0000000000
--- a/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2252a85e59669b5826019f60a98b7a69939dacfd Mon Sep 17 00:00:00 2001
-From: Greg Spencer <gspencer@google.com>
-Date: Mon, 4 Mar 2024 12:30:41 -0800
-Subject: [PATCH] Skip configuration dependency if unit tests are disabled.
-
-Commit 88baf62f made gtk+-3.0 an unconditional requirement, see:
-
-Issue: https://github.com/flutter/flutter/issues/144421
-Upstream: Merged. https://github.com/flutter/engine/pull/51179
-
-Signed-off-by: Greg Spencer <gspencer@google.com>
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- flutter/testing/BUILD.gn | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/flutter/testing/BUILD.gn b/flutter/testing/BUILD.gn
-index 9eac29452..a7d094695 100644
---- a/flutter/testing/BUILD.gn
-+++ b/flutter/testing/BUILD.gn
-@@ -51,7 +51,7 @@ source_set("testing") {
- 
-   sources = [ "run_all_unittests.cc" ]
- 
--  if (is_linux) {
-+  if (enable_unittests && is_linux) {
-     # So that we can call gtk_init in main().
-     configs += [ "//flutter/shell/platform/linux/config:gtk" ]
-   }
--- 
-2.44.0
-
diff --git a/package/flutter-engine/dot-gclient b/package/flutter-engine/dot-gclient
index ba9590a7f5..6ead80c8c2 100644
--- a/package/flutter-engine/dot-gclient
+++ b/package/flutter-engine/dot-gclient
@@ -8,6 +8,7 @@ solutions = [{
     "custom_vars": {
         "download_android_deps": False,
         "download_windows_deps": False,
-        "download_linux_deps": False
+        "download_linux_deps": False,
+        "download_fuchsia_deps": False
     },
 }]
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index dfc3c03ef9..020fa2ee8a 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.19.5
+FLUTTER_ENGINE_VERSION = 3.24.0
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -67,7 +67,7 @@ FLUTTER_ENGINE_INSTALL_FILES = libflutter_engine.so
 
 # Flutter engine includes a bundled patched clang that must be used for
 # compiling or else there are linking errors.
-FLUTTER_ENGINE_CLANG_PATH = $(@D)/buildtools/linux-x64/clang
+FLUTTER_ENGINE_CLANG_PATH = $(@D)/flutter/buildtools/linux-x64/clang
 
 FLUTTER_ENGINE_CONF_OPTS = \
 	--clang \
@@ -126,7 +126,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 FLUTTER_ENGINE_DEPENDENCIES += libgles
-FLUTTER_ENGINE_CONF_OPTS += --enable-impeller-opengles
+FLUTTER_ENGINE_CONF_OPTS += --enable-impeller-3d
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLFW),y)
@@ -153,7 +153,7 @@ FLUTTER_ENGINE_DEPENDENCIES += libxcb
 else
 define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
-		$(@D)/build_overrides/vulkan_headers.gni
+		$(@D)/flutter/build_overrides/vulkan_headers.gni
 
 	$(SED) "s%ozone_platform_x11.*%ozone_platform_x11 = false%g" \
 		$(@D)/build/config/BUILDCONFIG.gn
@@ -166,7 +166,7 @@ FLUTTER_ENGINE_DEPENDENCIES += wayland
 else
 define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
-		$(@D)/build_overrides/vulkan_headers.gni
+		$(@D)/flutter/build_overrides/vulkan_headers.gni
 
 	$(SED) "s%ozone_platform_wayland.*%ozone_platform_wayland = false%g" \
 		$(@D)/build/config/BUILDCONFIG.gn
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
