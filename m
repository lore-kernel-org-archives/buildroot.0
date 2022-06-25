Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6A9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 04:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C90B88486C;
	Sat, 25 Jun 2022 04:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C90B88486C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5EvHK26dJsM; Sat, 25 Jun 2022 04:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C00088482B;
	Sat, 25 Jun 2022 04:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00088482B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11BF91BF239
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 04:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E014D60AD6
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 04:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E014D60AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2AxGm-H-hzO for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 04:34:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C64B608F5
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C64B608F5
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 04:34:13 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 0C124844
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:34:11 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.81]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o4xUo-0SIO1p0; Sat, 25 Jun 2022 06:34:10 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:53640)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o4xUn-0005i7-Nw
 for buildroot@buildroot.org; Sat, 25 Jun 2022 06:34:09 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 06:34:09 +0200
Message-Id: <20220625043409.70939-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1656131650-01433199-F5C10608/0/0 CLEAN NORMAL
X-TOI-MSGID: 539ceed5-015d-4fad-b67b-9198e57f1625
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.18.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch, not needed anymore due to upstream removal of astrobwt:
https://github.com/xmrig/xmrig/commit/22d6a7525e0e5d117d2518906ae86adbc4e65be9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0001-astrobwt-fix-build-with-gcc-4.8.patch | 40 -------------------
 package/xmrig/xmrig.hash                      |  2 +-
 package/xmrig/xmrig.mk                        |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch

diff --git a/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch b/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 694d7b203c..0000000000
--- a/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 72234ae73590fa93d837034a3fb48b71eb071a2a Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 22 May 2022 20:24:14 +0200
-Subject: [PATCH] astrobwt: fix build with gcc-4.8
-
-Fixes build error:
-
-xmrig-6.17.0/src/crypto/astrobwt/sort_indices2.cpp:40:24: error: missing binary operator before token "("
- #if __has_cpp_attribute(unlikely)
-
-found with the buildroot toolchain
-arm-none-linux-gnueabi-gcc (Sourcery CodeBench Lite 2014.05-29) 4.8.3 20140320 (prerelease)
-
-Inspired by
-https://reviews.llvm.org/rG91c32fd8c8fa395971a028f7091273fa2c8f44e6
-
-Patch sent upstream: https://github.com/xmrig/xmrig/pull/3057
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/crypto/astrobwt/sort_indices2.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/crypto/astrobwt/sort_indices2.cpp b/src/crypto/astrobwt/sort_indices2.cpp
-index 2d86d462..3a70f619 100644
---- a/src/crypto/astrobwt/sort_indices2.cpp
-+++ b/src/crypto/astrobwt/sort_indices2.cpp
-@@ -36,6 +36,9 @@
- #define RESTRICT
- #endif
- 
-+#ifndef __has_cpp_attribute
-+#define __has_cpp_attribute(x) 0
-+#endif
- 
- #if __has_cpp_attribute(unlikely)
- #define UNLIKELY(X) (X) [[unlikely]]
--- 
-2.30.2
-
diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 7863c0319d..5b9d4402b5 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  748a989390202ba2d1ccbd9d9a6b8cbd6551149cbab63b347fd1ed6df0254faa  xmrig-6.17.0.tar.gz
+sha256  4531a31c0c095fcae18fdef0157f1e2a6694408abbcff6789c8f3cd6ab2c3ca0  xmrig-6.18.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 6e21e550a4..40db428b56 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.17.0
+XMRIG_VERSION = 6.18.0
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
