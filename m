Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499A5C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 07:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAA6D60AC1;
	Sat,  5 Nov 2022 07:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAA6D60AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEF1sCs5MD8s; Sat,  5 Nov 2022 07:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9C6360A9C;
	Sat,  5 Nov 2022 07:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9C6360A9C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D958E1BF21A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 07:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0B7B4197E
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 07:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0B7B4197E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZTaOPuTnV3i for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 07:52:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 383664197C
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 383664197C
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 07:52:05 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout11.t-online.de (Postfix) with SMTP id 875F9F19
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 08:52:03 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.183.139]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1orDy9-2ZKSwr0; Sat, 5 Nov 2022 08:51:57 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:49282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1orDy8-0002qw-23
 for buildroot@buildroot.org; Sat, 05 Nov 2022 08:51:56 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 08:51:56 +0100
Message-Id: <20221105075156.14160-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667634717-01449CE0-6581CE5B/0/0 CLEAN NORMAL
X-TOI-MSGID: fa7f6c66-89c5-4b7e-8cc3-cb4d52f2e8f7
Subject: [Buildroot] [PATCH 1/1] package/libdcadec: remove package
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

Quoting https://github.com/foo86/dcadec

"This program is deprecated!

 This decoder has been fully integrated into FFmpeg master branch and
 further development will continue there. Using FFmpeg for DTS decoding
 is now recommended."

Fixes:
http://autobuild.buildroot.net/results/1e63586c91a2670ecac2940f6e9840e6801c32f3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                 |  8 ++++++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/libdcadec/Config.in      |  7 -------
 package/libdcadec/libdcadec.hash |  3 ---
 package/libdcadec/libdcadec.mk   | 33 --------------------------------
 6 files changed, 8 insertions(+), 45 deletions(-)
 delete mode 100644 package/libdcadec/Config.in
 delete mode 100644 package/libdcadec/libdcadec.hash
 delete mode 100644 package/libdcadec/libdcadec.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0e63d59a98..7458fa331e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_LIBDCADEC
+	bool "package was deprecated upstream, use ffmpeg instead"
+	select BR2_LEGACY
+	help
+	  This decoder has been fully integrated into FFmpeg master
+	  branch and further development will continue there. Using
+	  FFmpeg for DTS decoding is now recommended.
+
 config BR2_KERNEL_HEADERS_5_17
 	bool "kernel headers version 5.17.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 4750c06b64..f7c6c71e6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -363,7 +363,6 @@ F:	package/libcdio/
 F:	package/libcec/
 F:	package/libcodec2/
 F:	package/libcrossguid/
-F:	package/libdcadec/
 F:	package/libdeflate/
 F:	package/libdrm/
 F:	package/libdvbcsa/
diff --git a/package/Config.in b/package/Config.in
index d14e7473b6..c0ff8c9144 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1787,7 +1787,6 @@ menu "Multimedia"
 	source "package/libbluray/Config.in"
 	source "package/libcamera/Config.in"
 	source "package/libcamera-apps/Config.in"
-	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbpsi/Config.in"
 	source "package/libdvbsi/Config.in"
diff --git a/package/libdcadec/Config.in b/package/libdcadec/Config.in
deleted file mode 100644
index 2687a18187..0000000000
--- a/package/libdcadec/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LIBDCADEC
-	bool "libdcadec"
-	help
-	  dcadec is a free DTS Coherent Acoustics decoder with support
-	  for HD extensions.
-
-	  https://github.com/foo86/dcadec
diff --git a/package/libdcadec/libdcadec.hash b/package/libdcadec/libdcadec.hash
deleted file mode 100644
index 3c3e80e8a3..0000000000
--- a/package/libdcadec/libdcadec.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  ed9d207fde3e8d576f3af8b0d1235b3371e315175757173689104efcaebf0d44  libdcadec-0.2.0.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
deleted file mode 100644
index a3579ad632..0000000000
--- a/package/libdcadec/libdcadec.mk
+++ /dev/null
@@ -1,33 +0,0 @@
-################################################################################
-#
-# libdcadec
-#
-################################################################################
-
-LIBDCADEC_VERSION = 0.2.0
-LIBDCADEC_SITE = $(call github,foo86,dcadec,v$(LIBDCADEC_VERSION))
-LIBDCADEC_LICENSE = LGPL-2.1+
-LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
-LIBDCADEC_INSTALL_STAGING = YES
-
-ifeq ($(BR2_STATIC_LIBS),)
-LIBDCADEC_SHARED = CONFIG_SHARED=1
-endif
-
-define LIBDCADEC_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
-		$(LIBDCADEC_SHARED) -C $(@D)
-endef
-
-define LIBDCADEC_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		$(LIBDCADEC_SHARED) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
-endef
-
-define LIBDCADEC_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		$(LIBDCADEC_SHARED) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
-endef
-
-$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
