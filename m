Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C96C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E9D851F1;
	Fri, 28 Feb 2025 17:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wS8bB2HEhXwX; Fri, 28 Feb 2025 17:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 154C685928
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 154C685928;
	Fri, 28 Feb 2025 17:12:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15AC81DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFE8142F20
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wn9d0TPObCWG for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D474D4247F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D474D4247F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE2F285E25; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 17:33:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3ef139386dae7cb82dfe9187cde18275999cf0b9
X-Git-Newrev: 48bce6ad8f7fdb52dc0a17c9ccf150a900b422f4
X-Patchwork-Hint: ignore
Message-Id: <20250228163031.CE2F285E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lynis: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=48bce6ad8f7fdb52dc0a17c9ccf150a900b422f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                  |  2 ++
 package/Config.in                           |  1 +
 package/lynis/Config.in                     | 10 ++++++
 package/lynis/lynis.hash                    |  3 ++
 package/lynis/lynis.mk                      | 48 +++++++++++++++++++++++++++++
 support/testing/tests/package/test_lynis.py | 26 ++++++++++++++++
 6 files changed, 90 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 10b8031ad3..d48b4c5500 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1168,6 +1168,7 @@ F:	package/lpty/
 F:	package/lrandom/
 F:	package/lsqlite3/
 F:	package/lua*
+F:	package/lynis/
 F:	package/lzlib/
 F:	package/moarvm/
 F:	package/mstpd/
@@ -1185,6 +1186,7 @@ F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
 F:	package/xavante/
 F:	support/testing/tests/package/test_lua*
+F:	support/testing/tests/package/test_lynis.py
 F:	utils/scancpan
 
 N:	Frank Hunleth <fhunleth@troodon-software.com>
diff --git a/package/Config.in b/package/Config.in
index 44b285d348..a4a8bd394f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2737,6 +2737,7 @@ menu "Security"
 	source "package/apparmor/Config.in"
 	source "package/checkpolicy/Config.in"
 	source "package/ima-evm-utils/Config.in"
+	source "package/lynis/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
 	source "package/optee-test/Config.in"
diff --git a/package/lynis/Config.in b/package/lynis/Config.in
new file mode 100644
index 0000000000..2757e86a2d
--- /dev/null
+++ b/package/lynis/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LYNIS
+	bool "lynis"
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_GZIP  # runtime (zgrep /proc/config.gz)
+	help
+	  Lynis is an auditing tool which tests and gathers (security)
+	  information from Unix based systems.
+	  Written in shell and running on system itself.
+
+	  https://cisofy.com/lynis/
diff --git a/package/lynis/lynis.hash b/package/lynis/lynis.hash
new file mode 100644
index 0000000000..1027fb21aa
--- /dev/null
+++ b/package/lynis/lynis.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9932147acafb1c5e13289a8bd46e8d330d4a97473da30ec04650ad019e497cd0  lynis-3.1.3.tar.gz
+sha256  57151f0fa287550534af08facb1c6693ca803ffa65b512da38b55c3130810bcf  LICENSE
diff --git a/package/lynis/lynis.mk b/package/lynis/lynis.mk
new file mode 100644
index 0000000000..13a883bd55
--- /dev/null
+++ b/package/lynis/lynis.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# lynis
+#
+################################################################################
+
+LYNIS_VERSION = 3.1.3
+LYNIS_SITE = $(call github,CISOfy,lynis,$(LYNIS_VERSION))
+LYNIS_LICENSE = GPL-3.0
+LYNIS_LICENSE_FILES = LICENSE
+
+define LYNIS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/lynis \
+		$(TARGET_DIR)/usr/sbin/lynis
+	$(INSTALL) -D -m 0644 $(@D)/default.prf \
+		$(TARGET_DIR)/etc/lynis/default.prf
+	$(INSTALL) -D -m 0644 $(@D)/developer.prf \
+		$(TARGET_DIR)/etc/lynis/developer.prf
+	$(INSTALL) -D -m 0644 $(@D)/plugins/* \
+		-t $(TARGET_DIR)/etc/lynis/plugins
+	$(INSTALL) -D -m 0644 $(@D)/include/* \
+		-t $(TARGET_DIR)/usr/share/lynis/include
+	$(INSTALL) -D -m 0644 $(@D)/db/*.db \
+		-t $(TARGET_DIR)/usr/share/lynis/db
+	$(INSTALL) -D -m 0644 $(@D)/db/languages/en \
+		$(TARGET_DIR)/usr/share/lynis/db/languages/en
+endef
+
+ifneq ($(BR2_PACKAGE_GAWK),y)
+define LYNIS_AWK_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AWK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_AWK_LIBM)
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_COREUTILS),y)
+define LYNIS_STAT_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_STAT)
+endef
+endif
+
+define LYNIS_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PGREP)
+	$(LYNIS_AWK_BUSYBOX_CONFIG_FIXUPS)
+	$(LYNIS_STAT_BUSYBOX_CONFIG_FIXUPS)
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_lynis.py b/support/testing/tests/package/test_lynis.py
new file mode 100644
index 0000000000..bed4023e64
--- /dev/null
+++ b/support/testing/tests/package/test_lynis.py
@@ -0,0 +1,26 @@
+import os
+
+import infra.basetest
+
+
+class TestLynis(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_LYNIS=y
+        """
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("which awk")
+        self.assertRunOk("which stat")
+        self.assertRunOk("which zgrep")
+        self.assertRunOk("lynis show version", timeout=90)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
