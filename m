Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A9EC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 08:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBCDA42CE0;
	Wed, 24 Jan 2024 08:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBCDA42CE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKUd95G5WI2m; Wed, 24 Jan 2024 08:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5FD142CF5;
	Wed, 24 Jan 2024 08:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5FD142CF5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 401F61BF339
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 08:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2217685110
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 08:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2217685110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plOJIY2HOZTg for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 08:29:18 +0000 (UTC)
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC5018510A
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 08:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC5018510A
Received: from droid02-cd.amlogic.com (10.98.11.201) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 24 Jan 2024
 16:28:59 +0800
From: Yang Li <yang.li@amlogic.com>
To: <buildroot@buildroot.org>
Date: Wed, 24 Jan 2024 16:28:34 +0800
Message-ID: <20240124082835.1995939-1-yang.li@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.98.11.201]
Subject: [Buildroot] [PATCH] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.72
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Yang Li <yang.li@amlogic.com>, Marcin
 Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog

Removed patch which is included in this release.

Signed-off-by: Yang Li <yang.li@amlogic.com>
---
 .../bluez5_utils-headers.mk                   |  2 +-
 .../0001-configure-Check-ell-path.patch       | 35 -------------------
 package/bluez5_utils/bluez5_utils.hash        |  2 +-
 package/bluez5_utils/bluez5_utils.mk          |  4 +--
 4 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 package/bluez5_utils/0001-configure-Check-ell-path.patch

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 0790dd7e0e..74b385e110 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.68
+BLUEZ5_UTILS_HEADERS_VERSION = 5.72
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/0001-configure-Check-ell-path.patch b/package/bluez5_utils/0001-configure-Check-ell-path.patch
deleted file mode 100644
index 3e5f7c6516..0000000000
--- a/package/bluez5_utils/0001-configure-Check-ell-path.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 124187ef9abed60a7c40f751153e9c4516cd1f91 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sat, 1 Jul 2023 01:31:20 +0000
-Subject: [PATCH] configure: Check ell path
-
-Use of AC_CHECK_FILE prevents cross compilation.
-Instead use test to support cross compiling.
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-
-Upstream: https://github.com/bluez/bluez/pull/546
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- configure.ac | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index eff297960..bc7edfcd3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -298,9 +298,10 @@ if (test "${enable_external_ell}" = "yes"); then
- 	AC_SUBST(ELL_LIBS)
- fi
- if (test "${enable_external_ell}" != "yes"); then
--	AC_CHECK_FILE(${srcdir}/ell/ell.h, dummy=yes,
--			AC_CHECK_FILE(${srcdir}/../ell/ell/ell.h, dummy=yes,
--				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)))
-+	if (test ! -f ${srcdir}/ell/ell.h) &&
-+			(test ! -f ${srcdir}/../ell/ell/ell.h); then
-+				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)
-+	fi
- fi
- AM_CONDITIONAL(EXTERNAL_ELL, test "${enable_external_ell}" = "yes" ||
- 				(test "${enable_btpclient}" != "yes" &&
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 45952e60f1..46680cf3c9 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  fc505e6445cb579a55cacee6821fe70d633921522043d322b696de0a175ff933  bluez-5.68.tar.xz
+sha256  499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e  bluez-5.72.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 82800c0430..3ccb63948c 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,12 +5,10 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.68
+BLUEZ5_UTILS_VERSION = 5.72
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-# 0001-configure-Check-ell-path.patch
-BLUEZ5_UTILS_AUTORECONF = YES
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
