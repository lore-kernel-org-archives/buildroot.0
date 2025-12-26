Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A56E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6AA160A9B;
	Fri, 26 Dec 2025 18:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7YLR4S9oVyK; Fri, 26 Dec 2025 18:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6BB860AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773266;
	bh=pGH/5KamWX3ysYzjsIKIr+slLNTqhjEECu4CrnUtRdQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kxDWVgDvcjaO58fuP2+B+3ApxlqVPv0au2STwdJ2H3k7cFLio0m2cVYJyCrBwHkPh
	 PwFaQRdW1Pvnau8JGobUKKMJ4Natzkv3iCbCeVgv72du6Dz1YBFE5gnZCpPj7FM+f4
	 x/kYSOVMTCKoZ8tgpSeDFkGMFMHW21WYr4MJfaMPol9s29XV20xPkb2E/Uy6ZYerxS
	 9ldWmxP9e476D6h2YtDJjN99QMyIzW2gQBi8zMjn1JCNCWroqXDzZA5+Hg49o2IuRV
	 e/GzMyTZCeDrrxB3nvy2slg1Kd+mYWYTrgwHkS+T8Kyl4mJfDzoABdbxMzUHRbOYOP
	 4hckhXhuECqBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6BB860AA1;
	Fri, 26 Dec 2025 18:21:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B91BB9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97C6080BD7
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrspQuRm7St9 for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC27B80AB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC27B80AB0
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E85D876FA; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cd7a5059bbc51a6386fd287e06b8941fa8bb2ed
X-Git-Newrev: 01c4206895faf3bc3a3c95da6610a72f57a053c6
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.9E85D876FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oatpp: bump version to 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=01c4206895faf3bc3a3c95da6610a72f57a053c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.

Backported bump to fix cmake 4 compatibility.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/oatpp/0001-cmake4.patch                    | 22 ++++++++++++
 ...core-base-Environment.hpp-include-cstdarg.patch | 39 ----------------------
 package/oatpp/oatpp.hash                           |  2 +-
 package/oatpp/oatpp.mk                             |  2 +-
 4 files changed, 24 insertions(+), 41 deletions(-)

diff --git a/package/oatpp/0001-cmake4.patch b/package/oatpp/0001-cmake4.patch
new file mode 100644
index 0000000000..5dffdff802
--- /dev/null
+++ b/package/oatpp/0001-cmake4.patch
@@ -0,0 +1,22 @@
+From 06232810f7c23cc8a91864a504df412255a370b6 Mon Sep 17 00:00:00 2001
+From: Leonid Stryzhevskyi <lganzzzo@gmail.com>
+Date: Tue, 23 Apr 2024 01:20:20 +0300
+Subject: [PATCH] refactor json namespaces
+
+Upstream: https://github.com/oatpp/oatpp/commit/06232810f7c23cc8a91864a504df412255a370b6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported only the cmake bump]
+---
+ CMakeLists.txt                                |  2 +-
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9d41c8b2e..14ab71acf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.25 FATAL_ERROR)
+ 
+ file(STRINGS "${CMAKE_CURRENT_LIST_DIR}/src/oatpp/core/base/Environment.hpp" OATPP_VERSION_MACRO REGEX "#define OATPP_VERSION \"[0-9]+.[0-9]+.[0-9]+\"$")
+ string(REGEX REPLACE "#define OATPP_VERSION \"([0-9]+.[0-9]+.[0-9]+)\"$" "\\1" oatpp_VERSION "${OATPP_VERSION_MACRO}")
diff --git a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
deleted file mode 100644
index 33fa04a2f2..0000000000
--- a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 6ac376cec5c9573abf3ee3b82e71bd2b7e410dad Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 23 Nov 2023 22:45:56 +0100
-Subject: [PATCH] src/oatpp/core/base/Environment.hpp: include cstdarg
-
-Include cstdarg to fix the following build failure with uclibc-ng:
-
-In file included from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.hpp:28,
-                 from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.cpp:25:
-/home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/core/base/Environment.hpp:359:93: error: 'va_list' has not been declared
-  359 |   static void vlogFormatted(v_uint32 priority, const std::string& tag, const char* message, va_list args);
-      |                                                                                             ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/bcdf7548ff752f936defd111d13c63245ea70cbe
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/oatpp/oatpp/commit/1d11558e2cbbabc0db02a233bf00d651ce5ea758
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- src/oatpp/core/base/Environment.hpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/oatpp/core/base/Environment.hpp b/src/oatpp/core/base/Environment.hpp
-index 984afdf2a7f5..2eb18be3e196 100644
---- a/src/oatpp/core/base/Environment.hpp
-+++ b/src/oatpp/core/base/Environment.hpp
-@@ -28,6 +28,7 @@
- 
- #include "./Config.hpp"
- 
-+#include <cstdarg>
- #include <cstdio>
- #include <atomic>
- #include <mutex>
--- 
-2.43.0
-
diff --git a/package/oatpp/oatpp.hash b/package/oatpp/oatpp.hash
index e6b35d8d51..4afb27f012 100644
--- a/package/oatpp/oatpp.hash
+++ b/package/oatpp/oatpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e1f80fa8fd7a74da6737e7fee1a4db68b4d7085a3f40e7d550752d6ff5714583  oatpp-1.3.0.tar.gz
+sha256  9dd31f005ab0b3e8895a478d750d7dbce99e42750a147a3c42a9daecbddedd64  oatpp-1.3.1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
index d3f6e1a9c2..e1ca3fb16c 100644
--- a/package/oatpp/oatpp.mk
+++ b/package/oatpp/oatpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OATPP_VERSION = 1.3.0
+OATPP_VERSION = 1.3.1
 OATPP_SITE = $(call github,oatpp,oatpp,$(OATPP_VERSION))
 OATPP_LICENSE = Apache-2.0
 OATPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
