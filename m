Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7BBC54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EE28820E0;
	Wed, 27 Mar 2024 22:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqhFVAfBJfbZ; Wed, 27 Mar 2024 22:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E458210B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99E458210B;
	Wed, 27 Mar 2024 22:06:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7915B1BF33B
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B20140517
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbMWRfPIpBSg for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC636415DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC636415DC
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:06:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C35AA843AB; Wed, 27 Mar 2024 22:06:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 23:02:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ff9d5f8861aac2521e2ab72188bc85e1668def9
X-Git-Newrev: c4878d530e8bbcf29173b62a725c66ac51849c65
X-Patchwork-Hint: ignore
Message-Id: <20240327220648.C35AA843AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cxx: bump to version 1.1.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4878d530e8bbcf29173b62a725c66ac51849c65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Drop LOG4CXX_IGNORE_CVES as CVE-2023-31038 has been fixed in 1.1.0
- Add unixodbc optional dependency

https://logging.apache.org/log4cxx/latest_stable/changelog.html#1.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-Make-ODBC-and-SMTP-opt-in-191.patch       | 73 ----------------------
 package/log4cxx/log4cxx.hash                       |  4 +-
 package/log4cxx/log4cxx.mk                         | 15 +++--
 3 files changed, 11 insertions(+), 81 deletions(-)

diff --git a/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch b/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch
deleted file mode 100644
index a116fcc491..0000000000
--- a/package/log4cxx/0001-Make-ODBC-and-SMTP-opt-in-191.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 4900c27cc284ba2f671ae92e6ffb4ab391f9507a Mon Sep 17 00:00:00 2001
-From: Robert Middleton <rm5248@users.noreply.github.com>
-Date: Mon, 6 Feb 2023 20:39:02 -0500
-Subject: [PATCH] Make ODBC and SMTP opt-in (#191)
-
-See #189
-
-Upstream: afeaab6d0f0107c77dfadcbe3708f170c48d5ed9
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/main/include/CMakeLists.txt | 40 ++++++++++++++++++++++++---------
- 1 file changed, 30 insertions(+), 10 deletions(-)
-
-diff --git a/src/main/include/CMakeLists.txt b/src/main/include/CMakeLists.txt
-index e31443fb..d6835293 100644
---- a/src/main/include/CMakeLists.txt
-+++ b/src/main/include/CMakeLists.txt
-@@ -85,22 +85,42 @@ include(CheckIncludeFiles)
- include(CheckIncludeFileCXX)
- include(CheckLibraryExists)
- 
--if(WIN32)
--	CHECK_INCLUDE_FILES(sqlext.h HAS_ODBC)
-+option(LOG4CXX_ENABLE_ODBC "Support logging via ODBC" OFF)
-+if(LOG4CXX_ENABLE_ODBC)
-+    if(WIN32)
-+            CHECK_INCLUDE_FILES(sqlext.h HAS_ODBC)
-+    else()
-+            include(FindPkgConfig)
-+
-+            pkg_check_modules( odbc odbc )
-+            if(${odbc_FOUND})
-+                    set(HAS_ODBC 1)
-+            else()
-+                    set(HAS_ODBC 0)
-+            endif(${odbc_FOUND})
-+    endif(WIN32)
-+
-+    if(NOT ${HAS_ODBC})
-+        message(SEND_ERROR "ODBC not found but requested")
-+    endif()
- else()
--	include(FindPkgConfig)
--
--	pkg_check_modules( odbc QUIET odbc )
--	if(${odbc_FOUND})
--		set(HAS_ODBC 1)
--	endif(${odbc_FOUND})
--endif(WIN32)
-+    set(HAS_ODBC 0)
-+endif(LOG4CXX_ENABLE_ODBC)
-+
-+option(LOG4CXX_ENABLE_ESMTP "Support logging via libesmtp" OFF)
-+if(LOG4CXX_ENABLE_ESMTP)
-+    CHECK_LIBRARY_EXISTS(esmtp smtp_create_session "" HAS_LIBESMTP)
-+    if(NOT HAS_LIBESMTP)
-+        message(SEND_ERROR "SMTP support with libesmtp not found but requested")
-+    endif()
-+else()
-+    set(HAS_LIBESMTP 0)
-+endif(LOG4CXX_ENABLE_ESMTP)
- 
- CHECK_INCLUDE_FILE_CXX(locale HAS_STD_LOCALE)
- CHECK_FUNCTION_EXISTS(mbsrtowcs HAS_MBSRTOWCS)
- CHECK_FUNCTION_EXISTS(wcstombs HAS_WCSTOMBS)
- CHECK_FUNCTION_EXISTS(fwide HAS_FWIDE)
--CHECK_LIBRARY_EXISTS(esmtp smtp_create_session "" HAS_LIBESMTP)
- CHECK_FUNCTION_EXISTS(syslog HAS_SYSLOG)
- if(UNIX)
-     set(CMAKE_REQUIRED_LIBRARIES "pthread")
--- 
-2.41.0
-
diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index 8190f94aa3..728d49ee38 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/logging/log4cxx/0.13.0/apache-log4cxx-0.13.0.tar.gz.sha512
-sha512  2a5f4fecc0415d942658c588774f0666082c497b6fd49bf64ab3328a997775206788c9b10a8c89208896c57da52fcc12c18d5d11ca1d3bf699e4633b8fcea6e5  apache-log4cxx-0.13.0.tar.gz
+# From https://www.apache.org/dist/logging/log4cxx/1.1.0/apache-log4cxx-1.1.0.tar.gz.sha512
+sha512  66a66eab933a6afd0779e3f73f65afa4fb82481208b591fd7c7c86ded805f50abcd9cdf954bdb49e1e7f5198e6c1c4fff8a7e180ff5fff9491f1946e9ba6fe2b  apache-log4cxx-1.1.0.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index aee682529c..8024c96d46 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,21 +4,17 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 0.13.0
+LOG4CXX_VERSION = 1.1.0
 LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
 LOG4CXX_LICENSE = Apache-2.0
 LOG4CXX_LICENSE_FILES = LICENSE
 LOG4CXX_CPE_ID_VENDOR = apache
-# We do not support ODBC functionality
-LOG4CXX_IGNORE_CVES = CVE-2023-31038
 
-# Note: if you want to support odbc, make sure CVE-2023-31038 is fixed
 LOG4CXX_CONF_OPTS = \
 	-DAPR_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apr-1-config \
-	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config \
-	-DLOG4CXX_ENABLE_ODBC=OFF
+	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config
 
 LOG4CXX_DEPENDENCIES = apr apr-util
 
@@ -33,6 +29,13 @@ else
 LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ODBC=ON
+LOG4CXX_DEPENDENCIES += unixodbc
+else
+LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ODBC=OFF
+endif
+
 ifeq ($(BR2_USE_WCHAR),y)
 LOG4CXX_CONF_OPTS += -DLOG4CXX_WCHAR_T=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
