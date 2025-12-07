Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74B8D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68A298420C;
	Fri, 12 Dec 2025 07:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4AoGgb740gO; Fri, 12 Dec 2025 07:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7AB184061
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526288;
	bh=dG9EmfDNgpvRBFsS9zWH39ZEX71WIzRYOqEtqZkfUbY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lQNPB4cFS+HPRXpiawFeTQJtlYnPiZEmagC8J1HZ6QR7kPgPCtcH7Upf3E02o59+V
	 PA8xIGFbsuznlOh4uZpgpZ1Do3/XNQkkfUJnx5rWCel8IaTybXJoTHaHWQywhuNoDs
	 J9XjaRUQ5D9gQWZ99pGo25/ax/4zsAmHHqMY6bu4SEf3uFOoxqo1VxRjkwZinogGd6
	 1bc9jFraJJsZDkhbhwCCxxEAA/duVB3hhNBI8Nu11Jt7BefSd9ydUa3ZDOInr1BUWo
	 pHAKebNnV2i6uN6QoYl6DdwpVplgZUBWwnQTqNFYlbKGi3pEFBllpG+oB75/5NP1Tr
	 tmKE8keUitPlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7AB184061;
	Fri, 12 Dec 2025 07:58:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8617E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADED44116A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAHHqu-22uVm for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 087DE41148
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 087DE41148
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 079F685C4C; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfe531ef8fbd2eb5d1eb8b067d5416e0ec540060
X-Git-Newrev: b6d5717f1b9a9a5c419610425ffa1542f4693e16
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.079F685C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/termcolor: fix cmake 4
 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6d5717f1b9a9a5c419610425ffa1542f4693e16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-Fix-CI-matrix-and-CMake-deprecations.patch | 270 +++++++++++++++++++++
 1 file changed, 270 insertions(+)

diff --git a/package/termcolor/0001-Fix-CI-matrix-and-CMake-deprecations.patch b/package/termcolor/0001-Fix-CI-matrix-and-CMake-deprecations.patch
new file mode 100644
index 0000000000..4e30df5f03
--- /dev/null
+++ b/package/termcolor/0001-Fix-CI-matrix-and-CMake-deprecations.patch
@@ -0,0 +1,270 @@
+From 89f20096bef51de347ec6f99345f65147359bd7c Mon Sep 17 00:00:00 2001
+From: Ihor Kalnytskyi <ihor@kalnytskyi.com>
+Date: Thu, 8 Aug 2024 22:58:42 +0300
+Subject: [PATCH] Fix CI matrix and CMake deprecations (#76)
+
+Upstream: https://github.com/ikalnytskyi/termcolor/commit/89f20096bef51de347ec6f99345f65147359bd7c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .github/workflows/cmake.yml             | 10 +++---
+ .github/workflows/macos.yml             | 12 ++++---
+ .github/workflows/ubuntu.yml            | 46 ++++++++++++++++++-------
+ .github/workflows/windows.yml           |  4 +--
+ CMakeLists.txt                          |  2 +-
+ examples/cmake-external/CMakeLists.txt  |  4 +--
+ examples/cmake-fetch/CMakeLists.txt     | 11 ++----
+ examples/cmake-package/CMakeLists.txt   |  2 +-
+ examples/cmake-submodule/CMakeLists.txt |  2 +-
+ 9 files changed, 55 insertions(+), 38 deletions(-)
+
+diff --git a/.github/workflows/cmake.yml b/.github/workflows/cmake.yml
+index eb61a4f..bdcfc83 100644
+--- a/.github/workflows/cmake.yml
++++ b/.github/workflows/cmake.yml
+@@ -11,7 +11,7 @@ jobs:
+     runs-on: ubuntu-latest
+ 
+     steps:
+-      - uses: actions/checkout@v2
++      - uses: actions/checkout@v4
+       - run: |
+           mkdir -p $GITHUB_WORKSPACE/tmp/termcolor && cd "$_"
+           cmake $GITHUB_WORKSPACE
+@@ -26,18 +26,18 @@ jobs:
+     runs-on: ubuntu-latest
+ 
+     steps:
+-      - uses: actions/checkout@v2
++      - uses: actions/checkout@v4
+       - run: sudo pip install cmake
+       - run: |
+           mkdir -p $GITHUB_WORKSPACE/tmp/example && cd "$_"
+-          /usr/local/bin/cmake $GITHUB_WORKSPACE/examples/cmake-fetch
++          cmake $GITHUB_WORKSPACE/examples/cmake-fetch
+           make && ./example
+ 
+   submodule:
+     runs-on: ubuntu-latest
+     
+     steps:
+-      - uses: actions/checkout@v2
++      - uses: actions/checkout@v4
+       - run: |
+           mkdir -p $GITHUB_WORKSPACE/tmp/example && cd "$_"
+           cmake $GITHUB_WORKSPACE/examples/cmake-submodule
+@@ -47,7 +47,7 @@ jobs:
+     runs-on: ubuntu-latest
+ 
+     steps:
+-      - uses: actions/checkout@v2
++      - uses: actions/checkout@v4
+       - run: |
+           mkdir -p $GITHUB_WORKSPACE/tmp/example && cd "$_"
+           cmake $GITHUB_WORKSPACE/examples/cmake-external
+diff --git a/.github/workflows/macos.yml b/.github/workflows/macos.yml
+index 134f137..ce99070 100644
+--- a/.github/workflows/macos.yml
++++ b/.github/workflows/macos.yml
+@@ -6,21 +6,23 @@ on:
+   pull_request:
+     branches: [master]
+ 
+-jobs:      
++jobs:
+   MacOS:
+     runs-on: macos-latest
+     strategy:
+       matrix:
+         compiler:
+-          - Xcode_10.3
+-          - Xcode_11.7
+-          - Xcode_12.4
++          - Xcode_15.4
++          - Xcode_15.3
++          - Xcode_15.2
++          - Xcode_15.1
++          - Xcode_14.3.1
+ 
+     env:
+       CXXFLAGS: -std=c++11
+ 
+     steps:
+-      - uses: actions/checkout@v2
++      - uses: actions/checkout@v4
+       - run: sudo xcode-select -s /Applications/${{ matrix.compiler }}.app/Contents/Developer
+       - run: cmake -DTERMCOLOR_TESTS=ON .
+       - run: cmake --build .
+diff --git a/.github/workflows/ubuntu.yml b/.github/workflows/ubuntu.yml
+index 21acca5..51ec02b 100644
+--- a/.github/workflows/ubuntu.yml
++++ b/.github/workflows/ubuntu.yml
+@@ -8,23 +8,44 @@ on:
+ 
+ jobs:  
+   Ubuntu-Clang:
+-    runs-on: ubuntu-latest
+     strategy:
+       matrix:
+-        clang-compiler:
+-          - "6.0"
+-          - "7"
+-          - "8"
+-          - "9"
+-          - "10"
+-          - "11"
++        include:
++          - clang-compiler: "6.0"
++            ubuntu-release: ubuntu-20.04
++          - clang-compiler: "7"
++            ubuntu-release: ubuntu-20.04
++          - clang-compiler: "8"
++            ubuntu-release: ubuntu-20.04
++          - clang-compiler: "9"
++            ubuntu-release: ubuntu-20.04
++          - clang-compiler: "10"
++            ubuntu-release: ubuntu-20.04
++          - clang-compiler: "11"
++            ubuntu-release: ubuntu-22.04
++          - clang-compiler: "12"
++            ubuntu-release: ubuntu-22.04
++          - clang-compiler: "13"
++            ubuntu-release: ubuntu-22.04
++          - clang-compiler: "14"
++            ubuntu-release: ubuntu-22.04
++          - clang-compiler: "15"
++            ubuntu-release: ubuntu-22.04
++          - clang-compiler: "16"
++            ubuntu-release: ubuntu-24.04
++          - clang-compiler: "17"
++            ubuntu-release: ubuntu-24.04
++          - clang-compiler: "18"
++            ubuntu-release: ubuntu-24.04
+ 
+     env:
+       CXX: clang++-${{ matrix.clang-compiler }}
+       CXXFLAGS: -std=c++11
+ 
++    runs-on: ${{ matrix.ubuntu-release }}
++
+     steps:
+-      - uses: actions/checkout@v2
++      - uses: actions/checkout@v4
+       - run: sudo apt update
+       - run: sudo apt -y install clang-${{ matrix.clang-compiler }}
+       - run: cmake -DTERMCOLOR_TESTS=ON .
+@@ -36,17 +57,16 @@ jobs:
+     strategy:
+       matrix:
+         gcc-compiler:
+-          - "7"
+-          - "8"
+-          - "9"
+           - "10"
++          - "11"
++          - "12"
+ 
+     env:
+       CXX: g++-${{ matrix.gcc-compiler }}
+       CXXFLAGS: -std=c++11
+ 
+     steps:
+-      - uses: actions/checkout@v2
++      - uses: actions/checkout@v4
+       - run: sudo apt update
+       - run: sudo apt -y install g++-${{ matrix.gcc-compiler }}
+       - run: cmake -DTERMCOLOR_TESTS=ON .
+diff --git a/.github/workflows/windows.yml b/.github/workflows/windows.yml
+index c345782..25ff37f 100644
+--- a/.github/workflows/windows.yml
++++ b/.github/workflows/windows.yml
+@@ -11,7 +11,7 @@ jobs:
+     runs-on: windows-latest
+ 
+     steps:
+-      - uses: actions/checkout@v2
++      - uses: actions/checkout@v4
+       - run: cmake -DTERMCOLOR_TESTS=ON .
+       - run: cmake --build .
+       - run: ./Debug/test_termcolor.exe
+@@ -20,7 +20,7 @@ jobs:
+     runs-on: windows-latest
+ 
+     steps:
+-      - uses: actions/checkout@v2
++      - uses: actions/checkout@v4
+       - run: cmake -DCMAKE_SH="CMAKE_SH-NOTFOUND" -DTERMCOLOR_TESTS=ON -G "MinGW Makefiles" .
+       - run: cmake --build .
+       - run: ./test_termcolor
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e0bfcd6..da4d5d3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ project(termcolor)
+ 
+ #
+diff --git a/examples/cmake-external/CMakeLists.txt b/examples/cmake-external/CMakeLists.txt
+index 525b2a8..077913e 100644
+--- a/examples/cmake-external/CMakeLists.txt
++++ b/examples/cmake-external/CMakeLists.txt
+@@ -1,10 +1,10 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ project(example)
+ 
+ include(ExternalProject)
+ 
+ ExternalProject_Add(termcolor_project
+-  GIT_REPOSITORY git://github.com/ikalnytskyi/termcolor.git
++  GIT_REPOSITORY https://github.com/ikalnytskyi/termcolor.git
+   GIT_TAG origin/master
+ 
+   # Termcolor is a header-only library which means we need to
+diff --git a/examples/cmake-fetch/CMakeLists.txt b/examples/cmake-fetch/CMakeLists.txt
+index 545184f..f0e7e27 100644
+--- a/examples/cmake-fetch/CMakeLists.txt
++++ b/examples/cmake-fetch/CMakeLists.txt
+@@ -1,17 +1,12 @@
+-cmake_minimum_required(VERSION 3.11)
++cmake_minimum_required(VERSION 3.14)
+ project(example)
+ 
+ include(FetchContent)
+ 
+ FetchContent_Declare(termcolor
+-  GIT_REPOSITORY git://github.com/ikalnytskyi/termcolor.git
++  GIT_REPOSITORY https://github.com/ikalnytskyi/termcolor.git
+   GIT_TAG origin/master)
+-FetchContent_GetProperties(termcolor)
+-
+-if(NOT termcolor_POPULATED)
+-  FetchContent_Populate(termcolor)
+-  add_subdirectory(${termcolor_SOURCE_DIR} ${termcolor_BINARY_DIR} EXCLUDE_FROM_ALL)
+-endif()
++FetchContent_MakeAvailable(termcolor)
+ 
+ add_executable(${CMAKE_PROJECT_NAME} example.cpp)
+ target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE termcolor)
+diff --git a/examples/cmake-package/CMakeLists.txt b/examples/cmake-package/CMakeLists.txt
+index 3f78a57..cf3b988 100644
+--- a/examples/cmake-package/CMakeLists.txt
++++ b/examples/cmake-package/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ project(example)
+ 
+ find_package(termcolor REQUIRED)
+diff --git a/examples/cmake-submodule/CMakeLists.txt b/examples/cmake-submodule/CMakeLists.txt
+index 5673372..3e7bece 100644
+--- a/examples/cmake-submodule/CMakeLists.txt
++++ b/examples/cmake-submodule/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ project(example)
+ 
+ add_subdirectory(../.. ${CMAKE_CURRENT_BINARY_DIR}/termcolor EXCLUDE_FROM_ALL)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
