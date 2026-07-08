Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E41FC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 556DE409FE;
	Fri, 10 Jul 2026 13:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2IkdOUZpC7k; Fri, 10 Jul 2026 13:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6460409DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690999;
	bh=xO8IsgWiyBr6MJvi81SVHBTF+ZNbmItfMsy692B5+I4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=grewl7DPQaYj9Aw+MrB5wF4ORDUMtuKzm1bwBmb4M8K064VHInrp9A9w6wslczNzP
	 OMftJEVla5JBRbu8sw0XXRsGkTxBt1DOOu4Tc7tvpml1rt72nl1kFQn45PE8wmxOKL
	 VSFYTwJDb73Ouv5TqLFlMUeoBE0V5Iixue3vpJiSoxnQ7MTu8IQeUMUWOsYVX+VBvw
	 95qkwXcW6U8s/MIAvEPYhKcyqZooJGo4VR6+7BOlqwEMmi/o1+3gRx8wSfSEOkQo0s
	 j6d4gywU17yovZG0LppXCl4IUzOCFiXtaS5CUUmIvQqxApq3M5hZOkdMam75ejlrO2
	 jNiO1ZVl2OLlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6460409DB;
	Fri, 10 Jul 2026 13:43:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D92092FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFE504076A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGZwH5QRl4Mn for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED0A2408F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED0A2408F4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EB1688660; Fri, 10 Jul 2026 13:42:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 15:01:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e690698e33e1eb0fdd4508bfe6d77433f01539f9
X-Git-Newrev: b47eb5a096ea364ddcbc5a52ced9d729f08b9801
X-Patchwork-Hint: ignore
Message-Id: <20260710134218.2EB1688660@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/webkitgtk:
 security bump to version 2.52.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b47eb5a096ea364ddcbc5a52ced9d729f08b9801
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:

https://webkitgtk.org/2026/06/02/webkitgtk2.52.4-released.html

Fixes the following security issues:

https://webkitgtk.org/security/WSA-2026-0003.html

Includes fixes (among others) for CVE-2026-28847, CVE-2026-28883,
CVE-2026-28901, CVE-2026-28902, CVE-2026-28903, CVE-2026-28904,
CVE-2026-28905, CVE-2026-28907, CVE-2026-28942, CVE-2026-28946,
CVE-2026-28947, CVE-2026-28953, CVE-2026-28955, CVE-2026-28958,
CVE-2026-43658, and CVE-2026-43660.

Also added 0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch,
to get webkitgtk compiled when -DUSE_SYSTEM_MALLOC=ON is in use.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Julien: add "security" in commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 013612b4962332ef528682a037a91c7a420f5bab)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...313606-main-Fails-to-build-with-system-ma.patch | 52 ++++++++++++++++++++++
 package/webkitgtk/webkitgtk.hash                   |  6 +--
 package/webkitgtk/webkitgtk.mk                     |  2 +-
 3 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch b/package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch
new file mode 100644
index 0000000000..decdba6814
--- /dev/null
+++ b/package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch
@@ -0,0 +1,52 @@
+From 146cdc86b7345ac8f513fdf649979e80db01a2ca Mon Sep 17 00:00:00 2001
+From: Alberto Garcia <berto@igalia.com>
+Date: Tue, 2 Jun 2026 07:24:38 -0700
+Subject: [PATCH] REGRESSION(313606@main): Fails to build with system malloc
+ https://bugs.webkit.org/show_bug.cgi?id=316083
+
+Reviewed by Fujii Hironori.
+
+Don't add bmalloc_CopyHeaders to LLIntOffsetsExtractor_DEPENDENCIES if
+USE_SYSTEM_MALLOC is on.
+
+* Source/JavaScriptCore/CMakeLists.txt:
+
+Canonical link: https://commits.webkit.org/305877.698@webkitglib/2.52
+
+Upstream: https://github.com/WebKit/WebKit/commit/a6bc685a685c8f16c919dc6310a62a26971d396e
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Source/JavaScriptCore/CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
+index a2a6d724608a..ea9ea17802f2 100644
+--- a/Source/JavaScriptCore/CMakeLists.txt
++++ b/Source/JavaScriptCore/CMakeLists.txt
+@@ -412,8 +412,10 @@ set(LLIntSettingsExtractor_DEPENDENCIES
+     JavaScriptCore_CopyHeaders
+     JavaScriptCore_CopyPrivateHeaders
+     WTF_CopyHeaders
+-    bmalloc_CopyHeaders
+ )
++if (NOT USE_SYSTEM_MALLOC)
++    list(APPEND LLIntSettingsExtractor_DEPENDENCIES bmalloc_CopyHeaders)
++endif ()
+ WEBKIT_EXECUTABLE(LLIntSettingsExtractor)
+ 
+ # LLIntSettingsExtractor target needs to have a direct or indirect
+@@ -439,8 +441,10 @@ set(LLIntOffsetsExtractor_DEPENDENCIES
+     JavaScriptCore_CopyHeaders
+     JavaScriptCore_CopyPrivateHeaders
+     WTF_CopyHeaders
+-    bmalloc_CopyHeaders
+ )
++if (NOT USE_SYSTEM_MALLOC)
++    list(APPEND LLIntOffsetsExtractor_DEPENDENCIES bmalloc_CopyHeaders)
++endif ()
+ WEBKIT_EXECUTABLE(LLIntOffsetsExtractor)
+ 
+ # The build system will execute asm.rb every time LLIntOffsetsExtractor's mtime is newer than
+-- 
+2.43.0
+
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 03b8d0a9be..f8c0e0297a 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.52.3.tar.xz.sums
-sha1  17f9b127618040a5f3fcbb70e37ea16ab6d69b0b  webkitgtk-2.52.3.tar.xz
-sha256  5b3e0d174e63dcc28848b1194e0e7448d5948c3c2427ecd931c2c5be5261aebb  webkitgtk-2.52.3.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.52.4.tar.xz.sums
+sha1  1bfaa562ae46a420abaad2b3b9175dc823cc7a93  webkitgtk-2.52.4.tar.xz
+sha256  cf4076a1ca2a64788edca8c452d8ebb68d5e2965e588fe46a388a016513edce4  webkitgtk-2.52.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 54e769d589..6cab2c6a24 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.52.3
+WEBKITGTK_VERSION = 2.52.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
