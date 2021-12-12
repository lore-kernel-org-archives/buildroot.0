Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22532C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D41036E6C5;
	Sun, 12 Dec 2021 14:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MYJ_I3i29ZlN; Sun, 12 Dec 2021 14:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 058856E5EA;
	Sun, 12 Dec 2021 14:55:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1095F1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14E2061CF7
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nN2gNcEjWTs9 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2E1E61CED
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:53:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1EBC183467; Sun, 12 Dec 2021 14:48:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:48:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36302ca4326fc7c94906bff26df8ac8dafb05131
X-Git-Newrev: baafe68bc3faa286d404636f25bb5cf4128d963f
X-Patchwork-Hint: ignore
Message-Id: <20211212144823.1EBC183467@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libexif: bump to version 0.6.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=baafe68bc3faa286d404636f25bb5cf4128d963f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/libexif/libexif/releases/tag/v0.6.24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...xif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch | 40 ----------------------
 package/libexif/libexif.hash                       |  2 +-
 package/libexif/libexif.mk                         |  4 +--
 3 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch b/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 7bbf3b3e4d..0000000000
--- a/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 0c925491dea995ca96770159158bb8d57a48d84b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 Sep 2021 07:56:32 +0200
-Subject: [PATCH] libexif/exif-gps-ifd.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8 raised since version 0.6.23 and
-https://github.com/libexif/libexif/commit/e12c3529813cd16d50bf0a1c759093e1039dffec:
-
-exif-gps-ifd.c: In function 'exif_get_gps_tag_info':
-exif-gps-ifd.c:62:3: error: 'for' loop initial declarations are only allowed in C99 mode
-   for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
-   ^
-exif-gps-ifd.c:62:3: note: use option -std=c99 or -std=gnu99 to compile your code
-
-Fixes:
- - http://autobuild.buildroot.org/results/7dd222e06d1e6611449fb8fe7516817c9ad43d65
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/libexif/libexif/pull/72]
----
- libexif/exif-gps-ifd.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libexif/exif-gps-ifd.c b/libexif/exif-gps-ifd.c
-index 9c9ba70..de5f950 100644
---- a/libexif/exif-gps-ifd.c
-+++ b/libexif/exif-gps-ifd.c
-@@ -59,7 +59,8 @@ const static struct ExifGPSIfdTagInfo exif_gps_ifd_tags[] = {
- };
- 
- const ExifGPSIfdTagInfo *exif_get_gps_tag_info(ExifTag tag) {
--  for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
-+  int i;
-+  for (i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
-     if (tag==exif_gps_ifd_tags[i].tag)
-       return &exif_gps_ifd_tags[i];
-   }
--- 
-2.33.0
-
diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
index e087daf58a..0d082aedb0 100644
--- a/package/libexif/libexif.hash
+++ b/package/libexif/libexif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a740a99920eb81ae0aa802bb46e683ce6e0cde061c210f5d5bde5b8572380431  libexif-0.6.23.tar.xz
+sha256  d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae  libexif-0.6.24.tar.bz2
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 49637f1519..921029b4ac 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBEXIF_VERSION = 0.6.23
-LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.xz
+LIBEXIF_VERSION = 0.6.24
+LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
 LIBEXIF_SITE = \
 	https://github.com/libexif/libexif/releases/download/v$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
