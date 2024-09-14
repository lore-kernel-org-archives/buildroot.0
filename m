Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5CBC02189
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13658846C0;
	Sat, 14 Sep 2024 09:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Yp9Q5o_zgI0; Sat, 14 Sep 2024 09:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDFB581463
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDFB581463;
	Sat, 14 Sep 2024 09:20:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8A231BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9791C4023E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Imp4ySucQ2UV for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6203040179
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6203040179
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:20:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5873B86FE2; Sat, 14 Sep 2024 09:20:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:20:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24cac9c4e6a36fd14b263a8eecf7ae7d58ab5a59
X-Git-Newrev: c1daa35cd9501844f5201a05b351ff6f6d15dde4
X-Patchwork-Hint: ignore
Message-Id: <20240914092029.5873B86FE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyinit: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c1daa35cd9501844f5201a05b351ff6f6d15dde4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package contains a Linux init script suitable for resource-limited
systems which can be used as an alternative to the one provided by
Busybox.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
[yann.morin.1998@free.fr: drop 'imply busybox']
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/busybox/busybox.mk   |  1 +
 package/tinyinit/Config.in   |  7 +++++++
 package/tinyinit/init        | 32 ++++++++++++++++++++++++++++++++
 package/tinyinit/tinyinit.mk | 13 +++++++++++++
 system/Config.in             |  9 +++++++++
 7 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b0efabfd5d..479ebeed37 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -793,6 +793,7 @@ F:	configs/stm32f769_disco_sd_defconfig
 F:	package/armadillo/
 F:	package/babeld/
 F:	package/sscep/
+F:	package/tinyinit/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
diff --git a/package/Config.in b/package/Config.in
index 4eccf77dd3..40b20201a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2870,6 +2870,7 @@ menu "System tools"
 	source "package/tar/Config.in"
 	source "package/tealdeer/Config.in"
 	source "package/thermald/Config.in"
+	source "package/tinyinit/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
 	source "package/tpm2-tools/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 204ebe0106..942875ee0e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -68,6 +68,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
+	$(if $(BR2_PACKAGE_TINYINIT),tinyinit) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
 	$(if $(BR2_PACKAGE_WATCHDOG),watchdog) \
 	$(if $(BR2_PACKAGE_WGET),wget) \
diff --git a/package/tinyinit/Config.in b/package/tinyinit/Config.in
new file mode 100644
index 0000000000..c780ed3cac
--- /dev/null
+++ b/package/tinyinit/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_TINYINIT
+	bool "tinyinit"
+	depends on BR2_INIT_TINYINIT
+	help
+	  A Linux tiny initialization script suitable for resource
+	  limited systems, which can be used as an alternative to the
+	  one provided by Busybox.
diff --git a/package/tinyinit/init b/package/tinyinit/init
new file mode 100644
index 0000000000..fbcb481010
--- /dev/null
+++ b/package/tinyinit/init
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+# This script replaces the default busybox init process to avoid having that
+# process staying alive and sleeping in the background, (uselessly) consuming
+# precious memory.
+
+# Mount procfs and sysfs
+/bin/mount -t proc proc /proc
+/bin/mount -t sysfs sysfs /sys
+
+# When the kernel is directly booted, devtmpfs is not automatically mounted.
+# Manually mount it if needed.
+devmnt=$(mount | grep -c devtmpfs)
+if [ "${devmnt}" -eq 0 ]; then
+    /bin/mount -t devtmpfs devtmpfs /dev
+fi
+
+# Use the /dev/console device node from devtmpfs if possible to not
+# confuse glibc's ttyname_r().
+# This may fail (E.G. booted with console=), and errors from exec will
+# terminate the shell, so use a subshell for the test
+if (exec 0</dev/console) 2>/dev/null; then
+    exec 0</dev/console
+    exec 1>/dev/console
+    exec 2>/dev/console
+fi
+
+# Clear memory to reduce page fragmentation
+echo 3 > /proc/sys/vm/drop_caches
+
+# Finally, let's start an interactive shell
+exec /bin/sh
diff --git a/package/tinyinit/tinyinit.mk b/package/tinyinit/tinyinit.mk
new file mode 100644
index 0000000000..ac1f0f736e
--- /dev/null
+++ b/package/tinyinit/tinyinit.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tinyinit
+#
+################################################################################
+
+define TINYINIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(TINYINIT_PKGDIR)/init $(TARGET_DIR)/sbin/init
+	# Downside: In non-initramfs systems the symlink isn't used/needed
+	(cd $(TARGET_DIR); ln -sf /sbin/init init)
+endef
+
+$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index a1199d850d..8f3579b7e0 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -165,6 +165,15 @@ config BR2_INIT_TINI
 
 	  https://github.com/krallin/tini
 
+config BR2_INIT_TINYINIT
+	bool "tiny init"
+	select BR2_PACKAGE_TINYINIT
+	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
+	help
+	  A Linux tiny initialization script suitable for resource
+	  limited systems, which can be used as an alternative to the
+	  one provided by Busybox.
+
 config BR2_INIT_NONE
 	bool "Custom (none)"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
