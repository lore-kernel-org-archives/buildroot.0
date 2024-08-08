Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DA5C52D7B
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 19:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA72740D0B;
	Thu,  8 Aug 2024 19:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRw41rD7yQZT; Thu,  8 Aug 2024 19:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F38B040D9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38B040D9B;
	Thu,  8 Aug 2024 19:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6B91BF98E
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E7A60A68
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvsGLfoBNARE for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B4D060B36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B4D060B36
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4788D848C0; Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 21:35:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b771887ca01a076b9169c1ac880e523c5fe6f44
X-Git-Newrev: 3e0ff92ac6843be664cd65e7251741228f683b48
X-Patchwork-Hint: ignore
Message-Id: <20240808193950.4788D848C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-packages: bump version to
 8af79fbca12699248e96b50b4705da74396cd6a3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e0ff92ac6843be664cd65e7251741228f683b48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of commit e35f29177495131f0f598fc7ae1ffd74d89edf15, the dynamic-layouts
example has been removed from the flutter-packages repository, which fixes
https://github.com/flutter/flutter/issues/148979.

The exact reasoning is as follows:

```
The dynamic_layouts package is unpublished, and its core feature set has not
been updated in years.

Though it's not high-traffic, all packages in that repo require maintenance
for Flutter versions, gradle bumps, and project migrations.
```

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  7 +++
 DEVELOPERS                                         |  1 -
 package/flutter-packages/Config.in                 |  1 -
 .../flutter-dynamic-layouts-example/Config.in      |  8 ----
 .../flutter-dynamic-layouts-example.hash           |  1 -
 .../flutter-dynamic-layouts-example.mk             | 54 ----------------------
 package/flutter-packages/flutter-packages.hash     |  2 +-
 package/flutter-packages/flutter-packages.mk       |  2 +-
 8 files changed, 9 insertions(+), 67 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6473947a9a..c1870613af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE
+	bool "flutter-dynamic-layouts-example has been removed"
+	select BR2_LEGACY
+	help
+	  flutter-dynamic-layouts was removed from flutter-packages
+	  as of commit e35f29177495131f0f598fc7ae1ffd74d89edf15.
+
 config BR2_KERNEL_HEADERS_6_9
 	bool "kernel headers version 6.9.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index c52f53565c..d7d0af3543 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -35,7 +35,6 @@ F:	package/flutter-engine/
 F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
-F:	package/flutter-packages/flutter-dynamic-layouts-example/
 F:	package/flutter-packages/flutter-go-router-example/
 F:	package/flutter-packages/flutter-image-example/
 F:	package/flutter-packages/flutter-markdown-example/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index 4e3e29582f..88d9193608 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -9,7 +9,6 @@ menuconfig BR2_PACKAGE_FLUTTER_PACKAGES
 if BR2_PACKAGE_FLUTTER_PACKAGES
 source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-animations-example/Config.in"
-source "package/flutter-packages/flutter-dynamic-layouts-example/Config.in"
 source "package/flutter-packages/flutter-go-router-example/Config.in"
 source "package/flutter-packages/flutter-image-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/Config.in b/package/flutter-packages/flutter-dynamic-layouts-example/Config.in
deleted file mode 100644
index a3f6630795..0000000000
--- a/package/flutter-packages/flutter-dynamic-layouts-example/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE
-	bool "flutter dynamic layouts example"
-	help
-	  This package provides support for multi sized tiles and
-	  different layouts. Currently the layouts that are implemented
-	  in this package are Stagger and Wrap.
-
-	  https://github.com/flutter/packages/tree/main/packages/dynamic_layouts/example
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash
deleted file mode 120000
index 879f2adb39..0000000000
--- a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash
+++ /dev/null
@@ -1 +0,0 @@
-../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk
deleted file mode 100644
index aefcf3f62c..0000000000
--- a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk
+++ /dev/null
@@ -1,54 +0,0 @@
-################################################################################
-#
-# flutter-dynamic-layouts-example
-#
-################################################################################
-
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME = example
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/dynamc-layouts-$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SUBDIR = packages/dynamic_layouts/example
-
-define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_CONFIGURE_CMDS
-	cd $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR) && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
-endef
-
-define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_CMDS
-	cd $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR) && \
-		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
-			package:$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME)/main.dart && \
-		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
-			--deterministic \
-			--obfuscate \
-			--snapshot_kind=app-aot-elf \
-			--elf=libapp.so \
-			.dart_tool/flutter_build/*/app.dill
-endef
-
-define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_TARGET_CMDS
-	mkdir -p $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/{data,lib}
-	cp -dprf $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/
-
-	$(INSTALL) -D -m 0755 $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/libapp.so \
-		$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/lib/libapp.so
-
-	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
-	$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/
-
-	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/lib/
-	$(RM) $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-	touch $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-endef
-
-$(eval $(generic-package))
diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index f266c497e4..1fbe601396 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2e1e19713ac74b6e00a6f5ec516e8ccda5e5ba1fc8b249d40abcfe4cb50dff87  flutter-packages-ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3.tar.gz
+sha256  388ec45142ddfab711aa82958c82657b8c2238deb6c131cec94a5a993ba4c760  flutter-packages-8af79fbca12699248e96b50b4705da74396cd6a3.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 6b1a4371e8..1a1913043b 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3
+FLUTTER_PACKAGES_VERSION = 8af79fbca12699248e96b50b4705da74396cd6a3
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
