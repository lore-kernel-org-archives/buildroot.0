Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE6ECA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8122260757;
	Thu, 14 Aug 2025 20:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sfY4ShbVxlp; Thu, 14 Aug 2025 20:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 823B6607D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 823B6607D7;
	Thu, 14 Aug 2025 20:07:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 156BD228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99710404A8
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXZUMENjuHA2 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39747404C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39747404C6
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 373878758C; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:33:36 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: fbb8b2a5b3cc4582938dab7f750c66ff13497653
X-Git-Newrev: 4f7126b85c49127cf87e0dd80b01a5f6dfd25ebd
X-Patchwork-Hint: ignore
Message-Id: <20250814200605.373878758C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/cjson: fix cmake
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2791959118278705415=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2791959118278705415==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4f7126b85c49127cf87e0dd80b01a5f6dfd25ebd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Add a patch fixing cmake 4 compatibility, found in upstream pull
request #935.

Fixes:

  https://autobuild.buildroot.org/results/e7e/e7e427b90718a5fc4985e2718e8b629bba672390

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
[Romain: add links to autobuilder failures in commit log]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 3d774b6c4dd63a8bf1b9d8f691b9451c75f19592)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-make_compatible_with_cmake_4.0.patch      | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/cjson/0001-make_compatible_with_cmake_4.0.patch b/package/cjson/0001-make_compatible_with_cmake_4.0.patch
new file mode 100644
index 0000000000..1fe5cd43ef
--- /dev/null
+++ b/package/cjson/0001-make_compatible_with_cmake_4.0.patch
@@ -0,0 +1,34 @@
+From 58bc7c823c2e39f1a626ec4da86952bc6819bd6b Mon Sep 17 00:00:00 2001
+From: Markus Vieth <mvieth@techfak.uni-bielefeld.de>
+Date: Sun, 30 Mar 2025 11:12:07 +0200
+Subject: [PATCH] Make compatible with CMake 4.0 When trying to build with
+ CMake 4.0, the following error is shown:
+
+CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+This change raises the minimum required CMake version to 3.5 and thus makes the project compatible with CMake 4.0
+
+Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
+Upstream: https://github.com/DaveGamble/cJSON/pull/935
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 36a6cb57..9428da58 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ set(CMAKE_LEGACY_CYGWIN_WIN32 0)
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(cJSON
+     VERSION 1.7.18

--===============2791959118278705415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2791959118278705415==--
