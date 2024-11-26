Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913ACE77180
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 606E581E57;
	Sun,  8 Dec 2024 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_FgZsRIoLvc; Sun,  8 Dec 2024 13:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BFA812D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BFA812D9;
	Sun,  8 Dec 2024 13:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E770EE0
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86E046080F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aTmEvbDX-P7 for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01A8A6080E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01A8A6080E
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2B0886B74; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 19:34:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20b240a9a25f5b734bd65894b714658334bd2148
X-Git-Newrev: 9aedec00d23904756382f59311ab06ff1955be8a
X-Patchwork-Hint: ignore
Message-Id: <20241208130652.F2B0886B74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fconfig: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9aedec00d23904756382f59311ab06ff1955be8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream location has been dead for 10 years and there is no reverse
dependencies for it, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy             |  7 +++++++
 package/Config.in            |  1 -
 package/fconfig/Config.in    |  6 ------
 package/fconfig/fconfig.hash |  3 ---
 package/fconfig/fconfig.mk   | 22 ----------------------
 5 files changed, 7 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3636228440..2ef1e19516 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_FCONFIG
+	bool "fconfig has been removed"
+	select BR2_LEGACY
+	help
+	  The fconfig package was removed as it is not maintained
+	  anymore and the upstream URL is gone.
+
 config BR2_PACKAGE_LIBHID
 	bool "libhid has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index d9af39b900..60cdb179a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -514,7 +514,6 @@ endmenu
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
 	source "package/fbtft/Config.in"
-	source "package/fconfig/Config.in"
 	source "package/flashrom/Config.in"
 	source "package/fmtools/Config.in"
 	source "package/freeipmi/Config.in"
diff --git a/package/fconfig/Config.in b/package/fconfig/Config.in
deleted file mode 100644
index e7dd58a84a..0000000000
--- a/package/fconfig/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_FCONFIG
-	bool "fconfig"
-	help
-	  fconfig - get/set RedBoot configuration parameters from Linux.
-
-	  http://andrzejekiert.ovh.org/software.html.en
diff --git a/package/fconfig/fconfig.hash b/package/fconfig/fconfig.hash
deleted file mode 100644
index 98e7fbf12b..0000000000
--- a/package/fconfig/fconfig.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  4ff0e8f07e35e46b705c0dbe9d9544ede01ea092a69e3f7db03e55a3f2bb8eb7  fconfig-20080329.tar.gz
-sha256  e698a9ea4d6dab0a15d3d6fd354b97b820629244f946529cc7f42b2b8e8f16d0  fconfig.c
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
deleted file mode 100644
index 1e6fbb40b4..0000000000
--- a/package/fconfig/fconfig.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# fconfig
-#
-################################################################################
-
-FCONFIG_VERSION = 20080329
-# Real upstream location has been disabled
-# FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig
-FCONFIG_SITE = http://sources.buildroot.net
-FCONFIG_LICENSE = GPL-2.0+
-FCONFIG_LICENSE_FILES = fconfig.c
-
-define FCONFIG_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define FCONFIG_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/fconfig $(TARGET_DIR)/sbin/fconfig
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
