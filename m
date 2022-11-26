Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D998EC43217
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 00:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C60380FB6;
	Sat, 26 Nov 2022 00:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C60380FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiGw_pZHBRlC; Sat, 26 Nov 2022 00:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54FED80B5C;
	Sat, 26 Nov 2022 00:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54FED80B5C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 457871BF964
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 00:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DB0C60590
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 00:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB0C60590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5UZ5YfQnPIi for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 00:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF71600CC
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EF71600CC
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 00:38:27 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-69d6476965-648qd
 (smtpc-mxd-69d6476965-648qd [2a02:598:64:8a00::1000:4fd])
 id 17f44162a1d4fe3917f3ff15; Sat, 26 Nov 2022 01:38:16 +0100 (CET)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by email-relay19.ng.seznam.cz (Seznam SMTPD 1.3.140) with ESMTP;
 Sat, 26 Nov 2022 01:38:13 +0100 (CET)  
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 01:38:07 +0100
Message-Id: <20221126003807.462157-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=szn20221014; t=1669423096;
 bh=UJzY7HZ8JIAeujp0MCyCIb4QMoZd7TeCDkUe2eoxhnE=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=YNbhWdqsN39T72BbwxxHYesNEAUQ9ddcfE83+j/1JpBc2dVYzvNQTPY01D10ugC4P
 GxG0EZshJ2mgwGUREVCe7/bez0FClGZoCR1mCrbZr6wYXTLgAbVhtWYbAGAOIxpTB6
 YCfc2sX0tH2OmIO14QHxyO5YhbvscmXQSRLYXWAIMNg3Gc3C80QjQ1lYqKzZfrME0K
 KsKdDBu788RmXT2BpR/JeCkoY7DSulwg35SfVgBTrmCMmeTWFwqE2DyLN5XLIHcM0a
 p1fAoCe04hR6r57MNmWBAhwZ3+LyDS1x6iU5WaEHeocOV2m9HblDgOg4rrvwnECzYo
 +H049fL6MkWTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=szn20221014 header.b=YNbhWdqs
Subject: [Buildroot] [PATCH 1/1] package/iputils: bump version to 20221126
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

This release removed: ninfod, rarpd, rdisc
=> add entries to Config.in.legacy.

LICENSE file got updated (just to use SPDX)
=> update checksum.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 Config.in.legacy             | 24 ++++++++++++++++++++++++
 package/iputils/Config.in    | 25 -------------------------
 package/iputils/iputils.hash |  6 +++---
 package/iputils/iputils.mk   |  9 ++-------
 4 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b3c35d6b07..6d20092ca4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,30 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_IPUTILS_NINFOD
+	bool "iputils 20221126 removed ninfod"
+	select BR2_LEGACY
+	help
+	  iputils 20221126 removed ninfod.
+
+config BR2_PACKAGE_IPUTILS_RARPD
+	bool "iputils 20221126 removed rarpd"
+	select BR2_LEGACY
+	help
+	  iputils 20221126 removed rarpd.
+
+config BR2_PACKAGE_IPUTILS_RDISC
+	bool "iputils 20221126 removed rdisc"
+	select BR2_LEGACY
+	help
+	  iputils 20221126 removed rdisc.
+
+config BR2_PACKAGE_IPUTILS_RDISC_SERVER
+	bool "iputils 20221126 removed rdisc"
+	select BR2_LEGACY
+	help
+	  iputils 20221126 removed rdisc.
+
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
 	bool "libopenssl rc5 was never enabled"
 	select BR2_LEGACY
diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index 1a8b555570..ec7bc5418d 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -28,37 +28,12 @@ config BR2_PACKAGE_IPUTILS_PING
 	help
 	  Installs ping.
 
-config BR2_PACKAGE_IPUTILS_RARPD
-	bool "rarpd"
-	help
-	  Installs rarpd.
-
-config BR2_PACKAGE_IPUTILS_RDISC
-	bool "rdisc"
-	default y
-	help
-	  Installs rdisc.
-
-config BR2_PACKAGE_IPUTILS_RDISC_SERVER
-	bool "rdisc (server code)"
-	default y
-	depends on BR2_PACKAGE_IPUTILS_RDISC
-	help
-	  Builds rdisc with server code.
-
 config BR2_PACKAGE_IPUTILS_TRACEPATH
 	bool "tracepath"
 	default y
 	help
 	  Installs tracepath.
 
-config BR2_PACKAGE_IPUTILS_NINFOD
-	bool "ninfod"
-	default y
-	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
-	help
-	  Installs ninfod.
-
 comment "ninfod needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index db52d990f2..ea23f27f3c 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,6 +1,6 @@
-# https://github.com/iputils/iputils/releases/download/20211215/sha256sum.asc
-sha256  b6f67fc705490673ff4471d006221b4a2f1b1180b929d9fefd771352621ccedf  iputils-20211215.tar.gz
+# https://github.com/iputils/iputils/releases/download/20221126/sha256sum.asc
+sha256  745ea711fe06d5c57d470d21acce3c3ab866eb6afb69379a16c6d60b89bd4311  iputils-20221126.tar.gz
 # Locally computed
-sha256  973281334c2da6364fa6bdc44c1f0f8d60d80d73c782982ffc5d53b0a31aa042  LICENSE
+sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/LICENSE.GPL2
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 84059de330..fe4468ec19 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,7 +11,7 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = 20211215
+IPUTILS_VERSION = 20221126
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
@@ -21,19 +21,14 @@ IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # Selectively build binaries
 IPUTILS_CONF_OPTS += \
 	-DBUILD_CLOCKDIFF=$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),true,false) \
-	-DBUILD_RARPD=$(if $(BR2_PACKAGE_IPUTILS_RARPD),true,false) \
-	-DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
-	-DENABLE_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
 	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
-	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
 	-DSKIP_TESTS=true
 
 # Selectively select the appropriate SELinux refpolicy modules
 IPUTILS_SELINUX_MODULES = \
 	$(if $(BR2_PACKAGE_IPUTILS_ARPING),netutils) \
 	$(if $(BR2_PACKAGE_IPUTILS_PING),netutils) \
-	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils) \
-	$(if $(BR2_PACKAGE_IPUTILS_RDISC),rdisc)
+	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils)
 
 #
 # arping
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
