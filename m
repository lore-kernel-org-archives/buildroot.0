Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74473C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:57:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D2CC60F6D
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D2CC60F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1511160719;
	Sun, 26 Sep 2021 19:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZYapiTZ0VQ3; Sun, 26 Sep 2021 19:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54131605A3;
	Sun, 26 Sep 2021 19:57:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7F91BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F013A403AE
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fquXQ8k21Ca0 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD7FD4035E
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 62E048D25E; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12a336c3239e474ccaa2c89b08f76db773604fca
X-Git-Newrev: fd863e3fae0724dec45556ae61087593b01616cb
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.62E048D25E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mjpegtools: bump to version 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd863e3fae0724dec45556ae61087593b01616cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version) and so autoreconf
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ly-causes-problems-on-some-x86_64-systems.patch | 73 ----------------------
 package/mjpegtools/mjpegtools.hash                 |  9 +--
 package/mjpegtools/mjpegtools.mk                   |  4 +-
 3 files changed, 6 insertions(+), 80 deletions(-)

diff --git a/package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch b/package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch
deleted file mode 100644
index f5de8ee969..0000000000
--- a/package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From e69557bea18eb7c3069c9527cc30f7cd91be27b7 Mon Sep 17 00:00:00 2001
-From: sms00 <sms00@3be20b7b-d6de-45d7-9b51-1db703c412de>
-Date: Thu, 28 Nov 2013 22:39:41 +0000
-Subject: [PATCH] PROGRAM_NOPIC apparently causes problems on some x86_64
- systems, has little to no performance effect on x86_64 systems and even on
- x86 systems most programs are I/O bound anyhow.  So remove the 4 uses of the
- flag
-
-git-svn-id: https://svn.code.sf.net/p/mjpeg/Code/trunk/mjpeg_play@3359 3be20b7b-d6de-45d7-9b51-1db703c412de
-
-[Retrieved (and backported by removing INSTALL updates) from:
-https://github.com/jaystevens/mjpegtools/commit/e69557bea18eb7c3069c9527cc30f7cd91be27b7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- y4mdenoise/Makefile.am |   4 +-
- y4munsharp/Makefile.am |   2 +-
- y4mutils/Makefile.am   |   2 +-
- yuvscaler/Makefile.am  |   2 +-
- 5 files changed, 26 insertions(+), 94 deletions(-)
-
-diff --git a/y4mdenoise/Makefile.am b/y4mdenoise/Makefile.am
-index dee9064f..d7fa76e2 100644
---- a/y4mdenoise/Makefile.am
-+++ b/y4mdenoise/Makefile.am
-@@ -4,8 +4,8 @@ MAINTAINERCLEANFILES = Makefile.in
- 
- EXTRA_DIST = implementation.html
- 
--AM_CFLAGS = -DNDEBUG -finline-functions @PROGRAM_NOPIC@
--AM_CXXFLAGS = -DNDEBUG -finline-functions @PROGRAM_NOPIC@
-+AM_CFLAGS = -DNDEBUG -finline-functions
-+AM_CXXFLAGS = -DNDEBUG -finline-functions
- 
- INCLUDES =  -I$(top_srcdir) -I$(top_srcdir)/utils
- 
-diff --git a/y4munsharp/Makefile.am b/y4munsharp/Makefile.am
-index a7f98acc..f99ff5cf 100644
---- a/y4munsharp/Makefile.am
-+++ b/y4munsharp/Makefile.am
-@@ -4,7 +4,7 @@ MAINTAINERCLEANFILES = Makefile.in
- 
- INCLUDES = -I $(top_srcdir)/utils -I $(top_srcdir)
- 
--y4munharp_CFLAGS=@PROGRAM_NOPIC@
-+y4munharp_CFLAGS=
- 
- bin_PROGRAMS = y4munsharp
- 
-diff --git a/y4mutils/Makefile.am b/y4mutils/Makefile.am
-index f3b0a671..7b8b1881 100644
---- a/y4mutils/Makefile.am
-+++ b/y4mutils/Makefile.am
-@@ -2,7 +2,7 @@
- 
- MAINTAINERCLEANFILES = Makefile.in
- 
--AM_CFLAGS   = @PROGRAM_NOPIC@
-+AM_CFLAGS   =
- AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/utils
- 
- LIBMJPEGUTILS = $(top_builddir)/utils/libmjpegutils.la
-diff --git a/yuvscaler/Makefile.am b/yuvscaler/Makefile.am
-index 1fe4d757..6d2adaca 100644
---- a/yuvscaler/Makefile.am
-+++ b/yuvscaler/Makefile.am
-@@ -18,6 +18,6 @@ noinst_HEADERS = \
- 
- EXTRA_DIST = yuvscaler_implementation.txt
- 
--yuvscaler_CFLAGS=@PROGRAM_NOPIC@
-+yuvscaler_CFLAGS=
- yuvscaler_SOURCES = yuvscaler.c yuvscaler_resample.c yuvscaler_bicubic.c
- yuvscaler_LDADD = $(LIBMJPEGUTILS) $(LIBM_LIBS)
diff --git a/package/mjpegtools/mjpegtools.hash b/package/mjpegtools/mjpegtools.hash
index 76e9403f83..8d74907b26 100644
--- a/package/mjpegtools/mjpegtools.hash
+++ b/package/mjpegtools/mjpegtools.hash
@@ -1,5 +1,6 @@
-# From http://sourceforge.net/projects/mjpeg/files/mjpegtools/2.1.0/
-md5	57bf5dd78976ca9bac972a6511b236f3	mjpegtools-2.1.0.tar.gz
-sha1	b9effa86280e23d67369e842e5cb645948583097	mjpegtools-2.1.0.tar.gz
+# From http://sourceforge.net/projects/mjpeg/files/mjpegtools/2.2.1/
+md5  168e0131c0b8a2e31df7a73eb602fc32  mjpegtools-2.2.1.tar.gz
+sha1  26e980912cd06f31033964acbc4b8d1932788bfc  mjpegtools-2.2.1.tar.gz
 # Locally computed
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
+sha256  b180536d7d9960b05e0023a197b00dcb100929a49aab71d19d55f4a1b210f49a  mjpegtools-2.2.1.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
index e2c6b7d8b7..8d6c475518 100644
--- a/package/mjpegtools/mjpegtools.mk
+++ b/package/mjpegtools/mjpegtools.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-MJPEGTOOLS_VERSION = 2.1.0
+MJPEGTOOLS_VERSION = 2.2.1
 MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEGTOOLS_VERSION)
 MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
 MJPEGTOOLS_INSTALL_STAGING = YES
 MJPEGTOOLS_LICENSE = GPL-2.0+
 MJPEGTOOLS_LICENSE_FILES = COPYING
-# We're patching Makefile.am
-MJPEGTOOLS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT),y)
 MJPEGTOOLS_CONF_OPTS += --enable-simd-accel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
