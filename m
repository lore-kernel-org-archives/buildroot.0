Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1397DC02182
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 15:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB9A984C3F;
	Wed, 22 Jan 2025 15:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZKgYA7s4J0h; Wed, 22 Jan 2025 15:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73E3284C0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E3284C0E;
	Wed, 22 Jan 2025 15:18:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E8E9D7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07ECC403EF
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivVXRwlWmz1S for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 15:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C764740259
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C764740259
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDC6D86034; Wed, 22 Jan 2025 15:18:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 16:01:53 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 75921aed27dc31f17377f5c533f8ee6953d15bca
X-Git-Newrev: 50cd11d4efc577ac68b554ea8c1e4a4882c80ea4
X-Patchwork-Hint: ignore
Message-Id: <20250122151820.BDC6D86034@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/rsync: bump to
 version 3.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=50cd11d4efc577ac68b554ea8c1e4a4882c80ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Drop first patch (already in version)

https://github.com/RsyncProject/rsync/blob/v3.3.0/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a8be7900a363ab21d8a1234d410cbc1ccee1edfd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...TX_copy-in-crypto-lib-instead-of-MD5_Init.patch | 28 ----------------------
 ...-use-pkg-config-to-retrieve-openssl-depe.patch} |  0
 package/rsync/rsync.hash                           |  4 ++--
 package/rsync/rsync.mk                             |  2 +-
 4 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch b/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
deleted file mode 100644
index 5381159968..0000000000
--- a/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 556a2c5bc2f6244f140a96302d4df92cfc25af8b Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayne@opencoder.net>
-Date: Tue, 25 Oct 2022 21:55:53 -0700
-Subject: [PATCH] Check for EVP_MD_CTX_copy in crypto lib instead of MD5_Init.
-
-Upstream: https://github.com/WayneD/rsync/commit/556a2c5bc2f6244f140a96302d4df92cfc25af8b
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a2c99558..ccad7f13 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -432,10 +432,10 @@ AH_TEMPLATE([USE_OPENSSL],
- if test x"$enable_openssl" != x"no"; then
-     if test x"$ac_cv_header_openssl_md4_h" = x"yes" && test x"$ac_cv_header_openssl_md5_h" = x"yes"; then
-       AC_MSG_RESULT(yes)
--      AC_SEARCH_LIBS(MD5_Init, crypto,
-+      AC_SEARCH_LIBS(EVP_MD_CTX_copy, crypto,
-           [AC_DEFINE(USE_OPENSSL)
- 	   enable_openssl=yes],
--          [err_msg="$err_msg$nl- Failed to find MD5_Init function in openssl crypto lib.";
-+          [err_msg="$err_msg$nl- Failed to find EVP_MD_CTX_copy function in openssl crypto lib.";
- 	   no_lib="$no_lib openssl"])
-     else
-         AC_MSG_RESULT(no)
diff --git a/package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch b/package/rsync/0001-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch
similarity index 100%
rename from package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch
rename to package/rsync/0001-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch
diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 842b5c099f..edeca9c4df 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.2.7.tar.gz.asc
-sha256  4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb  rsync-3.2.7.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.3.0.tar.gz.asc
+sha256  7399e9a6708c32d678a72a63219e96f23be0be2336e50fd1348498d07041df90  rsync-3.3.0.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index b9d392c8cb..188c87e1d4 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.2.7
+RSYNC_VERSION = 3.3.0
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
