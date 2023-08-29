Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDE8C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBE0D605AF;
	Tue, 29 Aug 2023 21:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE0D605AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKAjlyobwXKU; Tue, 29 Aug 2023 21:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEC5660F7A;
	Tue, 29 Aug 2023 21:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEC5660F7A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FFCF1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6828441836
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6828441836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WZSG2MVORCn for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:37:38 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6875417F7
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6875417F7
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c1f8aaab9aso13673795ad.1
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 14:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693345058; x=1693949858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rnbm/SB3Wl8fYSFa2PC/Ib0M8GMI6K3d9Phf2Fz6luI=;
 b=J9VaOCTYLshpeUP6Xfa6BkQx1CmDJPoIANYExwu877VwYXXmvC98bbg3ve8a/jVQJ0
 NLCX3I0DJxPJQA9blUFaKMvWonuAMe5lH+ILF2Q+2B7lw5SiqINfJbEJasdSOIOpOhSZ
 tJto0ZoVq3MJRMrF0NPP73kD2klTrslUwneUBoS9qba+qOeppbjNijLpIpjyQQbBA9rD
 WFc3A+V4z5yMR66nrrzDhflzJfa7R1Lk3LsM+A/1ffU0RI2FhZEUIaC7O5M9IrVohzko
 kmGYuGbCcAmVRSgexfTr82rNeCr35EQ1ohsAYl+eQ8E2PPDBQYxjXpbUdYvcvZO4IA+V
 qYLA==
X-Gm-Message-State: AOJu0Yy2lkPgNBRCVH4fbNqGxe81/vC51wrOVhpUPqm8YDjz6ZWaKLYC
 L9ZLoKyiZ+iZr3ejKFdvtI5EHR8Ew96oJYCsQQ0=
X-Google-Smtp-Source: AGHT+IGUorrrrLfhfw5rMEUk+TgnqK3iU2Th0HF42D6BNfTD4qQYNJ6cSxEB69kwTbKJmu+vHH7wHw==
X-Received: by 2002:a17:903:1248:b0:1be:f3ab:f4d7 with SMTP id
 u8-20020a170903124800b001bef3abf4d7mr355458plh.47.1693345057850; 
 Tue, 29 Aug 2023 14:37:37 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902a70500b001ae0152d280sm9691516plq.193.2023.08.29.14.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 14:37:37 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 15:37:25 -0600
Message-ID: <20230829213726.1957587-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
References: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693345058; x=1693949858;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rnbm/SB3Wl8fYSFa2PC/Ib0M8GMI6K3d9Phf2Fz6luI=;
 b=SwsRyQY60dWbJXYUQ0BjWBHCTIxT/4b7G4HzO9G7rL6sUWNIJP3Gxiffuu2BTdBXzo
 3fFpcoOKcsNWO7009cPHCyKHcpVLGnWEfIW3YcWXLnl/aa4+0MkLXLpUlceQj7EBxiIm
 FnemKN8h4f0oKGIuq44ZSDYKks+0CL0ztkIbg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SwsRyQY6
Subject: [Buildroot] [PATCH v7 6/7] package/flutter-gallery: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Flutter Gallery is a resource to help developers evaluate and use Flutter.
It is a collection of Material Design & Cupertino widgets, behaviors, and
vignettes implemented with Flutter.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
Changes v6 -> v7:
  - Drop $(FLUTTER_ENGINE_VERSION) from symlinks.

Changes v4 -> v5:
  - Depend on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
  - select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-remove-GetStorage.patch              | 84 +++++++++++++++++++
 package/flutter-gallery/Config.in             | 16 ++++
 package/flutter-gallery/flutter-gallery.hash  |  3 +
 package/flutter-gallery/flutter-gallery.mk    | 44 ++++++++++
 6 files changed, 149 insertions(+)
 create mode 100644 package/flutter-gallery/0001-remove-GetStorage.patch
 create mode 100644 package/flutter-gallery/Config.in
 create mode 100644 package/flutter-gallery/flutter-gallery.hash
 create mode 100644 package/flutter-gallery/flutter-gallery.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5137764f5a..ff0e362496 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -29,6 +29,7 @@
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/flutter-engine/
+F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 
diff --git a/package/Config.in b/package/Config.in
index 0cdb8d4ea4..ea6e19c6ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -343,6 +343,7 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
+	source "package/flutter-gallery/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
diff --git a/package/flutter-gallery/0001-remove-GetStorage.patch b/package/flutter-gallery/0001-remove-GetStorage.patch
new file mode 100644
index 0000000000..142cf853da
--- /dev/null
+++ b/package/flutter-gallery/0001-remove-GetStorage.patch
@@ -0,0 +1,84 @@
+From a1d38d78163d84d3506c188e195cd5fa363f4be6 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 17 Aug 2023 13:00:07 -0600
+Subject: [PATCH] remove GetStorage
+
+Commit 287b20a8bfc71196cd733625e622b98b2f84bef1 introduced the get_storage
+plugin which breaks with the following error when the application is ran:
+
+Unhandled Exception: MissingPluginException(No implementation found for method
+getApplicataionDocumentsDirectory on channel plugins.flutter.io/path_provider)
+
+Revert the change.
+
+Upstream: https://github.com/flutter/gallery/issues/994
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ lib/feature_discovery/feature_discovery.dart | 10 ----------
+ lib/main.dart                                |  2 --
+ pubspec.yaml                                 |  1 -
+ 3 files changed, 13 deletions(-)
+
+diff --git a/lib/feature_discovery/feature_discovery.dart b/lib/feature_discovery/feature_discovery.dart
+index 288c78b..965d83c 100644
+--- a/lib/feature_discovery/feature_discovery.dart
++++ b/lib/feature_discovery/feature_discovery.dart
+@@ -6,7 +6,6 @@ import 'package:flutter/material.dart';
+ import 'package:flutter/scheduler.dart';
+ import 'package:gallery/feature_discovery/animation.dart';
+ import 'package:gallery/feature_discovery/overlay.dart';
+-import 'package:get_storage/get_storage.dart';
+ 
+ const _featureHighlightShownKey = 'feature_highlight_shown';
+ 
+@@ -271,15 +270,6 @@ class _FeatureDiscoveryState extends State<FeatureDiscovery>
+ 
+     initAnimationControllers();
+     initAnimations();
+-
+-    final localStorage = GetStorage();
+-    final featureHiglightShown =
+-        localStorage.read<bool>(_featureHighlightShownKey) ?? false;
+-    localStorage.write(_featureHighlightShownKey, true);
+-    showOverlay = widget.showOverlay && !featureHiglightShown;
+-    if (showOverlay) {
+-      localStorage.write(_featureHighlightShownKey, true);
+-    }
+   }
+ 
+   void initAnimationControllers() {
+diff --git a/lib/main.dart b/lib/main.dart
+index e9f4ff9..8c7a4e3 100644
+--- a/lib/main.dart
++++ b/lib/main.dart
+@@ -16,7 +16,6 @@ import 'package:gallery/pages/backdrop.dart';
+ import 'package:gallery/pages/splash.dart';
+ import 'package:gallery/routes.dart';
+ import 'package:gallery/themes/gallery_theme_data.dart';
+-import 'package:get_storage/get_storage.dart';
+ import 'package:google_fonts/google_fonts.dart';
+ 
+ import 'firebase_options.dart';
+@@ -26,7 +25,6 @@ export 'package:gallery/data/demos.dart' show pumpDeferredLibraries;
+ 
+ void main() async {
+   GoogleFonts.config.allowRuntimeFetching = false;
+-  await GetStorage.init();
+ 
+   if (defaultTargetPlatform != TargetPlatform.linux &&
+       defaultTargetPlatform != TargetPlatform.windows &&
+diff --git a/pubspec.yaml b/pubspec.yaml
+index 964edad..4b00e40 100644
+--- a/pubspec.yaml
++++ b/pubspec.yaml
+@@ -24,7 +24,6 @@ dependencies:
+   firebase_core: ^2.7.0
+   firebase_crashlytics: ^3.1.1
+   firebase_performance: ^0.9.0+14
+-  get_storage: ^2.1.1
+   google_fonts: ^5.0.0
+   intl: any # An exact version pin will be provided by the Flutter SDK
+   meta: ^1.7.0
+-- 
+2.41.0
+
diff --git a/package/flutter-gallery/Config.in b/package/flutter-gallery/Config.in
new file mode 100644
index 0000000000..224457ea6f
--- /dev/null
+++ b/package/flutter-gallery/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_FLUTTER_GALLERY
+	bool "flutter-gallery"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE
+	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
+	help
+	  Flutter Gallery is a resource to help developers evaluate
+	  and use Flutter. It is a collection of Material Design &
+	  Cupertino widgets, behaviors, and vignettes implemented
+	  with Flutter.
+
+	  https://github.com/flutter/gallery
+
+comment "flutter-gallery needs flutter-engine"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_FLUTTER_ENGINE
diff --git a/package/flutter-gallery/flutter-gallery.hash b/package/flutter-gallery/flutter-gallery.hash
new file mode 100644
index 0000000000..aea1ed39be
--- /dev/null
+++ b/package/flutter-gallery/flutter-gallery.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  14272aba90b7d26db33bac7b4692f0e3ed1a008286a08eaf2ea79abd478f23e9  flutter-gallery-2.10.2.tar.gz
+sha256  c731cf5a33db0e12647e0680ef0bc7839f99749404ac1ba4626cf7192065b3b0  LICENSE
diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
new file mode 100644
index 0000000000..e89fbb009d
--- /dev/null
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# flutter-gallery
+#
+################################################################################
+
+FLUTTER_GALLERY_VERSION = 2.10.2
+FLUTTER_GALLERY_SITE = $(call github,flutter,gallery,v$(FLUTTER_GALLERY_VERSION))
+FLUTTER_GALLERY_LICENSE = BSD-3-Clause
+FLUTTER_GALLERY_LICENSE_FILES = LICENSE
+FLUTTER_GALLERY_DEPENDENCIES = \
+	host-flutter-sdk-bin \
+	flutter-engine 
+
+FLUTTER_GALLERY_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/gallery/$(FLUTTER_ENGINE_RUNTIME_MODE)
+
+define FLUTTER_GALLERY_BUILD_CMDS
+	cd $(@D) && \
+		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) packages get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) package:gallery/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_GALLERY_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_GALLERY_INSTALL_DIR)/{data,lib}
+	cp -dprf $(@D)/build/flutter_assets $(FLUTTER_GALLERY_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(@D)/libapp.so \
+		$(FLUTTER_GALLERY_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf ../../../$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_GALLERY_INSTALL_DIR)/data/
+
+	ln -sf ../../../../../lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
