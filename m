Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF51C531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 21:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E3F60649;
	Sat, 25 Jul 2026 21:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4Wjbza1aVHh; Sat, 25 Jul 2026 21:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16D0C6064B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785015008;
	bh=09RVdLqt0gaJj3U1bBKa3uPDtM8QquLYQLD9DhonMGM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VQTd6IuMaoap7hq6nPbthJOvEF4v1KeGTZt3CQrjo0bTpdTIU8gciky4kH+OZEYHH
	 XC9noPEEC5ESQWqys21GKhD62lKLtx3ro0YakI+lndlQDXb7DD0U1T1a8uUNJc/y8U
	 WdGddwHdXfK7OnQrScuUY0kkArdE/nMhPfOHCQe2SYH8tG7gACFUpu3hP5D3XHWNdJ
	 L+9wl2Boy9yqJWd5XwpfALHX6I8rg36Ni8St+nWtbF7F3DfmOB78+nYmzRah4Bf7/V
	 EgZVhd4r0RJzPu/TflNzbsqfCdpC/moFqSqRFqNFkTaP5CRcXm1bquO0yZb6YnERdF
	 ylB/UdrX6Wmlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16D0C6064B;
	Sat, 25 Jul 2026 21:30:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D383347
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B0A5406EF
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiHDRc9GlhHs for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 21:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C99406EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C99406EE
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:30:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E77608A5F4; Sat, 25 Jul 2026 21:29:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 23:25:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19c1f93e1293414ace60ced20d5058b096268820
X-Git-Newrev: 44a4d39ac493811e03898b6103478d73eb0ff7a6
X-Patchwork-Hint: ignore
Message-Id: <20260725212924.E77608A5F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libosmium: bump version to 2.23.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44a4d39ac493811e03898b6103478d73eb0ff7a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/osmcode/libosmium/blob/v2.23.1/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Require-a-more-modern-CMake.patch         | 45 ----------------------
 package/libosmium/libosmium.hash                   |  2 +-
 package/libosmium/libosmium.mk                     |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/package/libosmium/0001-Require-a-more-modern-CMake.patch b/package/libosmium/0001-Require-a-more-modern-CMake.patch
deleted file mode 100644
index 6c39e751fb..0000000000
--- a/package/libosmium/0001-Require-a-more-modern-CMake.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7ab87418a0697ac9b7b5f005fbd64dcd99a01124 Mon Sep 17 00:00:00 2001
-From: Jochen Topf <jochen@topf.org>
-Date: Tue, 15 Jul 2025 17:19:57 +0200
-Subject: [PATCH] Require a more modern CMake
-
-So it works with CMake 4
-
-See #391
-
-Upstream: https://github.com/osmcode/libosmium/commit/7ab87418a0697ac9b7b5f005fbd64dcd99a01124
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 11 ++---------
- 1 file changed, 2 insertions(+), 9 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cfeffa8e..80f6bfe1 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -6,7 +6,7 @@
- #
- #-----------------------------------------------------------------------------
- 
--cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
-+cmake_minimum_required(VERSION 3.10.0 FATAL_ERROR)
- list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
- 
- 
-@@ -36,14 +36,7 @@ set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo;MinSizeRel;Dev;Cover
- #
- #-----------------------------------------------------------------------------
- 
--project(libosmium)
--
--set(LIBOSMIUM_VERSION_MAJOR 2)
--set(LIBOSMIUM_VERSION_MINOR 22)
--set(LIBOSMIUM_VERSION_PATCH 0)
--
--set(LIBOSMIUM_VERSION
--    "${LIBOSMIUM_VERSION_MAJOR}.${LIBOSMIUM_VERSION_MINOR}.${LIBOSMIUM_VERSION_PATCH}")
-+project(libosmium VERSION 2.22.0 LANGUAGES CXX C)
- 
- set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
- 
diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index 9f09024f74..28cd63532f 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f74e3f6ba295baa7325ae5606e8f74ad9056f1d6ab4555c50bff6aa8246f366  libosmium-2.22.0.tar.gz
+sha256  eb47d8163396c73870dbf27819dcadda0c56f0191935c4f8659d1e61b261552f  libosmium-2.23.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index 5b73b3a128..c7736668f5 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.22.0
+LIBOSMIUM_VERSION = 2.23.1
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
