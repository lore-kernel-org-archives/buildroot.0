Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0DBCA1017
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 13:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF44360D7A;
	Sun,  7 Sep 2025 13:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNlbBC3QN1FV; Sun,  7 Sep 2025 13:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3D0061BB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3D0061BB5;
	Sun,  7 Sep 2025 13:37:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B3E39E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7234240731
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5QsykJD14yI for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 13:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 441E24021B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 441E24021B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 441E24021B
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 52BFE4E40C4A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D1BF6061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:37:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9186E102F1D00; 
 Sun,  7 Sep 2025 15:37:25 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Sep 2025 15:37:13 +0200
Message-ID: <20250907133721.3416326-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
References: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757252245; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Y2wtOD/8CK9bsF82HeVJb+aXE7sWzAPhRAkFpsoVZ8k=;
 b=NwucTI6n999zlYJwPIQgznZzebWquP2HMqNTyr1FuNeJ4yq2qS0IQxuxxWMr8nYqQuXJz0
 Cg+3nMdf3Zqi1Gfa46Bl10cV0WGr5rOOIZahI6tEptyDzZ5k/txUwuCpZtZXd0tsULjvvA
 so5AX9NnQvJpj3N8q9eQZ8IbiTPOIO2A0L0k0O639fJhN2E1NtzC8qCKuTSNZ2xIfMD8Lh
 3IxOaoaHNvzsYywHsE2r0xHSMy2hROkZqY87oehsCk1XfIb4IkXeZPGggk3b+FFfO40ihM
 asVxrdcCHosmJ8L7tF9rhQ28KndwnsbE4Kv5KyMfBxstcw9qDSDb34qiHL/UUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=NwucTI6n
Subject: [Buildroot] [PATCH 2/6] package/belle-sip: remove package
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

belle-sip was only needed as a dependency of linphone, as is anyway
bundled in more recent versions of linphone, making a separate package
unnnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                 |  8 +++++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/belle-sip/Config.in      | 22 ------------------
 package/belle-sip/belle-sip.hash |  3 ---
 package/belle-sip/belle-sip.mk   | 40 --------------------------------
 6 files changed, 8 insertions(+), 67 deletions(-)
 delete mode 100644 package/belle-sip/Config.in
 delete mode 100644 package/belle-sip/belle-sip.hash
 delete mode 100644 package/belle-sip/belle-sip.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 27ef1cf430..d2f2684673 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
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
index 32d7c8ac61..2c188d8dca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1012,7 +1012,6 @@ F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
 F:	package/bearssl/
-F:	package/belle-sip/
 F:	package/belr/
 F:	package/boinc/
 F:	package/cairo/
diff --git a/package/Config.in b/package/Config.in
index 989cb36d79..17cc0288e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2023,7 +2023,6 @@ menu "Networking"
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
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
