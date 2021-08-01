Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B59C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:07:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C7B61054
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04C7B61054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 974A1415CA;
	Sun,  1 Aug 2021 06:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNXixzgcdeNa; Sun,  1 Aug 2021 06:07:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EAA840485;
	Sun,  1 Aug 2021 06:07:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E23F41BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8591605F8
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M3JBOfcbik9P for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 06:07:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CBF4605F1
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 06:07:00 +0000 (UTC)
Received: from fwd35.aul.t-online.de (fwd35.aul.t-online.de [172.20.27.145])
 by mailout09.t-online.de (Postfix) with SMTP id 0EC8E10D57
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:06:58 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (r3Q8CgZAQhBdVVKclMCOUQTL2ZGsElt-So9zo-cPiOYhbXyx00v8rvjDZDYQRSdQnx@[79.214.201.246])
 by fwd35.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mA4ce-0qJPrU0; Sun, 1 Aug 2021 08:06:52 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:34088)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mA4cd-0000OQ-Oa
 for buildroot@buildroot.org; Sun, 01 Aug 2021 08:06:52 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 08:06:51 +0200
Message-Id: <20210801060651.3002-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: r3Q8CgZAQhBdVVKclMCOUQTL2ZGsElt-So9zo-cPiOYhbXyx00v8rvjDZDYQRSdQnx
X-TOI-EXPURGATEID: 150726::1627798012-0000C8B5-1D1517D0/0/0 CLEAN NORMAL
X-TOI-MSGID: 708ff342-3dc8-463f-94eb-2c467c67129b
Subject: [Buildroot] [PATCH 1/1] package/libsoil: remove package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

All kodi screensavers previously needing libsoil removed the dependency.

For reference:
https://github.com/xbmc/screensaver.matrixtrails/commit/92a0d44e9151cfce3be74e81a3e39f0688d69b7a
https://github.com/xbmc/screensaver.asterwave/commit/8a778873754de09c93031408c71b3c40d198f3bc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                        |  7 ++++
 DEVELOPERS                              |  1 -
 package/Config.in                       |  1 -
 package/libsoil/0001-fix-makefile.patch | 40 --------------------
 package/libsoil/Config.in               | 12 ------
 package/libsoil/libsoil.hash            |  4 --
 package/libsoil/libsoil.mk              | 50 -------------------------
 7 files changed, 7 insertions(+), 108 deletions(-)
 delete mode 100644 package/libsoil/0001-fix-makefile.patch
 delete mode 100644 package/libsoil/Config.in
 delete mode 100644 package/libsoil/libsoil.hash
 delete mode 100644 package/libsoil/libsoil.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 5233785209..399e916a4f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.08"
 
+BR2_PACKAGE_LIBSOIL
+	bool "libsoil package removed"
+	select BR2_LEGACY
+	help
+	  The libsoil package was removed. All packages needing
+	  libsoil removed the dependency.
+
 config BR2_PACKAGE_CLAPACK
 	bool "cblas/clapack package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index adfcc96059..114e133e94 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -387,7 +387,6 @@ F:	package/libpng/
 F:	package/libsidplay2/
 F:	package/libsilk/
 F:	package/libsndfile/
-F:	package/libsoil/
 F:	package/libsoundtouch/
 F:	package/libsquish/
 F:	package/libudfread/
diff --git a/package/Config.in b/package/Config.in
index 5066690a81..09cac91fb0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1512,7 +1512,6 @@ menu "Graphics"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
 	source "package/librsvg/Config.in"
-	source "package/libsoil/Config.in"
 	source "package/libsvg/Config.in"
 	source "package/libsvg-cairo/Config.in"
 	source "package/libsvgtiny/Config.in"
diff --git a/package/libsoil/0001-fix-makefile.patch b/package/libsoil/0001-fix-makefile.patch
deleted file mode 100644
index 310d26448b..0000000000
--- a/package/libsoil/0001-fix-makefile.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Various makefile fixes to allow cross compilation
-
-Partly ported from
-http://anonscm.debian.org/cgit/pkg-games/libsoil.git/tree/debian/patches/linking_correctly.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr soil.org/projects/makefile/alternate_Makefile.txt soil/projects/makefile/alternate_Makefile.txt
---- soil.org/projects/makefile/alternate_Makefile.txt	2008-07-07 18:13:28.000000000 +0200
-+++ soil/projects/makefile/alternate_Makefile.txt	2015-11-07 11:15:04.140106336 +0100
-@@ -1,8 +1,8 @@
- MAKE = make
--CC = gcc
--INSTALL_FILE = install -p -o root -g root -m 644
--INSTALL_DIR = install -p -o root -g root -d
--LN = ln -s
-+CC = $(GCC)
-+INSTALL_FILE = $(INSTALL) -m 644
-+INSTALL_DIR = $(INSTALL) -d
-+LN = ln -sf
- RM = rm -fv
- CFLAGS += -c -O2 -Wall
- LDFLAGS +=
-@@ -23,13 +23,13 @@
- all: $(OFILES) lib
- 
- %.o: %.c
--	$(CC) $(CFLAGS) $< -o $@
-+	$(CC) $(CFLAGS) -c -fPIC $< -o $@
- 
- lib: $(OFILES)
- 	# create static library
--	ar -cvq $(LIBNAME).a $(OFILES)
-+	$(AR) -cvq $(LIBNAME).a $(OFILES)
- 	# create shared library
--	gcc -shared -Wl,-soname,$(LIBNAME).so.$(MAJOR) -o $(LIBNAME).so.$(VERSION) $(OFILES)
-+	$(CC) -shared -Wl,-soname,$(LIBNAME).so.$(MAJOR) -o $(LIBNAME).so.$(VERSION) $(OFILES) -lGL -lm
- 
- install:
- 	$(INSTALL_DIR) $(DESTDIR)/$(INCLUDEDIR)
diff --git a/package/libsoil/Config.in b/package/libsoil/Config.in
deleted file mode 100644
index aea0cc3548..0000000000
--- a/package/libsoil/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_LIBSOIL
-	bool "libsoil"
-	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on !BR2_STATIC_LIBS
-	help
-	  SOIL is a tiny C library used primarily for uploading
-	  textures into OpenGL.
-
-	  http://www.lonesock.net/soil.html
-
-comment "libsoil needs an OpenGL backend and a toolchain w/ dynamic library"
-	depends on !BR2_PACKAGE_HAS_LIBGL || BR2_STATIC_LIBS
diff --git a/package/libsoil/libsoil.hash b/package/libsoil/libsoil.hash
deleted file mode 100644
index 2596cd6b4d..0000000000
--- a/package/libsoil/libsoil.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated
-sha256  a2305b8d64f6d636e36d669bbdb0ca5445d1345c754b3d61d3f037dad2e5f701  soil.zip
-sha256  a53f0508cafb544aa0b11c241c1000055bd9d827d19712f4de08898e36f29728  src/stb_image_aug.c
-sha256  449ba815b6f610660515246d029f5d08b45178fe8f9f9f520939edad85a7935e  src/image_helper.c
diff --git a/package/libsoil/libsoil.mk b/package/libsoil/libsoil.mk
deleted file mode 100644
index 2945edd8dd..0000000000
--- a/package/libsoil/libsoil.mk
+++ /dev/null
@@ -1,50 +0,0 @@
-################################################################################
-#
-# libsoil
-#
-################################################################################
-
-LIBSOIL_VERSION = 20080707
-LIBSOIL_SOURCE = soil.zip
-LIBSOIL_SITE = http://www.lonesock.net/files
-LIBSOIL_INSTALL_STAGING = YES
-LIBSOIL_DEPENDENCIES = libgl
-LIBSOIL_LICENSE = Public Domain, MIT
-LIBSOIL_LICENSE_FILES = src/stb_image_aug.c src/image_helper.c
-LIBSOIL_MAKEFILE = ../projects/makefile/alternate_Makefile.txt
-
-define LIBSOIL_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(LIBSOIL_DL_DIR)/$(LIBSOIL_SOURCE)
-	mv $(@D)/Simple\ OpenGL\ Image\ Library/* $(@D)
-endef
-
-# gnu patch < v2.5.9 doesn't correctly handle spaces in file names,
-# and we want to patch the 'alternate Makefile.txt' file, so rename
-# the file (and patch the renamed file) for compatibility with older
-# distributions
-define REMOVE_SPACE_FROM_FILENAME
-	cd $(@D)/projects/makefile/ && \
-		mv "alternate Makefile.txt" alternate_Makefile.txt
-endef
-LIBSOIL_POST_EXTRACT_HOOKS += REMOVE_SPACE_FROM_FILENAME
-
-define LIBSOIL_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
-		-C $(@D)/src
-endef
-
-define LIBSOIL_INSTALL_STAGING_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
-		DESTDIR=$(STAGING_DIR) install \
-		INSTALL=$(INSTALL) \
-		-C $(@D)/src
-endef
-
-define LIBSOIL_INSTALL_TARGET_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
-		DESTDIR=$(TARGET_DIR) install \
-		INSTALL=$(INSTALL) \
-		-C $(@D)/src
-endef
-
-$(eval $(generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
