Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543AECAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02260822E5;
	Fri, 19 Sep 2025 12:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFaWpAnGg6Xb; Fri, 19 Sep 2025 12:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B455822E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B455822E9;
	Fri, 19 Sep 2025 12:42:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B657273
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEBB240C14
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJYbRcq0T2B4 for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E45D4087A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E45D4087A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EDE385E80; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 09:40:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 599ce8869357de58a92865caa541b90a94df5994
X-Git-Newrev: 7be8dd89cee2d5a28a21e2d4a06db9b4e6f41829
X-Patchwork-Hint: ignore
Message-Id: <20250919124235.4EDE385E80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/avrdude: remove
 0001 patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7be8dd89cee2d5a28a21e2d4a06db9b4e6f41829
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This reverts commit dd4299e87a87bffee4491fdd30c9c23dc75fa7cb.

The SWIG implementation is not present on version 7.2 avaiable on
2025.02.x. It was introduced in version 8.0 of avrdude [1].

[1] https://github.com/avrdudes/avrdude/pull/1714

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...eLists.txt-allow-disabling-Python-support.patch | 59 ----------------------
 package/avrdude/avrdude.mk                         |  2 +-
 2 files changed, 1 insertion(+), 60 deletions(-)

diff --git a/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch b/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
deleted file mode 100644
index fc6210c099..0000000000
--- a/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 41ee27cf1d31bbc62425aab286b7e524acc64bff Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 29 Aug 2025 22:21:50 +0200
-Subject: [PATCH] CMakeLists.txt: allow disabling Python support
-
-In some cases, even if Swig is found and Python3 is found, it may not
-be desirable to build Python support in avrdude, so this commit adds
-an ENABLE_PYTHON_SUPPORT option to be able to explicitly disable using
-Python support (unfortunately CMake doesn't allow passing arguments
-that would prevent it from finding Swig/Python 3 if available).
-
-To preserve existing behavior, this option defaults to enabled (ON).
-
-Upstream: https://github.com/avrdudes/avrdude/pull/2051
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- CMakeLists.txt | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7f3fce92..94263bab 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -34,6 +34,7 @@ option(USE_EXTERNAL_LIBS "Use external libraries from AVRDUDE GitHub repositorie
- option(USE_LIBUSBWIN32 "Prefer libusb-win32 over libusb" OFF)
- option(DEBUG_CMAKE "Enable debugging output for this CMake project" OFF)
- option(BUILD_SHARED_LIBS "Build shared libraries" OFF)
-+option(ENABLE_PYTHON_SUPPORT "Enable Python support" ON)
- 
- if(WIN32)
-     # Prefer static libraries over DLLs on Windows
-@@ -281,14 +282,16 @@ if(HAVE_LINUXGPIO)
- endif()
- 
- # -------------------------------------
--# Find SWIG
--find_package(SWIG 4.0 COMPONENTS python)
--if(SWIG_FOUND)
--  find_package(Python3 COMPONENTS Interpreter Development)
--  if(PYTHON3_FOUND)
--    set(HAVE_SWIG 1)
--  else()
--    message(STATUS "Found SWIG but no Python3 header/library; cannot use SWIG")
-+# Find SWIG/Python3 if needed
-+if(ENABLE_PYTHON_SUPPORT)
-+  find_package(SWIG 4.0 COMPONENTS python)
-+  if(SWIG_FOUND)
-+    find_package(Python3 COMPONENTS Interpreter Development)
-+    if(PYTHON3_FOUND)
-+      set(HAVE_SWIG 1)
-+    else()
-+      message(STATUS "Found SWIG but no Python3 header/library; cannot use SWIG")
-+    endif()
-   endif()
- endif()
- 
--- 
-2.50.1
-
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 7ffecce041..54d83dec4b 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -9,7 +9,7 @@ AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
 
-AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON -DENABLE_PYTHON_SUPPORT=NO
+AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
