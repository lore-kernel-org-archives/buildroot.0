Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE0CCCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64FC8614AC;
	Wed,  1 Oct 2025 20:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIdJrZ32gH3L; Wed,  1 Oct 2025 20:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5342614A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5342614A4;
	Wed,  1 Oct 2025 20:01:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D829ED
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E6978404D
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXuVRLLkT9UO for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E74784047
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E74784047
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E987866FE; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 10:19:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3072f0ae883a5bd879ed99d173a9bbbac9a178d9
X-Git-Newrev: 367470848013def164722cdbc1954ab1199fa6c5
X-Patchwork-Hint: ignore
Message-Id: <20251001200129.0E987866FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openjpeg: bump
 version to 2.5.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=367470848013def164722cdbc1954ab1199fa6c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

And drop now included security patch. For details, see:

https://github.com/uclouvain/openjpeg/releases/tag/v2.5.4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4655cfd8f306be2f1421e070b5686c6637bf4c5a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...0001-check-for-error-after-parsing-header.patch | 41 ----------------------
 package/openjpeg/openjpeg.hash                     |  2 +-
 package/openjpeg/openjpeg.mk                       |  5 +--
 3 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/package/openjpeg/0001-check-for-error-after-parsing-header.patch b/package/openjpeg/0001-check-for-error-after-parsing-header.patch
deleted file mode 100644
index 9a02fbf3d4..0000000000
--- a/package/openjpeg/0001-check-for-error-after-parsing-header.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f809b80c67717c152a5ad30bf06774f00da4fd2d Mon Sep 17 00:00:00 2001
-From: Sebastian Rasmussen <sebras@gmail.com>
-Date: Thu, 16 Jan 2025 02:13:43 +0100
-Subject: [PATCH] opj_jp2_read_header: Check for error after parsing header.
-
-Consider the case where the caller has not set the p_image
-pointer to NULL before calling opj_read_header().
-
-If opj_j2k_read_header_procedure() fails while obtaining the rest
-of the marker segment when calling opj_stream_read_data() because
-the data stream is too short, then opj_j2k_read_header() will
-never have the chance to initialize p_image, leaving it
-uninitialized.
-
-opj_jp2_read_header() will check the p_image value whether
-opj_j2k_read_header() suceeded or failed. This may be detected as
-an error in valgrind or ASAN.
-
-The fix is to check whether opj_j2k_read_header() suceeded before
-using the output argument p_image.
-
-Upstream: https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d
-CVE: CVE-2025-54874
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/lib/openjp2/jp2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lib/openjp2/jp2.c b/src/lib/openjp2/jp2.c
-index 4df055a54..da5063186 100644
---- a/src/lib/openjp2/jp2.c
-+++ b/src/lib/openjp2/jp2.c
-@@ -2873,7 +2873,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
-                               p_image,
-                               p_manager);
- 
--    if (p_image && *p_image) {
-+    if (ret && p_image && *p_image) {
-         /* Set Image Color Space */
-         if (jp2->enumcs == 16) {
-             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index 1992d5ca6a..3fda2a243b 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  368fe0468228e767433c9ebdea82ad9d801a3ad1e4234421f352c8b06e7aa707  openjpeg-2.5.3.tar.gz
+sha256  a695fbe19c0165f295a8531b1e4e855cd94d0875d2f88ec4b61080677e27188a  openjpeg-2.5.4.tar.gz
 sha256  a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 7b1352c222..bc5d8143a6 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.5.3
+OPENJPEG_VERSION = 2.5.4
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_CPE_ID_VENDOR = uclouvain
 OPENJPEG_INSTALL_STAGING = YES
 
-# 0001-check-for-error-after-parsing-header.patch
-OPENJPEG_IGNORE_CVES += CVE-2025-54874
-
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
