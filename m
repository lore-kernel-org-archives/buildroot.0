Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6B2CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85D7484365;
	Tue,  9 Jun 2026 13:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1bf_ZW-Sh6z; Tue,  9 Jun 2026 13:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 473B584278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010268;
	bh=zaWdZFajJBorox2Q5vZvRa0e/yEQoihD6K2yRaui2bI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iy4CrnQPsd1NgQJQXq6GCZGAJVmesdaM++Y9rix1ycFFCe/UWqUgq7lEH1D0qNfe2
	 Mr3U7QL5bwyBMQCawzJCcmQKsVavj3ftXtymDJhbqsJpOk857oe+g3qg5q82c4P+bn
	 qvW6umaDDbjQqDBO8pGJC0iJJsk5ZCp+dqVDozvANhaMuNA28DH96ucEhvkMTNGQhQ
	 eWGKQ5DBQwwvDS15qZIZX15YNUgTi59NK0koACSfogfGSESRko7UyjAnPRkfubbClO
	 bZVTQ0PpGSOBmVG35kY/qlzKcIqVnfcttzlAhSUdDEa0sK9X+cnlFlIhnUmbMRmjg3
	 7Y1aciaXDaN0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 473B584278;
	Tue,  9 Jun 2026 13:04:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2B56196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54DA74271B
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 820bXb4MFSXM for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95F35426F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95F35426F9
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1D5387E7E; Tue,  9 Jun 2026 13:01:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6106c2c21cc5b9157141c5fe0abeddf54c934e9d
X-Git-Newrev: 3a795fa19a752dfd9f04f2a848e04879abf638a1
X-Patchwork-Hint: ignore
Message-Id: <20260609130122.D1D5387E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snappy: enable rtti
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a795fa19a752dfd9f04f2a848e04879abf638a1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Added patch to enable rtti, needed for upcoming bump of rocksdb to fix
link error:

output/per-package/rocksdb/host/bin/../lib/gcc/x86_64-buildroot-linux-
gnu/15.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
 librocksdb.so.10.7.5: undefined reference to `typeinfo for snappy::Sink'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../snappy/0002-add-option-to-enable-rtti.patch    | 52 ++++++++++++++++++++++
 package/snappy/snappy.mk                           |  5 ++-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/package/snappy/0002-add-option-to-enable-rtti.patch b/package/snappy/0002-add-option-to-enable-rtti.patch
new file mode 100644
index 0000000000..e82328b0ff
--- /dev/null
+++ b/package/snappy/0002-add-option-to-enable-rtti.patch
@@ -0,0 +1,52 @@
+From 376f14b5933e91d08ade6a503fdd657a6e01a149 Mon Sep 17 00:00:00 2001
+From: Max <tchristy001@outlook.com>
+Date: Wed, 24 Nov 2021 12:16:23 -0600
+Subject: [PATCH] add option to enable rtti, set default to current behavior
+
+Upstream: https://github.com/google/snappy/pull/147 (rejected)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[rebased for 1.2.2]
+---
+ CMakeLists.txt | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6eef485..aefd35b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -53,8 +53,10 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
+   add_definitions(-D_HAS_EXCEPTIONS=0)
+ 
+   # Disable RTTI.
+-  string(REGEX REPLACE "/GR" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
+-  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /GR-")
++  if(NOT SNAPPY_ENABLE_RTTI)
++    string(REGEX REPLACE "/GR" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /GR-")
++  endif(SNAPPY_ENABLE_RTTI)
+ else(MSVC)
+   # Use -Wall for clang and gcc.
+   if(NOT CMAKE_CXX_FLAGS MATCHES "-Wall")
+@@ -78,8 +80,10 @@ else(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions")
+ 
+   # Disable RTTI.
+-  string(REGEX REPLACE "-frtti" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
+-  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
++  if(NOT SNAPPY_ENABLE_RTTI)
++    string(REGEX REPLACE "-frtti" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
++  endif(SNAPPY_ENABLE_RTTI)
+ endif(MSVC)
+ 
+ # BUILD_SHARED_LIBS is a standard CMake variable, but we declare it here to make
+@@ -98,6 +102,8 @@ option(SNAPPY_REQUIRE_AVX2 "Target processors with AVX2 support." OFF)
+ 
+ option(SNAPPY_INSTALL "Install Snappy's header and library" ON)
+ 
++option(SNAPPY_ENABLE_RTTI "Enable RTTI for Snappy's library" OFF)
++
+ include(TestBigEndian)
+ test_big_endian(SNAPPY_IS_BIG_ENDIAN)
+ 
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 57c688b673..cd61bbb078 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -10,6 +10,9 @@ SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
 SNAPPY_CPE_ID_VENDOR = google
 SNAPPY_INSTALL_STAGING = YES
-SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_BENCHMARKS=OFF -DSNAPPY_BUILD_TESTS=OFF
+SNAPPY_CONF_OPTS = \
+	-DSNAPPY_BUILD_BENCHMARKS=OFF \
+	-DSNAPPY_BUILD_TESTS=OFF \
+	-DSNAPPY_ENABLE_RTTI=ON
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
