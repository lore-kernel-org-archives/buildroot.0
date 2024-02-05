Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD66C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53D1940BFD;
	Mon,  5 Feb 2024 11:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53D1940BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4aNWHlse9YC; Mon,  5 Feb 2024 11:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2353D40B42;
	Mon,  5 Feb 2024 11:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2353D40B42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9657D1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B04082951
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B04082951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y5dMFqGkR4To for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:01:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D0DB82919
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D0DB82919
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6961186B27; Mon,  5 Feb 2024 11:01:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:01:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0c65ba09063adf8bc29a4f3fc82f654f3196a36
X-Git-Newrev: c8f092e59b70adf41418a743f09fcccabbb865e8
X-Patchwork-Hint: ignore
Message-Id: <20240205110150.6961186B27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{bluez5_utils,
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c8f092e59b70adf41418a743f09fcccabbb865e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog

Removed patch which is included in this release.

Signed-off-by: Yang Li <yang.li@amlogic.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../bluez5_utils-headers/bluez5_utils-headers.mk   |  2 +-
 .../0001-configure-Check-ell-path.patch            | 35 ----------------------
 package/bluez5_utils/bluez5_utils.hash             |  2 +-
 package/bluez5_utils/bluez5_utils.mk               |  4 +--
 4 files changed, 3 insertions(+), 40 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
