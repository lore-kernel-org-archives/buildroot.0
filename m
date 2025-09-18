Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2B5CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20AB6822D2;
	Fri, 19 Sep 2025 12:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xUPJ0XRTxLr; Fri, 19 Sep 2025 12:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E2E8233D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01E2E8233D;
	Fri, 19 Sep 2025 12:48:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 034A5E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B62760738
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFAykgAleaDH for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD58A60D78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD58A60D78
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB113842A0; Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:35:25 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: fddb59b0d43ff1bb9e18a5cc7d61543775026016
X-Git-Newrev: 466681da77f3e0b697ad9ab9c66e4bf83a30f92c
X-Patchwork-Hint: ignore
Message-Id: <20250919124805.AB113842A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/fatcat: add
 upstream patch to fix CMake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=466681da77f3e0b697ad9ab9c66e4bf83a30f92c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Add upstream patch fixing cmake 4 compatibility:

CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

Fixes:

 https://autobuild.buildroot.org/results/548e662429e7cf91bd48e447345374c6734f1de7/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 013565ecfc18ad627f91a425412373a210bdf7ab)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...inimum-required-version-to-3.5-for-CMake-.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch b/package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
new file mode 100644
index 0000000000..31dfedda22
--- /dev/null
+++ b/package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
@@ -0,0 +1,40 @@
+From 2e3476a84cbe32598d36b5506c21025b3f94eb03 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 19:30:26 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
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
+Upstream: https://github.com/Gregwar/fatcat/commit/2e3476a84cbe32598d36b5506c21025b3f94eb03
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d6a2649..8f3eadc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(fatcat)
+ 
+ OPTION(DEFINE_WIN "Compiling windows" OFF)
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
