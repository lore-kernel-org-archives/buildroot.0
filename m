Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AD0C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D90E860A7D;
	Mon, 25 Mar 2024 23:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7nJ174xfDNN; Mon, 25 Mar 2024 23:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AFEA60A9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AFEA60A9E;
	Mon, 25 Mar 2024 23:45:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D83601BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53CE6400CE
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXgUpnzg0u51 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1064C40C2D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1064C40C2D
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D0AA811E9; Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 00:08:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a92e7c3cec351ed2d79192c08abb341130b34c81
X-Git-Newrev: c6f7ad6d9264c278d5012aa4475fa9277b5e68f8
X-Patchwork-Hint: ignore
Message-Id: <20240325234448.0D0AA811E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-gallery: drop package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c6f7ad6d9264c278d5012aa4475fa9277b5e68f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The maintainers of the flutter-gallery package archived the project as of
February 16, 2024. In addition, the flutter-gallery package is incompatible
with Flutter 3.19.x. Now that the flutter tests do not use this package, it
is safe to drop it.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in.legacy                                   |  9 +++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../flutter-gallery/0001-remove-GetStorage.patch   | 84 ----------------------
 package/flutter-gallery/Config.in                  | 16 -----
 package/flutter-gallery/flutter-gallery.hash       |  3 -
 package/flutter-gallery/flutter-gallery.mk         | 57 ---------------
 7 files changed, 9 insertions(+), 162 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1d3dc8b5c8..d00196e08b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_PACKAGE_FLUTTER_GALLERY
+	bool "flutter-gallery removed"
+	select BR2_LEGACY
+	help
+	  flutter-gallery has been removed due to being abandoned
+	  and no longer working with flutter 3.19+. It is replaced by
+	  flutter-packages, where individual sub-packages (examples)
+	  must be selected for the build.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	bool "Codescape IMG GNU Linux Toolchain 2018.09 has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index a76bf350bf..884edfe149 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -32,7 +32,6 @@ F:	package/dmenu-wayland/
 F:	package/fcft/
 F:	package/foot/
 F:	package/flutter-engine/
-F:	package/flutter-gallery/
 F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
diff --git a/package/Config.in b/package/Config.in
index dfdc716857..410fe0f493 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -315,7 +315,6 @@ comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/dmenu-wayland/Config.in"
-	source "package/flutter-gallery/Config.in"
 	source "package/flutter-packages/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
diff --git a/package/flutter-gallery/0001-remove-GetStorage.patch b/package/flutter-gallery/0001-remove-GetStorage.patch
deleted file mode 100644
index 142cf853da..0000000000
--- a/package/flutter-gallery/0001-remove-GetStorage.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From a1d38d78163d84d3506c188e195cd5fa363f4be6 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Thu, 17 Aug 2023 13:00:07 -0600
-Subject: [PATCH] remove GetStorage
-
-Commit 287b20a8bfc71196cd733625e622b98b2f84bef1 introduced the get_storage
-plugin which breaks with the following error when the application is ran:
-
-Unhandled Exception: MissingPluginException(No implementation found for method
-getApplicataionDocumentsDirectory on channel plugins.flutter.io/path_provider)
-
-Revert the change.
-
-Upstream: https://github.com/flutter/gallery/issues/994
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- lib/feature_discovery/feature_discovery.dart | 10 ----------
- lib/main.dart                                |  2 --
- pubspec.yaml                                 |  1 -
- 3 files changed, 13 deletions(-)
-
-diff --git a/lib/feature_discovery/feature_discovery.dart b/lib/feature_discovery/feature_discovery.dart
-index 288c78b..965d83c 100644
---- a/lib/feature_discovery/feature_discovery.dart
-+++ b/lib/feature_discovery/feature_discovery.dart
-@@ -6,7 +6,6 @@ import 'package:flutter/material.dart';
- import 'package:flutter/scheduler.dart';
- import 'package:gallery/feature_discovery/animation.dart';
- import 'package:gallery/feature_discovery/overlay.dart';
--import 'package:get_storage/get_storage.dart';
- 
- const _featureHighlightShownKey = 'feature_highlight_shown';
- 
-@@ -271,15 +270,6 @@ class _FeatureDiscoveryState extends State<FeatureDiscovery>
- 
-     initAnimationControllers();
-     initAnimations();
--
--    final localStorage = GetStorage();
--    final featureHiglightShown =
--        localStorage.read<bool>(_featureHighlightShownKey) ?? false;
--    localStorage.write(_featureHighlightShownKey, true);
--    showOverlay = widget.showOverlay && !featureHiglightShown;
--    if (showOverlay) {
--      localStorage.write(_featureHighlightShownKey, true);
--    }
-   }
- 
-   void initAnimationControllers() {
-diff --git a/lib/main.dart b/lib/main.dart
-index e9f4ff9..8c7a4e3 100644
---- a/lib/main.dart
-+++ b/lib/main.dart
-@@ -16,7 +16,6 @@ import 'package:gallery/pages/backdrop.dart';
- import 'package:gallery/pages/splash.dart';
- import 'package:gallery/routes.dart';
- import 'package:gallery/themes/gallery_theme_data.dart';
--import 'package:get_storage/get_storage.dart';
- import 'package:google_fonts/google_fonts.dart';
- 
- import 'firebase_options.dart';
-@@ -26,7 +25,6 @@ export 'package:gallery/data/demos.dart' show pumpDeferredLibraries;
- 
- void main() async {
-   GoogleFonts.config.allowRuntimeFetching = false;
--  await GetStorage.init();
- 
-   if (defaultTargetPlatform != TargetPlatform.linux &&
-       defaultTargetPlatform != TargetPlatform.windows &&
-diff --git a/pubspec.yaml b/pubspec.yaml
-index 964edad..4b00e40 100644
---- a/pubspec.yaml
-+++ b/pubspec.yaml
-@@ -24,7 +24,6 @@ dependencies:
-   firebase_core: ^2.7.0
-   firebase_crashlytics: ^3.1.1
-   firebase_performance: ^0.9.0+14
--  get_storage: ^2.1.1
-   google_fonts: ^5.0.0
-   intl: any # An exact version pin will be provided by the Flutter SDK
-   meta: ^1.7.0
--- 
-2.41.0
-
diff --git a/package/flutter-gallery/Config.in b/package/flutter-gallery/Config.in
deleted file mode 100644
index 224457ea6f..0000000000
--- a/package/flutter-gallery/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_FLUTTER_GALLERY
-	bool "flutter-gallery"
-	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_FLUTTER_ENGINE
-	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
-	help
-	  Flutter Gallery is a resource to help developers evaluate
-	  and use Flutter. It is a collection of Material Design &
-	  Cupertino widgets, behaviors, and vignettes implemented
-	  with Flutter.
-
-	  https://github.com/flutter/gallery
-
-comment "flutter-gallery needs flutter-engine"
-	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_FLUTTER_ENGINE
diff --git a/package/flutter-gallery/flutter-gallery.hash b/package/flutter-gallery/flutter-gallery.hash
deleted file mode 100644
index aea1ed39be..0000000000
--- a/package/flutter-gallery/flutter-gallery.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  14272aba90b7d26db33bac7b4692f0e3ed1a008286a08eaf2ea79abd478f23e9  flutter-gallery-2.10.2.tar.gz
-sha256  c731cf5a33db0e12647e0680ef0bc7839f99749404ac1ba4626cf7192065b3b0  LICENSE
diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
deleted file mode 100644
index acad706dae..0000000000
--- a/package/flutter-gallery/flutter-gallery.mk
+++ /dev/null
@@ -1,57 +0,0 @@
-################################################################################
-#
-# flutter-gallery
-#
-################################################################################
-
-FLUTTER_GALLERY_VERSION = 2.10.2
-FLUTTER_GALLERY_SITE = $(call github,flutter,gallery,v$(FLUTTER_GALLERY_VERSION))
-FLUTTER_GALLERY_LICENSE = BSD-3-Clause
-FLUTTER_GALLERY_LICENSE_FILES = LICENSE
-FLUTTER_GALLERY_DEPENDENCIES = \
-	host-flutter-sdk-bin \
-	flutter-engine
-
-FLUTTER_GALLERY_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/gallery/$(FLUTTER_ENGINE_RUNTIME_MODE)
-
-define FLUTTER_GALLERY_CONFIGURE_CMDS
-	cd $(@D) && \
-		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
-endef
-
-define FLUTTER_GALLERY_BUILD_CMDS
-	cd $(@D) && \
-		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
-		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			-Dflutter.dart_plugin_registrant=file://$(@D)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
-			--source file://$(@D)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
-			--source package:flutter/src/dart_plugin_registrant.dart \
-			--native-assets $(@D)/.dart_tool/flutter_build/*/native_assets.yaml \
-			package:gallery/main.dart && \
-		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
-			--deterministic \
-			--obfuscate \
-			--snapshot_kind=app-aot-elf \
-			--elf=libapp.so \
-			.dart_tool/flutter_build/*/app.dill
-endef
-
-define FLUTTER_GALLERY_INSTALL_TARGET_CMDS
-	mkdir -p $(FLUTTER_GALLERY_INSTALL_DIR)/{data,lib}
-	cp -dprf $(@D)/build/flutter_assets $(FLUTTER_GALLERY_INSTALL_DIR)/data/
-
-	$(INSTALL) -D -m 0755 $(@D)/libapp.so \
-		$(FLUTTER_GALLERY_INSTALL_DIR)/lib/libapp.so
-
-	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
-	$(FLUTTER_GALLERY_INSTALL_DIR)/data/
-
-	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
-	$(RM) $(FLUTTER_GALLERY_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-	touch $(FLUTTER_GALLERY_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
