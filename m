Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926CDD3C92D
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 19:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32B8680D03;
	Sat, 19 Oct 2024 19:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIIj86pyJnsq; Sat, 19 Oct 2024 19:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20BB480C93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20BB480C93;
	Sat, 19 Oct 2024 19:17:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1A954961
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 19:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBAF3400AF
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 19:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4M8pclEZGgr5 for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 19:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2E18400E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2E18400E0
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 19:17:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F8C486033; Sat, 19 Oct 2024 19:17:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 21:15:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3ade4d0bb1b87ecf41765eb975620c1c5b276f63
X-Git-Newrev: 729b66dcbbf0d1cc9366734bb70934818bbee748
X-Patchwork-Hint: ignore
Message-Id: <20241019191709.8F8C486033@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libarchive:
 security bump to version 3.7.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=729b66dcbbf0d1cc9366734bb70934818bbee748
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

3.7.5 fixed a number of security issues:

    fix multiple vulnerabilities identified by SAST (#2251, #2256)
    cpio: ignore out-of-range gid/uid/size/ino and harden AFIO parsing (#2258)
    lzop: prevent integer overflow (#2174)
    rar4: protect copy_from_lzss_window_to_unp() (#2172, CVE-2024-20696)
    rar4: fix CVE-2024-26256 (#2269, CVS-2024-26256)
    rar4: fix OOB in delta and audio filter (#2148, #2149)
    rar4: fix out of boundary access with large files (#2179)
    rar4: add boundary checks to rgb filter (#2210)
    rar4: fix OOB access with unicode filenames (#2203)
    rar5: clear 'data ready' cache on window buffer reallocs (#2265)
    rpm: calculate huge header sizes correctly (#2158)
    unzip: unify EOF handling (#2175)
    util: fix out of boundary access in mktemp functions (#2160)
    uu: stop processing if lines are too long (#2168)

And 3.7.6 fixed a tar regression introduced in 3.7.5

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ab3c84e5e2391a7832f6baa2f20b28661f55dd2c)
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch     | 2 +-
 .../0002-autotools-do-not-add-iconv-for-Requires.private.patch          | 2 +-
 package/libarchive/libarchive.hash                                      | 2 +-
 package/libarchive/libarchive.mk                                        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
index a4dd7dad5c..e630c51fef 100644
--- a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
+++ b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
@@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
 index 93f7af94..204a4e69 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -434,9 +434,7 @@ if test "x$with_iconv" != "xno"; then
+@@ -449,9 +449,7 @@ if test "x$with_iconv" != "xno"; then
      AC_CHECK_HEADERS([localcharset.h])
      am_save_LIBS="$LIBS"
      LIBS="${LIBS} ${LIBICONV}"
diff --git a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
index 3cbd304109..aca2dab9db 100644
--- a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
+++ b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
@@ -17,7 +17,7 @@ diff --git a/configure.ac b/configure.ac
 index 99bff20d1..f245d0c55 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -434,7 +434,6 @@ if test "x$with_iconv" != "xno"; then
+@@ -449,7 +449,6 @@ if test "x$with_iconv" != "xno"; then
      AC_CHECK_HEADERS([localcharset.h])
      am_save_LIBS="$LIBS"
      LIBS="${LIBS} ${LIBICONV}"
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index a2c6488731..08920b61c5 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  f887755c434a736a609cbd28d87ddbfbe9d6a3bb5b703c22c02f6af80a802735  libarchive-3.7.4.tar.xz
+sha256  0a2efdcb185da2eb1e7cd8421434cb9a6119f72417a13335cca378d476fd3ba0  libarchive-3.7.6.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 7d58b5c69f..d3a447552e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.4
+LIBARCHIVE_VERSION = 3.7.6
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
