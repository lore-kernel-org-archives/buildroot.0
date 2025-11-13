Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077C8CD5BAF
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEEFE60751;
	Thu, 13 Nov 2025 09:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGbuzENT1-wo; Thu, 13 Nov 2025 09:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9BA260DF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9BA260DF1;
	Thu, 13 Nov 2025 09:53:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CAC3230
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E06D40D30
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTambR2yeonF for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47E904057E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47E904057E
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38079845F4; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Nov 2025 10:37:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90e4e80fc38550feb66743a93dce56cded756a1a
X-Git-Newrev: ffa68244171fb16207f61953cfebdff9bb411d5d
X-Patchwork-Hint: ignore
Message-Id: <20251113095342.38079845F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/belle-sip: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffa68244171fb16207f61953cfebdff9bb411d5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

belle-sip was only needed as a dependency of linphone, as is anyway
bundled in more recent versions of linphone, making a separate package
unnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                 |  8 ++++++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/belle-sip/Config.in      | 22 ----------------------
 package/belle-sip/belle-sip.hash |  3 ---
 package/belle-sip/belle-sip.mk   | 40 ----------------------------------------
 6 files changed, 8 insertions(+), 67 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9d1e0a1ff5..10433ccb88 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_BELLE_SIP
+	bool "belle-sip has been removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as part of the linphone
+	  removal. In addition, newer version of linphone directly
+	  bundle belle-sip making a separate package unnecessary.
+
 config BR2_PACKAGE_LINPHONE
 	bool "linphone has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 3307ee9918..358c952d91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1020,7 +1020,6 @@ F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
 F:	package/bearssl/
-F:	package/belle-sip/
 F:	package/belr/
 F:	package/boinc/
 F:	package/cairo/
diff --git a/package/Config.in b/package/Config.in
index 6e25934a28..b21ba89b31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2010,7 +2010,6 @@ menu "Networking"
 	source "package/azmq/Config.in"
 	source "package/azure-iot-sdk-c/Config.in"
 	source "package/batman-adv/Config.in"
-	source "package/belle-sip/Config.in"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/cni-plugins/Config.in"
diff --git a/package/belle-sip/Config.in b/package/belle-sip/Config.in
deleted file mode 100644
index 8e4de366e4..0000000000
--- a/package/belle-sip/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_BELLE_SIP
-	bool "belle-sip"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS # dlfcn.h
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
-	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_BCTOOLBOX
-	# needs crypto support in bctoolbox
-	select BR2_PACKAGE_MBEDTLS
-	help
-	  Belle-sip is a modern library implementing SIP (RFC 3261)
-	  transport, transaction and dialog layers.
-
-	  http://www.linphone.org/technical-corner/belle-sip
-
-comment "belle-sip needs a toolchain w/ threads, C++, dynamic library, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-
-comment "belle-sip needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/belle-sip/belle-sip.hash b/package/belle-sip/belle-sip.hash
deleted file mode 100644
index 670ce0062e..0000000000
--- a/package/belle-sip/belle-sip.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  eabba615c97080572c1b9d3c76f8f9cf6a7432eedf37482672e5fa178a688f72  belle-sip-4.4.8.tar.gz
-sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
deleted file mode 100644
index b4de3612ce..0000000000
--- a/package/belle-sip/belle-sip.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-################################################################################
-#
-# belle-sip
-#
-################################################################################
-
-BELLE_SIP_VERSION = 4.4.8
-BELLE_SIP_SITE = \
-	https://gitlab.linphone.org/BC/public/belle-sip/-/archive/$(BELLE_SIP_VERSION)
-BELLE_SIP_LICENSE = GPL-3.0+
-BELLE_SIP_LICENSE_FILES = LICENSE.txt
-BELLE_SIP_CPE_ID_VENDOR = linphone
-BELLE_SIP_INSTALL_STAGING = YES
-BELLE_SIP_DEPENDENCIES = \
-	bctoolbox \
-	$(if $(BR2_PACKAGE_ZLIB),zlib)
-BELLE_SIP_CONF_OPTS = \
-	-DENABLE_STRICT=OFF \
-	-DENABLE_TESTS=OFF
-
-ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
-BELLE_SIP_CONF_OPTS += -DENABLE_MDNS=ON
-BELLE_SIP_DEPENDENCIES += avahi
-else
-BELLE_SIP_CONF_OPTS += -DENABLE_MDNS=OFF
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
-endif
-
-BELLE_SIP_CFLAGS = $(TARGET_CFLAGS)
-
-BELLE_SIP_CONF_OPTS += -DCMAKE_C_FLAGS="$(BELLE_SIP_CFLAGS)"
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
