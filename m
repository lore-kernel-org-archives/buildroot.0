Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5A5C54FB3
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 20:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0835C80A89;
	Mon, 26 May 2025 20:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kw62ELCwCLp4; Mon, 26 May 2025 20:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 273AA80A06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 273AA80A06;
	Mon, 26 May 2025 20:17:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95B3328B
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87981402E5
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7maJdhmEm4K4 for <buildroot@buildroot.org>;
 Mon, 26 May 2025 20:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C98CF4006C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C98CF4006C
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:17:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5DB687634; Mon, 26 May 2025 20:17:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 22:15:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6788f3d26ccf36b928c68b423077ae590d176967
X-Git-Newrev: 223abaf98a5b0f982def64311f106465bb8095ff
X-Patchwork-Hint: ignore
Message-Id: <20250526201743.B5DB687634@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzo: fix CMake 4.0 compatibility
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=223abaf98a5b0f982def64311f106465bb8095ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to fix lzo builds with CMake 4.0.

Fixes:
 https://autobuild.buildroot.org/results/8d9/8d9cc53d68d93432e6a7bddad0ed3fdaed913da6 (target)
 https://autobuild.buildroot.org/results/aba/aba68e0889b66300f87706e15ff34899d3e1e97f (host)
 (and many more)

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...cmake-bump-compatibility-level-up-to-3.10.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/lzo/0001-cmake-bump-compatibility-level-up-to-3.10.patch b/package/lzo/0001-cmake-bump-compatibility-level-up-to-3.10.patch
new file mode 100644
index 0000000000..2c5c9d95b7
--- /dev/null
+++ b/package/lzo/0001-cmake-bump-compatibility-level-up-to-3.10.patch
@@ -0,0 +1,48 @@
+From 8158764baaa6cea81f514af157019c0dc81b6e46 Mon Sep 17 00:00:00 2001
+From: Florian Larysch <fl@n621.de>
+Date: Thu, 22 May 2025 23:46:42 +0200
+Subject: [PATCH] cmake: bump compatibility level up to 3.10
+
+As of CMake 4.0, backwards compatibility to versions older than 3.5 has
+been removed and is deprecated for versions older than 3.10. Bump
+compatibility to version 3.10 using the process described in [1].
+
+Of the changed policies, only CMP0065 seems to affect the LZO build as
+is, namely the example binaries, but this seems like a reasonable change
+rather than an actual compatibility issue.
+
+[1] https://cmake.org/cmake/help/v4.0/manual/cmake-policies.7.html#updating-projects
+
+Upstream: Submitted to upstream via direct email as there is no public
+          mailing list or forge presence.
+
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 98c0a1a..108537c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -8,7 +8,7 @@
+ # All Rights Reserved.
+ #
+ 
+-cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.0...3.10 FATAL_ERROR)
+ 
+ #
+ # simple usage example (Unix):
+@@ -57,7 +57,7 @@ if(NOT ENABLE_STATIC AND NOT ENABLE_SHARED)
+     set(ENABLE_STATIC ON)
+ endif()
+ if(ENABLE_SHARED AND WIN32)
+-    cmake_minimum_required(VERSION 3.4.3 FATAL_ERROR) # needed for WINDOWS_EXPORT_ALL_SYMBOLS
++    cmake_minimum_required(VERSION 3.4.3...3.10 FATAL_ERROR) # needed for WINDOWS_EXPORT_ALL_SYMBOLS
+ endif()
+ 
+ # install directories
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
