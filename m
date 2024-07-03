Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07262C30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 09:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E0E984670;
	Wed,  3 Jul 2024 09:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-aZNgg5nb8W; Wed,  3 Jul 2024 09:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF0E98466C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF0E98466C;
	Wed,  3 Jul 2024 09:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DD251BF33D
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 09:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58D108466C
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 09:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0X3ElCcA5q-W for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 09:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9A2B844AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9A2B844AA
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9A2B844AA
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 09:06:38 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a729d9d7086so76571766b.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 02:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719997597; x=1720602397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aYe+YnF0EUGwo+FxY3ktukvaYJAaRug7LiydQnjYwUo=;
 b=jl3MYyENQByyMBFMqqrVyhGcwYS2V9LIl44MGQKRsbB3j7OEEaLmgix7PhnllPF5Cs
 6gOwXr81BopYQwrEZ6qjcIWn8AAmlFwmHiuB+klD5ZE1bjd9DXGwnhVv1h16rEQjFc+6
 5Po/WC5HaqlknXeNo9Nma8NymD0NRBLR3px1GPuF9mEl+nJfG+vXb+NjarGcePCINr4M
 fxte1uKc3jB5C1c1BBiwIRg2aQQRLjlmO+lP4AZjwnACAPeG+JAWBDseeBqU5pOMQau1
 VKX++6h+oNwppiqnNNQKcaUXj+CyeczGUL78StISzNMHkVbsbt0qB2DyqA5I3W3PW3J4
 4eEA==
X-Gm-Message-State: AOJu0YzNVWRA9D9U6vJheJFwi8KPmOBuRZb134Ssjq23MGEBoxGnuBxM
 8AAfwxpkdOFBhkJe43tXyo3guPahQX25Lk5bpktP46cqLiSY1AEfI1acQmGXzHvZnsZk7eCm/gD
 xItc=
X-Google-Smtp-Source: AGHT+IEdImt+P+1g8K9g8Uuaw32yqj4mng8zruSe9LyK+E1s6F4zR6CUjN6ZQju7FRYa5cw3kcITHw==
X-Received: by 2002:a17:906:2750:b0:a72:7a71:7f4f with SMTP id
 a640c23a62f3a-a77a2411db7mr81403666b.7.1719997596624; 
 Wed, 03 Jul 2024 02:06:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1a37:2bf3:7cf8:1941])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf1ba9dsm489379766b.29.2024.07.03.02.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 02:06:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 11:06:30 +0200
Message-ID: <20240703090630.2657626-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719997597; x=1720602397;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aYe+YnF0EUGwo+FxY3ktukvaYJAaRug7LiydQnjYwUo=;
 b=Dm+qgomtz7qmzidgFWqNUVh3yMM26sYT3knshCmvi7YfOUrJ+8tIrlc8ITqupSLk3Z
 CNku/7/Ia6zcDnPO/ciRAY4Mtb/aQabEopc8Oli7Gn63TDGPUiaZVRgPQwuAyo/VJotI
 jXHvYlHaA+YwJfWwdMMJ1aOxvBTkxhkBsZMOE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Dm+qgomt
Subject: [Buildroot] [PATCH 1/1] package/leveldb: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Steve James <ste@junkomatic.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, leveldb fails to build with output:

    Applying 0002-CMake-install-libmemenv.a.patch using patch:
    patching file CMakeLists.txt
    Hunk #1 succeeded at 209 (offset 22 lines).
    Hunk #2 succeeded at 469 (offset 27 lines).
    Hunk #3 FAILED at 495.
    1 out of 3 hunks FAILED -- saving rejects to file CMakeLists.txt.rej

    Applying 0004-cmake-Use-find_package-to-find-Snappy.patch using patch:
    patching file CMakeLists.txt
    Hunk #2 FAILED at 34.
    Hunk #3 succeeded at 301 (offset 22 lines).
    1 out of 3 hunks FAILED -- saving rejects to file CMakeLists.txt.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0002-CMake-install-libmemenv.a.patch      | 24 ++++++++++---------
 ...make-Use-find_package-to-find-Snappy.patch | 18 +++++++-------
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/package/leveldb/0002-CMake-install-libmemenv.a.patch b/package/leveldb/0002-CMake-install-libmemenv.a.patch
index ea742b0c4977..25e050eaff8d 100644
--- a/package/leveldb/0002-CMake-install-libmemenv.a.patch
+++ b/package/leveldb/0002-CMake-install-libmemenv.a.patch
@@ -1,4 +1,4 @@
-From 2fa960098e5b6f9daa9f7d6cab27188566859be8 Mon Sep 17 00:00:00 2001
+From ef03beb64f5e8028f6b5d65f75ee60e8b2eec594 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 12 Oct 2019 14:43:46 +0200
 Subject: [PATCH] CMake: install libmemenv.a
@@ -10,15 +10,17 @@ https://git.busybox.net/buildroot/commit/?id=16f847340d07dce620e4c3fc0a099aa7989
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Fabrice : updated for 1.23]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- CMakeLists.txt | 26 +++++++++++++++++++++++++-
- 1 file changed, 25 insertions(+), 1 deletion(-)
+ CMakeLists.txt | 32 +++++++++++++++++++++++++++++++-
+ 1 file changed, 31 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a65afbf..83b2425 100644
+index f8285b82c6a4..ffce93b01ed6 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -187,6 +187,30 @@ target_sources(leveldb
+@@ -209,6 +209,30 @@ target_sources(leveldb
      "${LEVELDB_PUBLIC_INCLUDE_DIR}/write_batch.h"
  )
  
@@ -49,7 +51,7 @@ index a65afbf..83b2425 100644
  if (WIN32)
    target_sources(leveldb
      PRIVATE
-@@ -418,7 +436,7 @@ endif(LEVELDB_BUILD_BENCHMARKS)
+@@ -445,7 +469,7 @@ int main() {
  endif(LEVELDB_BUILD_BENCHMARKS)
  
  if(LEVELDB_INSTALL)
@@ -58,8 +60,8 @@ index a65afbf..83b2425 100644
      EXPORT leveldbTargets
      RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
      LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-@@ -444,6 +462,12 @@ if(LEVELDB_INSTALL)
-     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/leveldb
+@@ -471,6 +495,12 @@ if(LEVELDB_INSTALL)
+     DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/leveldb"
    )
  
 +  install(
@@ -69,8 +71,8 @@ index a65afbf..83b2425 100644
 +  )
 +
    include(CMakePackageConfigHelpers)
-   write_basic_package_version_file(
-       "${PROJECT_BINARY_DIR}/leveldbConfigVersion.cmake"
+   configure_package_config_file(
+     "cmake/${PROJECT_NAME}Config.cmake.in"
 -- 
-2.20.1
+2.43.0
 
diff --git a/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch b/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
index 714e1b082740..e254a26b9afb 100644
--- a/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
+++ b/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
@@ -1,4 +1,4 @@
-From 450c1d88b3e1af34614294830b4dc0612d198d26 Mon Sep 17 00:00:00 2001
+From aa658d96f59d0e29f0d9208b8fbb3cce42e57edc Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Pawe=C5=82=20Bylica?= <chfast@gmail.com>
 Date: Wed, 8 May 2019 10:42:03 +0200
 Subject: [PATCH] cmake: Use find_package() to find Snappy
@@ -9,6 +9,8 @@ in static link configurations]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Fabrice : updated for 1.23]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  CMakeLists.txt         | 12 ++++++++----
  cmake/FindSnappy.cmake | 31 +++++++++++++++++++++++++++++++
@@ -16,7 +18,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  create mode 100644 cmake/FindSnappy.cmake
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 78fead6..2efccda 100644
+index 436a9fe5513f..bbd179d3be59 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -6,6 +6,9 @@ cmake_minimum_required(VERSION 3.9)
@@ -29,9 +31,9 @@ index 78fead6..2efccda 100644
  # C standard can be overridden when this is used as a sub-project.
  if(NOT CMAKE_C_STANDARD)
    # This project can use C11, but will gracefully decay down to C89.
-@@ -31,13 +34,14 @@ option(LEVELDB_INSTALL "Install LevelDB's header and library" ON)
- include(TestBigEndian)
- test_big_endian(LEVELDB_IS_BIG_ENDIAN)
+@@ -34,13 +37,14 @@ option(LEVELDB_BUILD_TESTS "Build LevelDB's unit tests" ON)
+ option(LEVELDB_BUILD_BENCHMARKS "Build LevelDB's benchmarks" ON)
+ option(LEVELDB_INSTALL "Install LevelDB's header and library" ON)
  
 +find_package(Snappy)
 +
@@ -45,7 +47,7 @@ index 78fead6..2efccda 100644
  check_library_exists(tcmalloc malloc "" HAVE_TCMALLOC)
  
  include(CheckCXXSymbolExists)
-@@ -276,9 +280,9 @@ endif(HAVE_ATOMIC)
+@@ -298,9 +302,9 @@ endif(HAVE_ATOMIC)
  if(HAVE_CRC32C)
    target_link_libraries(leveldb crc32c)
  endif(HAVE_CRC32C)
@@ -60,7 +62,7 @@ index 78fead6..2efccda 100644
  endif(HAVE_TCMALLOC)
 diff --git a/cmake/FindSnappy.cmake b/cmake/FindSnappy.cmake
 new file mode 100644
-index 0000000..88c1de9
+index 000000000000..88c1de98f228
 --- /dev/null
 +++ b/cmake/FindSnappy.cmake
 @@ -0,0 +1,31 @@
@@ -96,5 +98,5 @@ index 0000000..88c1de9
 +  )
 +endif()
 -- 
-2.26.2
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
