Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59263C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 20:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03265605FA;
	Sun, 15 Jun 2025 20:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnbgSM09a6uU; Sun, 15 Jun 2025 20:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD36605D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD36605D2;
	Sun, 15 Jun 2025 20:52:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 857691A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 778E340205
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1SOCNbBbA89 for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 20:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4605401E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4605401E9
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:52:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F87683A8A; Sun, 15 Jun 2025 20:52:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 22:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 393d7e4d2197696bf0df7c83dc1dd97e3f6253bb
X-Git-Newrev: 68c8ff2c9521be62681e2a9ead9dccc8d7106d04
X-Patchwork-Hint: ignore
Message-Id: <20250615205216.9F87683A8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cannelloni: bump to version 2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=68c8ff2c9521be62681e2a9ead9dccc8d7106d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:

https://github.com/mguentner/cannelloni/releases/tag/v2.0.0

Bump GCC to at least GCC 8 due to the C++20 requirement.

Add TCP protocol to the package's description.

This release also raise cmake version requirement to 3.15, which fixes
build failures with host-cmake >= 4.x.

Fixes:
https://autobuild.buildroot.org/results/87d5ab39a84c51f340875ae365d4f39439e81645/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: add a commit log comment about fixes with host-cmake 4]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cannelloni/Config.in       | 8 ++++----
 package/cannelloni/cannelloni.hash | 2 +-
 package/cannelloni/cannelloni.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cannelloni/Config.in b/package/cannelloni/Config.in
index e137e60c60..a2a15c0274 100644
--- a/package/cannelloni/Config.in
+++ b/package/cannelloni/Config.in
@@ -1,17 +1,17 @@
 config BR2_PACKAGE_CANNELLONI
 	bool "cannelloni"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++20
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # lksctp-tools
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lksctp-tools
 	depends on !BR2_STATIC_LIBS # lksctp-tools
 	help
-	  A SocketCAN over Ethernet tunnel. The tunnel supports both
+	  A SocketCAN over Ethernet tunnel. The tunnel supports TCP,
 	  UDP and SCTP protocols.
 
 	  https://github.com/mguentner/cannelloni
 
-comment "cannelloni needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "cannelloni needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index 107415b0ac..625e43d157 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  de44b7e327fbf38883f46e51a5afd07de5144f2e44c5f42b7f2f0741165f0b13  cannelloni-1.0.0.tar.gz
+sha256  3dde63727549d4a39154e78b95f4a5dad96af236ca6cef531f347c0b923c74d5  cannelloni-2.0.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index f97a091760..7978cfccf5 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CANNELLONI_VERSION = 1.0.0
+CANNELLONI_VERSION = 2.0.0
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,v$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPL-2.0
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
