Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61498D3B7E7
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37890403A8;
	Sun,  7 Dec 2025 17:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fry0K_EpUIPU; Sun,  7 Dec 2025 17:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C9EE403A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126888;
	bh=CXi9u2BA4rMYbjbU0LkNCpu74OzklFY15My7zk55KTQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jIgXVwjWzcsq9nTLeXWKmZqaPUlC6zaDrVbov3SBpZJDB/guXChsOCKRj3ovdW7j6
	 L/qI2KwY4DhFwcsgjA+4hqt9qD0pnEYgzrzyvy0AsFpRd34Bm4E+bXn0QN2vzfrIcz
	 I9Ae6lOnaqYazjtnZQUxOtZUCt3UMdW/mdRmCgt/MMglXBcEeQo7gZz2tCbwRAfuug
	 3eM1QcTxGvWtKmOQHdDbQeQOBfmeofipiQLR3K1nOUT4S5+YWJyhokLp4gMX64/1zz
	 qQcikscw55lF6+rYLuCAhEE7OtrFqSAo8PRF1VTSaPP2Efv7482g6PkRVY/G0hcWsP
	 VQFYnr0RFBbHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C9EE403A9;
	Sun,  7 Dec 2025 17:01:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EC802CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E80C60B60
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjEUCZbzyr2B for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C46E460B75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C46E460B75
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFD53867B0; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3d26ce283bb6ce3f991344444eea11fac687afc0
X-Git-Newrev: ae303fbef47860092a7d300f4a4e01b9386f2ac3
X-Patchwork-Hint: ignore
Message-Id: <20251207170112.BFD53867B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zynaddsubfx: fix cmake
 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae303fbef47860092a7d300f4a4e01b9386f2ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zynaddsubfx/0003-CMake-cleanup.patch       | 39 ++++++++++++++++++++++
 .../zynaddsubfx/0004-Modernize-CMakeLists.patch    | 24 +++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/package/zynaddsubfx/0003-CMake-cleanup.patch b/package/zynaddsubfx/0003-CMake-cleanup.patch
new file mode 100644
index 0000000000..b8ced14b17
--- /dev/null
+++ b/package/zynaddsubfx/0003-CMake-cleanup.patch
@@ -0,0 +1,39 @@
+From ffe9ca1375168dd86c974dbe7c0264fce393150e Mon Sep 17 00:00:00 2001
+From: Johannes Lorenz <j.git@lorenz-ho.me>
+Date: Sun, 29 Dec 2024 03:22:44 +0100
+Subject: [PATCH] Add -Werror support, CMake cleanup
+
+* Raise CMake minimum version to 3.5 (due to deprecation warnings)
+
+Upstream: https://github.com/zynaddsubfx/zynaddsubfx/commit/ffe9ca1375168dd86c974dbe7c0264fce393150e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported only cmake_minimum_required bump to 3.0.6]
+---
+ .github/workflows/ccpp.yml |  2 +-
+ CMakeLists.txt             |  3 +-
+ rtosc                      |  2 +-
+ src/CMakeLists.txt         | 57 +++++++++++++++++++-------------------
+ src/Misc/MiddleWare.cpp    |  4 ++-
+ src/UI/MasterUI.fl         |  6 ++--
+ src/UI/OscilGenUI.fl       |  4 +--
+ src/UI/PartUI.fl           |  6 ++--
+ src/UI/SUBnoteUI.fl        |  4 +--
+ 9 files changed, 45 insertions(+), 43 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e678d939c..9bae0b40d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,9 +1,10 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")
+ project(zynaddsubfx)
+ set(VERSION_MAJOR "3")
+ set(VERSION_MINOR "0")
+ set(VERSION_REVISION "6")
++cmake_policy(SET CMP0072 NEW)
+ 
+ #Set data directory, if any
+ if(DEFINED ZYN_DATADIR)
diff --git a/package/zynaddsubfx/0004-Modernize-CMakeLists.patch b/package/zynaddsubfx/0004-Modernize-CMakeLists.patch
new file mode 100644
index 0000000000..3b2ccfd13e
--- /dev/null
+++ b/package/zynaddsubfx/0004-Modernize-CMakeLists.patch
@@ -0,0 +1,24 @@
+From c00fdb161004e06e52ef46ba921014bd15b1601b Mon Sep 17 00:00:00 2001
+From: fundamental <mark.d.mccurry@gmail.com>
+Date: Sat, 4 Nov 2023 16:32:42 +0100
+Subject: [PATCH] Modernize CMakeLists
+
+Upstream: https://github.com/fundamental/rtosc/commit/c00fdb161004e06e52ef46ba921014bd15b1601b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported only cmake_minimum_required bump]
+---
+ CMakeLists.txt           | 276 +++++++++++++++++----------------------
+ cmake/ColorMessage.cmake |  15 ++-
+ 2 files changed, 131 insertions(+), 160 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e62af32..33d80ac 100644
+--- a/rtosc/CMakeLists.txt
++++ b/rtosc/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(RTOSC)
+ 
+ set(VERSION_MAJOR 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
