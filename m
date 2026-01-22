Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7075FD6CFA2
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 273D640945;
	Thu, 22 Jan 2026 19:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6yXfhNn8DRO; Thu, 22 Jan 2026 19:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A2DE40946
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769109825;
	bh=c5O76QR77eBM4LqxHxBN7l2R5DBU1Nz5bobJ0qadgx4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K+nHSeY7OCSYC9ghMWt49hWRGeWkjvQ0+nBYvMp81HuQM/GE42/d0hlldO1IePJ2y
	 dPbblh+TLqwRNrlFzMRVHiTi6z5r2VTlbfcBGDy02sHoCWZv0lTHrELMZkjtbUphWo
	 3XO0cw5rQOcEwFa2N4VPtRRbyOjDvva7mHs2aei0K7McopFU67jUI1/0b0201wFOQp
	 tonF6oAFj0kgUTo2KHEXpA2p81LIqdnP2u9X8YUzA9IW1mnnrBS785geOcusFNzZvk
	 TYmFi+WChh3gmnV89L5yZoVGx/71I2iTnuvKJrHDd/ICjX53ce1+vd8XS39f7FLGfT
	 R69LaJnK06rsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A2DE40946;
	Thu, 22 Jan 2026 19:23:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87943122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7660340156
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bT1eJQJtXX7 for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81DFA4012B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81DFA4012B
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:23:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EF6E85C15; Thu, 22 Jan 2026 19:23:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:22:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1ff33e6a471ec40c0575d773b77b033aeda68f4
X-Git-Newrev: 848b3c96d5892f127e659a4a602ff68e0cf69a4e
X-Patchwork-Hint: ignore
Message-Id: <20260122192342.6EF6E85C15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libubootenv: bump to version 0.3.7
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=848b3c96d5892f127e659a4a602ff68e0cf69a4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://github.com/sbabic/libubootenv/releases/tag/v0.3.7

Drop Update cmake_minimum_required to 3.5 patch which is now upstream.

Rebase do not force the build of a shared library patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...sts.txt-do-not-force-the-build-of-a-share.patch | 12 +++--
 ...0002-Update-cmake_minimum_required-to-3.5.patch | 53 ----------------------
 package/libubootenv/libubootenv.hash               |  2 +-
 package/libubootenv/libubootenv.mk                 |  2 +-
 4 files changed, 9 insertions(+), 60 deletions(-)

diff --git a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
index 9c5438f30e..24935bb1d9 100644
--- a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
+++ b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
@@ -1,4 +1,4 @@
-From 5448ca9d92f7fa197060323a82a5f060ce7c31e7 Mon Sep 17 00:00:00 2001
+From 5ccdd0f15ca3fc1c57b517bf325d572a5398e3cd Mon Sep 17 00:00:00 2001
 From: Pierre-Jean Texier <pjtexier@koncepto.io>
 Date: Wed, 22 May 2019 10:26:27 +0200
 Subject: [PATCH] src/CMakeLists.txt: do not force the build of a shared
@@ -26,10 +26,10 @@ Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 4b71bc5..0b515f4 100644
+index 3370232..efa9840 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -15,17 +15,15 @@ SET(include_HEADERS
+@@ -19,11 +19,9 @@ SET(include_HEADERS
  
  include(GNUInstallDirs) # for the CMAKE_INSTALL_LIBDIR variable
  
@@ -40,7 +40,9 @@ index 4b71bc5..0b515f4 100644
 -ADD_LIBRARY(ubootenv_static STATIC ${libubootenv_SOURCES} ${include_HEADERS})
 -SET_TARGET_PROPERTIES(ubootenv_static PROPERTIES OUTPUT_NAME ubootenv)
  add_executable(fw_printenv fw_printenv.c)
- target_link_libraries(ubootenv z yaml)
+ target_link_libraries(ubootenv z)
+ if (NOT NO_YML_SUPPORT)
+@@ -33,7 +31,7 @@ endif(NOT NO_YML_SUPPORT)
  target_link_libraries(fw_printenv ubootenv)
  add_custom_target(fw_setenv ALL ${CMAKE_COMMAND} -E create_symlink fw_printenv fw_setenv)
  
@@ -50,5 +52,5 @@ index 4b71bc5..0b515f4 100644
  install (TARGETS fw_printenv DESTINATION ${CMAKE_INSTALL_BINDIR})
  install (PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/fw_setenv DESTINATION ${CMAKE_INSTALL_BINDIR})
 -- 
-2.30.2
+2.43.0
 
diff --git a/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch b/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch
deleted file mode 100644
index 531623bc53..0000000000
--- a/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 87581f45d442903af8a9f331b11052bdd836c7f6 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 14 May 2025 14:03:38 -0600
-Subject: [PATCH] Update cmake_minimum_required to 3.5
-
-This supports compilation with cmake-4.0.0.
-
-Fixes:
-CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-  to tell CMake that the project requires at least <min> but has been updated
-  to work with policies introduced by <max> or earlier.
-
-  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://patchwork.ozlabs.org/project/swupdate/patch/20250514201740.686772-1-james.hilliard1@gmail.com/
----
- CMakeLists.txt     | 2 +-
- src/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 796d7bc..0a11730 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,7 +2,7 @@
- #
- # SPDX-License-Identifier:     LGPL-2.1-or-later
- 
--cmake_minimum_required (VERSION 2.6)
-+cmake_minimum_required (VERSION 3.5)
- project (libubootenv C)
- 
- # The version number.
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index c56d0c7..3370232 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -1,7 +1,7 @@
- # SPDX-FileCopyrightText: 2019-2021 Stefano Babic <stefano.babic@swupdate.org>
- #
- # SPDX-License-Identifier:     LGPL-2.1-or-later
--cmake_minimum_required (VERSION 2.6)
-+cmake_minimum_required (VERSION 3.5)
- # Sources and private headers
- SET(libubootenv_SOURCES
-   uboot_env.c
--- 
-2.34.1
-
diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 986b651e42..4b48c5527c 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7946006781ad518aac1f06e2ad7e0281e4ece3d59e9616cccb01fd0c169a3e0b  libubootenv-0.3.6.tar.gz
+sha256  92021fc5a0a965030588d0c867a771d28b28c0d17c9fd022f0dafe9f01de714e  libubootenv-0.3.7.tar.gz
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 5c2c36e90b..b18486af6f 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 0.3.6
+LIBUBOOTENV_VERSION = 0.3.7
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
 LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
