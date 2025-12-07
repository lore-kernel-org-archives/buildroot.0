Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA44D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ADAB82768;
	Fri, 12 Dec 2025 07:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwD9whSMPggY; Fri, 12 Dec 2025 07:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02411843ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526353;
	bh=QnkUjbVeu2DlIvPbN99M5cXXCgBteOMyVbafNl4BRJY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sT57f4juFMlw8HIz0Msouf4sB23wpbJZlDQm2sFq+UdXOd2EFYtz3VKBb7L/rO5e8
	 fAGlosYItttFScoX6KhehmBNpcJUZ6dPzXcqe4TM0Da3lH+JNYgomL8mV34OAAv3zG
	 XtubjUEs25VIWRNi/gGGcvw5L17kOfbEJL1QcNpBvEVOMUkCBh/n6XuVpEBmc69N52
	 5xxGnCsAG57nuX38jNyjfklXqm8hVOMASLsO1MJlaABp9VbZiI/CUtDbhWwy2G3gSl
	 xRBXO/sm0n1OC72NY+3BPp3kJMPdYnku7sTf23Zkhtm6F9CpH6YO7J8o9MJRfg0Oiv
	 bHXEcIzIgEddQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02411843ED;
	Fri, 12 Dec 2025 07:59:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC2D6E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54F3D41191
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOyiGhueJGRi for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88EDA41167
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88EDA41167
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8812581674; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:24:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3dce54d9cea599ca9d43868f9d19902e6caacb1
X-Git-Newrev: bc311aacf5fb563f2fd7955b163de0149d7a39cd
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.8812581674@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gflags: fix cmake 4 compatibility
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
