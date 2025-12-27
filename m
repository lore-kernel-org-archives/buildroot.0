Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FA1E92704
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A0AB607A3;
	Sat, 27 Dec 2025 11:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dW6ROM4EoPcK; Sat, 27 Dec 2025 11:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7188060777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766835482;
	bh=seu/GjAvg1YKX0ebapdY2DeMuLOsRswR9SBJnDIOPes=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hykupJaMSj2P08JIrN8TMGU3DKXBa89SF++TC7n2gQDu9CH6reMxist1qYwA18SHM
	 qxWFFL3QvGccfXFe5x8H3Ey/ZY/AhrGMjCYpYJzGZGr4167Tvmz1Oiw2g9JqKZgV7E
	 qcXp5DBArF3KZw0JaBBL9w67LxgEeXuJvbtbmE7dESDCN+2IA0vONCtJINomrR/tgy
	 2V4adBYzNju9d7QXdMaAoKNuWOJmlZjeW73qgKE5on0zPMhEqYza2tf7LGgZsNsf5l
	 tH9ZYEWEVZfCSm+2C29hXP5ng6j086gcV1NlqL6/Qlyk2UusP4hCOq92VjCePII3fT
	 X3FuTqLDRYk2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7188060777;
	Sat, 27 Dec 2025 11:38:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D516DEC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C721160777
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MsZC1H-R3dU for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0659460766
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0659460766
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:38:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA3B987716; Sat, 27 Dec 2025 11:37:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 12:36:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81bd1b50678d8b1174e6c6abf3aab72e7ea5c9e9
X-Git-Newrev: fa6a81b4d92fb30cc631e9b45b3d0bb8ac3045c4
X-Patchwork-Hint: ignore
Message-Id: <20251227113759.EA3B987716@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cppcms: add patch to fix build
 with CMake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa6a81b4d92fb30cc631e9b45b3d0bb8ac3045c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://autobuild.buildroot.net/results/5f0a3a525866519ee12acb9997d217b4a8b870fe/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...Lists.txt-make-it-compatible-with-CMake-4.patch | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch b/package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch
new file mode 100644
index 0000000000..6080fb1e1b
--- /dev/null
+++ b/package/cppcms/0001-CMakeLists.txt-make-it-compatible-with-CMake-4.patch
@@ -0,0 +1,107 @@
+From fb3943378d84a6ced1182502eb839d6fc6e51914 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 16 Dec 2025 15:31:38 +0100
+Subject: [PATCH] CMakeLists.txt: make it compatible with CMake 4
+
+The build with CMake >= 4 currently fails with:
+
+CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+we simply need to specify that the minimum version is 3.5 to fix the
+build.
+
+Upstream: https://github.com/artyom-beilis/cppcms/pull/106
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt                                          | 2 +-
+ booster/CMakeLists.txt                                  | 2 +-
+ contrib/server_side/sessions/CMakeLists.txt             | 2 +-
+ contrib/server_side/sessions/berkeley_db/CMakeLists.txt | 2 +-
+ contrib/server_side/sessions/cppdb/CMakeLists.txt       | 2 +-
+ contrib/server_side/sessions/sqlite3/CMakeLists.txt     | 2 +-
+ examples/message_board/CMakeLists.txt                   | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a9c601b..826e87f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ set(CMAKE_LEGACY_CYGWIN_WIN32 0)
+ 
+ 
+diff --git a/booster/CMakeLists.txt b/booster/CMakeLists.txt
+index 6ec1ffa..8f63254 100644
+--- a/booster/CMakeLists.txt
++++ b/booster/CMakeLists.txt
+@@ -6,7 +6,7 @@
+ #  http://www.boost.org/LICENSE_1_0.txt)
+ #
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ project(booster)
+ include(CheckFunctionExists)
+ include(CheckCXXSourceCompiles)
+diff --git a/contrib/server_side/sessions/CMakeLists.txt b/contrib/server_side/sessions/CMakeLists.txt
+index 0909fa6..e7ae01f 100644
+--- a/contrib/server_side/sessions/CMakeLists.txt
++++ b/contrib/server_side/sessions/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ add_subdirectory(sqlite3)
+ add_subdirectory(cppdb)
+diff --git a/contrib/server_side/sessions/berkeley_db/CMakeLists.txt b/contrib/server_side/sessions/berkeley_db/CMakeLists.txt
+index 6bbac69..534bce2 100644
+--- a/contrib/server_side/sessions/berkeley_db/CMakeLists.txt
++++ b/contrib/server_side/sessions/berkeley_db/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if(WIN32 OR CYGWIN)
+ 	add_definitions(-DDLL_EXPORT)
+diff --git a/contrib/server_side/sessions/cppdb/CMakeLists.txt b/contrib/server_side/sessions/cppdb/CMakeLists.txt
+index 9781be9..792ec39 100644
+--- a/contrib/server_side/sessions/cppdb/CMakeLists.txt
++++ b/contrib/server_side/sessions/cppdb/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if(WIN32 OR CYGWIN)
+ 	add_definitions(-DDLL_EXPORT)
+diff --git a/contrib/server_side/sessions/sqlite3/CMakeLists.txt b/contrib/server_side/sessions/sqlite3/CMakeLists.txt
+index 4c236e3..82808f4 100644
+--- a/contrib/server_side/sessions/sqlite3/CMakeLists.txt
++++ b/contrib/server_side/sessions/sqlite3/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ if(WIN32 OR CYGWIN)
+ 	add_definitions(-DDLL_EXPORT)
+ endif()
+diff --git a/examples/message_board/CMakeLists.txt b/examples/message_board/CMakeLists.txt
+index 0e5c555..96a56c2 100644
+--- a/examples/message_board/CMakeLists.txt
++++ b/examples/message_board/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ project(cppcms)
+ 
+ include_directories(${CMAKE_SOURCE_DIR})
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
