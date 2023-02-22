Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8E0C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 21:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE8DE61409;
	Wed, 22 Feb 2023 21:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE8DE61409
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j75hrapVgOW0; Wed, 22 Feb 2023 21:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1684461371;
	Wed, 22 Feb 2023 21:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1684461371
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B27531BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B832402DC
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B832402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W87Qq4aVl8uS for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 21:01:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE19D40135
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 21:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE19D40135
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D1BE868C8; Wed, 22 Feb 2023 21:01:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 22:00:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5893d2d1f19168a12e823d78882d6037b791e276
X-Git-Newrev: b5178b092a820e328434490cad47c2ea8342f392
X-Patchwork-Hint: ignore
Message-Id: <20230222210118.9D1BE868C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xerces: drop patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5178b092a820e328434490cad47c2ea8342f392
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is not needed since commit
62cab101356c97432da482e168adaf065de65c4f. This patch is actually raising
a build failure since bump to version 3.2.4 in commit
d2d8f146a9f0ed3b66c4dd470bb76efdbb630a75 and
https://github.com/apache/xerces-c/commit/af1935b567c18c8b2de71d6ea97239be60876335:

CMake Error at src/CMakeLists.txt:1271 (add_library):
  Target "xerces-c" links to target "CURL::libcurl" but the target was not
  found.  Perhaps a find_package() call is missing for an IMPORTED target, or
  an ALIAS target is missing?

Fixes:
 - http://autobuild.buildroot.org/results/c62856a5eeb34714f26235b2d6f8adc4ea612686

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xerces/0001-fix-static-linking-with-curl.patch | 39 ----------------------
 1 file changed, 39 deletions(-)

diff --git a/package/xerces/0001-fix-static-linking-with-curl.patch b/package/xerces/0001-fix-static-linking-with-curl.patch
deleted file mode 100644
index db38de79fc..0000000000
--- a/package/xerces/0001-fix-static-linking-with-curl.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 26e3f1440bbc75c704fc93ff43a2abbfbe4c0203 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 11 Oct 2018 22:56:50 +0200
-Subject: [PATCH] fix static linking with curl
-
-When curl is statically built with openssl support, xerces needs to
-link with openssl libraries so use pkg_check_modules to get any
-needed dependencies
-
-Fixes:
- - http://autobuild.buildroot.org/results/29ca90fff2c8e38f2edf7240eca3aa3fe7397c45
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cmake/XercesNetAccessorSelection.cmake | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/cmake/XercesNetAccessorSelection.cmake b/cmake/XercesNetAccessorSelection.cmake
-index 7a63f1f6b..e90fcf034 100644
---- a/cmake/XercesNetAccessorSelection.cmake
-+++ b/cmake/XercesNetAccessorSelection.cmake
-@@ -31,7 +31,13 @@ if(network)
- 
-   # Requires select() which is UNIX only
-   if(UNIX)
--    find_package(CURL)
-+    find_package(PkgConfig)
-+    if (PkgConfig_FOUND)
-+      pkg_check_modules(CURL libcurl)
-+      if (NOT CURL_FOUND)
-+        find_package(CURL)
-+      endif()
-+    endif()
-     if(CURL_FOUND)
-       list(APPEND netaccessors curl)
-     endif()
--- 
-2.17.1
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
