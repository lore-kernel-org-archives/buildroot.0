Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3E9CAC582
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 15:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 144BA83BE6;
	Fri, 12 Sep 2025 15:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxTuaewEPNhz; Fri, 12 Sep 2025 15:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08F6183BD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F6183BD8;
	Fri, 12 Sep 2025 15:33:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57FA712D
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 477684072E
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9770C0Z4vXWj for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 15:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68DCE406DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68DCE406DA
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:33:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58589844B1; Fri, 12 Sep 2025 15:33:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Sep 2025 17:22:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0797adf4078484c90c95ddfe216d4fc1b881b97
X-Git-Newrev: 013565ecfc18ad627f91a425412373a210bdf7ab
X-Patchwork-Hint: ignore
Message-Id: <20250912153306.58589844B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fatcat: add upstream patch to fix
 CMake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=013565ecfc18ad627f91a425412373a210bdf7ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch fixing cmake 4 compatibility:

CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

Fixes:

 https://autobuild.buildroot.org/results/548e662429e7cf91bd48e447345374c6734f1de7/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
