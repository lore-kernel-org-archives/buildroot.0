Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79905CE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 430258416A;
	Fri,  6 Sep 2024 20:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beV-jG1ZvYbP; Fri,  6 Sep 2024 20:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97721848EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97721848EF;
	Fri,  6 Sep 2024 20:04:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1120B1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 865926113F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKeCsjif8OhF for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A941610E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A941610E4
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CE3F86EE1; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 18:41:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1293c5cc7bac3c6e21d7ba43120bf4643199c1ab
X-Git-Newrev: 35ee257177abc792d599636dd36792dfb3416a8d
X-Patchwork-Hint: ignore
Message-Id: <20240906195856.3CE3F86EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.77
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
Content-Type: multipart/mixed; boundary="===============1982307457476344742=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1982307457476344742==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=35ee257177abc792d599636dd36792dfb3416a8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which are included in this release, autoreconf is not
needed anymore.

Changelog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../bluez5_utils-headers/bluez5_utils-headers.mk   |  2 +-
 .../0001-configure.ac-Fix-disable-cups.patch       | 41 ----------------------
 ...figure.ac-fix-sixaxis-build-without-tools.patch | 35 ------------------
 package/bluez5_utils/bluez5_utils.hash             |  2 +-
 package/bluez5_utils/bluez5_utils.mk               |  5 +--
 5 files changed, 3 insertions(+), 82 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 2f07a7b422..ffd78c40f8 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.75
+BLUEZ5_UTILS_HEADERS_VERSION = 5.77
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/0001-configure.ac-Fix-disable-cups.patch b/package/bluez5_utils/0001-configure.ac-Fix-disable-cups.patch
deleted file mode 100644
index 2c6c46f6fd..0000000000
--- a/package/bluez5_utils/0001-configure.ac-Fix-disable-cups.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From cb0de49bc6f8a6bf8f01a24599b499aa4bf18032 Mon Sep 17 00:00:00 2001
-From: Lars Wendler <polynomial-c@gmx.de>
-Date: Tue, 16 Apr 2024 07:26:04 +0200
-Subject: [PATCH] configure.ac: Fix --disable-cups
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-or else we get:
-  configure: error: conditional "CUPS_SERVERBIN" was never defined.
-  Usually this means the macro was only invoked conditionally.
-
-Fixes: https://github.com/bluez/bluez/issues/773
-
-Upstream: https://patchwork.kernel.org/project/bluetooth/list/?series=844910
-Signed-off-by: Jan Čermák <sairon@sairon.cz>
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9dea70d..dbba759 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -249,12 +249,12 @@ AM_CONDITIONAL(CUPS, test "${enable_cups}" != "no")
- if (test "${enable_cups}" != "no"); then
- 	AC_MSG_CHECKING([cups directory])
- 	cups_serverbin=`$PKG_CONFIG cups --variable=cups_serverbin`
--	AM_CONDITIONAL(CUPS_SERVERBIN, test "${cups_serverbin}" != "")
--	if (test "${cups_serverbin}" != ""); then
--		AC_SUBST(CUPS_SERVERBIN, ${cups_serverbin})
--	fi
- 	AC_MSG_RESULT([${cups_serverbin}])
- fi
-+AM_CONDITIONAL(CUPS_SERVERBIN, test "${cups_serverbin}" != "")
-+AS_IF([test "${cups_serverbin}" != ""],[
-+	AC_SUBST(CUPS_SERVERBIN, ${cups_serverbin})
-+])
- 
- AC_ARG_ENABLE(mesh, AS_HELP_STRING([--enable-mesh],
- 		[enable Mesh profile support]), [enable_mesh=${enableval}])
diff --git a/package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch b/package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch
deleted file mode 100644
index 1e0e34cb8f..0000000000
--- a/package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f4795bf64dbf8778fc765b7dad1b1bfb365b48d7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 8 May 2024 19:54:16 +0200
-Subject: configure.ac: fix sixaxis build without tools
-
-Fix the following build failure with --enable-sixaxis --enable-udev
---disable-tools raised since version 5.73 and
-9f71892b63f6b65dab874a633d88ae2dcad93a16:
-
-sixaxis.c:(.text.sixaxis_init+0x23): undefined reference to `udev_new'
-
-Fixes: http://autobuild.buildroot.org/results/c337d0f473c5fbb3e6cda1317ba06f5e2b16a43e
-
-Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=f4795bf64dbf8778fc765b7dad1b1bfb365b48d7
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9dea70ddc1..8b3cdb4e8f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -226,7 +226,7 @@ AM_CONDITIONAL(MONITOR, test "${enable_monitor}" != "no")
- 
- AC_ARG_ENABLE(udev, AS_HELP_STRING([--disable-udev],
- 		[disable udev device support]), [enable_udev=${enableval}])
--if (test "${enable_tools}" != "no" && test "${enable_udev}" != "no"); then
-+if (test "${enable_udev}" != "no"); then
- 	PKG_CHECK_MODULES(UDEV, libudev >= 196)
- 	AC_DEFINE(HAVE_UDEV, 1, [Define to 1 if udev is required])
- fi
--- 
-cgit 1.2.3-korg
-
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 9cc19f87dd..1b10bfbf64 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  988cb3c4551f6e3a667708a578f5ca9f93fc896508f98f08709be4f8ab033c2f  bluez-5.75.tar.xz
+sha256  5d032fdc1d4a085813554f57591e2e1fb0ceb2b3616ee56f689bc00e1d150812  bluez-5.77.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index da10f95a05..b1caef5cc5 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,12 +5,9 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.75
+BLUEZ5_UTILS_VERSION = 5.77
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
-# 0001-configure.ac-Fix-disable-cups.patch
-# 0002-configure.ac-fix-sixaxis-build-without-tools.patch
-BLUEZ5_UTILS_AUTORECONF = YES
 BLUEZ5_UTILS_INSTALL_STAGING = YES
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB

--===============1982307457476344742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1982307457476344742==--
