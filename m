Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A9CC25B75
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBADD406DF;
	Mon, 13 May 2024 20:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAEKcpI4sZJ6; Mon, 13 May 2024 20:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7012D406E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7012D406E2;
	Mon, 13 May 2024 20:59:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E77881BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C101982114
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Hw3Bqc0wu3l for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E866581AD1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E866581AD1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:59:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A318F87279; Mon, 13 May 2024 20:59:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 22:59:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a28bc67ce5f37661275c90904db7929c2416dc88
X-Git-Newrev: 1b533c2d9ee6247939fb34fbe6550dea0a656ff1
X-Patchwork-Hint: ignore
Message-Id: <20240513205943.A318F87279@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-c: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b533c2d9ee6247939fb34fbe6550dea0a656ff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides a C binding based on the main Zenoh
implementation written in Rust.

https://github.com/eclipse-zenoh/zenoh-c

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libzenoh-c/Config.in       |  9 +++++++++
 package/libzenoh-c/libzenoh-c.hash |  3 +++
 package/libzenoh-c/libzenoh-c.mk   | 40 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ad03c26ea4..a9deddb343 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -83,6 +83,7 @@ N:	Alessandro Partesotti <a.partesotti@gmail.com>
 F:	package/oatpp/
 
 N:	Alex Michel <alex.michel@wiedemann-group.com>
+F:	package/libzenoh-c/
 F:	package/libzenoh-pico/
 F:	package/network-manager-openvpn/
 
diff --git a/package/Config.in b/package/Config.in
index 768103e0c4..1b6a5b0dab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2048,6 +2048,7 @@ menu "Networking"
 	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
+	source "package/libzenoh-c/Config.in"
 	source "package/libzenoh-pico/Config.in"
 	source "package/lksctp-tools/Config.in"
 	source "package/mbuffer/Config.in"
diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
new file mode 100644
index 0000000000..d22807c047
--- /dev/null
+++ b/package/libzenoh-c/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBZENOH_C
+	bool "libzenoh-c"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  This package provides a C binding based on the main
+	  Zenoh implementation written in Rust.
+
+	  https://github.com/eclipse-zenoh/zenoh-c
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
new file mode 100644
index 0000000000..8331f5cca4
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c792f0be936ecbb3f759124be28950a01385f4680eaf4f1da55997640899648e  libzenoh-c-0.11.0.2-cargo2.tar.gz
+sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
new file mode 100644
index 0000000000..3a50fe6bf1
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# libzenoh-c
+#
+################################################################################
+
+LIBZENOH_C_VERSION = 0.11.0.2
+LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
+LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
+LIBZENOH_C_LICENSE_FILES = LICENSE
+LIBZENOH_C_INSTALL_STAGING = YES
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+LIBZENOH_C_LIB_LOCATION = $(@D)/target/$(RUSTC_TARGET_NAME)/debug
+else
+LIBZENOH_C_LIB_LOCATION = $(@D)/target/$(RUSTC_TARGET_NAME)/release
+endif
+
+define LIBZENOH_C_INSTALL_FILES
+	$(INSTALL) -D -m 644 \
+		$(LIBZENOH_C_LIB_LOCATION)/libzenohc.so \
+		$(1)/usr/lib/libzenohc.so
+endef
+
+# This package does not provide any binaries or examples, and the
+# cargo infra does not provide any possibility to disable the --bins
+# option in cargo install step, we have to override the
+# INSTALL_STAGING_CMDS and the INSTALL_TARGET_CMDS macros.
+
+define LIBZENOH_C_INSTALL_TARGET_CMDS
+	$(call LIBZENOH_C_INSTALL_FILES,$(TARGET_DIR))
+endef
+
+define LIBZENOH_C_INSTALL_STAGING_CMDS
+	$(call LIBZENOH_C_INSTALL_FILES,$(STAGING_DIR))
+	mkdir -p $(STAGING_DIR)/usr/include/
+	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/
+endef
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
