Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F87DC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 797C860905;
	Mon, 25 Mar 2024 23:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdXpuHkgNOvs; Mon, 25 Mar 2024 23:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F3CE6090B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F3CE6090B;
	Mon, 25 Mar 2024 23:44:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02AA61BF954
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3BEC60909
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nb9MkYFk4G9 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B552B608EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B552B608EF
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FB9A8411D; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 23:54:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 631647f4a7c580e8964515f275584a628eca61bd
X-Git-Newrev: 88a300753a8c729714570fd1ac20eda9db074555
X-Patchwork-Hint: ignore
Message-Id: <20240325234447.9FB9A8411D@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/flutter-packages/flutter-adaptive-scaffold-example: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=88a300753a8c729714570fd1ac20eda9db074555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides a nice-looking Gmail lookalike application using
Material 3.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/flutter-packages/Config.in                 |  1 +
 .../flutter-adaptive-scaffold-example/Config.in    |  8 ++++
 .../flutter-adaptive-scaffold-example.hash         |  1 +
 .../flutter-adaptive-scaffold-example.mk           | 54 ++++++++++++++++++++++
 5 files changed, 65 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cf2d9e93cd..7a909f947f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -34,6 +34,7 @@ F:	package/foot/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-packages/
+F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index 7cedf7c473..9c4b42b74c 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -7,6 +7,7 @@ menuconfig BR2_PACKAGE_FLUTTER_PACKAGES
 	  First-party Flutter package examples.
 
 if BR2_PACKAGE_FLUTTER_PACKAGES
+source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
 endif
 
diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/Config.in b/package/flutter-packages/flutter-adaptive-scaffold-example/Config.in
new file mode 100644
index 0000000000..f7c448e06c
--- /dev/null
+++ b/package/flutter-packages/flutter-adaptive-scaffold-example/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE
+	bool "flutter adaptive scaffold example"
+	help
+	  Adaptive Scaffold reacts to input from users, devices and
+	  screen elements and renders your Flutter application
+	  according to the Material 3 guidelines.
+
+	  https://github.com/flutter/packages/tree/main/packages/flutter_adaptive_scaffold/example
diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
new file mode 100644
index 0000000000..f6ac086115
--- /dev/null
+++ b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# flutter-adaptive-scaffold-example
+#
+################################################################################
+
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME = flutter_adaptive_scaffold_example
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SUBDIR = packages/flutter_adaptive_scaffold/example
+
+define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/libapp.so \
+		$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
