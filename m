Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73628CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E50C80D70;
	Thu, 14 Aug 2025 20:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5lDxhdpACEr; Thu, 14 Aug 2025 20:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13D1480F04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D1480F04;
	Thu, 14 Aug 2025 20:07:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6BFA228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8954F4049D
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUAYB4hNfnak for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 423A4404C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 423A4404C7
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 400E387609; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:33:43 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 4f7126b85c49127cf87e0dd80b01a5f6dfd25ebd
X-Git-Newrev: 2fe351d66a2112a1beec85192d62a2d8e8c533bd
X-Patchwork-Hint: ignore
Message-Id: <20250814200605.400E387609@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/flatcc: fix cmake
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
Content-Type: multipart/mixed; boundary="===============4786632325489668390=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4786632325489668390==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2fe351d66a2112a1beec85192d62a2d8e8c533bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Add a patch fixing cmake 4 compatibility, found in upstream pull
request #349. The patch has been modified to apply on version 0.6.1
instead of the current upstream HEAD.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 76099d285e75d646ffd7dc0f3872b261ffedbb89)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============4786632325489668390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4786632325489668390==--
