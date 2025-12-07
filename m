Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC22ED4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2AD84316;
	Fri, 12 Dec 2025 07:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDOWrGxLf634; Fri, 12 Dec 2025 07:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83D2184023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526310;
	bh=fwv+zi4P38EPVyKmQlxNGSZZbbnnUfY1bIp7Zhv5mUg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LU+fIt7QdZ6lHTzvnoGB81+4Dr2tbcmMel+88njfs3QehiJxwyvl8neBxn6CqapDg
	 bkc7pYsDb62AOiT62G0iE9jkyY0FBTCLHyHsHhiUYyxc4qB0Fkjut7uPNw7buw1Q+1
	 a1E4BKct6dvVt7LnCn3lIbwPW0wkqpVl5mpVY2qb0TuVr+9AE+V58QrsVlszCeB3zZ
	 PDUA9HDCdQ/+cpTGT2zNDMgGds3lEv9Y3GFngSbQO0OBvw2je8o5XcrYZGRu83gvLP
	 Xhfkfk+dWnxTr8Og5P7jqvECdiHYthWgHv265HTJYYleF6+QlXcLbSymDyfCOTAdhN
	 F4Vqq0t/T5/3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83D2184023;
	Fri, 12 Dec 2025 07:58:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC3162C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07AAF41173
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PN-PqG8Bq8mP for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BBC041183
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BBC041183
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A028807F9; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d26ce283bb6ce3f991344444eea11fac687afc0
X-Git-Newrev: ae303fbef47860092a7d300f4a4e01b9386f2ac3
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.5A028807F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zynaddsubfx: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae303fbef47860092a7d300f4a4e01b9386f2ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
