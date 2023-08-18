Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A794FC71159
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 15:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 546B64007B;
	Fri, 18 Aug 2023 15:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 546B64007B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fd2wjwwNHqHu; Fri, 18 Aug 2023 15:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A750642418;
	Fri, 18 Aug 2023 15:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A750642418
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2AF11BF2EC
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC7194207C
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC7194207C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GdBCKBwS-vc for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 15:52:46 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB4484093A
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 15:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB4484093A
Received: from pwmachine.numericable.fr (85-170-34-233.rev.numericable.fr
 [85.170.34.233])
 by linux.microsoft.com (Postfix) with ESMTPSA id E1BF5211F7DB;
 Fri, 18 Aug 2023 08:52:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E1BF5211F7DB
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 17:52:17 +0200
Message-Id: <20230818155219.71054-3-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818155219.71054-1-flaniel@linux.microsoft.com>
References: <20230818155219.71054-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1692373965;
 bh=CX8ojsLI8KAdi/xiYyd+d3fhPF5EZabICjKkS8RYzo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lq1pUSj/VFvHU8WVoqKHhs8WQ8+IEoxLdrlrrA8t8VJjU4hhuWftheYaviRKjpyWm
 0i8KuKyW9t7ff7eRmJVxO2HwnmyPSc+jjGiMCrCYHy7kWz5GOR5GxOGjUexQ5EXZrB
 +k6Byl4QyHipDu1UTEeBHFxrbfOA/zvokTc2r490=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=lq1pUSj/
Subject: [Buildroot] [RFC PATCH v3 2/3] package/sysdig: bump to version
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

This commit also sets all the BUNDLED_DEPS as off and add them as dependencies.
This way, we ensure building sysdig the buildroot way and not by wgetting some
packages from distant URL.

We also specify DRIVER_SOURCE_DIR, otherwise configuration would fail with the
following error message:
CMake Error at cmake/modules/driver.cmake:53 (add_subdirectory):
  The source directory

    /.../buildroot/output/build/sysdig-0.31.4/buildroot-build/driver-repo/driver-prefix/src/driver

  does not contain a CMakeLists.txt file.
Call Stack (most recent call first):
  cmake/modules/falcosecurity-libs.cmake:97 (include)
  CMakeLists.txt:149 (include)

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 package/sysdig/sysdig.hash |  2 +-
 package/sysdig/sysdig.mk   | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

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
index bafe534a16..965cdc69c7 100644
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
@@ -17,8 +17,12 @@ SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 SYSDIG_DEPENDENCIES = \
 	falcosecurity-libs \
-	ncurses \
 	json-for-modern-cpp \
+	libb64 \
+	re2 \
+	tbb \
+	ncurses \
+	valijson \
 	yaml-cpp
 
 # Don't build the driver as part of the 'standard' procedure, it has been built
@@ -26,13 +30,18 @@ SYSDIG_DEPENDENCIES = \
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
-	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson \
 	-DSYSDIG_VERSION=$(SYSDIG_VERSION)
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
