Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ABCC87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 16:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77E5C40D64;
	Sun, 10 Aug 2025 16:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxvXJ0wVnzkp; Sun, 10 Aug 2025 16:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79C7140C7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79C7140C7A;
	Sun, 10 Aug 2025 16:48:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A771154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C5C440227
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xc-jWVnk6w-i for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 16:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A4B740063
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A4B740063
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:48:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80BB38711C; Sun, 10 Aug 2025 16:48:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 18:40:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34a3a1ee8b82b9b6aebbc73da9efabef0bbc38aa
X-Git-Newrev: 3d774b6c4dd63a8bf1b9d8f691b9451c75f19592
X-Patchwork-Hint: ignore
Message-Id: <20250810164822.80BB38711C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cjson: fix cmake 4 compatibility
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2635699277815797108=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2635699277815797108==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3d774b6c4dd63a8bf1b9d8f691b9451c75f19592
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch fixing cmake 4 compatibility, found in upstream pull
request #935.

Fixes:

  https://autobuild.buildroot.org/results/e7e/e7e427b90718a5fc4985e2718e8b629bba672390

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
[Romain: add links to autobuilder failures in commit log]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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

--===============2635699277815797108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2635699277815797108==--
