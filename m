Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA019C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 21:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54EB840453;
	Mon,  2 Jan 2023 21:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54EB840453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOJe7J2544Lr; Mon,  2 Jan 2023 21:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8353440166;
	Mon,  2 Jan 2023 21:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8353440166
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B05071BF2C3
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 21:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BED840166
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 21:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BED840166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vYnhniDLwQu for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 21:36:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75DAB400D3
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75DAB400D3
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 21:36:09 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout02.t-online.de (Postfix) with SMTP id 9BD26236B7
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 22:35:40 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pCST1-28dLZh0; Mon, 2 Jan 2023 22:35:35 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:40792)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pCST1-0002MF-0m
 for buildroot@buildroot.org; Mon, 02 Jan 2023 22:35:35 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon,  2 Jan 2023 22:35:35 +0100
Message-Id: <20230102213535.44208-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672695335-8A6BF81F-55742F73/0/0 CLEAN NORMAL
X-TOI-MSGID: ab0ea7ca-9205-4b20-8d35-17c532d9a6f6
Subject: [Buildroot] [PATCH 1/1] package/libsndfile: bump to version 1.2.0
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

Release notes:
https://github.com/libsndfile/libsndfile/releases/tag/1.2.0

Drop patch (already in version).

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch | 24 -------------------
 package/libsndfile/libsndfile.hash            |  2 +-
 package/libsndfile/libsndfile.mk              |  4 +---
 3 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch

diff --git a/package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch b/package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch
deleted file mode 100644
index 44ed6dc2cb..0000000000
--- a/package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From e4fdaeefddd39bae1db27d48ccb7db7733e0c009 Mon Sep 17 00:00:00 2001
-From: Michael Cho <cho-m@tuta.io>
-Date: Sun, 17 Apr 2022 21:31:07 -0700
-Subject: [PATCH] configure.ac: substitute EXTERNAL_MPEG_LIBS in sndfile.pc
-
-[Retrieved from:
-https://github.com/libsndfile/libsndfile/commit/e4fdaeefddd39bae1db27d48ccb7db7733e0c009]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 727b67bc0..a4c776d70 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -739,6 +739,7 @@ AC_SUBST(SNDIO_LIBS)
- AC_SUBST(EXTERNAL_XIPH_CFLAGS)
- AC_SUBST(EXTERNAL_XIPH_LIBS)
- AC_SUBST(EXTERNAL_XIPH_REQUIRE)
-+AC_SUBST(EXTERNAL_MPEG_LIBS)
- AC_SUBST(EXTERNAL_MPEG_REQUIRE)
- AC_SUBST(MPG123_CFLAGS)
- AC_SUBST(MPG123_LIBS)
diff --git a/package/libsndfile/libsndfile.hash b/package/libsndfile/libsndfile.hash
index 67d10d03c4..be3ba41dc6 100644
--- a/package/libsndfile/libsndfile.hash
+++ b/package/libsndfile/libsndfile.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  0f98e101c0f7c850a71225fb5feaf33b106227b3d331333ddc9bacee190bcf41  libsndfile-1.1.0.tar.xz
+sha256  0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a  libsndfile-1.2.0.tar.xz
 # Locally calculated
 sha256  ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 0b57a1fdd8..d8d1725444 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-LIBSNDFILE_VERSION = 1.1.0
+LIBSNDFILE_VERSION = 1.2.0
 LIBSNDFILE_SOURCE = libsndfile-$(LIBSNDFILE_VERSION).tar.xz
 LIBSNDFILE_SITE = https://github.com/libsndfile/libsndfile/releases/download/$(LIBSNDFILE_VERSION)
 LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
-# We're patching configure.ac
-LIBSNDFILE_AUTORECONF = YES
 LIBSNDFILE_DEPENDENCIES = host-pkgconf
 
 LIBSNDFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
