Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC81C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 14:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE8DF408F6;
	Tue, 26 Dec 2023 14:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE8DF408F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOBNQSidC_zy; Tue, 26 Dec 2023 14:00:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA7DE40894;
	Tue, 26 Dec 2023 14:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA7DE40894
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96CD11BF228
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70068801EC
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70068801EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIK7qq1vuQQd for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:59:46 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 035A181398
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 035A181398
Received: by mail.gandi.net (Postfix) with ESMTPA id 7F174E0002;
 Tue, 26 Dec 2023 13:59:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 14:59:40 +0100
Message-ID: <20231226135941.2784505-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226135941.2784505-1-thomas.petazzoni@bootlin.com>
References: <20231226135941.2784505-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703599184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yAZTDURgKESwO3KXbz9U7GtKiYULkSyltVDkgAIT3TE=;
 b=XI1nSM+0lr32z//VC2lX1fbA8CtiNKphCthqtEiWV5eZGsveZNipFtpvRACGEaX6vhgRat
 wlrDL3SR0jsDqkGu5WGvrMZmrBAge7l9Yx/0Y3nu1ZfNviNe8SwNIEu35kAw6ODdK3kJhn
 WE5BDuVSWW/ZcErnQpHZlhRaUywMcmTcy+iTKHivVM2iTHUIZdM/tYkvfpBPGIxcsH8/AT
 lsO5MxDmSneLMQyTgD+o1QUUP1aYgs4zruOaKsngMTtb7TLOcUzFXlG2z2mra96Q+jjyq7
 fFnAjG0Idmj/g/W0jD2ccP7VLE5fvhnju1WbLqc2ClFXJpyDEJ7HQOiyL19+1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XI1nSM+0
Subject: [Buildroot] [PATCH v2 2/2] package/libmpd: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the removal of gmpc, we can drop libmpd as well, which was
apparently developed/maintained by the same group of people. The URL
in Config.in, http://gmpcwiki.sarine.nl/index.php?title=Libmpd, no
longer works, and no new alternative upstream was found.

The reference MPD client library is libmpdclient, which is still
maintained.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  7 ++++++
 package/Config.in                             |  1 -
 ...x-build-on-archlinux-missing-include.patch | 24 -------------------
 package/libmpd/Config.in                      | 17 -------------
 package/libmpd/libmpd.hash                    |  3 ---
 package/libmpd/libmpd.mk                      | 15 ------------
 7 files changed, 7 insertions(+), 61 deletions(-)
 delete mode 100644 package/libmpd/0001-Fix-build-on-archlinux-missing-include.patch
 delete mode 100644 package/libmpd/Config.in
 delete mode 100644 package/libmpd/libmpd.hash
 delete mode 100644 package/libmpd/libmpd.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 0868593a92..4e6c688380 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -685,7 +685,6 @@ package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch Upstre
 package/libmng/0001-jpeg-9a.patch Upstream
 package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch Upstream
 package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch Upstream
-package/libmpd/0001-Fix-build-on-archlinux-missing-include.patch Upstream
 package/libmpeg2/0001-altivec.patch Upstream
 package/libmpeg2/0002-armv4l.patch Upstream
 package/libmpeg2/0003-fix-arm-detection.patch Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 0ab9dcadff..5916cb4fae 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_LIBMPD
+	bool "libmpd package was removed"
+	select BR2_LEGACY
+	help
+	  The libmpd package was only used by gmpc, both of which are
+	  no longer maintained upstream.
+
 config BR2_PACKAGE_GMPC
 	bool "gmpc package was removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 34efaf29e5..95eabd9d5f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1467,7 +1467,6 @@ menu "Audio/Sound"
 	source "package/liblo/Config.in"
 	source "package/libmad/Config.in"
 	source "package/libmodplug/Config.in"
-	source "package/libmpd/Config.in"
 	source "package/libmpdclient/Config.in"
 	source "package/libreplaygain/Config.in"
 	source "package/libsamplerate/Config.in"
diff --git a/package/libmpd/0001-Fix-build-on-archlinux-missing-include.patch b/package/libmpd/0001-Fix-build-on-archlinux-missing-include.patch
deleted file mode 100644
index be16eb9713..0000000000
--- a/package/libmpd/0001-Fix-build-on-archlinux-missing-include.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 4f946c01000fd97100e4a534b47f9c7ace0403df Mon Sep 17 00:00:00 2001
-From: QC <qball@gmpclient.org>
-Date: Thu, 9 Oct 2014 19:51:50 +0200
-Subject: [PATCH] Fix build on archlinux (missing include)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/DaveDavenport/libmpd/commit/4f946c01000fd97100e4a534b47f9c7ace0403df]
----
- src/libmpd-internal.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libmpd-internal.h b/src/libmpd-internal.h
-index c84c3a4..30cdc85 100644
---- a/src/libmpd-internal.h
-+++ b/src/libmpd-internal.h
-@@ -21,6 +21,7 @@
- #define __MPD_INTERNAL_LIB_
- 
- #include "libmpdclient.h"
-+#include <config.h>
- struct _MpdData_real;
- 
- typedef struct _MpdData_real {
diff --git a/package/libmpd/Config.in b/package/libmpd/Config.in
deleted file mode 100644
index 1e3b860063..0000000000
--- a/package/libmpd/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_PACKAGE_LIBMPD
-	bool "libmpd"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  High-level client library for accessing Music Player Daemon.
-	  LibMpd is a library that provides high-level, callback-based
-	  access to Music Player Daemon (mpd).
-
-	  http://gmpcwiki.sarine.nl/index.php?title=Libmpd
-
-comment "libmpd needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmpd/libmpd.hash b/package/libmpd/libmpd.hash
deleted file mode 100644
index 875eba2b05..0000000000
--- a/package/libmpd/libmpd.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83  libmpd-11.8.17.tar.gz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
deleted file mode 100644
index 2aa7ff7e05..0000000000
--- a/package/libmpd/libmpd.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# libmpd
-#
-################################################################################
-
-LIBMPD_VERSION_MAJOR = 11.8
-LIBMPD_VERSION = $(LIBMPD_VERSION_MAJOR).17
-LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/$(LIBMPD_VERSION_MAJOR)
-LIBMPD_INSTALL_STAGING = YES
-LIBMPD_DEPENDENCIES = libglib2
-LIBMPD_LICENSE = GPL-2.0+
-LIBMPD_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
