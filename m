Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0AED116EA
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98C84054A;
	Thu, 27 Nov 2025 20:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCV2wrs7q3Eo; Thu, 27 Nov 2025 20:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC48440619
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC48440619;
	Thu, 27 Nov 2025 20:36:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 144F12A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC2E960A8F
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_JChgdTevND for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79D1B61718
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79D1B61718
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 787E085C08; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:14:15 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 8e90a1fa0fa203b65dc98ccf8bb8c6b8d96db4c4
X-Git-Newrev: bee716ba13388f4d334b51d0185764e5ce61f28f
X-Patchwork-Hint: ignore
Message-Id: <20251127203602.787E085C08@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/ortp: remove
 package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bee716ba13388f4d334b51d0185764e5ce61f28f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

ortp was only needed as a dependency of linphone, as is anyway bundled
in more recent versions of linphone, making a separate package
unnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8a40f079ac5e6fc784aa7cfc3e86669cb348fd6c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy       |  8 ++++++++
 package/Config.in      |  1 -
 package/ortp/Config.in | 16 ----------------
 package/ortp/ortp.hash |  3 ---
 package/ortp/ortp.mk   | 25 -------------------------
 5 files changed, 8 insertions(+), 45 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 489b92a3e0..7cc8d7eab6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.08.3"
 
+config BR2_PACKAGE_ORTP
+	bool "ortp has been removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as part of the linphone
+	  removal. In addition, newer version of linphone directly
+	  bundle ortp making a separate package unnecessary.
+
 config BR2_PACKAGE_MEDIASTREAMER
 	bool "mediastreamer has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 650420b960..3d663ba9e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2141,7 +2141,6 @@ menu "Networking"
 	source "package/openmpi/Config.in"
 	source "package/openpgm/Config.in"
 	source "package/openzwave/Config.in"
-	source "package/ortp/Config.in"
 	source "package/paho-mqtt-c/Config.in"
 	source "package/paho-mqtt-cpp/Config.in"
 	source "package/pistache/Config.in"
diff --git a/package/ortp/Config.in b/package/ortp/Config.in
deleted file mode 100644
index e296e82f7a..0000000000
--- a/package/ortp/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_ORTP
-	bool "oRTP"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
-	select BR2_PACKAGE_BCTOOLBOX
-	help
-	  oRTP, a Real-time Transport Protocol (RTP,RFC3550) library
-
-	  https://www.linphone.org/technical-corner/ortp
-
-comment "ortp needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "ortp needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
deleted file mode 100644
index 7853c63143..0000000000
--- a/package/ortp/ortp.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  9b1d43f676a35920e2837abc0eb4d600d4d3e47d2621fa3b0897777cf587ee8d  ortp-4.4.8.tar.gz
-sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
deleted file mode 100644
index 67bef9aebb..0000000000
--- a/package/ortp/ortp.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# ortp
-#
-################################################################################
-
-ORTP_VERSION = 4.4.8
-ORTP_SITE = https://gitlab.linphone.org/BC/public/ortp/-/archive/$(ORTP_VERSION)
-ORTP_LICENSE = GPL-3.0+
-ORTP_LICENSE_FILES = LICENSE.txt
-ORTP_INSTALL_STAGING = YES
-ORTP_DEPENDENCIES = bctoolbox
-ORTP_CONF_OPTS = \
-	-DENABLE_DOC=OFF \
-	-DENABLE_STRICT=OFF
-
-ifeq ($(BR2_STATIC_LIBS),y)
-ORTP_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-ORTP_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-ORTP_CONF_OPTS += -DENABLE_STATIC=OFF -DENABLE_SHARED=ON
-endif
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
