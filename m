Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B33DC87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 16:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D28A40C7A;
	Sun, 10 Aug 2025 16:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_clbM8o6EDK; Sun, 10 Aug 2025 16:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAD1F40D65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAD1F40D65;
	Sun, 10 Aug 2025 16:48:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F9B2138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 512E240063
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WO5_2WM_n-Do for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 16:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AFF5401CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AFF5401CB
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:48:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B3D68711D; Sun, 10 Aug 2025 16:48:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 18:43:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d774b6c4dd63a8bf1b9d8f691b9451c75f19592
X-Git-Newrev: 76099d285e75d646ffd7dc0f3872b261ffedbb89
X-Patchwork-Hint: ignore
Message-Id: <20250810164822.8B3D68711D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flatcc: fix cmake 4 compatibility
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
Content-Type: multipart/mixed; boundary="===============8492124881235099658=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8492124881235099658==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=76099d285e75d646ffd7dc0f3872b261ffedbb89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch fixing cmake 4 compatibility, found in upstream pull
request #349. The patch has been modified to apply on version 0.6.1
instead of the current upstream HEAD.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...nimum_required_version_to_3.5_for_cmake_4.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/flatcc/0001-cmake_set_minimum_required_version_to_3.5_for_cmake_4.patch b/package/flatcc/0001-cmake_set_minimum_required_version_to_3.5_for_cmake_4.patch
new file mode 100644
index 0000000000..9bfae54ae2
--- /dev/null
+++ b/package/flatcc/0001-cmake_set_minimum_required_version_to_3.5_for_cmake_4.patch
@@ -0,0 +1,51 @@
+From 915f62dcd9f0a372944f749cf4acd707db10c5fd Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 12:59:17 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
+Upstream: https://github.com/dvidelabs/flatcc/pull/349
+---
+ CMakeLists.txt               | 2 +-
+ external/hash/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d4127f598..b51e5c5bd 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ #cmake_minimum_required (VERSION 2.8.12.2)
+ # Centos 7
+ #cmake_minimum_required (VERSION 2.8.11)
+-cmake_minimum_required (VERSION 2.8)
++cmake_minimum_required (VERSION 3.5)
+ 
+ # Disable build of tests and samples. Due to custom build step
+ # dependency on flatcc tool, some custom build configurations may
+diff --git a/external/hash/CMakeLists.txt b/external/hash/CMakeLists.txt
+index 7b7d990dd..12eb3daa4 100644
+--- a/external/hash/CMakeLists.txt
++++ b/external/hash/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 3.0.2)
++cmake_minimum_required (VERSION 3.5)
+ 
+ project (HashTest)
+ 

--===============8492124881235099658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8492124881235099658==--
