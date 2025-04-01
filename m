Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995EBC36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 19:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48FAE6114F;
	Tue,  1 Apr 2025 19:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2dCYTBaUFcG; Tue,  1 Apr 2025 19:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7819461178
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7819461178;
	Tue,  1 Apr 2025 19:54:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9635F17F
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 846A1415B3
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlV_0iIr7_cm for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 19:54:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E7B4097F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8E7B4097F
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:54:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C02CB839FE; Tue,  1 Apr 2025 19:54:36 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 1 Apr 2025 21:33:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b6b2333cff7f53972bed8c449bd3310f195c0a0
X-Git-Newrev: 5cab9ee22476373d45e0505dc21cafdd3c821212
X-Patchwork-Hint: ignore
Message-Id: <20250401195436.C02CB839FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ufs-utils: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cab9ee22476373d45e0505dc21cafdd3c821212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's a tool to access UFS (Universal Flash Storage) devices from user
space.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/ufs-utils/Config.in      | 11 +++++++++++
 package/ufs-utils/ufs-utils.hash |  3 +++
 package/ufs-utils/ufs-utils.mk   | 20 ++++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 44f7684c97..e4b8085ca6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -805,6 +805,7 @@ F:	package/babeld/
 F:	package/iana-assignments/
 F:	package/sscep/
 F:	package/tinyinit/
+F:	package/ufs-utils/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
diff --git a/package/Config.in b/package/Config.in
index 4b7e474cac..eb22c81d1d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -249,6 +249,7 @@ menu "Filesystem and flash utilities"
 	source "package/sshfs/Config.in"
 	source "package/sunxi-tools/Config.in"
 	source "package/udftools/Config.in"
+	source "package/ufs-utils/Config.in"
 	source "package/unionfs/Config.in"
 	source "package/xfsprogs/Config.in"
 	source "package/zerofree/Config.in"
diff --git a/package/ufs-utils/Config.in b/package/ufs-utils/Config.in
new file mode 100644
index 0000000000..438eeaf7a6
--- /dev/null
+++ b/package/ufs-utils/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_UFS_UTILS
+	bool "ufs-utils"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	help
+	  UFS utils is a set of utilities for managing Universal
+	  Flash Storage (UFS) devices.
+
+	  https://github.com/SanDisk-Open-Source/ufs-utils.git
+
+comment "ufs-utils needs a toolchain w/ headers >= 5.1"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
diff --git a/package/ufs-utils/ufs-utils.hash b/package/ufs-utils/ufs-utils.hash
new file mode 100644
index 0000000000..c6ef91a025
--- /dev/null
+++ b/package/ufs-utils/ufs-utils.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  66259581b13e33edeccb08edd2389627121adf9b425ba4545f6a84d7292ef4fa  ufs-utils-4.13.5.tar.gz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ufs-utils/ufs-utils.mk b/package/ufs-utils/ufs-utils.mk
new file mode 100644
index 0000000000..504f87f375
--- /dev/null
+++ b/package/ufs-utils/ufs-utils.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# ufs-utils
+#
+################################################################################
+
+UFS_UTILS_VERSION = 4.13.5
+UFS_UTILS_SITE = $(call github,SanDisk-Open-Source,ufs-utils,v$(UFS_UTILS_VERSION))
+UFS_UTILS_LICENSE = GPL-2.0
+UFS_UTILS_LICENSE_FILES = COPYING
+
+define UFS_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define UFS_UTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/ufs-utils $(TARGET_DIR)/usr/bin/ufs-utils
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
