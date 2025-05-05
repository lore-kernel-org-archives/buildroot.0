Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E18C3ABB6
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 10:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB6F060A5B;
	Mon,  5 May 2025 10:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbOeN2mYLWmA; Mon,  5 May 2025 10:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D7960A51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10D7960A51;
	Mon,  5 May 2025 10:42:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 152BFEA
 for <buildroot@buildroot.org>; Mon,  5 May 2025 10:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAC224058C
 for <buildroot@buildroot.org>; Mon,  5 May 2025 10:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHVtHxelSBH4 for <buildroot@buildroot.org>;
 Mon,  5 May 2025 10:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D2AC4053C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D2AC4053C
 for <buildroot@buildroot.org>; Mon,  5 May 2025 10:42:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBE7B86432; Mon,  5 May 2025 10:42:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 May 2025 12:38:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a07a9d155b8f601d68f07ee0ed1dc8d48907644
X-Git-Newrev: 11c7d00a59bd263d1234086d8b769a4be397bde8
X-Patchwork-Hint: ignore
Message-Id: <20250505104223.EBE7B86432@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiredis: bump to version 1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=11c7d00a59bd263d1234086d8b769a4be397bde8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/redis/hiredis/releases/tag/v1.3.0

Note this version raises the minimum cmake version from 3.0.0 to 3.7.0.
This change fixes build with a host-cmake 4.0.0 (which has removed
compatibility with cmake < 3.5). Such a failure happens on Arch Linux
which is now providing cmake 4.0.

Fixes:
https://autobuild.buildroot.org/results/662fc308807866f9e25655541f6a8ef9ff32e55a/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add details in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...add-option-to-not-install-NuGet-packaging.patch | 51 ----------------------
 package/hiredis/hiredis.hash                       |  2 +-
 package/hiredis/hiredis.mk                         |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch b/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
deleted file mode 100644
index dbe8bc0ae6..0000000000
--- a/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ff7a064490e0aacf718a5263b25b2ddaad0d245e Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 20 Jan 2024 13:53:39 +0100
-Subject: [PATCH] CMakeList: add option to not install NuGet packaging
-
-The NuGet hiredis.target packaging description file is of no use on
-systems that are not using NuGet, like Linux systems, and the spurious
-presence of that file is not "clean".
-
-Add a cmake option to allow users to disable installation of that file.
-As some people may have relied on that file to be installed, continue to
-install it by default.
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/redis/hiredis/commit/ff7a064490e0aacf718a5263b25b2ddaad0d245e
----
- CMakeLists.txt | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b7d6ee8..0fcf29b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -6,6 +6,9 @@ OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
- OPTION(ENABLE_SSL_TESTS "Should we test SSL connections" OFF)
- OPTION(ENABLE_EXAMPLES "Enable building hiredis examples" OFF)
- OPTION(ENABLE_ASYNC_TESTS "Should we run all asynchronous API tests" OFF)
-+# Historically, the NuGet file was always install; default
-+# to ON for those who rely on that historical behaviour.
-+OPTION(ENABLE_NUGET "Install NuGET packaging details" ON)
-
- MACRO(getVersionBit name)
-   SET(VERSION_REGEX "^#define ${name} (.+)$")
-@@ -105,9 +108,11 @@ if (MSVC AND BUILD_SHARED_LIBS)
-         CONFIGURATIONS Debug RelWithDebInfo)
- endif()
-
--# For NuGet packages
--INSTALL(FILES hiredis.targets
--    DESTINATION build/native)
-+if (ENABLE_NUGET)
-+    # For NuGet packages
-+    INSTALL(FILES hiredis.targets
-+        DESTINATION build/native)
-+endif()
-
- INSTALL(FILES hiredis.h read.h sds.h async.h alloc.h sockcompat.h
-     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/hiredis)
---
-2.43.0
-
diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index 16ee442d93..b9b4fe556e 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  82ad632d31ee05da13b537c124f819eb88e18851d9cb0c30ae0552084811588c  hiredis-1.2.0.tar.gz
+sha256  25cee4500f359cf5cad3b51ed62059aadfc0939b05150c1f19c7e2829123631c  hiredis-1.3.0.tar.gz
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  COPYING
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 86f35bd4cd..f7acb2f131 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIREDIS_VERSION_MAJOR = 1.2
+HIREDIS_VERSION_MAJOR = 1.3
 HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
