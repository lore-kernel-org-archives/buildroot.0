Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47DAC83F10
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 12:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F8C283495;
	Thu, 31 Aug 2023 12:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F8C283495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5JuTCrvtx-nN; Thu, 31 Aug 2023 12:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90F5183486;
	Thu, 31 Aug 2023 12:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F5183486
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7BA1BF3D1
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 12:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB1B183487
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 12:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB1B183487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ybP2JCKoUUQC for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 12:30:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D147F80BC3
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 12:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D147F80BC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEB2286747; Thu, 31 Aug 2023 12:30:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 14:28:25 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 63dc6f6d4ef7fa5dc0c724f08e1af414ae368f76
X-Git-Newrev: f6f9b0938b41371d49207f99f86e50d9984dc05a
X-Patchwork-Hint: ignore
Message-Id: <20230831123056.BEB2286747@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libmodsecurity:
 security bump to version 3.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6f9b0938b41371d49207f99f86e50d9984dc05a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following security issue:
- CVE-2023-28882: Trustwave ModSecurity 3.0.5 through 3.0.8 before 3.0.9 allows
  a denial of service (worker crash and unresponsiveness) because some inputs
  cause a segfault in the Transaction class for some configurations.

  https://security-tracker.debian.org/tracker/CVE-2023-28882

- Drop 0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch, handling of libmaxminddb
  was fixed upstream in d2b700d
- Drop 0004-build-pcre.m4-fix-build-without-pcre.patch, handling of PCRE was
  fixed upstream in 791964a

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a1e0e7276ca246385d7f31d2db8331f52ce34228)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch | 28 ---------------------
 ...0004-build-pcre.m4-fix-build-without-pcre.patch | 29 ----------------------
 package/libmodsecurity/libmodsecurity.hash         |  4 +--
 package/libmodsecurity/libmodsecurity.mk           |  4 +--
 4 files changed, 4 insertions(+), 61 deletions(-)

diff --git a/package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch b/package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch
deleted file mode 100644
index 9608e3d935..0000000000
--- a/package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6737dc133cb4811a000c02b4e0a92b72f0b220ee Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 16 Jul 2021 19:12:51 +0200
-Subject: [PATCH] Revert "Fix maxminddb link on FreeBSD"
-
-This reverts commit 785958f9b5089b918c7d054cbcc2fe4a3c7b3788.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- build/libmaxmind.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/libmaxmind.m4 b/build/libmaxmind.m4
-index 656fc250..02820b5a 100644
---- a/build/libmaxmind.m4
-+++ b/build/libmaxmind.m4
-@@ -10,7 +10,7 @@ dnl  MAXMIND_VERSION
- AC_DEFUN([PROG_MAXMIND], [
- 
- # Possible names for the maxmind library/package (pkg-config)
--MAXMIND_POSSIBLE_LIB_NAMES="maxminddb maxmind"
-+MAXMIND_POSSIBLE_LIB_NAMES="libmaxminddb maxminddb maxmind"
- 
- # Possible extensions for the library
- MAXMIND_POSSIBLE_EXTENSIONS="so la sl dll dylib"
--- 
-2.30.2
-
diff --git a/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch b/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch
deleted file mode 100644
index 5a5baeacee..0000000000
--- a/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From af96f4fe916adc7dc6d649a07c10b45c978d31a1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 27 Jul 2022 14:17:20 +0200
-Subject: [PATCH] build/pcre.m4: fix build without pcre
-
-Don't raise an error if pcre is disabled now that pcre2 is supported
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent (no feedback on
-https://github.com/SpiderLabs/ModSecurity/pull/2596)]
----
- build/pcre.m4 | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/build/pcre.m4 b/build/pcre.m4
-index f6c9ae18..3e40f5c9 100644
---- a/build/pcre.m4
-+++ b/build/pcre.m4
-@@ -99,7 +99,6 @@ AC_SUBST(PCRE_LD_PATH)
- 
- if test -z "${PCRE_VERSION}"; then
-     AC_MSG_NOTICE([*** pcre library not found.])
--    ifelse([$2], , AC_MSG_ERROR([pcre library is required]), $2)
- else
-     AC_MSG_NOTICE([using pcre v${PCRE_VERSION}])
-     ifelse([$1], , , $1) 
--- 
-2.35.1
-
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 7ba0ef7f18..c79ae1cf45 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.8/modsecurity-v3.0.8.tar.gz.sha256
-sha256  e241c89b3cd7e58a863d0d0d6b9b8ba4d33ffb0f51171044c258c62e3e7956c7  modsecurity-v3.0.8.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.9/modsecurity-v3.0.9.tar.gz.sha256
+sha256  a5111ecd23e332a1d7c9652dbdb18517a96b21573315cb887a8e86761b95d3d8  modsecurity-v3.0.9.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index e83fda895f..335f3a41e5 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.8
+LIBMODSECURITY_VERSION = 3.0.9
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
@@ -12,7 +12,7 @@ LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
-# We're patching build/libmaxmind.m4 and build/pcre.m4
+# We're patching configure.ac
 LIBMODSECURITY_AUTORECONF = YES
 
 LIBMODSECURITY_DEPENDENCIES = pcre2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
