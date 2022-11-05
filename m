Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEBDC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 18:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA8A60AE0;
	Sat,  5 Nov 2022 18:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BA8A60AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KitL56QXEo2W; Sat,  5 Nov 2022 18:11:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4989160AAE;
	Sat,  5 Nov 2022 18:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4989160AAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46D4E1BF375
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21D0760AAE
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D0760AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cpEikMqbVorw for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 18:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4563060A94
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 18:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4563060A94
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3294987D5B; Sat,  5 Nov 2022 18:11:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 19:09:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adc1c5d8f14f69a62a2a4260465363ab120816ab
X-Git-Newrev: c6aed2126b9c4cbae2a3f770e6d9029b44daa957
X-Patchwork-Hint: ignore
Message-Id: <20221105181141.3294987D5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdcadec: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6aed2126b9c4cbae2a3f770e6d9029b44daa957
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quoting https://github.com/foo86/dcadec

"This program is deprecated!

 This decoder has been fully integrated into FFmpeg master branch and
 further development will continue there. Using FFmpeg for DTS decoding
 is now recommended."

lbdcadec has had no commit oin the past 7+ years now.

Fixes:
http://autobuild.buildroot.net/results/1e63586c91a2670ecac2940f6e9840e6801c32f3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr: amend commit log with age of last activity]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                 |  8 ++++++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/libdcadec/Config.in      |  7 -------
 package/libdcadec/libdcadec.hash |  3 ---
 package/libdcadec/libdcadec.mk   | 33 ---------------------------------
 6 files changed, 8 insertions(+), 45 deletions(-)

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
index 7d27936992..2613624f4b 100644
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
index 238d7813f0..aef80f9ab0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1785,7 +1785,6 @@ menu "Multimedia"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
