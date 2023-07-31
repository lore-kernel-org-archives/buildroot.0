Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6AEC001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 20:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B662960F0A;
	Mon, 31 Jul 2023 20:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B662960F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utK5uAa3_2iI; Mon, 31 Jul 2023 20:14:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAEFA60774;
	Mon, 31 Jul 2023 20:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAEFA60774
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 285F71BF2B4
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03CF281EE0
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03CF281EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3IJJIRewyeNR for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 20:14:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2BF98188B
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 20:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2BF98188B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8705D83DEE; Mon, 31 Jul 2023 20:14:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 22:10:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b559109eeeec19e6e33c82712690aec89dcb562
X-Git-Newrev: e434d8a29fd566c43c1051eb84694b6ac032597d
X-Patchwork-Hint: ignore
Message-Id: <20230731201404.8705D83DEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysdig: remove patch that doesn't
 apply
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e434d8a29fd566c43c1051eb84694b6ac032597d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch
should have been deleted as part of Buildroot commit
08792a60df80a1147ee78bb108f8186996bf0c77 ("package/sysdig: bump to
version 0.29.3"). Indeed, this patch was merged upstream as commit
114436c1a45142ef73acfc2607fbc6572782160f between 0.29.2 and 0.29.3.

This fixes the following build failure:

Applying 0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch using patch:
patching file cmake/modules/nlohmann-json.cmake
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file cmake/modules/nlohmann-json.cmake.rej

There are no autobuilder failures, probably because getting to build
sysdig requires so many special conditions that it never triggered.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-USE_BUNDLED_DEPS-before-getting-nlohmann.patch | 52 ----------------------
 1 file changed, 52 deletions(-)

diff --git a/package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch b/package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch
deleted file mode 100644
index 3521bd3f8d..0000000000
--- a/package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0dbebd008c04d266dc41c4bec8280a0744fd5130 Mon Sep 17 00:00:00 2001
-From: Francis Laniel <flaniel@linux.microsoft.com>
-Date: Wed, 13 Apr 2022 18:01:11 +0100
-Subject: [PATCH] cmake: Check USE_BUNDLED_DEPS before getting
- nlohmann-json.
-
-Upstream: https://github.com/draios/sysdig/pull/1869
-Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
----
- cmake/modules/nlohmann-json.cmake | 29 +++++++++++++++++++----------
- 1 file changed, 19 insertions(+), 10 deletions(-)
-
-diff --git a/cmake/modules/nlohmann-json.cmake b/cmake/modules/nlohmann-json.cmake
-index bb1279d7..feb0f071 100644
---- a/cmake/modules/nlohmann-json.cmake
-+++ b/cmake/modules/nlohmann-json.cmake
-@@ -16,13 +16,22 @@
- # limitations under the License.
- #
- 
--set(NJSON_SRC "${PROJECT_BINARY_DIR}/njson-prefix/src/njson")
--message(STATUS "Using bundled nlohmann-json in '${NJSON_SRC}'")
--set(NJSON_INCLUDE_DIR "${NJSON_SRC}/single_include")
--ExternalProject_Add(
--  njson
--  URL "https://github.com/nlohmann/json/archive/v3.3.0.tar.gz"
--  URL_HASH "SHA256=2fd1d207b4669a7843296c41d3b6ac5b23d00dec48dba507ba051d14564aa801"
--  CONFIGURE_COMMAND ""
--  BUILD_COMMAND ""
--  INSTALL_COMMAND "")
-+if(NOT USE_BUNDLED_DEPS)
-+  find_path(NJSON_INCLUDE_DIR NAMES nlohmann/json.hpp)
-+  if(NJSON_INCLUDE_DIR)
-+    message(STATUS "Found njson: include: ${NJSON_INCLUDE_DIR}")
-+  else()
-+    message(FATAL_ERROR "Couldn't find system njson")
-+  endif()
-+else()
-+  set(NJSON_SRC "${PROJECT_BINARY_DIR}/njson-prefix/src/njson")
-+  message(STATUS "Using bundled nlohmann-json in '${NJSON_SRC}'")
-+  set(NJSON_INCLUDE_DIR "${NJSON_SRC}/single_include")
-+  ExternalProject_Add(
-+    njson
-+    URL "https://github.com/nlohmann/json/archive/v3.3.0.tar.gz"
-+    URL_HASH "SHA256=2fd1d207b4669a7843296c41d3b6ac5b23d00dec48dba507ba051d14564aa801"
-+    CONFIGURE_COMMAND ""
-+    BUILD_COMMAND ""
-+    INSTALL_COMMAND "")
-+endif()
--- 
-2.25.1
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
