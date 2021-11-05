Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BCFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:16:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 891A2604DA
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 891A2604DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61C0B82796;
	Fri,  5 Nov 2021 16:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m8vRMNe29sQL; Fri,  5 Nov 2021 16:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 836A3827A5;
	Fri,  5 Nov 2021 16:16:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E9321BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DB1E40012
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxBYjJxGi3cX for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:15:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 003B4404A4
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2D89D8A6B3; Fri,  5 Nov 2021 16:11:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:09:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c83c1fd4a06dc3ef2803fe160ad57c35546ba7b
X-Git-Newrev: 4b2d3198c37de140a1ad653855cb3e89ef3bd7a9
X-Patchwork-Hint: ignore
Message-Id: <20211105161120.2D89D8A6B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-ares: bump to version 1.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b2d3198c37de140a1ad653855cb3e89ef3bd7a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version) and so autoreconf

https://c-ares.org/changelog.html#1_18_1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...vide-ares_nameser-h-as-a-public-interface.patch | 170 ---------------------
 package/c-ares/c-ares.hash                         |   2 +-
 package/c-ares/c-ares.mk                           |   4 +-
 3 files changed, 2 insertions(+), 174 deletions(-)

diff --git a/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch b/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch
deleted file mode 100644
index c3ae3daa8d..0000000000
--- a/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From 7712fcd17847998cf1ee3071284ec50c5b3c1978 Mon Sep 17 00:00:00 2001
-From: Felix Yan <felixonmars@archlinux.org>
-Date: Wed, 18 Aug 2021 01:32:44 +0800
-Subject: [PATCH] Provide ares_nameser.h as a public interface (#417)
-
-NodeJS needs ares_nameser.h as a pubic header.
-
-Fixes: #415
-Fix By: Felix Yan (@felixonmars)
-
-[Retrieved from:
-https://github.com/c-ares/c-ares/commit/7712fcd17847998cf1ee3071284ec50c5b3c1978]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt                      |  6 ++++++
- configure.ac                        | 14 ++++++++++++++
- include/CMakeLists.txt              |  2 +-
- include/Makefile.am                 |  2 +-
- include/ares_build.h.cmake          |  2 ++
- include/ares_build.h.in             |  3 +++
- {src/lib => include}/ares_nameser.h | 10 ++++++----
- src/lib/Makefile.inc                |  1 -
- 8 files changed, 33 insertions(+), 7 deletions(-)
- rename {src/lib => include}/ares_nameser.h (98%)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3f42d145..28f8e01a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -557,6 +557,12 @@ ENDIF()
- IF (HAVE_WINDOWS_H)
- 	SET (CARES_HAVE_WINDOWS_H 1)
- ENDIF()
-+IF (HAVE_ARPA_NAMESER_H)
-+	SET (CARES_HAVE_ARPA_NAMESER_H 1)
-+ENDIF()
-+IF (HAVE_ARPA_NAMESER_COMPAT_H)
-+	SET (CARES_HAVE_ARPA_NAMESER_COMPAT_H 1)
-+ENDIF()
- 
- # Record toplevel CMakeLists.txt path
- set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
-diff --git a/configure.ac b/configure.ac
-index c21b8ff3..1ba8a8ec 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -547,6 +547,20 @@ dnl *Sigh* these are needed in order for net/if.h to get properly detected.
- ]
- )
- 
-+dnl Test and set CARES_HAVE_ARPA_NAMESER_H / CARES_HAVE_ARPA_NAMESER_COMPAT_H
-+AC_CHECK_DECL([HAVE_ARPA_NAMESER_H],
-+[
-+CARES_DEFINE_UNQUOTED([CARES_HAVE_ARPA_NAMESER_H])
-+],
-+[]
-+)
-+AC_CHECK_DECL([HAVE_ARPA_NAMESER_COMPAT_H],
-+[
-+CARES_DEFINE_UNQUOTED([CARES_HAVE_ARPA_NAMESER_COMPAT_H])
-+],
-+[]
-+)
-+
- dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
- AC_TYPE_SIZE_T
-diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
-index 439e7bb2..3321956d 100644
---- a/include/CMakeLists.txt
-+++ b/include/CMakeLists.txt
-@@ -3,6 +3,6 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
- 
- # Headers installation target
- IF (CARES_INSTALL)
--	SET (CARES_HEADERS ares.h ares_version.h "${PROJECT_BINARY_DIR}/ares_build.h" ares_rules.h ares_dns.h)
-+	SET (CARES_HEADERS ares.h ares_version.h "${PROJECT_BINARY_DIR}/ares_build.h" ares_rules.h ares_dns.h ares_nameser.h)
- 	INSTALL (FILES ${CARES_HEADERS} COMPONENT Devel DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
- ENDIF ()
-diff --git a/include/Makefile.am b/include/Makefile.am
-index 125a686a..d208bece 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -2,6 +2,6 @@ AUTOMAKE_OPTIONS = foreign nostdinc 1.9.6
- ACLOCAL_AMFLAGS = -I m4 --install
- 
- # what headers to install on 'make install':
--include_HEADERS = ares.h ares_version.h ares_build.h ares_rules.h ares_dns.h
-+include_HEADERS = ares.h ares_version.h ares_build.h ares_rules.h ares_dns.h ares_nameser.h
- 
- EXTRA_DIST = ares_build.h.cmake ares_build.h.in ares_build.h.dist CMakeLists.txt
-diff --git a/include/ares_build.h.cmake b/include/ares_build.h.cmake
-index ac32d47f..e847f17e 100644
---- a/include/ares_build.h.cmake
-+++ b/include/ares_build.h.cmake
-@@ -13,6 +13,8 @@
- #cmakedefine CARES_HAVE_WS2TCPIP_H
- #cmakedefine CARES_HAVE_WINSOCK2_H
- #cmakedefine CARES_HAVE_WINDOWS_H
-+#cmakedefine CARES_HAVE_ARPA_NAMESER_H
-+#cmakedefine CARES_HAVE_ARPA_NAMESER_COMPAT_H
- 
- #ifdef CARES_HAVE_SYS_TYPES_H
- #  include <sys/types.h>
-diff --git a/include/ares_build.h.in b/include/ares_build.h.in
-index 24e3a989..20fd28a0 100644
---- a/include/ares_build.h.in
-+++ b/include/ares_build.h.in
-@@ -55,6 +55,9 @@
-    Error Compilation_aborted_CARES_TYPEOF_ARES_SOCKLEN_T_already_defined
- #endif
- 
-+#undef CARES_HAVE_ARPA_NAMESER_H
-+#undef CARES_HAVE_ARPA_NAMESER_COMPAT_H
-+
- /* ================================================================ */
- /*  EXTERNAL INTERFACE SETTINGS FOR CONFIGURE CAPABLE SYSTEMS ONLY  */
- /* ================================================================ */
-diff --git a/src/lib/ares_nameser.h b/include/ares_nameser.h
-similarity index 98%
-rename from src/lib/ares_nameser.h
-rename to include/ares_nameser.h
-index 65aebcc1..18a9e5ac 100644
---- a/src/lib/ares_nameser.h
-+++ b/include/ares_nameser.h
-@@ -2,10 +2,12 @@
- #ifndef ARES_NAMESER_H
- #define ARES_NAMESER_H
- 
--#ifdef HAVE_ARPA_NAMESER_H
-+#include "ares_build.h"
-+
-+#ifdef CARES_HAVE_ARPA_NAMESER_H
- #  include <arpa/nameser.h>
- #endif
--#ifdef HAVE_ARPA_NAMESER_COMPAT_H
-+#ifdef CARES_HAVE_ARPA_NAMESER_COMPAT_H
- #  include <arpa/nameser_compat.h>
- #endif
- 
-@@ -68,7 +70,7 @@
-  * provide them
-  * ============================================================================
-  */
--#ifndef HAVE_ARPA_NAMESER_H
-+#ifndef CARES_HAVE_ARPA_NAMESER_H
- 
- typedef enum __ns_class {
-     ns_c_invalid = 0,       /* Cookie. */
-@@ -173,7 +175,7 @@ typedef enum __ns_rcode {
-     ns_r_badtime = 18
- } ns_rcode;
- 
--#endif /* HAVE_ARPA_NAMESER_H */
-+#endif /* CARES_HAVE_ARPA_NAMESER_H */
- 
- 
- /* ============================================================================
-diff --git a/src/lib/Makefile.inc b/src/lib/Makefile.inc
-index 7426c3de..47bc8cdd 100644
---- a/src/lib/Makefile.inc
-+++ b/src/lib/Makefile.inc
-@@ -73,7 +73,6 @@ HHEADERS = ares_android.h                        \
-   ares_strsplit.h			\
-   ares_writev.h				\
-   bitncmp.h				\
--  ares_nameser.h			\
-   ares_setup.h				\
-   setup_once.h
- 
diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 28657645df..af1f076aab 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  4803c844ce20ce510ef0eb83f8ea41fa24ecaae9d280c468c582d2bb25b3913d  c-ares-1.17.2.tar.gz
+sha256  1a7d52a8a84a9fbffb1be9133c0f6e17217d91ea5a6fa61f6b4729cda78ebbcf  c-ares-1.18.1.tar.gz
 
 # Hash for license file
 sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 71bfa110a1..0152759ebc 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.17.2
+C_ARES_VERSION = 1.18.1
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = LICENSE.md
 C_ARES_CPE_ID_VENDOR = c-ares_project
-# We're patching configure.ac
-C_ARES_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
