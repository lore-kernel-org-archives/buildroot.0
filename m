Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF73EE4990
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0103160BF2;
	Tue, 30 Dec 2025 18:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIOmsYSrYJHV; Tue, 30 Dec 2025 18:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1450E60BC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118368;
	bh=2+anRLgjAiSklejR9QErIUqhTdDYq+3pD2/RTt3SkKE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hs1+hqB+N/cg7xObwpxe1w1s1RgGLkC2wt3K1te4HBuZJtXdYC3Cf0L0Zag4xTXr9
	 NccXXvw0jyfmiX0MWeCavofM/0+c2xyxxe7tga2b+czTRj/pzBe0FhUA4AJiMXsFAG
	 2S0w1O268TGMq/UhQEJOpCUjZqHVtE/ZO2rJWriwlUeo0sDEjQgjIbx2UUUkKz3Ws7
	 NDjbLAthaxz3XpsMenMtGVLtwz270DjvkfLp901CCPZ5GhpHWbKmuD1vwL1ux6aQtP
	 n7AmjQOYyNhH1zClA3ha/1W/m/3Q8hqZSkefBns0IdUjtEKqN5PvtnZZZt2YE4SA/T
	 92IOkRyMmirgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1450E60BC1;
	Tue, 30 Dec 2025 18:12:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0975635B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B50C403B8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjM3FUbedP2p for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0218403F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0218403F4
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2A3C87C3E; Tue, 30 Dec 2025 18:12:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f9e324091d195a9b1034c652796d4a2fe7a1a4b
X-Git-Newrev: b318a0c22b4ac3cb9b8cd19d85a779a403feb0c4
X-Patchwork-Hint: ignore
Message-Id: <20251230181234.E2A3C87C3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/taskd: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4735358535134785858=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4735358535134785858==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b318a0c22b4ac3cb9b8cd19d85a779a403feb0c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/GothenburgBitFactory/taskserver/commit/e71163665181a27589c52126c542e1426f55d4eb
The package "is no longer actively developed."

https://github.com/GothenburgBitFactory/taskserver shows this note:
"This repository was archived by the owner on Jul 4, 2024.
 It is now read-only."

The package is broken with cmake 4 and no other package depends on it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Ben Boeckel <mathstuf@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  3 --
 Config.in.legacy                                   |  6 ++++
 DEVELOPERS                                         |  3 --
 package/Config.in                                  |  1 -
 ...ing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch | 28 ---------------
 ...se-correct-variables-for-GnuTLS-detection.patch | 32 -----------------
 ...-CMakeLists-use-pkg-config-uuid-detection.patch | 40 ----------------------
 package/taskd/Config.in                            | 18 ----------
 package/taskd/taskd.hash                           |  5 ---
 package/taskd/taskd.mk                             | 13 -------
 10 files changed, 6 insertions(+), 143 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a2710cdd3e..a80e89c168 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -983,9 +983,6 @@ package/swupdate/swupdate.sh Shellcheck
 package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch lib_patch.Upstream
 package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/targetcli-fb/S50target Shellcheck lib_sysv.Variables
-package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch lib_patch.Upstream
-package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch lib_patch.Upstream
-package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch lib_patch.Upstream
 package/tcf-agent/S55tcf-agent Shellcheck lib_sysv.Variables
 package/tftpd/S80tftpd-hpa Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/ti-gfx/0001-newclkapi.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index fc5979c926..acc8edf963 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_TASKD
+	bool "taskd has been removed"
+	select BR2_LEGACY
+	help
+	  taskd was deprecated upstream and has been removed
+
 config BR2_PACKAGE_SCONESERVER
 	bool "sconeserver has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 37b8904751..477fb5a72d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -347,9 +347,6 @@ F:	package/uhubctl/
 N:	Baxiche Su <baxiche@gmail.com>
 F:	package/qt6/qt6multimedia/
 
-N:	Ben Boeckel <mathstuf@gmail.com>
-F:	package/taskd/
-
 N:	Benjamin Kamath <kamath.ben@gmail.com>
 F:	package/lapack/
 
diff --git a/package/Config.in b/package/Config.in
index 42ae5aae4d..ab24e84531 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2402,7 +2402,6 @@ menu "Miscellaneous"
 	source "package/shared-mime-info/Config.in"
 	source "package/snooze/Config.in"
 	source "package/sunwait/Config.in"
-	source "package/taskd/Config.in"
 	source "package/wine/Config.in"
 	source "package/xmrig/Config.in"
 	source "package/xutil_util-macros/Config.in"
diff --git a/package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch b/package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch
deleted file mode 100644
index 960c71b9ea..0000000000
--- a/package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b067ab9bf667bb9257bb9eeaa6bf25f9a1a17f06 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Fri, 6 May 2016 23:35:42 +0200
-Subject: [PATCH] Fix missing cmakedefine HAVE_GET_CURRENT_DIR_NAME
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
----
- cmake.h.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cmake.h.in b/cmake.h.in
-index 4124ce9..0b8f9d0 100644
---- a/cmake.h.in
-+++ b/cmake.h.in
-@@ -51,6 +51,7 @@
- #cmakedefine HAVE_ST_BIRTHTIME
- 
- /* Functions */
-+#cmakedefine HAVE_GET_CURRENT_DIR_NAME
- #cmakedefine HAVE_TIMEGM
- #cmakedefine HAVE_UUID_UNPARSE_LOWER
- 
--- 
-2.8.2
-
diff --git a/package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch b/package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch
deleted file mode 100644
index f2365ea298..0000000000
--- a/package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 88fee5c6eb2271d3de6b9878cd29a0494999aa18 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Sun, 20 Nov 2016 23:46:45 +0100
-Subject: [PATCH] Use correct variables for GnuTLS detection
-
-At least with recent CMake, it seems the variables created by
-find_package (GnuTLS) are called PC_GNUTLS_INCLUDE_DIRS and
-PC_GNUTLS_LIBRARIES.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d8125d9..ccf827b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -110,8 +110,8 @@ message ("-- Looking for GnuTLS")
- find_package (GnuTLS REQUIRED)
- if (GNUTLS_FOUND)
-   set (HAVE_LIBGNUTLS true)
--  set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${GNUTLS_INCLUDE_DIR})
--  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${GNUTLS_LIBRARIES})
-+  set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${PC_GNUTLS_INCLUDE_DIRS})
-+  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${PC_GNUTLS_LIBRARIES})
- endif (GNUTLS_FOUND)
- 
- message ("-- Looking for libuuid")
--- 
-2.10.2
-
diff --git a/package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch b/package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch
deleted file mode 100644
index 34139fef74..0000000000
--- a/package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-CMakeLists.txt: use pkg-config to detect uuid when possible
-
-In order to take into account the libraries used by libuuid when
-building statically, using pkg-config is recommended. This patch
-therefore improves the CMakeLists.txt to use pkg-config to detect
-libuuid when pkg-config is available.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/CMakeLists.txt
-===================================================================
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -6,6 +6,7 @@
- 
- include (CheckFunctionExists)
- include (CheckStructHasMember)
-+include (FindPkgConfig)
- 
- set (HAVE_CMAKE true)
- 
-@@ -119,8 +120,16 @@
-   # Apple and FreeBSD include the uuid functions in their libc, rather than libuuid
-   check_function_exists (uuid_unparse_lower HAVE_UUID_UNPARSE_LOWER)
- else (DARWIN OR FREEBSD)
--  find_path    (UUID_INCLUDE_DIR   uuid/uuid.h)
--  find_library (UUID_LIBRARY NAMES uuid)
-+  if(PKG_CONFIG_FOUND)
-+    pkg_check_modules(PC_UUID uuid)
-+    if(PC_UUID_FOUND)
-+      set (UUID_INCLUDE_DIR ${PC_UUID_INCLUDE_DIRS})
-+      set (UUID_LIBRARY ${PC_UUID_LIBRARIES})
-+    endif(PC_UUID_FOUND)
-+  else(PKG_CONFIG_FOUND)
-+    find_path    (UUID_INCLUDE_DIR   uuid/uuid.h)
-+    find_library (UUID_LIBRARY NAMES uuid)
-+  endif(PKG_CONFIG_FOUND)
-   if (UUID_INCLUDE_DIR AND UUID_LIBRARY)
-     set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${UUID_INCLUDE_DIR})
-     set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${UUID_LIBRARY})
diff --git a/package/taskd/Config.in b/package/taskd/Config.in
deleted file mode 100644
index 19d123fb59..0000000000
--- a/package/taskd/Config.in
+++ /dev/null
@@ -1,18 +0,0 @@
-config BR2_PACKAGE_TASKD
-	bool "taskd"
-	depends on !BR2_STATIC_LIBS # gnutls
-	depends on BR2_USE_WCHAR # gnutls
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_GNUTLS
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	help
-	  Task management synchronization daemon.
-
-	  http://taskwarrior.org/
-
-comment "taskd needs a toolchain w/ C++, wchar, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		BR2_STATIC_LIBS
diff --git a/package/taskd/taskd.hash b/package/taskd/taskd.hash
deleted file mode 100644
index d3f8bb250e..0000000000
--- a/package/taskd/taskd.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://taskwarrior.org/download/
-sha1  ded339deeee65277e4712f71a9159502f8b20b52  taskd-1.1.0.tar.gz
-# Locally calculated
-sha256  7b8488e687971ae56729ff4e2e5209ff8806cf8cd57718bfd7e521be130621b4  taskd-1.1.0.tar.gz
-sha256  84d1a8c2e6e306864ff350857a36b6c74756e61e2eae6822cf2fa88212720f68  COPYING
diff --git a/package/taskd/taskd.mk b/package/taskd/taskd.mk
deleted file mode 100644
index b19be68912..0000000000
--- a/package/taskd/taskd.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# taskd
-#
-################################################################################
-
-TASKD_VERSION = 1.1.0
-TASKD_SITE = http://taskwarrior.org/download
-TASKD_LICENSE = MIT
-TASKD_LICENSE_FILES = COPYING
-TASKD_DEPENDENCIES = gnutls util-linux host-pkgconf
-
-$(eval $(cmake-package))

--===============4735358535134785858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4735358535134785858==--
