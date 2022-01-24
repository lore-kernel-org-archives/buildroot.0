Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57216C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E997B60F22;
	Mon, 24 Jan 2022 21:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYy3UVGDIeAQ; Mon, 24 Jan 2022 21:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A8F460B2B;
	Mon, 24 Jan 2022 21:03:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E47181BF3FB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1D7784C0E
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hnj4LHq2UYbO for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:03:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FBE484C0C
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:03:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AA7E1822E8; Mon, 24 Jan 2022 20:56:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 21:58:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c7ad667ec4a25226848baba809e492ca0ff06da
X-Git-Newrev: 27d08083ed4db5bd055219574cc602aaf8053a49
X-Patchwork-Hint: ignore
Message-Id: <20220124205624.AA7E1822E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xml-security-c: bump to version
 2.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=27d08083ed4db5bd055219574cc602aaf8053a49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.0.4 of the Apache XML Security for C++ has been released,
correcting support for OpenSSL earlier than 1.1.

Version 2.0.3 of the Apache XML Security for C++ has been released,
adding support for OpenSSL 3.0.0.

Drop patch (already in version) and so autoreconf

https://santuario.apache.org/cindex.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...onf-variable-cache-option-for-getcwd-test.patch | 50 ----------------------
 package/xml-security-c/xml-security-c.hash         |  4 +-
 package/xml-security-c/xml-security-c.mk           |  5 +--
 3 files changed, 3 insertions(+), 56 deletions(-)

diff --git a/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch b/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch
deleted file mode 100644
index 26b53ba719..0000000000
--- a/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 9d14fad412a497fe83cfc6ab594ddc612512f02a Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Thu, 4 Jun 2020 20:34:11 -0500
-Subject: [PATCH] autoconf variable cache option for getcwd test
-
-The cached variable allows cross compiled builds to successfully set the
-desired default for this value without invoking a test.
-
-Fixes:
-https://issues.apache.org/jira/browse/SANTUARIO-549
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- configure.ac | 20 ++++++++++++--------
- 1 file changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b43d7a5..c3d4489 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -74,14 +74,18 @@ AC_CHECK_FUNCS([strcasecmp])
- 
- # Check whether getcwd can dynamically allocate memory.
- AC_MSG_CHECKING([whether getcwd(NULL, 0) works])
--AC_RUN_IFELSE([AC_LANG_PROGRAM([#include <stdlib.h>
--     #include <unistd.h>],
--[char *cwd = getcwd(NULL, 0);
--return (cwd != NULL) ? EXIT_SUCCESS : EXIT_FAILURE;])],
--     [AC_MSG_RESULT(yes)
--      AC_DEFINE([XSEC_HAVE_GETCWD_DYN], [1],
--         [Define to 1 if getcwd(NULL, 0) works])],
--     [AC_MSG_RESULT(no)])
-+AC_CACHE_VAL([xml_cv_func_getcwd_null],
-+[AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <stdlib.h>
-+     #include <unistd.h>
-+     char *cwd = getcwd(NULL, 0);
-+     return (cwd != NULL) ? EXIT_SUCCESS : EXIT_FAILURE;]])],
-+  [xml_cv_func_getcwd_null=yes],
-+  [xml_cv_func_getcwd_null=no])])
-+AC_MSG_RESULT([$xml_cv_func_getcwd_null])
-+if test $xml_cv_func_getcwd_null = yes; then
-+AC_DEFINE([XSEC_HAVE_GETCWD_DYN], [1],
-+  [Define to 1 if getcwd(NULL, 0) works])
-+fi
- 
- AC_LANG(C++)
- 
--- 
-2.17.1
-
diff --git a/package/xml-security-c/xml-security-c.hash b/package/xml-security-c/xml-security-c.hash
index d91ed86e9c..f4b7041a63 100644
--- a/package/xml-security-c/xml-security-c.hash
+++ b/package/xml-security-c/xml-security-c.hash
@@ -1,3 +1,3 @@
-# From http://www.apache.org/dist/santuario/c-library/xml-security-c-2.0.2.tar.gz.sha256
-sha256  c303a2b08cb9ca0f5594adcbb83829b1e793175d7114a82f7d78def8bb2e30df  xml-security-c-2.0.2.tar.gz
+# From http://www.apache.org/dist/santuario/c-library/xml-security-c-2.0.4.tar.gz.sha256
+sha256  a78da6720f6c2ba14100d2426131e0d33eac5a2dba5cc11bdd04974b7eb89003  xml-security-c-2.0.4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/xml-security-c/xml-security-c.mk b/package/xml-security-c/xml-security-c.mk
index fe761819ee..fda9af4798 100644
--- a/package/xml-security-c/xml-security-c.mk
+++ b/package/xml-security-c/xml-security-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XML_SECURITY_C_VERSION = 2.0.2
+XML_SECURITY_C_VERSION = 2.0.4
 XML_SECURITY_C_SITE = http://archive.apache.org/dist/santuario/c-library
 XML_SECURITY_C_LICENSE = Apache-2.0
 XML_SECURITY_C_LICENSE_FILES = LICENSE.txt
@@ -15,7 +15,4 @@ XML_SECURITY_C_CONF_ENV = \
 	xml_cv_func_getcwd_null=yes \
 	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
-# Patched configure.ac
-XML_SECURITY_C_AUTORECONF = YES
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
