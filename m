Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BA6C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 16:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7D6C419C2;
	Wed,  3 Jan 2024 16:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7D6C419C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPZ6pvxD-PWx; Wed,  3 Jan 2024 16:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DC41419C3;
	Wed,  3 Jan 2024 16:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DC41419C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22BB11BF283
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 16:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC83381E72
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 16:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC83381E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V54hLL2SMtiV for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 16:49:24 +0000 (UTC)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A64B981B25
 for <buildroot@busybox.net>; Wed,  3 Jan 2024 16:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A64B981B25
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 4CC16440A96;
 Wed,  3 Jan 2024 18:47:15 +0200 (IST)
To: buildroot@busybox.net
Date: Wed,  3 Jan 2024 18:49:06 +0200
Message-ID: <7bf9e3705b3b2bfe8d7796551156abd2ddb8ea26.1704300546.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1704300435;
 bh=kmoU6IAF0NeA/tFHB7/3ucq/wLb4TTAZ/XS+yaCqb88=;
 h=From:To:Cc:Subject:Date:From;
 b=aj3TRB7glNjbP1YN2kWM40rJboFec+4PVa1wa9B0QvDtxaTr+d72t921hIakWg2qQ
 lr4TCAeKtnDYC5IGCA3v4lCRWBsAL0SYLHdejxB+zULy4iPdm6W4anGmBAzMu0ywm9
 mMP15gxby5yVJ7vP6oSwetAHUr7lMZBqrAAc0IiROZxp2QEvHhwdJeq+Jz5hyCR+AB
 cgXuhsWxRfa8KTs/xwi4PaWv0zPP9KwaPkI4gMRm8VP/0a97IZSbskgDSuBRJXucII
 bQpZuuPw892DiXp6ZLzm7Xzb1VYWKRgYVyZ5Th1VkUTrmwEQA8E32u45+Wv187bQ/m
 N0RSvzBke53KQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=aj3TRB7g
Subject: [Buildroot] [PATCH] package/picocom: bump to version 2023-04
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to new upstream.

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .checkpackageignore                           |  1 -
 ...-with-libc-s-without-cispeed-cospeed.patch | 49 -------------------
 package/picocom/Config.in                     |  2 +-
 package/picocom/picocom.hash                  |  2 +-
 package/picocom/picocom.mk                    |  4 +-
 5 files changed, 4 insertions(+), 54 deletions(-)
 delete mode 100644 package/picocom/0001-Compile-with-libc-s-without-cispeed-cospeed.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 40d9fb1ed440..7e15db0d29c4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1047,7 +1047,6 @@ package/php/0002-iconv-tweak-iconv-detection.patch Upstream
 package/php/0003-configure-disable-the-phar-tool.patch Upstream
 package/php/0004-Call-apxs-with-correct-prefix.patch Upstream
 package/php/0005-allow-opcache-cross-compiling.patch Upstream
-package/picocom/0001-Compile-with-libc-s-without-cispeed-cospeed.patch Upstream
 package/pifmrds/0001-Makefile-cross-compile-friendly.patch Upstream
 package/pifmrds/0002-Makefile-use-LDFLAGS.patch Upstream
 package/pifmrds/0003-Makefile-fix-static-link.patch Upstream
diff --git a/package/picocom/0001-Compile-with-libc-s-without-cispeed-cospeed.patch b/package/picocom/0001-Compile-with-libc-s-without-cispeed-cospeed.patch
deleted file mode 100644
index 5143e311020a..000000000000
--- a/package/picocom/0001-Compile-with-libc-s-without-cispeed-cospeed.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 30c712c5f14306460c44bea70e24419db9d44f8c Mon Sep 17 00:00:00 2001
-From: Nick Patavalis <npat@efault.net>
-Date: Thu, 12 Apr 2018 15:16:04 +0300
-Subject: [PATCH] Compile with libc's without cispeed / cospeed
-
-Some libc implementations (e.g. musl) do not define the cispeed and
-cospeed struct termios fields. So we have to check the
-_HAVE_STRUCT_TERMIOS_C_ISPEED and _HAVE_STRUCT_TERMIOS_C_OSPEED
-macros. If not defined, we disable custom baudrate support.
-
-[baruch: backported from upstream master to 3.1]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 1acf1ddabaf3
-
- custbaud.h | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/custbaud.h b/custbaud.h
-index 48151a4a4e84..ae4ae8daf49e 100644
---- a/custbaud.h
-+++ b/custbaud.h
-@@ -26,6 +26,8 @@
- #ifndef CUSTBAUD_H
- #define CUSTBAUD_H
- 
-+#include <termios.h>
-+
- #ifndef NO_CUSTOM_BAUD
- 
- #if defined (__linux__)
-@@ -33,7 +35,13 @@
- /* Enable by-default for kernels > 2.6.0 on x86 and x86_64 only */
- #include <linux/version.h>
- #if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,0)
--#if defined (__i386__) || defined (__x86_64__) || defined (USE_CUSTOM_BAUD)
-+/* Some libc implementations (e.g. musl) do not define the cispeed and
-+   cospeed struct termios fields. We do not support custom baudrates
-+   on them. */
-+#if ( (defined (__i386__) || defined (__x86_64__))  \
-+      && defined (_HAVE_STRUCT_TERMIOS_C_ISPEED)    \
-+      && defined (_HAVE_STRUCT_TERMIOS_C_OSPEED) )  \
-+    || defined (USE_CUSTOM_BAUD)
- #ifndef USE_CUSTOM_BAUD
- #define USE_CUSTOM_BAUD
- #endif
--- 
-2.16.3
-
diff --git a/package/picocom/Config.in b/package/picocom/Config.in
index 9f8efc4a9a4b..6db71e1791a7 100644
--- a/package/picocom/Config.in
+++ b/package/picocom/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PICOCOM
 	  in principle, very much like minicom, only it's pico instead
 	  of mini!
 
-	  https://github.com/npat-efault/picocom/
+	  https://gitlab.com/wsakernel/picocom
diff --git a/package/picocom/picocom.hash b/package/picocom/picocom.hash
index 77c270408c3a..8107f5633a6c 100644
--- a/package/picocom/picocom.hash
+++ b/package/picocom/picocom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e6761ca932ffc6d09bd6b11ff018bdaf70b287ce518b3282d29e0270e88420bb  picocom-3.1.tar.gz
+sha256  107d3e49e502ce63f826525f587826990451bcb39492efe2e0463dd62d64f3ea  picocom-2023-04.tar.gz
 sha256  9273c6b2c55be95f0f0df292d87e8900e5bfdf5b510a6ea09e80306cf45c10f6  LICENSE.txt
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 2d585bb2f5fe..2828c98fb7f9 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PICOCOM_VERSION = 3.1
-PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
+PICOCOM_VERSION = 2023-04
+PICOCOM_SITE = $(call gitlab,wsakernel,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 PICOCOM_CPE_ID_VENDOR = picocom_project
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
