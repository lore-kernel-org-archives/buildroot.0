Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFC3C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73E034064C;
	Mon,  3 Jun 2024 09:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ep2OHdpS9TU6; Mon,  3 Jun 2024 09:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0787B4117D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0787B4117D;
	Mon,  3 Jun 2024 09:21:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C20A1BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E48040683
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXyJdzasYZRG for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2C6D40689
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2C6D40689
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE478878C8; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 11:11:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eca3ea8d3f83a19a1ce9823306e689d2b0b92c5d
X-Git-Newrev: 6d0d809a28d802873c3ebd209791bfdeaa2a6353
X-Patchwork-Hint: ignore
Message-Id: <20240603091957.CE478878C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/on2-8170-libs: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d0d809a28d802873c3ebd209791bfdeaa2a6353
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The linux4sam_1.9 upstream is no longer available for this binary-only
library that was used with a gstreamer 0.10 plugin, which was itself removed
in 2020.02 with commit fb49c7a26182f9d (package/gstreamer/*: remove
packages), so remove the package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                         |  6 ++++++
 package/Config.in                        |  1 -
 package/on2-8170-libs/Config.in          | 15 ---------------
 package/on2-8170-libs/on2-8170-libs.hash |  2 --
 package/on2-8170-libs/on2-8170-libs.mk   | 26 --------------------------
 5 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 46f7a304cb..a1650733a9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_PACKAGE_ON2_8170_LIBS
+	bool "on2-8170-libs removed"
+	select BR2_LEGACY
+	help
+	  Upstream for this binary only library is no longer available.
+
 config BR2_GCC_VERSION_11_X
 	bool "gcc 11.x support removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 1b6a5b0dab..2ec4e70566 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -44,7 +44,6 @@ menu "Audio and video applications"
 	source "package/multicat/Config.in"
 	source "package/musepack/Config.in"
 	source "package/ncmpc/Config.in"
-	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
 	source "package/pipewire/Config.in"
 	source "package/pipewire-media-session/Config.in"
diff --git a/package/on2-8170-libs/Config.in b/package/on2-8170-libs/Config.in
deleted file mode 100644
index 2a60c581e4..0000000000
--- a/package/on2-8170-libs/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_ON2_8170_LIBS
-	bool "on2-8170-libs"
-	#This is a binary only package which has been compiled for glibc
-	depends on BR2_arm926t
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_LINUX_KERNEL # on2-8170-modules
-	select BR2_PACKAGE_ON2_8170_MODULES # runtime
-	help
-	  Libraries for Hantro X170 video decoder
-
-	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
-
-comment "on2-8170-libs needs a glibc toolchain and a Linux kernel to be built"
-	depends on BR2_arm926t
-	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/on2-8170-libs/on2-8170-libs.hash b/package/on2-8170-libs/on2-8170-libs.hash
deleted file mode 100644
index c8b76e5794..0000000000
--- a/package/on2-8170-libs/on2-8170-libs.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  db7390a13e7c0426894a6f966ecde1f89e6566416088c50729750e800306a2de  on2-8170-libs-1.0.tar.gz
diff --git a/package/on2-8170-libs/on2-8170-libs.mk b/package/on2-8170-libs/on2-8170-libs.mk
deleted file mode 100644
index ad321d832f..0000000000
--- a/package/on2-8170-libs/on2-8170-libs.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-################################################################################
-#
-# on2-8170-libs
-#
-################################################################################
-
-ON2_8170_LIBS_VERSION = 1.0
-ON2_8170_LIBS_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec
-
-ON2_8170_LIBS_LICENSE = PROPRIETARY
-# No license file is included in the archive
-
-ON2_8170_LIBS_INSTALL_STAGING = YES
-
-define ON2_8170_LIBS_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
-	cp -dpf $(@D)/*.a $(@D)/*.so $(STAGING_DIR)/usr/lib
-	cp -dpf $(@D)/*.h $(STAGING_DIR)/usr/include
-endef
-
-define ON2_8170_LIBS_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(@D)/*.so $(TARGET_DIR)/usr/lib
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
