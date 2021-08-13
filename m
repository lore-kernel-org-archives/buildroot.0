Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAE3C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:05:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BE12610CC
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BE12610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49F4560640;
	Fri, 13 Aug 2021 13:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pn8y_m6FYL6b; Fri, 13 Aug 2021 13:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A572460692;
	Fri, 13 Aug 2021 13:05:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A97B11BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9904483AEF
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGPRdi9S3dYg for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:05:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA5CE80EB8
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:05:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 742E687BC7; Fri, 13 Aug 2021 13:04:47 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:05:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0610d838d82a46141d762a498b09762e8f423c68
X-Git-Newrev: 43b69dbac811e509ad38c959b0238d565669de6a
X-Patchwork-Hint: ignore
Message-Id: <20210813130447.742E687BC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgeos: bump version
 to 3.9.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=43b69dbac811e509ad38c959b0238d565669de6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove upstream patch.
Add myself to DEVELOPERS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 .../0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch | 37 ----------------------
 package/libgeos/libgeos.hash                       |  2 +-
 package/libgeos/libgeos.mk                         |  2 +-
 4 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b82f36f776..a102ce4af4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1871,6 +1871,7 @@ N:	Max Filippov <jcmvbkbc@gmail.com>
 F:	arch/Config.in.xtensa
 
 N:	Maxim Kochetkov <fido_max@inbox.ru>
+F:	package/libgeos/
 F:	package/libosmium/
 F:	package/osm2pgsql/
 F:	package/postgis/
diff --git a/package/libgeos/0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch b/package/libgeos/0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch
deleted file mode 100644
index 94748dcdbd..0000000000
--- a/package/libgeos/0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 16848d6da27140caf922f71a233f96a508fb061e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 24 Jan 2021 12:38:37 +0100
-Subject: [PATCH] CMakeLists.txt: add BUILD_BENCHMARKS
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/libgeos/geos/pull/395]
----
- CMakeLists.txt | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c8b39bac..8ca6b829 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -48,6 +48,7 @@ option(BUILD_SHARED_LIBS "Build GEOS with shared libraries" ON)
- set(CMAKE_CXX_STANDARD 11 CACHE STRING "C++ standard version to use (default is 11)")
- 
- ## GEOS custom variables
-+option(BUILD_BENCHMARKS "Build GEOS benchmarks" ON)
- cmake_dependent_option(GEOS_BUILD_DEVELOPER
-   "Build with compilation flags useful for development" ON
-   "GEOS_BUILD_FROM_GIT" OFF)
-@@ -292,7 +293,9 @@ endif()
- #-----------------------------------------------------------------------------
- # Benchmarks
- #-----------------------------------------------------------------------------
--add_subdirectory(benchmarks)
-+if(BUILD_BENCHMARKS)
-+  add_subdirectory(benchmarks)
-+endif()
- 
- #-----------------------------------------------------------------------------
- # Utils
--- 
-2.29.2
-
diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 5b5e44c7c5..3508ba9077 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd8082cf12f45f27630193c78bdb5a3cba847b81e72b20268356c2a4fc065269  geos-3.9.0.tar.bz2
+sha256  7e630507dcac9dc07565d249a26f06a15c9f5b0c52dd29129a0e3d381d7e382a  geos-3.9.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index a355732af8..ab2035c62a 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.9.0
+LIBGEOS_VERSION = 3.9.1
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
