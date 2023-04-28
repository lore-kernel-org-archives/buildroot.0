Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBF8C77B7E
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 15:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB7C6427A0;
	Fri, 28 Apr 2023 15:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7C6427A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0EqdP8DLK75n; Fri, 28 Apr 2023 15:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8744142824;
	Fri, 28 Apr 2023 15:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8744142824
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7CD1BF57B
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 15:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3447C84247
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 15:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3447C84247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBW7Qx5LtNTx for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 15:22:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F1B784240
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F1B784240
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 15:22:39 +0000 (UTC)
Received: from pwmachine.numericable.fr
 (166.red-83-59-184.dynamicip.rima-tde.net [83.59.184.166])
 by linux.microsoft.com (Postfix) with ESMTPSA id CBF3B21C33F7;
 Fri, 28 Apr 2023 08:22:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CBF3B21C33F7
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 16:22:10 +0100
Message-Id: <20230428152211.20394-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428152211.20394-1-flaniel@linux.microsoft.com>
References: <20230428152211.20394-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1682695358;
 bh=zGBwoLos2Qg5AdfA6VF8hE60QA+x2xX6wgAYKu78tK0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W3fB3LaMVhvZ9NzO072/lJ3UjmcGY34s5bec+Q1zTWiIthMeJUuxPg8zOli87QG3J
 5ASpFEJX8jG4YLZnOSN/wt+rgfN/vt4BTytLf3oovLJ6/5eS3vlnfMovkJCSzAzHUc
 jnDAoIZuHl6lNp4lsoy7EJ37K99RSW5ckZNWstXE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=W3fB3LaM
Subject: [Buildroot] [RFC PATCH v1 1/2] package/sysdig: bump to version
 0.31.4
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Remove upstream patch as it is no more needed.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 ...BUNDLED_DEPS-before-getting-nlohmann.patch | 52 -------------------
 package/sysdig/sysdig.hash                    |  2 +-
 package/sysdig/sysdig.mk                      |  8 ++-
 3 files changed, 8 insertions(+), 54 deletions(-)
 delete mode 100644 package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch

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
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index cda3de5e7c..902f6f2b82 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  6b96797859002ab69a2bed4fdba1c7fe8064ecf8661621ae7d8fbf8599ffa636  sysdig-0.29.3.tar.gz
+sha256  b8f43326506f85e99a3455f51b75ee79bf4db9dc12908ef43af672166274a795  sysdig-0.31.4.tar.gz
 sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index bafe534a16..aabd274557 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.29.3
+SYSDIG_VERSION = 0.31.4
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = Apache-2.0
 SYSDIG_LICENSE_FILES = COPYING
@@ -26,11 +26,17 @@ SYSDIG_DEPENDENCIES = \
 # grpc_cpp_plugin is needed to build falcosecurity libs, so we give the host
 # one there.
 SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR) \
+	-DDRIVER_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR)/driver \
 	-DBUILD_DRIVER=OFF \
 	-DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin \
 	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME) \
 	-DENABLE_DKMS=OFF \
 	-DUSE_BUNDLED_DEPS=OFF \
+	-DUSE_BUNDLED_TBB=OFF \
+	-DUSE_BUNDLED_B64=OFF \
+	-DUSE_BUNDLED_JSONCPP=OFF \
+	-DUSE_BUNDLED_VALIJSON=OFF \
+	-DUSE_BUNDLED_RE2=OFF \
 	-DWITH_CHISEL=ON \
 	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson \
 	-DSYSDIG_VERSION=$(SYSDIG_VERSION)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
