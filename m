Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A459ED10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55BD56069D;
	Sat, 26 Oct 2024 14:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSfLGWtSj2iU; Sat, 26 Oct 2024 14:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C4786066F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C4786066F;
	Sat, 26 Oct 2024 14:51:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D4FA2318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A6CC40361
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxWnxts5OZ5o for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9944E40287
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9944E40287
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:51:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81F2383CDA; Sat, 26 Oct 2024 14:51:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:51:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72a30e20860e051d0ef0218e133cfeeb5bd1452a
X-Git-Newrev: 2b89c72679e07981ca3fb692e3d8150d731ee854
X-Patchwork-Hint: ignore
Message-Id: <20241026145137.81F2383CDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/popperjs: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b89c72679e07981ca3fb692e3d8150d731ee854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PopperJS project is now called floating-ui and is hosted on
https://github.com/floating-ui/floating-ui this caused legacy
source code archives to be repackaged with difference directory
name which broke the sha256 hash and made the autobuild fail.

Given the package has never been bumped since its introduction the
support for that package should probably be dropped.

This package used to be maintained by Thomas De Schampheleire, who no
longer contributes to Buildroot, and removed himself from the
DEVELOPERS file in March 2024.

Fixes:

  https://autobuild.buildroot.org/results/ab62afa6252ad986a900fbfc8b805038edc5d1d6/
  https://autobuild.buildroot.org/results/d1a5b56b987aa178b2ca3fa0855a5bd3da896bcb/
  https://autobuild.buildroot.org/results/9629da94be61a906fd113e77f0120cade521a715/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy               |  6 ++++++
 package/Config.in              |  1 -
 package/popperjs/Config.in     |  6 ------
 package/popperjs/popperjs.hash |  3 ---
 package/popperjs/popperjs.mk   | 19 -------------------
 5 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4a47a2dda1..9a1693dd76 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_POPPERJS
+	bool "popperjs has been removed"
+	select BR2_LEGACY
+	help
+	  The project has been renamed to floating-ui.
+
 config BR2_KERNEL_HEADERS_6_10
 	bool "kernel headers version 6.10.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2d72ffb104..6aceef9e7f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1888,7 +1888,6 @@ endif
 	source "package/json-javascript/Config.in"
 	source "package/jszip/Config.in"
 	source "package/openlayers/Config.in"
-	source "package/popperjs/Config.in"
 	source "package/vis-network/Config.in"
 	source "package/vuejs/Config.in"
 if BR2_PACKAGE_VUEJS
diff --git a/package/popperjs/Config.in b/package/popperjs/Config.in
deleted file mode 100644
index eae963100e..0000000000
--- a/package/popperjs/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_POPPERJS
-	bool "popperjs"
-	help
-	  Popper.js, a JavaScript Tooltip & Popover Positioning Engine.
-
-	  https://popper.js.org
diff --git a/package/popperjs/popperjs.hash b/package/popperjs/popperjs.hash
deleted file mode 100644
index a2388f5b7a..0000000000
--- a/package/popperjs/popperjs.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  83eecef51d10826faca2cd5cabb344e0bef6d4127d7e728db9e4d8308b7b15d1  popperjs-1.16.0.tar.gz
-sha256  2961310ed05cd9373a08b8191c071425a7fede0ca5d807ca38fa5f5f61c5b834  LICENSE.md
diff --git a/package/popperjs/popperjs.mk b/package/popperjs/popperjs.mk
deleted file mode 100644
index c5df302eb2..0000000000
--- a/package/popperjs/popperjs.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# popperjs
-#
-################################################################################
-
-POPPERJS_VERSION = 1.16.0
-POPPERJS_SITE = $(call github,popperjs,popper-core,v$(POPPERJS_VERSION))
-POPPERJS_LICENSE = MIT
-POPPERJS_LICENSE_FILES = LICENSE.md
-
-define POPPERJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/umd/popper.min.js \
-		$(TARGET_DIR)/var/www/popperjs/js/popper.min.js
-	$(INSTALL) -m 0644 -D $(@D)/dist/umd/popper-utils.min.js \
-		$(TARGET_DIR)/var/www/popperjs/js/popper-utils.min.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
