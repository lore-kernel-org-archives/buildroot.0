Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4323C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71C457002B;
	Tue, 21 Feb 2023 01:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71C457002B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wB8-6QQeRXto; Tue, 21 Feb 2023 01:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8614070146;
	Tue, 21 Feb 2023 01:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8614070146
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 037FC1BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80071610E2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80071610E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ol0ePEMl44W5 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 832366FE5F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 832366FE5F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 819BC828C8; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 11:57:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 247e2d0eb1e60f483044d58bed58c5ed321528f7
X-Git-Newrev: c419ef62d84b5be65599452ab84f7ed719bbe470
X-Patchwork-Hint: ignore
Message-Id: <20230220205255.819BC828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/neon-2-sse: bump to
 version 097a5ecacd527d5b5c3006e360fb9cb1c1c48a1f
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

commit: https://git.buildroot.net/buildroot/commit/?id=c419ef62d84b5be65599452ab84f7ed719bbe470
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neon-2-sse/0001-Fix-cmake-languages.patch | 40 -----------------------
 package/neon-2-sse/neon-2-sse.hash                |  2 +-
 package/neon-2-sse/neon-2-sse.mk                  |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/package/neon-2-sse/0001-Fix-cmake-languages.patch b/package/neon-2-sse/0001-Fix-cmake-languages.patch
deleted file mode 100644
index e0becb1ffa..0000000000
--- a/package/neon-2-sse/0001-Fix-cmake-languages.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 186ec82e033d8c718d760d14945535a9d7e160fd Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sun, 29 Jan 2023 21:00:27 -0700
-Subject: [PATCH] Fix cmake languages
-
-When no language is set cmake defaults to C and CXX, since we support
-C by itself we should set the project language to C so that we don't
-get a compiler error when building without a CXX toolchain.
-
-Fixes:
-CMake Error at CMakeLists.txt:5 (project):
-  No CMAKE_CXX_COMPILER could be found.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/intel/ARM_NEON_2_x86_SSE/pull/62]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e4b8980..8f58e79 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,7 +2,7 @@
- # Modification: Copyright (C) 2017 David Hirvonen
- 
- cmake_minimum_required(VERSION 3.0)
--project(NEON_2_SSE VERSION 1.0.0)
-+project(NEON_2_SSE VERSION 1.0.0 LANGUAGES C)
- 
- add_library(${PROJECT_NAME} INTERFACE)
- 
--- 
-2.34.1
-
diff --git a/package/neon-2-sse/neon-2-sse.hash b/package/neon-2-sse/neon-2-sse.hash
index ded20d58f5..f964d2fa61 100644
--- a/package/neon-2-sse/neon-2-sse.hash
+++ b/package/neon-2-sse/neon-2-sse.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  019fbc7ec25860070a1d90e12686fc160cfb33e22aa063c80f52b363f1361e9d  neon-2-sse-a15b489e1222b2087007546b4912e21293ea86ff.tar.gz
+sha256  4567ca8c8cbc8ce0ea3ddb9dc0f158707eb85c631cb400fd7010cd299cdc5377  neon-2-sse-097a5ecacd527d5b5c3006e360fb9cb1c1c48a1f.tar.gz
 # License files, locally calculated
 sha256  7022f51b439a5915e933ecc270c83e24ca0cb2cceeb08b0132dcd4dbb03ed2dc  LICENSE
diff --git a/package/neon-2-sse/neon-2-sse.mk b/package/neon-2-sse/neon-2-sse.mk
index 3e87c62e21..ee6f5446b6 100644
--- a/package/neon-2-sse/neon-2-sse.mk
+++ b/package/neon-2-sse/neon-2-sse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_2_SSE_VERSION = a15b489e1222b2087007546b4912e21293ea86ff
+NEON_2_SSE_VERSION = 097a5ecacd527d5b5c3006e360fb9cb1c1c48a1f
 NEON_2_SSE_SITE = $(call github,intel,ARM_NEON_2_x86_SSE,$(NEON_2_SSE_VERSION))
 NEON_2_SSE_LICENSE = BSD-2-Clause
 NEON_2_SSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
