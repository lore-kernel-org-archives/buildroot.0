Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70BFECAAD3
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 07:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CCB2832FF;
	Thu, 15 Sep 2022 07:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CCB2832FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bi-QDkC-KtfI; Thu, 15 Sep 2022 07:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 204C5832E8;
	Thu, 15 Sep 2022 07:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 204C5832E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49F9D1BF344
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 07:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 260B3832E8
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 07:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 260B3832E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyJgPzCdaq9p for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 07:36:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47BAA832E7
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 07:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BAA832E7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 351C580501; Thu, 15 Sep 2022 07:36:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 09:35:08 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 028251bd7c36dcdb066cc0548421c901dd58bc2c
X-Git-Newrev: d646d751b46b1f1919333638287f2f1ecd3cf7c0
X-Patchwork-Hint: ignore
Message-Id: <20220915073631.351C580501@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ne10: fix build
 without C++
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d646d751b46b1f1919333638287f2f1ecd3cf7c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure without C++ raised since bump to version
1.2.0 in commit 8cdf680799d7055a272190387064f87c7c638906 and
https://github.com/projectNe10/Ne10/commit/20b1896fd6532336e6a46608778bd6e0396dc4dc:

CMake Error at /nvmedata/autobuild/instance-11/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/clang++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/a86d09d569babe6b88cb8e5fbb47483772f42aed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 88ae4ebd21d6996ae85ff47a9259325c43c1280a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ne10/0002-fix-build-without-C.patch | 55 +++++++++++++++++++++++++++++
 package/ne10/ne10.mk                        |  6 ++++
 2 files changed, 61 insertions(+)

diff --git a/package/ne10/0002-fix-build-without-C.patch b/package/ne10/0002-fix-build-without-C.patch
new file mode 100644
index 0000000000..9dafffd5b0
--- /dev/null
+++ b/package/ne10/0002-fix-build-without-C.patch
@@ -0,0 +1,55 @@
+From f19b109f2a879af7b0753d94a2a312e4039adbed Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 May 2022 23:52:36 +0200
+Subject: [PATCH] fix build without C++
+
+Fix the following build failure without C++ raised since version 1.2.0
+and
+https://github.com/projectNe10/Ne10/commit/20b1896fd6532336e6a46608778bd6e0396dc4dc:
+
+CMake Error at /nvmedata/autobuild/instance-11/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
+  The C++ compiler
+
+    "/usr/bin/clang++"
+
+  is not able to compile a simple test program.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a86d09d569babe6b88cb8e5fbb47483772f42aed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/projectNe10/Ne10/pull/280]
+---
+ CMakeLists.txt         | 2 +-
+ modules/CMakeLists.txt | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 40e1b72..10081f8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -26,7 +26,7 @@
+ #
+ cmake_minimum_required(VERSION 2.6)
+ 
+-project(NE10 C CXX ASM)
++project(NE10 C ASM)
+ 
+ option(NE10_BUILD_SHARED "Build NE10 shared libraries" OFF)
+ option(NE10_BUILD_STATIC "Build NE10 static libraries" ON)
+diff --git a/modules/CMakeLists.txt b/modules/CMakeLists.txt
+index 4f158e9..951527a 100644
+--- a/modules/CMakeLists.txt
++++ b/modules/CMakeLists.txt
+@@ -173,6 +173,8 @@ endif(IOS_PLATFORM)
+ endif()
+ 
+ if(NE10_ENABLE_DSP)
++    enable_language(CXX)
++
+     #enable NE10_init_dsp
+     add_definitions(-DNE10_ENABLE_DSP)
+ 
+-- 
+2.35.1
+
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index e529caf2af..3946605556 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -16,6 +16,12 @@ NE10_CONF_OPTS = \
 	-DNE10_BUILD_UNIT_TEST=OFF \
 	-DNE10_LINUX_TARGET_ARCH=$(if $(BR2_aarch64),aarch64,armv7)
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+NE10_CONF_OPTS += -DNE10_ENABLE_DSP=ON
+else
+NE10_CONF_OPTS += -DNE10_ENABLE_DSP=OFF
+endif
+
 ifeq ($(BR2_STATIC_LIBS),)
 NE10_CONF_OPTS += \
 	-DNE10_BUILD_SHARED=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
