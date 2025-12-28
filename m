Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE52D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C5E3406EA;
	Sun, 28 Dec 2025 22:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7vufOljnZyT; Sun, 28 Dec 2025 22:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53CFA406F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766962008;
	bh=8IgstmYxKOVq4nT7isIZFqk5Uezv0nmOIb+86/EYp1Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oRQeZtTRRZL8XjkPGADIfJNzTzO6Q2zJ6XZBsbrRnyEKv+2SDaKmbP7DxEbnHxNWH
	 c2vzvfMj2oiQgJ5aSB/5wFp6H5r/hvDh43fODOg4hBi+7SMYGommdLoxGHc/dgKYmG
	 vGBKYMMn6kqt1ecfTyBoicvG/1im1sRXbu1Qz5/pXLLspq/ChRZfnX0Yk19Waoy6Xr
	 L7ib25v4dwfhh7UmdUd7ayl9C6OINTc8vCXSeLKcl4n5B8o8XR3vlSRSuq3Uu6gz4i
	 XgPksfndUNjVgxrtevYTdCLExNbh4uAZqRD1GiNR716LNqtiZd2bGltmyoB6Urjmwu
	 q7DdpGhsVi91g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53CFA406F0;
	Sun, 28 Dec 2025 22:46:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51334D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42BF1406F5
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bb-hw3WkrEv2 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79191406EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79191406EA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70EF587A53; Sun, 28 Dec 2025 22:46:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:42:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee656a4486cecc24dc424e4de62ca6c185432d0b
X-Git-Newrev: 34a1a42ab1ee218a1e99b21217d5f680d07f78b1
X-Patchwork-Hint: ignore
Message-Id: <20251228224645.70EF587A53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/soapy-sdr: add patch to fix CMake
 >= 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=34a1a42ab1ee218a1e99b21217d5f680d07f78b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
  to tell CMake that the project requires at least <min> but has been updated
  to work with policies introduced by <max> or earlier.

  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

Fixes:

  https://autobuild.buildroot.net/results/074098fef4f8a5e89a4f04efbdd1f545f4616772/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...s.txt-bump-minimum-CMake-required-version.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/soapy-sdr/0002-CMakeLists.txt-bump-minimum-CMake-required-version.patch b/package/soapy-sdr/0002-CMakeLists.txt-bump-minimum-CMake-required-version.patch
new file mode 100644
index 0000000000..6f591a3682
--- /dev/null
+++ b/package/soapy-sdr/0002-CMakeLists.txt-bump-minimum-CMake-required-version.patch
@@ -0,0 +1,67 @@
+From 52ed7a5acc8059c87be88d2a930ddb28e03d6a91 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 28 Dec 2025 21:57:46 +0100
+Subject: [PATCH] CMakeLists.txt: bump minimum CMake required version
+
+Building with CMake >= 4 requires a minimum version of at least 3.5,
+otherwise the build fails with:
+
+CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/pothosware/SoapySDR/pull/477
+---
+ CMakeLists.txt               | 2 +-
+ ExampleDriver/CMakeLists.txt | 2 +-
+ python/CMakeLists.txt        | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fe00bd0..f103daf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ ########################################################################
+ # Project setup
+ ########################################################################
+-cmake_minimum_required(VERSION 3.1.0)
++cmake_minimum_required(VERSION 3.5)
+ project(SoapySDR)
+ enable_language(CXX)
+ enable_testing()
+diff --git a/ExampleDriver/CMakeLists.txt b/ExampleDriver/CMakeLists.txt
+index 4e83dbe..b907b70 100644
+--- a/ExampleDriver/CMakeLists.txt
++++ b/ExampleDriver/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ # Project setup -- only needed if device support is a stand-alone build
+ # We recommend that the support module be built in-tree with the driver.
+ ########################################################################
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ project(SoapySDRMyDevice CXX)
+ enable_testing()
+ 
+diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
+index 8cb1592..0253223 100644
+--- a/python/CMakeLists.txt
++++ b/python/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ ########################################################################
+ # Project setup
+ ########################################################################
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(SoapySDRPython CXX)
+ enable_testing()
+ 
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
