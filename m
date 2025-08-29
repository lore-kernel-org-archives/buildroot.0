Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34281CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1EAE616BA;
	Fri, 29 Aug 2025 17:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpGLYJa4BCK5; Fri, 29 Aug 2025 17:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18F45616C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18F45616C1;
	Fri, 29 Aug 2025 17:49:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE13A69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A041540656
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8M0E5qyNLInD for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C24354003D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C24354003D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:49:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBC0787E30; Fri, 29 Aug 2025 17:49:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 19:49:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2680209ad58e3e170215ddd1f57d1509b4255604
X-Git-Newrev: dca62a6365b4172cd8e37e83f87ac8f8c8899eb0
X-Patchwork-Hint: ignore
Message-Id: <20250829174941.BBC0787E30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ev3dev-linux-drivers:
 remove package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dca62a6365b4172cd8e37e83f87ac8f8c8899eb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

These external linux drivers haven't seen any activity in Buildroot
for a while, and are anyway aimed at an old kernel version (4.19).

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Acked-by: David Lechner <david@lechnology.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy                                     |  9 +++++++++
 DEVELOPERS                                           |  2 --
 linux/Config.ext.in                                  | 10 ----------
 linux/linux-ext-ev3dev-linux-drivers.mk              | 12 ------------
 package/Config.in                                    |  1 -
 package/ev3dev-linux-drivers/Config.in               | 12 ------------
 package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk | 11 -----------
 package/ev3dev-linux-drivers/lego-linux-drivers.hash |  2 --
 8 files changed, 9 insertions(+), 50 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index efb59dc535..21cada8c9d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.11"
+
+config BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS
+	bool "ev3dev Linux drivers have been removed"
+	select BR2_LEGACY
+	help
+	  Linux drivers for LEGO MINDSTORMS EV3 from the ev3dev project
+	  are targeting an outdated kernel which is no longer supported.
+
 comment "Legacy options removed in 2025.08"
 
 config BR2_PACKAGE_LIBCURL_BEARSSL
diff --git a/DEVELOPERS b/DEVELOPERS
index 0276f2f2cf..87a26b4388 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -839,9 +839,7 @@ F:	package/libtalloc/
 N:	David Lechner <david@lechnology.com>
 F:	board/lego/ev3/
 F:	configs/lego_ev3_defconfig
-F:	linux/linux-ext-ev3dev-linux-drivers.mk
 F:	package/brickd/
-F:	package/ev3dev-linux-drivers/
 
 N:	David Pierret <david.pierret@smile.fr>
 F:	package/bat/
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3cbf42d344..229d6b8c76 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -55,16 +55,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	help
 	  RTAI Kernel part.
 
-#-------------------------------------------------------------------------------
-# ev3dev Linux drivers
-config BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS
-	bool "ev3dev Linux drivers"
-	select BR2_PACKAGE_EV3DEV_LINUX_DRIVERS
-	help
-	  Linux drivers for LEGO MINDSTORMS EV3 from the ev3dev project.
-
-	  https://github.com/ev3dev/lego-linux-drivers
-
 #-------------------------------------------------------------------------------
 # fbtft
 config BR2_LINUX_KERNEL_EXT_FBTFT
diff --git a/linux/linux-ext-ev3dev-linux-drivers.mk b/linux/linux-ext-ev3dev-linux-drivers.mk
deleted file mode 100644
index 3bb12db38d..0000000000
--- a/linux/linux-ext-ev3dev-linux-drivers.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# Patch the linux kernel with ev3dev extension
-#
-################################################################################
-
-LINUX_EXTENSIONS += ev3dev-linux-drivers
-
-define EV3DEV_LINUX_DRIVERS_PREPARE_KERNEL
-	mkdir -p $(LINUX_DIR)/drivers/lego
-	cp -dpfr $(EV3DEV_LINUX_DRIVERS_DIR)/* $(LINUX_DIR)/drivers/lego/
-endef
diff --git a/package/Config.in b/package/Config.in
index b4eac5cf91..1c4dcf2c75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -512,7 +512,6 @@ endmenu
 	source "package/esp-hosted/Config.in"
 	source "package/espflash/Config.in"
 	source "package/eudev/Config.in"
-	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
 	source "package/fbtft/Config.in"
diff --git a/package/ev3dev-linux-drivers/Config.in b/package/ev3dev-linux-drivers/Config.in
deleted file mode 100644
index 9be2f282e9..0000000000
--- a/package/ev3dev-linux-drivers/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-# Prompt-less option, because this package is not doing anything except
-# downloading the ev3dev driver sources. The real work is done by a Linux
-# extension.
-config BR2_PACKAGE_EV3DEV_LINUX_DRIVERS
-	bool
-	depends on BR2_LINUX_KERNEL
-	help
-	  Linux drivers for LEGO MINDSTORMS EV3
-
-	  This is only the download helper for the kernel patch.
-
-	  https://github.com/ev3dev/lego-linux-drivers
diff --git a/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk b/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
deleted file mode 100644
index 92e8927817..0000000000
--- a/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-#
-# ev3dev Linux drivers
-#
-################################################################################
-
-EV3DEV_LINUX_DRIVERS_VERSION = 0e551eb25ae8600c1f178814781bfb42dc835496
-EV3DEV_LINUX_DRIVERS_SITE = $(call github,ev3dev,lego-linux-drivers,$(EV3DEV_LINUX_DRIVERS_VERSION))
-EV3DEV_LINUX_DRIVERS_LICENSE = GPL-2.0
-
-$(eval $(generic-package))
diff --git a/package/ev3dev-linux-drivers/lego-linux-drivers.hash b/package/ev3dev-linux-drivers/lego-linux-drivers.hash
deleted file mode 100644
index cc48f65395..0000000000
--- a/package/ev3dev-linux-drivers/lego-linux-drivers.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  9d2740b348c8d43e7e15fedc4cec99bf351a3a2ba8691f2a07c439a9c034bc04  lego-linux-drivers-0e551eb25ae8600c1f178814781bfb42dc835496.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
