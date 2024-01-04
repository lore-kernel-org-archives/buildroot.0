Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56130C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FB1A61AEB;
	Thu,  4 Jan 2024 21:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB1A61AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1U6Num8mJbZ; Thu,  4 Jan 2024 21:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BFFD6F4CE;
	Thu,  4 Jan 2024 21:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BFFD6F4CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3733F1BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F59340189
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F59340189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBuLIBFEA4nP for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:45:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91BFB400D6
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91BFB400D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7685E84150; Thu,  4 Jan 2024 21:45:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:44:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5eba2ef3a5930cd05ad33741b83af02c1dbf42e
X-Git-Newrev: d6a5bcf9063fec7e626867636bbe3c3adde9086a
X-Patchwork-Hint: ignore
Message-Id: <20240104214527.7685E84150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/picocom: bump to version 2023-04
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6a5bcf9063fec7e626867636bbe3c3adde9086a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to new upstream.

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...mpile-with-libc-s-without-cispeed-cospeed.patch | 49 ----------------------
 package/picocom/Config.in                          |  2 +-
 package/picocom/picocom.hash                       |  2 +-
 package/picocom/picocom.mk                         |  4 +-
 5 files changed, 4 insertions(+), 54 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 40d9fb1ed4..7e15db0d29 100644
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
index 5143e31102..0000000000
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
index 9f8efc4a9a..6db71e1791 100644
--- a/package/picocom/Config.in
+++ b/package/picocom/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PICOCOM
 	  in principle, very much like minicom, only it's pico instead
 	  of mini!
 
-	  https://github.com/npat-efault/picocom/
+	  https://gitlab.com/wsakernel/picocom
diff --git a/package/picocom/picocom.hash b/package/picocom/picocom.hash
index 77c270408c..8107f5633a 100644
--- a/package/picocom/picocom.hash
+++ b/package/picocom/picocom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e6761ca932ffc6d09bd6b11ff018bdaf70b287ce518b3282d29e0270e88420bb  picocom-3.1.tar.gz
+sha256  107d3e49e502ce63f826525f587826990451bcb39492efe2e0463dd62d64f3ea  picocom-2023-04.tar.gz
 sha256  9273c6b2c55be95f0f0df292d87e8900e5bfdf5b510a6ea09e80306cf45c10f6  LICENSE.txt
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 2d585bb2f5..2828c98fb7 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
