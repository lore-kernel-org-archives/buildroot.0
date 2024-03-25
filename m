Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FAEC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 203BF60A66;
	Mon, 25 Mar 2024 23:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkVFzGCi0tHz; Mon, 25 Mar 2024 23:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B406D60A93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B406D60A93;
	Mon, 25 Mar 2024 23:45:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A36B1BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0831C60907
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWNZ-xdHmg5c for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF35C608F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF35C608F6
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA1CE84148; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 23:58:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3239d18257fa4e5cd8268959d553693fd141ebf
X-Git-Newrev: a1b8cb90166c6e7cff0e4fcc53a490648080fdee
X-Patchwork-Hint: ignore
Message-Id: <20240325234447.BA1CE84148@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/flutter-packages/flutter-dynamic-layouts-example: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1b8cb90166c6e7cff0e4fcc53a490648080fdee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides two multi-sized tiles and different layouts:
Stagger and Wrap.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/flutter-packages/Config.in                 |  1 +
 .../flutter-dynamic-layouts-example/Config.in      |  8 ++++
 .../flutter-dynamic-layouts-example.hash           |  1 +
 .../flutter-dynamic-layouts-example.mk             | 54 ++++++++++++++++++++++
 5 files changed, 65 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 774f374857..0ca7579f8b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -36,6 +36,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
+F:	package/flutter-packages/flutter-dynamic-layouts-example/
 F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index 365e91cd99..17e68da8e1 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_FLUTTER_PACKAGES
 if BR2_PACKAGE_FLUTTER_PACKAGES
 source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-animations-example/Config.in"
+source "package/flutter-packages/flutter-dynamic-layouts-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
 endif
 
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/Config.in b/package/flutter-packages/flutter-dynamic-layouts-example/Config.in
new file mode 100644
index 0000000000..a3f6630795
--- /dev/null
+++ b/package/flutter-packages/flutter-dynamic-layouts-example/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE
+	bool "flutter dynamic layouts example"
+	help
+	  This package provides support for multi sized tiles and
+	  different layouts. Currently the layouts that are implemented
+	  in this package are Stagger and Wrap.
+
+	  https://github.com/flutter/packages/tree/main/packages/dynamic_layouts/example
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk
new file mode 100644
index 0000000000..aefcf3f62c
--- /dev/null
+++ b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# flutter-dynamic-layouts-example
+#
+################################################################################
+
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME = example
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/dynamc-layouts-$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SUBDIR = packages/dynamic_layouts/example
+
+define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/libapp.so \
+		$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
