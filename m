Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69789C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BAC141D08;
	Mon, 20 Feb 2023 22:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BAC141D08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SE-2Lc5sFBQQ; Mon, 20 Feb 2023 22:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D007641E89;
	Mon, 20 Feb 2023 22:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D007641E89
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48BD41BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0300416DA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0300416DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_5GFDM0HjSc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1E71416CE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1E71416CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFD2686494; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 23:05:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4d05fa00fd07c3d0cd3f1b6ee676e6dd20c5430f
X-Git-Newrev: 380341b249175382691f268de4b41d3843ff0acc
X-Patchwork-Hint: ignore
Message-Id: <20230220205210.AFD2686494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libarchive: bump to
 version 3.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=380341b249175382691f268de4b41d3843ff0acc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...libarchive-Handle-a-calloc-returning-NULL.patch | 38 ----------------------
 package/libarchive/Config.in                       |  2 +-
 package/libarchive/libarchive.hash                 |  2 +-
 package/libarchive/libarchive.mk                   |  5 +--
 4 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch b/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
deleted file mode 100644
index 75ce6112fe..0000000000
--- a/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
-From: obiwac <obiwac@gmail.com>
-Date: Fri, 22 Jul 2022 22:41:10 +0200
-Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)
-
-[Retrieved from:
-https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libarchive/archive_write.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
-index 66592e826..27626b541 100644
---- a/libarchive/archive_write.c
-+++ b/libarchive/archive_write.c
-@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
- 	struct archive_write_filter *f;
- 
- 	f = calloc(1, sizeof(*f));
-+
-+	if (f == NULL)
-+		return (NULL);
-+
- 	f->archive = _a;
- 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
- 	if (a->filter_first == NULL)
-@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
- 	a->client_data = client_data;
- 
- 	client_filter = __archive_write_allocate_filter(_a);
-+
-+	if (client_filter == NULL)
-+		return (ARCHIVE_FATAL);
-+
- 	client_filter->open = archive_write_client_open;
- 	client_filter->write = archive_write_client_write;
- 	client_filter->close = archive_write_client_close;
diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
index fd429acb60..ffa4cff7b3 100644
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBARCHIVE
 	  Libarchive is a reusable C library for reading and writing a
 	  variety of streaming archive formats.
 
-	  http://www.libarchive.org/
+	  https://www.libarchive.org/
 
 if BR2_PACKAGE_LIBARCHIVE
 
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index ca580b4977..b03bef3de5 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  5a411aceb978f43e626f0c2d1812ddd8807b645ed892453acabd532376c148e6  libarchive-3.6.1.tar.xz
+sha256  9e2c1b80d5fbe59b61308fdfab6c79b5021d7ff4ff2489fb12daf0a96a83551d  libarchive-3.6.2.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 649b7dd4dc..cfc148d01d 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.6.1
+LIBARCHIVE_VERSION = 3.6.2
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
@@ -12,9 +12,6 @@ LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CPE_ID_VENDOR = libarchive
 
-# 0001-libarchive-Handle-a-calloc-returning-NULL.patch
-LIBARCHIVE_IGNORE_CVES += CVE-2022-36227
-
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBARCHIVE_CONF_OPTS += --enable-bsdtar=static
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
