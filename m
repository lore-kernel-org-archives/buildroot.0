Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B34D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28D9B40740;
	Sun,  7 Dec 2025 16:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ju0WOLqF-idh; Sun,  7 Dec 2025 16:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49DAA406F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123364;
	bh=gLvElpdkOzWoGkMBBtD7gyhK9lAiQp3eTrt+fFhk2Kc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VFz+vD6/Wmx8R2rdwLk+WKRTrsX2jdRTEg2x3fljm+bTJl8cxl42+LnfXEyo2NRmu
	 4TeEiEOK6MLIV+QmLPGqt9islIvQLyPUSc/UMFtp9pZ7i+akTYJkXym9LE3mUK7s/h
	 4udaRFpqjO5an/cGZMN2eHj2FvXf7fJxrq8RvURSzcOm9JK/IqBkpsrrJ3OfZIySKN
	 3E7M3OJAQM/MmRv3oAq1rKosO/+E9sxejsGTymEfbXc/GptbYo9QnPBOBhEycXKyW9
	 Me9NY1q6LU3wo9VawzMotI2M4eowfU0YMHUcJpOSr9yCcaymnINd49u/EHipUxiaLr
	 zChyvEoREl3tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49DAA406F9;
	Sun,  7 Dec 2025 16:02:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2F6AE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F4A403D8
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ai6inVhJTWBU for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 573FF4036A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 573FF4036A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 548D386717; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:24:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e3dce54d9cea599ca9d43868f9d19902e6caacb1
X-Git-Newrev: bc311aacf5fb563f2fd7955b163de0149d7a39cd
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.548D386717@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gflags: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc311aacf5fb563f2fd7955b163de0149d7a39cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gflags/0001-build-support-cmake-4.0.patch | 53 +++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/gflags/0001-build-support-cmake-4.0.patch b/package/gflags/0001-build-support-cmake-4.0.patch
new file mode 100644
index 0000000000..de01384d05
--- /dev/null
+++ b/package/gflags/0001-build-support-cmake-4.0.patch
@@ -0,0 +1,53 @@
+From 70c01a642f08734b7bddc9687884844ca117e080 Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Mon, 31 Mar 2025 18:35:49 -0400
+Subject: [PATCH] build: support cmake 4.0 (#367)
+
+Signed-off-by: Rui Chen <rui@chenrui.dev>
+
+Upstream: https://github.com/gflags/gflags/commit/70c01a642f08734b7bddc9687884844ca117e080
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt             | 2 +-
+ test/config/CMakeLists.txt | 2 +-
+ test/nc/CMakeLists.txt     | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4b5db235..a664bb12 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -70,7 +70,7 @@
+ ## - GFLAGS_INSTALL_SHARED_LIBS
+ ## - GFLAGS_INSTALL_STATIC_LIBS
+ 
+-cmake_minimum_required (VERSION 3.0.2 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ if (POLICY CMP0042)
+   cmake_policy (SET CMP0042 NEW)
+diff --git a/test/config/CMakeLists.txt b/test/config/CMakeLists.txt
+index 6190b253..205121e8 100644
+--- a/test/config/CMakeLists.txt
++++ b/test/config/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ ## gflags package configuration tests
+ 
+-cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ project (gflags_${TEST_NAME})
+ 
+diff --git a/test/nc/CMakeLists.txt b/test/nc/CMakeLists.txt
+index d00b07d0..1b4d511a 100644
+--- a/test/nc/CMakeLists.txt
++++ b/test/nc/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ ## gflags negative compilation tests
+ 
+-cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ if (NOT TEST_NAME)
+   message (FATAL_ERROR "Missing TEST_NAME CMake flag")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
