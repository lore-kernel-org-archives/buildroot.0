Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A29C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D7606082D;
	Mon,  3 Jun 2024 07:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPBGHv-m_SZg; Mon,  3 Jun 2024 07:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB2160B0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EB2160B0F;
	Mon,  3 Jun 2024 07:18:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 681521BF861
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62BC76071F
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NieySQS_VFH for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04B89606DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04B89606DB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04B89606DB
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 032C66000C;
 Mon,  3 Jun 2024 07:17:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wp-002Edr-1o;
 Mon, 03 Jun 2024 09:17:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:25 +0200
Message-Id: <20240603071726.532652-22-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 22/23] package/on2-8170-libs: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The linux4sam_1.9 upstream is no longer available for this binary-only
library that was used with a gstreamer 0.10 plugin, which was itself removed
in 2020.02 with commit fb49c7a26182f9d (package/gstreamer/*: remove
packages), so remove the package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                         |  6 ++++++
 package/Config.in                        |  1 -
 package/on2-8170-libs/Config.in          | 15 --------------
 package/on2-8170-libs/on2-8170-libs.hash |  2 --
 package/on2-8170-libs/on2-8170-libs.mk   | 26 ------------------------
 5 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 package/on2-8170-libs/Config.in
 delete mode 100644 package/on2-8170-libs/on2-8170-libs.hash
 delete mode 100644 package/on2-8170-libs/on2-8170-libs.mk

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
