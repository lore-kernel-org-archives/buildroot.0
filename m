Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92A0C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 625D960A35;
	Mon, 25 Mar 2024 23:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4xJskZZKXMA; Mon, 25 Mar 2024 23:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D638560A4C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D638560A4C;
	Mon, 25 Mar 2024 23:44:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B80E1BF95D
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E421840C28
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 674oY5WMqNam for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E93EE4044F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E93EE4044F
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7759811E9; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 00:01:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26ab7ee00a0212db37da3189cfbd241ab8fe817e
X-Git-Newrev: 83c1ba5f449182afac6f6c9c6fa7288519bc241b
X-Patchwork-Hint: ignore
Message-Id: <20240325234447.D7759811E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/flutter-packages/flutter-image-example: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=83c1ba5f449182afac6f6c9c6fa7288519bc241b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package uses the NetworkImageWithRetry method to download the Flutter
logo. The package requires ca-certificates, or else SSL errors occur when
the application attempts to download the image.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/flutter-packages/Config.in                 |  1 +
 .../flutter-image-example/Config.in                |  8 ++++
 .../flutter-image-example.hash                     |  1 +
 .../flutter-image-example/flutter-image-example.mk | 54 ++++++++++++++++++++++
 5 files changed, 65 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a4c8fba6d2..d5ef02b7ad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -38,6 +38,7 @@ F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
 F:	package/flutter-packages/flutter-dynamic-layouts-example/
 F:	package/flutter-packages/flutter-go-router-example/
+F:	package/flutter-packages/flutter-image-example/
 F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index bbcd3aec93..bfaccef264 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -11,6 +11,7 @@ source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-animations-example/Config.in"
 source "package/flutter-packages/flutter-dynamic-layouts-example/Config.in"
 source "package/flutter-packages/flutter-go-router-example/Config.in"
+source "package/flutter-packages/flutter-image-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
 endif
 
diff --git a/package/flutter-packages/flutter-image-example/Config.in b/package/flutter-packages/flutter-image-example/Config.in
new file mode 100644
index 0000000000..15ae20872a
--- /dev/null
+++ b/package/flutter-packages/flutter-image-example/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FLUTTER_IMAGE_EXAMPLE
+	bool "flutter image example"
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+	help
+	  Use NetworkImageWithRetry instead of Image.network to
+	  load images from the network with a retry mechanism.
+
+	  https://github.com/flutter/packages/tree/main/packages/flutter_image/example
diff --git a/package/flutter-packages/flutter-image-example/flutter-image-example.hash b/package/flutter-packages/flutter-image-example/flutter-image-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-image-example/flutter-image-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-image-example/flutter-image-example.mk b/package/flutter-packages/flutter-image-example/flutter-image-example.mk
new file mode 100644
index 0000000000..20f185896d
--- /dev/null
+++ b/package/flutter-packages/flutter-image-example/flutter-image-example.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# flutter-image-example
+#
+################################################################################
+
+FLUTTER_IMAGE_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_IMAGE_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_IMAGE_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_IMAGE_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_IMAGE_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_IMAGE_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_IMAGE_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_IMAGE_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_IMAGE_EXAMPLE_PKG_NAME = flutter_image_example
+FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_IMAGE_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_IMAGE_EXAMPLE_SUBDIR = packages/flutter_image/example
+
+define FLUTTER_IMAGE_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_IMAGE_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_IMAGE_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_IMAGE_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/libapp.so \
+		$(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
