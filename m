Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29079D3B7E8
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E741060BAF;
	Sun,  7 Dec 2025 16:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_F9HGz1diOC; Sun,  7 Dec 2025 16:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBB2360B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123354;
	bh=vzVpZLH0r3z1RskCsSdy9D13Nsj7COKqxE/K5US1UJM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZRDShxqWmi1KKiSK1S3xtL8bHzvSrtGaFC/H0tpzrwp4oAJsfk6wThItocIPJCy7o
	 Q2QsLlko0jxz096P0gkjFt6khbK7hQuEG/oy2bxeKdXXXLvTcni/y6Xca7Io/Lfs66
	 xUo9xmp/VbsJNA5rsAX4U9JUYHM0CIcQBhJBa8tvGi125UVVanmGt+EVytnQM4UAtI
	 Fqzsy1GpQizWz3rhvejUd7M+qJOvmnyyx4fvTIKLGbL7k81YqozoRxbKHA72cL4tFG
	 QhomLZ7psPh8qnOZgvEqZAGfDLuTbMMke23u7U443j32YFeRBYG+zVAel+aptTwgY9
	 WQji34wZr+Qfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB2360B70;
	Sun,  7 Dec 2025 16:02:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BA61E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3966A822B4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ER9U6w1NzEB for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6237C822B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6237C822B5
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E87A85DB7; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:05:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bc311aacf5fb563f2fd7955b163de0149d7a39cd
X-Git-Newrev: 330be1e4c1375e3b1a0e4f84013fe96531edce7c
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.5E87A85DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcue: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=330be1e4c1375e3b1a0e4f84013fe96531edce7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Not yet found by buildroot autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Raise-CMake-minimum-version-to-3.10.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch b/package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch
new file mode 100644
index 0000000000..f61b752004
--- /dev/null
+++ b/package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch
@@ -0,0 +1,42 @@
+From d62e39506f4f9b12d58efbd2f1e2667c06b13a19 Mon Sep 17 00:00:00 2001
+From: Andreas Sturmlechner <asturm@gentoo.org>
+Date: Sun, 28 Sep 2025 22:12:39 +0200
+Subject: [PATCH] Raise CMake minimum version to 3.10
+
+Signed-off-by: Andreas Sturmlechner <asturm@gentoo.org>
+
+Downloaded from Gentoo commit
+https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=67d125dc0333e62fccb360f5918b044aa4bdf978
+
+Upstream: https://github.com/lipnitsk/libcue/pull/73
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to 2.3.0]
+---
+ CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c4f9d8e..0d3cb04 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,10 +1,14 @@
++CMAKE_MINIMUM_REQUIRED(VERSION 3.10 FATAL_ERROR)
++
++if (POLICY CMP0145)
++	cmake_policy(SET CMP0145 OLD) # since 3.27
++endif()
++
+ SET(PACKAGE libcue)
+ SET(PACKAGE_NAME libcue)
+ SET(PACKAGE_VERSION 2.3.0)
+ SET(PACKAGE_SOVERSION 2)
+ 
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.8 FATAL_ERROR)
+-
+ PROJECT(libcue C)
+ 
+ include(GNUInstallDirs)
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
