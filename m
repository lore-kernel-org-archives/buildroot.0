Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9443DC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 16:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44ACE606B0;
	Tue, 26 Dec 2023 16:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44ACE606B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86KZrMgOYKJA; Tue, 26 Dec 2023 16:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E127606F5;
	Tue, 26 Dec 2023 16:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E127606F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D47AD1BF3B0
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE2AF812DE
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE2AF812DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bexnghK4O-ef for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 16:33:34 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CC8780FA1
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 16:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC8780FA1
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d4103aed7so55079215e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 08:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703608412; x=1704213212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C1/agb+6wQmGOZah5MDgOU4z66cKRuLLwolQsnwonXA=;
 b=f/WbEJAWkhpJ0yrS5a3WQmbEdR3NZyjuwxqVnQojqf7tlU/ScdY/aFPOAg5VAGW00y
 2UARZ32fYzuU2UShKy8mxH5AKTpHfbFTWM6LhOaMgFhC82ElMOJjkR74vcHvEg+4uQ32
 VEV9R34S3n6xU4FPRPHgGvM4HxJyaX+cWgq5wTZYGMtIAnr0lQJyTmarmV4EcpwjlRRM
 PiiTF2ogHU2ez1IbCxRB/k5A2fb41SvA0grfyvG1kkv6jh/828DoUMpbDuLupXGI5xJ3
 Ccuk7sZpvu6EQWhOA9GnS1JcIkH3LlFn/YhFoX/ccuZrI99+uC88nGF1KITSnmsEBgUU
 8fNQ==
X-Gm-Message-State: AOJu0YzAwlXUQ7Ceau/zGcVFzZudJ6TaT9OuoCCd0x2Rsz4B2sTWS/vq
 t69JRXyQI5G+nTvFvRJ4qeVyUt06iqE=
X-Google-Smtp-Source: AGHT+IFjgQlUfvs/uZFh9ziZ0hdYphzkrqEf9MrQ3LTiAAwNMd+9gJVbtAGceeU0ELXw6NEuZTsLjg==
X-Received: by 2002:a05:600c:4ec7:b0:40d:593c:b2c2 with SMTP id
 g7-20020a05600c4ec700b0040d593cb2c2mr998507wmq.159.1703608411415; 
 Tue, 26 Dec 2023 08:33:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i2-20020a05600c354200b0040d5ac00dc6sm2370837wmq.8.2023.12.26.08.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 08:33:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 17:32:19 +0100
Message-ID: <20231226163219.769637-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703608412; x=1704213212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1/agb+6wQmGOZah5MDgOU4z66cKRuLLwolQsnwonXA=;
 b=nYnH+iRLCjiLVfVq0VsxZApCi1+cISKFY0BZ/8l0nQI0wErXfh8/KWB96BOoQCSPYG
 Ui1RlgR9GoHIVtumRTM5DQkdg8xvPGiJE6QrfqDXxa6hQu1ZIZy7fTiI3o+BArhu4UDy
 h7DJ1WnnqI9YqDjm60U0IVnoKps0Xga7amiLCJiDNU4pw+4KZqDBfSKe3G5F/enZjI5t
 s/TaRguA0uhvsNypwlJ/d8j9SobjrbBGCfb4TXa2Rdzgb1TIJPjkjQukfFKZqbs/HhDh
 KDQiDM0GrvEV/ljlonQJLnYDzbljqFVmEbXiwloyBQEMJ6Stt1kehL+glVyvo9j7Wvfn
 sO7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nYnH+iRL
Subject: [Buildroot] [PATCH 1/1] package/motion: bump to version 4.6.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

https://github.com/Motion-Project/motion/releases/tag/release-4.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/motion/0001-Gettext-0-22.patch        | 164 ------------------
 ...Include-libwebp-when-WEBP-is-enabled.patch |  26 ---
 package/motion/motion.hash                    |   2 +-
 package/motion/motion.mk                      |   2 +-
 4 files changed, 2 insertions(+), 192 deletions(-)
 delete mode 100644 package/motion/0001-Gettext-0-22.patch
 delete mode 100644 package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch

diff --git a/package/motion/0001-Gettext-0-22.patch b/package/motion/0001-Gettext-0-22.patch
deleted file mode 100644
index aeacd0e2ec..0000000000
--- a/package/motion/0001-Gettext-0-22.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 2d8d68cfcc1cf4fc8861671e185fdf235dcf9740 Mon Sep 17 00:00:00 2001
-From: David Seifert <16636962+SoapGentoo@users.noreply.github.com>
-Date: Fri, 30 Jun 2023 05:37:50 +0200
-Subject: [PATCH] Gettext 0.22 (#1681)
-
-* po: fix gettext 0.22 format specifier
-
-Bug: https://bugs.gentoo.org/908965
-Bug: https://savannah.gnu.org/bugs/index.php?64334#comment1
-
-* Autotools: fix `make distcheck`
-
-* use correct `dist_` specifiers for including files in tarball
-* do not override `docdir`, since this is a user variable
-* include headers in tarball
-
-Upstream: https://github.com/Motion-Project/motion/commit/2d8d68cfcc1cf4fc8861671e185fdf235dcf9740
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile.am     | 11 +++++------
- configure.ac    |  1 -
- man/Makefile.am |  1 -
- po/de.po        |  2 +-
- po/fi.po        |  2 +-
- src/Makefile.am | 52 ++++++++++++++++++++++++++++++++++++-------------
- 6 files changed, 46 insertions(+), 23 deletions(-)
- delete mode 100644 man/Makefile.am
-
-diff --git a/Makefile.am b/Makefile.am
-index 3d2f968e2..5ae03cd2c 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,19 +1,18 @@
- ACLOCAL_AMFLAGS = -I m4
- 
--SUBDIRS = src po man
-+SUBDIRS = src po
- 
--sysconfdir = @sysconfdir@/$(PACKAGE)
--sysconf_DATA = \
-+pkgsysconfdir = $(sysconfdir)/@PACKAGE@
-+dist_pkgsysconf_DATA = \
- 	data/motion-dist.conf \
- 	data/camera1-dist.conf \
- 	data/camera2-dist.conf \
- 	data/camera3-dist.conf \
- 	data/camera4-dist.conf
- 
--man_MANS = man/motion.1
-+dist_man_MANS = man/motion.1
- 
--docdir = $(datadir)/doc/@PACKAGE@
--doc_DATA = \
-+dist_doc_DATA = \
- 	doc/mask1.png \
- 	doc/normal.jpg \
- 	doc/outputmotion1.jpg  \
-diff --git a/configure.ac b/configure.ac
-index dfcf5eae2..ce588f65b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -496,7 +496,6 @@ AC_CONFIG_FILES([
- 	Makefile
- 	src/Makefile
-   po/Makefile.in
--  man/Makefile
-   data/camera1-dist.conf
-   data/camera2-dist.conf
-   data/camera3-dist.conf
-diff --git a/man/Makefile.am b/man/Makefile.am
-deleted file mode 100644
-index 14aa069f0..000000000
---- a/man/Makefile.am
-+++ /dev/null
-@@ -1 +0,0 @@
--man_MANS = motion.1
-\ No newline at end of file
-diff --git a/po/de.po b/po/de.po
-index 9142c9195..ccd5f09d7 100644
---- a/po/de.po
-+++ b/po/de.po
-@@ -3458,7 +3458,7 @@ msgstr "Sprache: Deutsch"
- #: src/util.c
- #, c-format
- msgid "Could not allocate %llu bytes of memory!"
--msgstr "%Llu Bytes Speicher konnten nicht zugeordnet werden!"
-+msgstr "%llu Bytes Speicher konnten nicht zugeordnet werden!"
- 
- #: src/util.c
- #, c-format
-diff --git a/po/fi.po b/po/fi.po
-index 1afbdb68b..d3117a922 100644
---- a/po/fi.po
-+++ b/po/fi.po
-@@ -3432,7 +3432,7 @@ msgstr "Kieli: englanti"
- #: src/util.c
- #, c-format
- msgid "Could not allocate %llu bytes of memory!"
--msgstr "%Llu-tavua muistia ei voitu varata!"
-+msgstr "%llu-tavua muistia ei voitu varata!"
- 
- #: src/util.c
- #, c-format
-diff --git a/src/Makefile.am b/src/Makefile.am
-index f93decf55..6f9d02e6b 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,17 +1,43 @@
--AM_CPPFLAGS= -Dsysconfdir=\"$(sysconfdir)/motion\" -DLOCALEDIR=\"$(DESTDIR)$(localedir)\"
--
--if INC_MMAL_SRC
--MMAL_SRC=raspicam/RaspiCamControl.c raspicam/RaspiCLI.c
--endif
--
--LIBS = @LIBINTL@ @LIBS@
-+AM_CPPFLAGS= -Dsysconfdir=\"$(sysconfdir)/motion\" -DLOCALEDIR=\"$(localedir)\"
-+LDADD = $(LIBINTL)
- 
- bin_PROGRAMS = motion
- 
--motion_SOURCES = motion.c logger.c conf.c draw.c jpegutils.c video_loopback.c \
--	video_v4l2.c video_common.c video_bktr.c netcam.c netcam_http.c netcam_ftp.c \
--	netcam_jpeg.c netcam_wget.c netcam_rtsp.c track.c alg.c event.c picture.c \
--	rotate.c translate.c ffmpeg.c util.c dbse.c webu_status.c \
--	webu.c webu_html.c webu_stream.c webu_text.c mmalcam.c $(MMAL_SRC)
--
-+motion_SOURCES = \
-+	alg.h alg.c \
-+	conf.h conf.c \
-+	dbse.h dbse.c \
-+	draw.h draw.c \
-+	event.h event.c \
-+	ffmpeg.h ffmpeg.c \
-+	jpegutils.h jpegutils.c \
-+	logger.h logger.c \
-+	mmalcam.h mmalcam.c \
-+	motion.h motion.c \
-+	netcam.h netcam.c \
-+	netcam_ftp.h netcam_ftp.c \
-+	netcam_http.h netcam_http.c \
-+	netcam_jpeg.h netcam_jpeg.c \
-+	netcam_rtsp.h netcam_rtsp.c \
-+	netcam_wget.h netcam_wget.c \
-+	picture.h picture.c \
-+	rotate.h rotate.c \
-+	track.h track.c \
-+	translate.h translate.c \
-+	util.h util.c \
-+	video_bktr.h video_bktr.c \
-+	video_common.h video_common.c \
-+	video_loopback.h video_loopback.c \
-+	video_v4l2.h video_v4l2.c \
-+	webu.h webu.c \
-+	webu_html.h webu_html.c \
-+	webu_status.h webu_status.c \
-+	webu_stream.h webu_stream.c \
-+	webu_text.h webu_text.c \
-+	mmx.h pwc-ioctl.h
- 
-+if INC_MMAL_SRC
-+motion_SOURCES += \
-+	raspicam/RaspiCamControl.h raspicam/RaspiCamControl.c \
-+	raspicam/RaspiCLI.h raspicam/RaspiCLI.c
-+endif
diff --git a/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch b/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch
deleted file mode 100644
index a1536a7d2f..0000000000
--- a/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 40ecd71ff361442f1579089481619dd7cae90ffd Mon Sep 17 00:00:00 2001
-From: Piotr Mionskowski <piotr.mionskowski@gmail.com>
-Date: Sun, 9 Jul 2023 01:44:49 +0200
-Subject: [PATCH] Include libwebp when WEBP is enabled
-
-Upstream: https://github.com/Motion-Project/motion/commit/40ecd71ff361442f1579089481619dd7cae90ffd
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ce588f65..ee45ac37 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -191,8 +191,8 @@ AS_IF([test "${WEBP}" = "yes" ], [
-     AS_IF([pkg-config libwebpmux ], [
-         AC_MSG_RESULT(yes)
-         AC_DEFINE([HAVE_WEBP], [1], [Define to 1 if WEBP is around])
--        TEMP_CFLAGS="$TEMP_CFLAGS "`pkg-config --cflags libwebpmux`
--        TEMP_LIBS="$TEMP_LIBS "`pkg-config --libs libwebpmux`
-+        TEMP_CFLAGS="$TEMP_CFLAGS "`pkg-config --cflags libwebpmux libwebp`
-+        TEMP_LIBS="$TEMP_LIBS "`pkg-config --libs libwebpmux libwebp`
-       ],[
-         AC_MSG_RESULT(no)
-       ]
diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 21f74b481f..e8bbfbcbcb 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0c824276bb23565b7cf10409ebdcb46b85fb1f6abca957252e52290bb1fe473e  motion-4.5.1.tar.gz
+sha256  9268df31a5ebeaf8daca4747cdcd01c86e223625b6f971e9bcec98edf35ec06f  motion-4.6.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 2cce6cd1ff..554d056999 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.5.1
+MOTION_VERSION = 4.6.0
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
