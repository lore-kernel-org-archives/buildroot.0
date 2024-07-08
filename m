Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D80C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D69F608E9;
	Mon,  8 Jul 2024 20:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45aA8VMs8mY1; Mon,  8 Jul 2024 20:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A54EA6090A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A54EA6090A;
	Mon,  8 Jul 2024 20:20:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC9F01BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9538405A1
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdufWXbGxtHN for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A02DD40133
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A02DD40133
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97AB883FF5; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:13:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2898d7bef63adf677bdb8c0d0d4d7da93bddc7e8
X-Git-Newrev: 9d8883971da90339d3b9825a9df02139ae0ae268
X-Patchwork-Hint: ignore
Message-Id: <20240708202012.97AB883FF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yajl: update the patches to be
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d8883971da90339d3b9825a9df02139ae0ae268
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, yajl fails to build with output:

    Applying 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch using patch:
    patching file src/CMakeLists.txt
    Hunk #1 FAILED at 37.
    Hunk #2 succeeded at 52 (offset 1 line).
    Hunk #3 succeeded at 79 (offset 1 line).
    1 out of 3 hunks FAILED -- saving rejects to file src/CMakeLists.txt.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-cmake-disable-shared-library-build-when-BUILD_SHARED.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
index 53decca649..e9170772d4 100644
--- a/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
+++ b/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
@@ -7,6 +7,8 @@ When BUILD_SHARED_LIBS is off, you don't want to build the shared
 library.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/CMakeLists.txt | 4 ++++
  1 file changed, 4 insertions(+)
@@ -15,15 +17,15 @@ diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
 index 99cf9e9..9e9c77d 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -37,6 +37,7 @@ SET(LIBRARY_OUTPUT_PATH ${libDir})
- 
+@@ -38,6 +38,7 @@ SET(LIBRARY_OUTPUT_PATH ${libDir})
  ADD_LIBRARY(yajl_s STATIC ${SRCS} ${HDRS} ${PUB_HDRS})
+ SET_TARGET_PROPERTIES(yajl_s PROPERTIES OUTPUT_NAME yajl)
  
 +IF(BUILD_SHARED_LIBS)
  ADD_LIBRARY(yajl SHARED ${SRCS} ${HDRS} ${PUB_HDRS})
  
  #### setup shared library version number
-@@ -51,6 +52,7 @@ IF(APPLE)
+@@ -52,6 +53,7 @@ IF(APPLE)
    SET_TARGET_PROPERTIES(yajl PROPERTIES
                          INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib")
  ENDIF(APPLE)
@@ -31,7 +33,7 @@ index 99cf9e9..9e9c77d 100644
  
  #### build up an sdk as a post build step
  
-@@ -77,10 +79,12 @@ INCLUDE_DIRECTORIES(${incDir}/..)
+@@ -78,10 +80,12 @@ INCLUDE_DIRECTORIES(${incDir}/..)
  
  # at build time you may specify the cmake variable LIB_SUFFIX to handle
  # 64-bit systems which use 'lib64'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
