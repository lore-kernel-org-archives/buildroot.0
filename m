Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9553EC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6232D60A63;
	Mon, 25 Mar 2024 23:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPvRuSdt2gqp; Mon, 25 Mar 2024 23:45:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE9A60AA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DE9A60AA1;
	Mon, 25 Mar 2024 23:45:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B9D01BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25323608F6
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piQ_dn7c1WnW for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07CAF608FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07CAF608FC
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E64ED84074; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 00:03:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83c1ba5f449182afac6f6c9c6fa7288519bc241b
X-Git-Newrev: c51e0f4aec80ea71d812ff9956dc8214e7efdb7e
X-Patchwork-Hint: ignore
Message-Id: <20240325234447.E64ED84074@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/flutter-packages/flutter-rfw-local-example: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c51e0f4aec80ea71d812ff9956dc8214e7efdb7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Displays a custom "Hello, World!" custom widget in a
remote Flutter widget (RFW) for use by a remote widget.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/flutter-packages/Config.in                 |  1 +
 .../flutter-rfw-local-example/Config.in            |  7 +++
 .../flutter-rfw-local-example.hash                 |  1 +
 .../flutter-rfw-local-example.mk                   | 54 ++++++++++++++++++++++
 5 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d5ef02b7ad..a76bf350bf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -40,6 +40,7 @@ F:	package/flutter-packages/flutter-dynamic-layouts-example/
 F:	package/flutter-packages/flutter-go-router-example/
 F:	package/flutter-packages/flutter-image-example/
 F:	package/flutter-packages/flutter-markdown-example/
+F:	package/flutter-packages/flutter-rfw-local-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/ivi-homescreen/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index bfaccef264..4e3e29582f 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -13,6 +13,7 @@ source "package/flutter-packages/flutter-dynamic-layouts-example/Config.in"
 source "package/flutter-packages/flutter-go-router-example/Config.in"
 source "package/flutter-packages/flutter-image-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
+source "package/flutter-packages/flutter-rfw-local-example/Config.in"
 endif
 
 comment "flutter packages need flutter-engine"
diff --git a/package/flutter-packages/flutter-rfw-local-example/Config.in b/package/flutter-packages/flutter-rfw-local-example/Config.in
new file mode 100644
index 0000000000..42324a1eaa
--- /dev/null
+++ b/package/flutter-packages/flutter-rfw-local-example/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FLUTTER_RFW_LOCAL_EXAMPLE
+	bool "remote flutter widgets example"
+	help
+	  This example shows how one can create custom widgets in an RFW
+	  client, for use by remote widgets.
+
+	  https://github.com/flutter/packages/tree/main/packages/rfw/example/local
diff --git a/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.hash b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
new file mode 100644
index 0000000000..b57c021f8b
--- /dev/null
+++ b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# flutter-rfw-local-example
+#
+################################################################################
+
+FLUTTER_RFW_LOCAL_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_RFW_LOCAL_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_RFW_LOCAL_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_RFW_LOCAL_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_RFW_LOCAL_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_RFW_LOCAL_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_RFW_LOCAL_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_RFW_LOCAL_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME = local
+FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/rfw-$(FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME)-example/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_RFW_LOCAL_EXAMPLE_SUBDIR = packages/rfw/example/local
+
+define FLUTTER_RFW_LOCAL_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/libapp.so \
+		$(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
