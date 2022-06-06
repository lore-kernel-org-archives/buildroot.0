Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24043C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 08:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDA5860E4D;
	Mon,  6 Jun 2022 08:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id irY7B8kT0_ah; Mon,  6 Jun 2022 08:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2CB160B47;
	Mon,  6 Jun 2022 08:49:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8B1B1BF39C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 08:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D80FF840BA
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 08:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYxQMStEtUYm for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 08:49:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07A9A8407D
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 08:49:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 38D8A86C48; Mon,  6 Jun 2022 08:37:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 10:48:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1dd0548d3f351c88e447d08f87e93f3151947c7
X-Git-Newrev: dec6a0af3f8de27c85fcaf862b16ab04f1a97ecc
X-Patchwork-Hint: ignore
Message-Id: <20220606083743.38D8A86C48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: security bump to version
 4.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dec6a0af3f8de27c85fcaf862b16ab04f1a97ecc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-0561, CVE-2022-0562, CVE-2022-0865, CVE-2022-0891,
CVE-2022-0907, CVE-2022-0908, CVE-2022-0909, CVE-2022-0924,
CVE-2022-1056, CVE-2022-1210, CVE-2022-1622 and CVE-2022-1623

Drop patch (already in version)

http://www.simplesystems.org/libtiff/v4.4.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fix-global-buffer-overflow-for-ASCII-tags.patch | 43 ----------------------
 package/tiff/tiff.hash                             |  2 +-
 package/tiff/tiff.mk                               |  5 +--
 3 files changed, 2 insertions(+), 48 deletions(-)

diff --git a/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch b/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
deleted file mode 100644
index ba1487782e..0000000000
--- a/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 03047a26952a82daaa0792957ce211e0aa51bc64 Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Tue, 25 Jan 2022 16:25:28 +0000
-Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
- count is required (fixes #355)
-
-[Retrieved from:
-https://gitlab.com/libtiff/libtiff/-/commit/03047a26952a82daaa0792957ce211e0aa51bc64]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tools/tiffset.c | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/tools/tiffset.c b/tools/tiffset.c
-index 8c9e23c5..e7a88c09 100644
---- a/tools/tiffset.c
-+++ b/tools/tiffset.c
-@@ -146,9 +146,19 @@ main(int argc, char* argv[])
- 
-             arg_index++;
-             if (TIFFFieldDataType(fip) == TIFF_ASCII) {
--                if (TIFFSetField(tiff, TIFFFieldTag(fip), argv[arg_index]) != 1)
--                    fprintf( stderr, "Failed to set %s=%s\n",
--                             TIFFFieldName(fip), argv[arg_index] );
-+                if(TIFFFieldPassCount( fip )) {
-+                    size_t len;
-+                    len = strlen(argv[arg_index]) + 1;
-+                    if (len > UINT16_MAX || TIFFSetField(tiff, TIFFFieldTag(fip),
-+                            (uint16_t)len, argv[arg_index]) != 1)
-+                        fprintf( stderr, "Failed to set %s=%s\n",
-+                            TIFFFieldName(fip), argv[arg_index] );
-+                } else {
-+                    if (TIFFSetField(tiff, TIFFFieldTag(fip),
-+                            argv[arg_index]) != 1)
-+                        fprintf( stderr, "Failed to set %s=%s\n",
-+                            TIFFFieldName(fip), argv[arg_index] );
-+                }
-             } else if (TIFFFieldWriteCount(fip) > 0
- 		       || TIFFFieldWriteCount(fip) == TIFF_VARIABLE) {
-                 int     ret = 1;
--- 
-GitLab
-
diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index ea08a1fc92..6bd28a0f59 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8  tiff-4.3.0.tar.gz
+sha256  917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed  tiff-4.4.0.tar.gz
 sha256  fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index f80ab7ac55..525712c9e9 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.3.0
+TIFF_VERSION = 4.4.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
@@ -12,9 +12,6 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
-# 0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
-TIFF_IGNORE_CVES += CVE-2022-22844
-
 TIFF_CONF_OPTS = \
 	--disable-cxx \
 	--without-x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
