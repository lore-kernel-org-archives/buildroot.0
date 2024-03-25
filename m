Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841C6C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51D5060A3E;
	Mon, 25 Mar 2024 23:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reCrlRGhyuEX; Mon, 25 Mar 2024 23:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3939360A6F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3939360A6F;
	Mon, 25 Mar 2024 23:45:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C759E1BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09C2940C20
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRJeKgFhO_-s for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC8A0400CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC8A0400CE
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C97D684117; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 23:59:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1b8cb90166c6e7cff0e4fcc53a490648080fdee
X-Git-Newrev: 26ab7ee00a0212db37da3189cfbd241ab8fe817e
X-Patchwork-Hint: ignore
Message-Id: <20240325234447.C97D684117@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/flutter-packages/flutter-go-router-example: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=26ab7ee00a0212db37da3189cfbd241ab8fe817e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A Flutter plugin that manages files and interactions with file dialogs.
This package contains a dart_plugin_registrant dart file, much like the
flutter-gallery package. The build commands contain the three
lines from the flutter-gallery package referencing the
dart_plugin_registrant dart file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/flutter-packages/Config.in                 |  1 +
 .../flutter-go-router-example/Config.in            |  7 +++
 .../flutter-go-router-example.hash                 |  1 +
 .../flutter-go-router-example.mk                   | 57 ++++++++++++++++++++++
 5 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0ca7579f8b..a4c8fba6d2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
 F:	package/flutter-packages/flutter-dynamic-layouts-example/
+F:	package/flutter-packages/flutter-go-router-example/
 F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index 17e68da8e1..bbcd3aec93 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -10,6 +10,7 @@ if BR2_PACKAGE_FLUTTER_PACKAGES
 source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-animations-example/Config.in"
 source "package/flutter-packages/flutter-dynamic-layouts-example/Config.in"
+source "package/flutter-packages/flutter-go-router-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
 endif
 
diff --git a/package/flutter-packages/flutter-go-router-example/Config.in b/package/flutter-packages/flutter-go-router-example/Config.in
new file mode 100644
index 0000000000..8cdb61e3bc
--- /dev/null
+++ b/package/flutter-packages/flutter-go-router-example/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FLUTTER_GO_ROUTER_EXAMPLE
+	bool "flutter go router example"
+	help
+	  A Flutter plugin that manages files and interactions
+	  with file dialogs.
+
+	  https://github.com/flutter/packages/tree/main/packages/go_router/example
diff --git a/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.hash b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk
new file mode 100644
index 0000000000..a7fa36ca9e
--- /dev/null
+++ b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# flutter-go-router-example
+#
+################################################################################
+
+FLUTTER_GO_ROUTER_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_GO_ROUTER_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_GO_ROUTER_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_GO_ROUTER_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_GO_ROUTER_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_GO_ROUTER_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_GO_ROUTER_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_GO_ROUTER_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_GO_ROUTER_EXAMPLE_PKG_NAME = go_router_examples
+FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_GO_ROUTER_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_GO_ROUTER_EXAMPLE_SUBDIR = packages/go_router/example
+
+define FLUTTER_GO_ROUTER_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_GO_ROUTER_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			-Dflutter.dart_plugin_registrant=file://$(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
+			--source file://$(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
+			--source package:flutter/src/dart_plugin_registrant.dart \
+			--native-assets $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_GO_ROUTER_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/libapp.so \
+		$(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
