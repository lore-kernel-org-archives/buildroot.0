Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B65C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 15:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70795812BA;
	Sun, 18 May 2025 15:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tOOESaBwBaH; Sun, 18 May 2025 15:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CA2281342
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CA2281342;
	Sun, 18 May 2025 15:07:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E17DDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E83EB812FB
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXYrIDfMqoOc for <buildroot@buildroot.org>;
 Sun, 18 May 2025 15:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EF4D8122A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EF4D8122A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:07:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29AEF87147; Sun, 18 May 2025 15:07:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 17:07:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7c091f11398bdb6498adaa344d0934d97b4ef39
X-Git-Newrev: 187f7b14692f4b7087aba675e9aef09fbbc05144
X-Patchwork-Hint: ignore
Message-Id: <20250518150726.29AEF87147@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/casync-nano: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=187f7b14692f4b7087aba675e9aef09fbbc05144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

casync-nano is an implementation of a subset of the features of casync,
optimized for performing OTA updates on embedded systems.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/Config.in.host               |  1 +
 package/casync-nano/Config.in        | 21 +++++++++++++++++++++
 package/casync-nano/Config.in.host   |  7 +++++++
 package/casync-nano/casync-nano.hash |  3 +++
 package/casync-nano/casync-nano.mk   | 30 ++++++++++++++++++++++++++++++
 7 files changed, 66 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7bc7385586..78bb555530 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1133,6 +1133,9 @@ F:	package/rsyslog/
 N:	Florian Fainelli <f.fainelli@gmail.com>
 F:	package/cpulimit/
 
+N:	Florian Larysch <fl@n621.de>
+F:	package/casync-nano/
+
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
 F:	package/odhcploc/
diff --git a/package/Config.in b/package/Config.in
index d09cfe066a..ffaed13c74 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2467,6 +2467,7 @@ endif
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
 	source "package/casync/Config.in"
+	source "package/casync-nano/Config.in"
 	source "package/cfm/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index bf04f5fa97..b0f7529a13 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/bmap-writer/Config.in.host"
 	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
+	source "package/casync-nano/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/checksec/Config.in.host"
diff --git a/package/casync-nano/Config.in b/package/casync-nano/Config.in
new file mode 100644
index 0000000000..8ba80e4ce6
--- /dev/null
+++ b/package/casync-nano/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_CASYNC_NANO
+	bool "casync-nano"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZSTD
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Tiny casync-like tool optimized for embedded systems.
+
+	  https://github.com/florolf/casync-nano
+
+if BR2_PACKAGE_CASYNC_NANO
+
+config BR2_PACKAGE_CASYNC_NANO_CASYNC_SHIM
+	bool "install casync shim"
+	# only one package should provide the "casync" command
+	depends on !BR2_PACKAGE_CASYNC
+	help
+	  Install a shim that provides basic compatibility with the
+	  "extract" sub-command of casync to programs that expect it.
+
+endif
diff --git a/package/casync-nano/Config.in.host b/package/casync-nano/Config.in.host
new file mode 100644
index 0000000000..2fc3340017
--- /dev/null
+++ b/package/casync-nano/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_CASYNC_NANO
+	bool "host casync-nano tool"
+	help
+	  casync-nano host tool (csn-tool) for casync-nano specific
+	  features like chunk encryption.
+
+	  https://github.com/florolf/casync-nano
diff --git a/package/casync-nano/casync-nano.hash b/package/casync-nano/casync-nano.hash
new file mode 100644
index 0000000000..1697fa93ef
--- /dev/null
+++ b/package/casync-nano/casync-nano.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  29ed8a767304e7e3032e66feea3d2dada7cc7db73344231a54bf080cc6e65ecf  casync-nano-1.1.1.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/casync-nano/casync-nano.mk b/package/casync-nano/casync-nano.mk
new file mode 100644
index 0000000000..e492627fa3
--- /dev/null
+++ b/package/casync-nano/casync-nano.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# casync-nano
+#
+################################################################################
+
+CASYNC_NANO_VERSION = 1.1.1
+CASYNC_NANO_SITE = $(call github,florolf,casync-nano,v$(CASYNC_NANO_VERSION))
+CASYNC_NANO_LICENSE = LGPL-2.1
+CASYNC_NANO_LICENSE_FILES = COPYING
+CASYNC_NANO_DEPENDENCIES = host-pkgconf openssl zstd libcurl
+
+ifeq ($(BR2_PACKAGE_CASYNC_NANO_CASYNC_SHIM),y)
+define CASYNC_NANO_INSTALL_CASYNC_SHIM
+	ln -sf csn $(TARGET_DIR)/usr/bin/casync
+endef
+endif
+
+define CASYNC_NANO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m0755 $(@D)/csn $(TARGET_DIR)/usr/bin/csn
+	$(CASYNC_NANO_INSTALL_CASYNC_SHIM)
+endef
+
+# We're only building csn-tool for the host, so only openssl is
+# needed, not the other dependencies
+HOST_CASYNC_NANO_DEPENDENCIES = host-pkgconf host-openssl
+HOST_CASYNC_NANO_CONF_OPTS = -DBUILD_CSN=Off -DBUILD_CSN_TOOL=On
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
