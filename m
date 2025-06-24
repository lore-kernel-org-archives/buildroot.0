Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75A5C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AC706125B;
	Thu, 26 Jun 2025 19:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjVstDK2I7B9; Thu, 26 Jun 2025 19:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19B056131A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19B056131A;
	Thu, 26 Jun 2025 19:49:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FEEB154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 684254195B
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqYOUnDx9NDY for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 544EE41962
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 544EE41962
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 525328467F; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 20:41:43 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: c54ca15c65828d8ae1a39fce60777a5380efd84b
X-Git-Newrev: e851f1341b8094dc105825919d22a37aa62f2c4f
X-Patchwork-Hint: ignore
Message-Id: <20250626194922.525328467F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/mjpg-streamer:
 bump version to v1.0.0-1-g310b29f4
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

commit: https://git.buildroot.net/buildroot/commit/?id=e851f1341b8094dc105825919d22a37aa62f2c4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Add fix to build with cmake 4.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: use "git describe --tags --abbrev=40" format in _VERSION]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f1adb7952d5176c33581db0ded48740043d257fa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mjpg-streamer/0002-cmake4.patch  | 34 ++++++++++++++++++++++++++++++++
 package/mjpg-streamer/mjpg-streamer.hash |  2 +-
 package/mjpg-streamer/mjpg-streamer.mk   |  2 +-
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/package/mjpg-streamer/0002-cmake4.patch b/package/mjpg-streamer/0002-cmake4.patch
new file mode 100644
index 0000000000..ed7211ab81
--- /dev/null
+++ b/package/mjpg-streamer/0002-cmake4.patch
@@ -0,0 +1,34 @@
+From 0dd9cf8b23fa183a403794e15617237662104d1d Mon Sep 17 00:00:00 2001
+From: Stephen L Arnold <nerdboy@gentoo.org>
+Date: Mon, 29 Nov 2021 18:13:34 -0800
+Subject: [PATCH] fix: update cmake build, fix install, add simple test and
+ versioning
+
+Signed-off-by: Stephen L Arnold <nerdboy@gentoo.org>
+
+Upstream: https://github.com/jacksonliam/mjpg-streamer/pull/333
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd:
+ ported cmake version bump from upstream PR to fix build with cmake 4.x]
+---
+ mjpg-streamer-experimental/CMakeLists.txt     | 102 +++++++++++++-----
+ mjpg-streamer-experimental/Makefile           |  15 +--
+ .../cmake/FindGphoto2.cmake                   |  20 ++--
+ .../cmake/mjpg_streamer_utils.cmake           |  22 ++--
+ mjpg-streamer-experimental/mjpg_streamer.c    |   4 -
+ mjpg-streamer-experimental/mjpg_streamer.h    |   9 +-
+ .../plugins/input_ptp2/CMakeLists.txt         |   6 +-
+ .../plugins/output_http/CMakeLists.txt        |   2 +-
+ 8 files changed, 117 insertions(+), 63 deletions(-)
+
+diff --git a/mjpg-streamer-experimental/CMakeLists.txt b/mjpg-streamer-experimental/CMakeLists.txt
+index cf26620e..e6e67bc7 100644
+--- a/mjpg-streamer-experimental/CMakeLists.txt
++++ b/mjpg-streamer-experimental/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.3)
++cmake_minimum_required(VERSION 3.10.0)
+ set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
+ 
+ project("mjpg-streamer" C)
diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
index 164c9b2181..980549f657 100644
--- a/package/mjpg-streamer/mjpg-streamer.hash
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5b427b07c03c2c0468cc782daf1510d315141170246828fcbb7c07f927879973  mjpg-streamer-5a6e0a2db163e6ae9461552b59079870d0959340.tar.gz
+sha256  eb4de7fed9f8b15ee6d8ca2b0417aff2854cd018582b7090e28eb0aaa19bc808  mjpg-streamer-v1.0.0-1-g310b29f4a94c46652b20c4b7b6e5cf24e532af39.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 46f3f50104..5e52b45b01 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MJPG_STREAMER_VERSION = 5a6e0a2db163e6ae9461552b59079870d0959340
+MJPG_STREAMER_VERSION = v1.0.0-1-g310b29f4a94c46652b20c4b7b6e5cf24e532af39
 MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,$(MJPG_STREAMER_VERSION))
 MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
