Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E8ED59F67
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20039812E8;
	Wed,  6 Nov 2024 21:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rC1vrIHicr3v; Wed,  6 Nov 2024 21:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F22D1812CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F22D1812CC;
	Wed,  6 Nov 2024 21:15:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E06A4C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CA074072B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z65T5J4U3H6R for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B084007D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02B084007D
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:14:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3FD085E77; Wed,  6 Nov 2024 21:14:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 22:03:26 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 61e995dc57bd0cc8ca90cb9296a16f473a35e28f
X-Git-Newrev: 00a9042f4d3206a6ff7eaff1b913bedddc27eeae
X-Patchwork-Hint: ignore
Message-Id: <20241106211453.E3FD085E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/libarchive:
 security bump to version 3.7.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=00a9042f4d3206a6ff7eaff1b913bedddc27eeae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Security fixes:
- gzip: prevent a hang when processing a malformed gzip inside a gzip
  (#2366, OSS-Fuzz)
- tar: don't crash on truncated tar archives (#2364, OSS-Fuzz)
- tar: fix two leaks in tar header parsing (#2377)

Important bugfixes:
- 7-zip: read/write symlink paths as UTF-8 (#2252)
- cpio: exit with an error code if an entry could not be extracted (#2371)
- rar5: report encrypted entries (#2096)
- tar: fix truncation of entry pathnames in specific archives (#2360)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 55d0c9a9a6f89ed5c4d2e0d25cf499f180a99ee1)
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch     | 2 +-
 .../0002-autotools-do-not-add-iconv-for-Requires.private.patch          | 2 +-
 package/libarchive/libarchive.hash                                      | 2 +-
 package/libarchive/libarchive.mk                                        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
index e630c51fef..31ac4b0b5a 100644
--- a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
+++ b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
@@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
 index 93f7af94..204a4e69 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -449,9 +449,7 @@ if test "x$with_iconv" != "xno"; then
+@@ -455,9 +455,7 @@ if test "x$with_iconv" != "xno"; then
      AC_CHECK_HEADERS([localcharset.h])
      am_save_LIBS="$LIBS"
      LIBS="${LIBS} ${LIBICONV}"
diff --git a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
index aca2dab9db..a5b4c86a2f 100644
--- a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
+++ b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
@@ -17,7 +17,7 @@ diff --git a/configure.ac b/configure.ac
 index 99bff20d1..f245d0c55 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -449,7 +449,6 @@ if test "x$with_iconv" != "xno"; then
+@@ -455,7 +455,6 @@ if test "x$with_iconv" != "xno"; then
      AC_CHECK_HEADERS([localcharset.h])
      am_save_LIBS="$LIBS"
      LIBS="${LIBS} ${LIBICONV}"
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 08920b61c5..c0b04b0f4b 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  0a2efdcb185da2eb1e7cd8421434cb9a6119f72417a13335cca378d476fd3ba0  libarchive-3.7.6.tar.xz
+sha256  879acd83c3399c7caaee73fe5f7418e06087ab2aaf40af3e99b9e29beb29faee  libarchive-3.7.7.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index d3a447552e..70123ee2b1 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.6
+LIBARCHIVE_VERSION = 3.7.7
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
