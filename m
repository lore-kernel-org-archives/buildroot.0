Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBF7EE0203
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0001C405C0;
	Tue, 30 Dec 2025 21:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHhKl6uyqLTt; Tue, 30 Dec 2025 21:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2012A405C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767128787;
	bh=zfemgaGGgnSesJHjMOpLCFN0iuHB8NFOKkuuQeY1vNM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QB6XbtZxVKGl407OVAk6c26y+SNwBxOv/jZ+JfIjfqpfoCx+8hYl/RCYda7m1lsBJ
	 H88jSOSUkA9+LfueRcLdKZ7nDkJS2nlomYVAGIcIK2eym2AvyDEFWxtKI+YgabKsvw
	 v5w0i31YwMrEdPy/BKTZmSH+qB5sG0qzmLLkmEMX6iwBdW4/MGqtp/ApaWxkOEPPqf
	 ijctROIB+uNsi8Gggs5lvcsuxZWFZzCKtQL01eI7H5VzNZFUE6nLE/hrn+7PhA5v9b
	 Qyf83DoE1B28/DkHnwd4xxaUvSGvc0ffckEyeuZH0y1sOzxzdznTgquuXZd3T5NsVb
	 1M5U1n+agP8oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2012A405C1;
	Tue, 30 Dec 2025 21:06:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06D9535B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA7AF405DF
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiPQNQxUAV-Z for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE91B405C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE91B405C0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD68687CA5; Tue, 30 Dec 2025 21:06:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 21:50:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f1b4a0cf484bb5817572deefb9280418540e771
X-Git-Newrev: 31fd1e4a36681421400a2c1290464eafbcf3c731
X-Patchwork-Hint: ignore
Message-Id: <20251230210621.CD68687CA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: add patch to fix
 CMake >= 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=31fd1e4a36681421400a2c1290464eafbcf3c731
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
