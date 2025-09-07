Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAA6CAC582
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 13:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E638475B;
	Sun,  7 Sep 2025 13:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovFjxaWCp8vD; Sun,  7 Sep 2025 13:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5BBF8474E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5BBF8474E;
	Sun,  7 Sep 2025 13:37:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 067CCCA
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E10878474E
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjakgWErWW6m for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 13:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF9968330B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF9968330B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF9968330B
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6A29A4E40C49
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3E9C46061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5FF82102F1C62; 
 Sun,  7 Sep 2025 15:37:24 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Sep 2025 15:37:12 +0200
Message-ID: <20250907133721.3416326-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
References: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757252244; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=91cfauhguoYs9prLJ75lwp9g+s1HpA9B8n7kk2zkdQU=;
 b=adabTEyu1G1h0b1HnOHPYU5DN5LAhKA40t8P461Jvsdbpndts646TTbKe3zjNsBYIeRPvu
 RrdXOEO81suhfurLaBPYAbkhu58JbQ48ZBnXytanEWgEl+xeEy/fWpFOnE+V58YbyUYKZ5
 9wTUyfLk9Ru6lqpsM+g4f1zeZ6cfXe3w/u0pbXgNSRepJcpJMDY3dFEBRexczlMgnVgdTo
 MPFf+YxrW8Erke+rtpbDOmlcHQ63pVhl8z3OombWamTHgjVzAaXWtswKTy20EHbf7igha1
 5GXQgb66RWA4Q4e2bhP9ciG+wfdestLvk1bIXtMGrxUOeSePc4NXpQA5OxP1yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=adabTEyu
Subject: [Buildroot] [PATCH 1/6] package/linphone: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is no longer maintained in Buildroot: no maintainer in
DEVELOPERS file, and doesn't build since we bumped mbedtls to version
3.x in commit 3481a9643fc7223e400ed877f08ade34d44e6b78, which first
appeared in 2025.05.

Also, upstream linphone has changed their strategy, and now their
specific dependencies (bctoolbox, belle-sip, etc.) are bundled in
linphone, so anyway the packaging needs to be adapted significantly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  8 ++++
 package/Config.in                             |  1 -
 ...re-paths-paths.cpp-fix-powerpc-build.patch | 35 ----------------
 package/linphone/Config.in                    | 41 ------------------
 package/linphone/linphone.hash                |  4 --
 package/linphone/linphone.mk                  | 42 -------------------
 7 files changed, 8 insertions(+), 124 deletions(-)
 delete mode 100644 package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch
 delete mode 100644 package/linphone/Config.in
 delete mode 100644 package/linphone/linphone.hash
 delete mode 100644 package/linphone/linphone.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index fb61258753..a89542365e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -671,7 +671,6 @@ package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
 package/lighttpd/S50lighttpd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch lib_patch.Upstream
 package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch lib_patch.Upstream
-package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch lib_patch.Upstream
 package/linux-zigbee/0001-test-serial-Remove-test-serial.patch lib_patch.Upstream
 package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch lib_patch.Upstream
 package/linuxptp/S65ptp4l Shellcheck lib_sysv.Indent
diff --git a/Config.in.legacy b/Config.in.legacy
index f51177a1ed..27ef1cf430 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_LINPHONE
+	bool "linphone has been removed"
+	select BR2_LEGACY
+	help
+	  This package was no longer maintained in Buildroot and was
+	  no longer building. It can be re-added if someone volunteers
+	  to fix the issues, update the package and maintain it.
+
 config BR2_PACKAGE_NETSTAT_NAT
 	bool "netstat-nat has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index af858ebf11..989cb36d79 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2562,7 +2562,6 @@ endif
 	source "package/lighttpd/Config.in"
 	source "package/linknx/Config.in"
 	source "package/links/Config.in"
-	source "package/linphone/Config.in"
 	source "package/linux-zigbee/Config.in"
 	source "package/linuxptp/Config.in"
 	source "package/lldpd/Config.in"
diff --git a/package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch b/package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch
deleted file mode 100644
index 1655fa59a1..0000000000
--- a/package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d5d528e7562f358b9564e64cea0678020c51479a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 15 Mar 2020 18:56:19 +0100
-Subject: [PATCH] src/core/paths/paths.cpp: fix powerpc build
-
-Fix the following build failure on powerpc:
-
-/home/test/autobuild/run/instance-2/output-1/build/linphone-4.3.1/src/core/paths/paths.cpp:32:3: error: #error "Unsupported system."
-  #error "Unsupported system."
-   ^~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/d90bca02c2771df8dfbf39892d529fb5f9069656
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/core/paths/paths.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/paths/paths.cpp b/src/core/paths/paths.cpp
-index 0442282fe..2c6508a51 100644
---- a/src/core/paths/paths.cpp
-+++ b/src/core/paths/paths.cpp
-@@ -26,7 +26,7 @@
- 	#include "paths-android.h"
- #elif defined(_WIN32)
- 	#include "paths-windows.h"
--#elif defined(__linux)
-+#elif defined(__linux) || defined(__linux__)
- 	#include "paths-linux.h"
- #else
- 	#error "Unsupported system."
--- 
-2.25.1
-
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
deleted file mode 100644
index 3fe25c1659..0000000000
--- a/package/linphone/Config.in
+++ /dev/null
@@ -1,41 +0,0 @@
-config BR2_PACKAGE_LINPHONE
-	bool "linphone"
-	depends on BR2_USE_MMU
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS # belle-sip, mediastreamer
-	depends on BR2_TOOLCHAIN_HAS_THREADS # belr, belle-sip, mediastreamer
-	# belr, belle-sip, mediastreamer
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	depends on BR2_USE_WCHAR # belle-sip
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # mediastreamer
-	select BR2_PACKAGE_BELLE_SIP
-	select BR2_PACKAGE_BELR
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_MEDIASTREAMER
-	select BR2_PACKAGE_SQLITE
-	help
-	  Linphone is an internet phone or Voice Over IP phone (VoIP).
-
-	  With linphone you can communicate freely with people over
-	  the internet, with voice, video, and text instant messaging.
-	  Linphone makes use of the SIP protocol, an open standard
-	  for internet telephony. You can use Linphone with any SIP
-	  VoIP operator, including our free SIP audio/video service.
-	  linphone is free-software (or open-source), you can download
-	  and redistribute it freely.
-	  Linphone is available for desktop computers: Linux, Windows,
-	  MacOSX, and for mobile phones: Android, iPhone, Blackberry.
-
-	  Linphone support in Buildroot is limited to the commandline
-	  client, linphonec, and video support is not enabled.
-
-	  http://www.linphone.org/
-
-comment "linphone needs a toolchain w/ threads, C++, dynamic library, wchar, gcc >= 5"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
-comment "linphone needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/linphone/linphone.hash b/package/linphone/linphone.hash
deleted file mode 100644
index 6d456ac9c9..0000000000
--- a/package/linphone/linphone.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  9956f6785a787041328da000cee5fcc1e41d6f17956ffe5e0402fac0f9a9676b  linphone-4.4.8.tar.gz
-# Locally computed
-sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
deleted file mode 100644
index bb79e2f782..0000000000
--- a/package/linphone/linphone.mk
+++ /dev/null
@@ -1,42 +0,0 @@
-################################################################################
-#
-# linphone
-#
-################################################################################
-
-LINPHONE_VERSION = 4.4.8
-LINPHONE_SITE = \
-	https://gitlab.linphone.org/BC/public/liblinphone/-/archive/$(LINPHONE_VERSION)
-LINPHONE_CONF_OPTS = \
-	-DENABLE_ADVANCED_IM=OFF \
-	-DENABLE_CXX_WRAPPER=OFF \
-	-DENABLE_DB_STORAGE=OFF \
-	-DENABLE_LIME=OFF \
-	-DENABLE_LIME_X3DH=OFF \
-	-DENABLE_STRICT=OFF \
-	-DENABLE_TOOLS=OFF \
-	-DENABLE_TUTORIALS=OFF \
-	-DENABLE_UNIT_TESTS=OFF \
-	-DENABLE_VCARD=OFF \
-	-DENABLE_VIDEO=OFF \
-	-DGIT_EXECUTABLE=OFF
-LINPHONE_INSTALL_STAGING = YES
-LINPHONE_DEPENDENCIES = \
-	belle-sip \
-	belr \
-	libxml2 \
-	mediastreamer \
-	sqlite \
-	$(if $(BR2_PACKAGE_ZLIB),zlib)
-LINPHONE_LICENSE = GPL-3.0+
-LINPHONE_LICENSE_FILES = LICENSE.txt
-
-ifeq ($(BR2_STATIC_LIBS),y)
-LINPHONE_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LINPHONE_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-LINPHONE_CONF_OPTS += -DENABLE_STATIC=OFF -DENABLE_SHARED=ON
-endif
-
-$(eval $(cmake-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
