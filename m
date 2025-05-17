Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1A4C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA7C84890;
	Mon, 19 May 2025 11:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QM4NZZlVnIN2; Mon, 19 May 2025 11:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A28684902
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A28684902;
	Mon, 19 May 2025 11:04:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3943EE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73AD040DA9
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycEGVYzyYnGC for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EDFD41E69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EDFD41E69
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C62981E90; Mon, 19 May 2025 10:40:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 17:06:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dad998a8070bc07838f78453fcb7906fefab22ba
X-Git-Newrev: 2722a8ad73c9bd84e69fafcd84e0ab7940f1e6cb
X-Patchwork-Hint: ignore
Message-Id: <20250519104008.4C62981E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libubootenv: fix cmake
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2722a8ad73c9bd84e69fafcd84e0ab7940f1e6cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a patch fixing cmake 4 compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0002-Update-cmake_minimum_required-to-3.5.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch b/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch
new file mode 100644
index 0000000000..531623bc53
--- /dev/null
+++ b/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch
@@ -0,0 +1,53 @@
+From 87581f45d442903af8a9f331b11052bdd836c7f6 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 14 May 2025 14:03:38 -0600
+Subject: [PATCH] Update cmake_minimum_required to 3.5
+
+This supports compilation with cmake-4.0.0.
+
+Fixes:
+CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://patchwork.ozlabs.org/project/swupdate/patch/20250514201740.686772-1-james.hilliard1@gmail.com/
+---
+ CMakeLists.txt     | 2 +-
+ src/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 796d7bc..0a11730 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ #
+ # SPDX-License-Identifier:     LGPL-2.1-or-later
+ 
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.5)
+ project (libubootenv C)
+ 
+ # The version number.
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index c56d0c7..3370232 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ # SPDX-FileCopyrightText: 2019-2021 Stefano Babic <stefano.babic@swupdate.org>
+ #
+ # SPDX-License-Identifier:     LGPL-2.1-or-later
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.5)
+ # Sources and private headers
+ SET(libubootenv_SOURCES
+   uboot_env.c
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
