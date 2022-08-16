Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F46EC2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 10:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDF5060F82;
	Tue, 16 Aug 2022 10:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDF5060F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mQRNwMGE9ann; Tue, 16 Aug 2022 10:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B24660F67;
	Tue, 16 Aug 2022 10:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B24660F67
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 832421BF3C8
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 10:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DEF081B48
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 10:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DEF081B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enydpFVUlB-Y for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 10:41:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E20581B23
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 10:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E20581B23
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 34D6E87818; Tue, 16 Aug 2022 10:26:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 12:18:36 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 87209f1a9ec22425edc5d1c5750182a2192ecc02
X-Git-Newrev: 1a41de765e9d8b204ccf49be29e99dd12a77cef1
X-Patchwork-Hint: ignore
Message-Id: <20220816102641.34D6E87818@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/rpi-userland: fix
 build without libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a41de765e9d8b204ccf49be29e99dd12a77cef1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit dd524a6e968274225f0645ff50bf129af9e550ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
