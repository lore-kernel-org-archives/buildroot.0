Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9518C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4727A41736;
	Sat, 23 Jul 2022 19:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4727A41736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zwm6qELyo0YH; Sat, 23 Jul 2022 19:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0258E40988;
	Sat, 23 Jul 2022 19:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0258E40988
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D540E1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B081D402D0
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B081D402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4DKSnUzSkAcD for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:39:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB7D1401B2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB7D1401B2
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5F94684C9F; Sat, 23 Jul 2022 19:25:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:29:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0829c09527dd622e90ea410c1becb66c0cc71020
X-Git-Newrev: dd524a6e968274225f0645ff50bf129af9e550ce
X-Patchwork-Hint: ignore
Message-Id: <20220723192530.5F94684C9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-userland: fix build without
 libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd524a6e968274225f0645ff50bf129af9e550ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without libexecinfo raised since commit
66d7d3bec341188bcfd83fa70b44dd62e0073431:

CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
Please set them or make sure they are set and tested correctly in the CMake files:
EXECINFO_LIBRARY
    linked by target "vcos" in directory /home/buildroot/autobuild/run/instance-1/output-1/build/rpi-userland-14b90ff9d9f031391a299e6e006965d02bfd1bb1/interface/vcos/pthreads

Fixes:
 - http://autobuild.buildroot.org/results/0b4b20e4eed1ed5120f22d29fc24038f268e6cc6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
index e799c82418..6c596395f9 100644
--- a/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
+++ b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
@@ -1,4 +1,4 @@
-From 220c37b496f5c883bbfa955ee7fee471e41c34d4 Mon Sep 17 00:00:00 2001
+From c8270cea98bcce0d22ddc8e2f86eae2c9989efd4 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 25 Feb 2022 19:21:06 +0100
 Subject: [PATCH] interface/vcos/pthreads/CMakeLists.txt: fix build with
@@ -20,7 +20,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/interface/vcos/pthreads/CMakeLists.txt b/interface/vcos/pthreads/CMakeLists.txt
-index 1d81ca3..43aca03 100644
+index 1d81ca3..100207f 100644
 --- a/interface/vcos/pthreads/CMakeLists.txt
 +++ b/interface/vcos/pthreads/CMakeLists.txt
 @@ -33,12 +33,14 @@ set (SOURCES
@@ -32,11 +32,11 @@ index 1d81ca3..43aca03 100644
  if (VCOS_PTHREADS_BUILD_SHARED)
     add_library (vcos SHARED ${SOURCES})
 -   target_link_libraries (vcos pthread dl rt)
-+   target_link_libraries (vcos pthread dl rt ${EXECINFO_LIBRARY})
++   target_link_libraries (vcos pthread dl rt $<$<BOOL:${EXECINFO_LIBRARY}>:${EXECINFO_LIBRARY}>)
  else ()
     add_library (vcos ${SOURCES})
 -   target_link_libraries (vcos pthread rt)
-+   target_link_libraries (vcos pthread rt ${EXECINFO_LIBRARY})
++   target_link_libraries (vcos pthread rt $<$<BOOL:${EXECINFO_LIBRARY}>:${EXECINFO_LIBRARY}>)
  endif ()
  
  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
