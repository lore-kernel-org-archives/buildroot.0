Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0598C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F9444EF04;
	Tue, 21 Feb 2023 00:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F9444EF04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYuAHC3UkrBl; Tue, 21 Feb 2023 00:07:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 380A44EF8F;
	Tue, 21 Feb 2023 00:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380A44EF8F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 379DC1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2D276F9E8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2D276F9E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3B_z0CL0KtSZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D37386F9F4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D37386F9F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1AC5828C8; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:34:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d290f602b679043810dd658eba1f6f1f87faa9b4
X-Git-Newrev: 1757c1fe0556d7339d23c5726fb49cca1c7d7759
X-Patchwork-Hint: ignore
Message-Id: <20230220205224.D1AC5828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsndfile: bump to
 version 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1757c1fe0556d7339d23c5726fb49cca1c7d7759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/libsndfile/libsndfile/releases/tag/1.2.0

Drop patch (already in version).

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...bstitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch | 24 ----------------------
 package/libsndfile/libsndfile.hash                 |  2 +-
 package/libsndfile/libsndfile.mk                   |  4 +---
 3 files changed, 2 insertions(+), 28 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
