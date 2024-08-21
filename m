Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA777C52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 11:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 567D080A81;
	Wed, 21 Aug 2024 11:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rorCvCNTF3yg; Wed, 21 Aug 2024 11:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C397808A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C397808A3;
	Wed, 21 Aug 2024 11:49:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C22E31BF4E7
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 11:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B065160A63
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 11:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwVGjo-EnZrm for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 11:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C91F9606EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C91F9606EB
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 11:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3D5C8623C; Wed, 21 Aug 2024 11:49:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 13:49:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4d8881731ed745aff676b860a05abdff9ff1a0c
X-Git-Newrev: 7944b8811b801d0ad4fa1a179c2bad1db4c2976b
X-Patchwork-Hint: ignore
Message-Id: <20240821114953.B3D5C8623C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fan-ctrl: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7944b8811b801d0ad4fa1a179c2bad1db4c2976b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For this package, we're downloading from the CVS repository viewer,
but it is gone. The only way would be to download from the CVS
repository itself, but really upstream is completely dead, and this
package has seen no update since it has been introduced in 2013, so
let's get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy               |  7 +++++++
 package/Config.in              |  1 -
 package/fan-ctrl/Config.in     | 11 -----------
 package/fan-ctrl/fan-ctrl.hash |  2 --
 package/fan-ctrl/fan-ctrl.mk   | 27 ---------------------------
 5 files changed, 7 insertions(+), 41 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c1870613af..0bae66c3bb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_FAN_CTRL
+	bool "fan-ctrl has been removed"
+	select BR2_LEGACY
+	help
+	  This package was no longer available from SourceForge, the
+	  upstream is completely dead.
+
 config BR2_PACKAGE_FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE
 	bool "flutter-dynamic-layouts-example has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..317f859684 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -513,7 +513,6 @@ endmenu
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
-	source "package/fan-ctrl/Config.in"
 	source "package/fbtft/Config.in"
 	source "package/fconfig/Config.in"
 	source "package/flashrom/Config.in"
diff --git a/package/fan-ctrl/Config.in b/package/fan-ctrl/Config.in
deleted file mode 100644
index 869631683b..0000000000
--- a/package/fan-ctrl/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_FAN_CTRL
-	bool "fan-ctrl"
-	depends on BR2_USE_MMU # fork()
-	help
-	  Fan-ctrl is a little daemon that controls the speed of one
-	  or more system or CPU fans. It does so by monitoring
-	  temperature inputs and selecting a fan speed from an array
-	  of available speeds based on a set of temperature
-	  thresholds.
-
-	  http://fan-ctrl.sourceforge.net/
diff --git a/package/fan-ctrl/fan-ctrl.hash b/package/fan-ctrl/fan-ctrl.hash
deleted file mode 100644
index 4f26696785..0000000000
--- a/package/fan-ctrl/fan-ctrl.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha1  d8ba5bac15e90c36a4e908ca1c98fac83bf702ea  fan-ctrl.c?revision=1.3
diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
deleted file mode 100644
index 81a52f1e9f..0000000000
--- a/package/fan-ctrl/fan-ctrl.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# fan-ctrl
-#
-################################################################################
-
-# no release, so grab .c file directly from viewvc
-FAN_CTRL_VERSION = 1.3
-FAN_CTRL_SOURCE = fan-ctrl.c?revision=$(FAN_CTRL_VERSION)
-FAN_CTRL_SITE = http://fan-ctrl.cvs.sourceforge.net/viewvc/fan-ctrl/fan-ctrl
-FAN_CTRL_LICENSE = GPL-2.0+
-FAN_CTRL_LICENSE_FILES = fan-ctrl.c
-
-define FAN_CTRL_EXTRACT_CMDS
-	cp $(FAN_CTRL_DL_DIR)/$(FAN_CTRL_SOURCE) $(@D)/fan-ctrl.c
-endef
-
-define FAN_CTRL_BUILD_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
-		$(@D)/fan-ctrl.c -o $(@D)/fan-ctrl
-endef
-
-define FAN_CTRL_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/fan-ctrl $(TARGET_DIR)/usr/sbin/fan-ctrl
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
