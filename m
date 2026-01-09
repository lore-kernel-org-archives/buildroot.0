Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59698D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CF8583D06;
	Tue, 13 Jan 2026 19:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBSUlyTLgIkp; Tue, 13 Jan 2026 19:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7F7983EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333284;
	bh=XbyA/a7ayRcRpT0HRmWguAyMN3Hmn/Iaj8oCVvoEkU0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JT5TKWj8cvgk1IRzi/g231ardLZXmlbih/yEWoJGYhG6ead5dicqSEbqpPXYeRFyR
	 PcMK7VJSzV3D8OocPnrcr0A4CluywfYkyHhzpP14oqsVp2g23SQrjk7XJTQs9IX9M7
	 zlAkP/6EwwiZArJrnh66AOYIRC42kXD1FqttG/R+vkbci/CePVCBDI0PXRnkFJdoLM
	 wd0vgRDhnMF3DjLhzawQwGO29AVvKozUa/bligAZYdf2OY3Hau/MA4mAxSaJGqCwRV
	 bKK2LdtnGVtak1TWQ15tzQ+o8fkAFWHNkyXzp7n45yynBTEL2FHIPibrcErbFC6JEy
	 M1cwYfym4z/Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F7983EC1;
	Tue, 13 Jan 2026 19:41:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 094B21C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32BD882F9B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tA_xdWIAZpjt for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01D5E82E95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01D5E82E95
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3A208256D; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:16:15 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 3c7ed8125d42178132383cb18b2051a4f762d190
X-Git-Newrev: b20acc5bea27d0dc279f9a89fe189386c891fd70
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.F3A208256D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/qt5/qt5webkit:
 add patch to fix CMake >= 4 compatibility
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b20acc5bea27d0dc279f9a89fe189386c891fd70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 31fd1e4a36681421400a2c1290464eafbcf3c731)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...txt-update-CMake-minimum-required-version.patch | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch b/package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch
new file mode 100644
index 0000000000..97115125ee
--- /dev/null
+++ b/package/qt5/qt5webkit/0009-CMakeLists.txt-update-CMake-minimum-required-version.patch
@@ -0,0 +1,92 @@
+From b3e016db4ad62bd3386736ce380e4b1c4601a08c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 28 Dec 2025 14:44:34 +0100
+Subject: [PATCH] CMakeLists.txt: update CMake minimum required version
+
+Building with CMake >= 4.x requires the cmake_minimum_required()
+version to be at least 3.5, so let's update to that to fix:
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
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: dead, repository is obsolete
+---
+ CMakeLists.txt                           | 2 +-
+ Source/JavaScriptCore/CMakeLists.txt     | 2 +-
+ Source/WTF/CMakeLists.txt                | 2 +-
+ Source/WebCore/CMakeLists.txt            | 2 +-
+ Source/WebKit/CMakeLists.txt             | 2 +-
+ tests/webkitwidgets/cmake/CMakeLists.txt | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 31a2ea1fd544..a870b490c7fb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ project(WebKit)
+ 
+ # This should be removed once we require CMake 3.3.
+diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
+index afd76ca1a184..07fb5ad450dc 100644
+--- a/Source/JavaScriptCore/CMakeLists.txt
++++ b/Source/JavaScriptCore/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ include(WebKitCommon)
+ 
+ set(JavaScriptCore_INCLUDE_DIRECTORIES
+diff --git a/Source/WTF/CMakeLists.txt b/Source/WTF/CMakeLists.txt
+index 1d41f303acde..efc52e5280e4 100644
+--- a/Source/WTF/CMakeLists.txt
++++ b/Source/WTF/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ include(WebKitCommon)
+ 
+ add_subdirectory(wtf)
+diff --git a/Source/WebCore/CMakeLists.txt b/Source/WebCore/CMakeLists.txt
+index 3b3a9ed4bd24..c69cf8eae586 100644
+--- a/Source/WebCore/CMakeLists.txt
++++ b/Source/WebCore/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ include(WebKitCommon)
+ 
+ set(WebCore_INCLUDE_DIRECTORIES
+diff --git a/Source/WebKit/CMakeLists.txt b/Source/WebKit/CMakeLists.txt
+index c845856da6f6..b900d088ded5 100644
+--- a/Source/WebKit/CMakeLists.txt
++++ b/Source/WebKit/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ include(WebKitCommon)
+ 
+ set(WebKit_SOURCES
+diff --git a/tests/webkitwidgets/cmake/CMakeLists.txt b/tests/webkitwidgets/cmake/CMakeLists.txt
+index 8f266fccb48c..2f5dd261971e 100644
+--- a/tests/webkitwidgets/cmake/CMakeLists.txt
++++ b/tests/webkitwidgets/cmake/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(qmake_cmake_files)
+ 
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
