Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA443C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53C274195B;
	Wed,  1 May 2024 20:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axYdBpoojh3c; Wed,  1 May 2024 20:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AA0041831
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AA0041831;
	Wed,  1 May 2024 20:46:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 798CF1BF400
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9273405FD
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qx6f4cEHk5Rr for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DDFE4067C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DDFE4067C
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:46:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A219864D4; Wed,  1 May 2024 20:46:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 22:21:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17a04da7d4fdfe44547e9b50a62c2f4af49e9ae8
X-Git-Newrev: b890206876588ed0d16187abf49d35a45177cc3d
X-Patchwork-Hint: ignore
Message-Id: <20240501204617.5A219864D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.75
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
Content-Type: multipart/mixed; boundary="===============1199494227070851047=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1199494227070851047==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b890206876588ed0d16187abf49d35a45177cc3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 5.75 containing various fixes. Added a patch to fix
build with disabled CUPS (failing since 5.73, waiting to be reviewed and
merged) and enabled autoreconf which is needed for that patch.

Changelog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../bluez5_utils-headers/bluez5_utils-headers.mk   |  2 +-
 .../0001-configure.ac-Fix-disable-cups.patch       | 41 ++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.hash             |  2 +-
 package/bluez5_utils/bluez5_utils.mk               |  4 ++-
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 74b385e110..2f07a7b422 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.72
+BLUEZ5_UTILS_HEADERS_VERSION = 5.75
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/0001-configure.ac-Fix-disable-cups.patch b/package/bluez5_utils/0001-configure.ac-Fix-disable-cups.patch
new file mode 100644
index 0000000000..2c6c46f6fd
--- /dev/null
+++ b/package/bluez5_utils/0001-configure.ac-Fix-disable-cups.patch
@@ -0,0 +1,41 @@
+From cb0de49bc6f8a6bf8f01a24599b499aa4bf18032 Mon Sep 17 00:00:00 2001
+From: Lars Wendler <polynomial-c@gmx.de>
+Date: Tue, 16 Apr 2024 07:26:04 +0200
+Subject: [PATCH] configure.ac: Fix --disable-cups
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+or else we get:
+  configure: error: conditional "CUPS_SERVERBIN" was never defined.
+  Usually this means the macro was only invoked conditionally.
+
+Fixes: https://github.com/bluez/bluez/issues/773
+
+Upstream: https://patchwork.kernel.org/project/bluetooth/list/?series=844910
+Signed-off-by: Jan Čermák <sairon@sairon.cz>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9dea70d..dbba759 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -249,12 +249,12 @@ AM_CONDITIONAL(CUPS, test "${enable_cups}" != "no")
+ if (test "${enable_cups}" != "no"); then
+ 	AC_MSG_CHECKING([cups directory])
+ 	cups_serverbin=`$PKG_CONFIG cups --variable=cups_serverbin`
+-	AM_CONDITIONAL(CUPS_SERVERBIN, test "${cups_serverbin}" != "")
+-	if (test "${cups_serverbin}" != ""); then
+-		AC_SUBST(CUPS_SERVERBIN, ${cups_serverbin})
+-	fi
+ 	AC_MSG_RESULT([${cups_serverbin}])
+ fi
++AM_CONDITIONAL(CUPS_SERVERBIN, test "${cups_serverbin}" != "")
++AS_IF([test "${cups_serverbin}" != ""],[
++	AC_SUBST(CUPS_SERVERBIN, ${cups_serverbin})
++])
+ 
+ AC_ARG_ENABLE(mesh, AS_HELP_STRING([--enable-mesh],
+ 		[enable Mesh profile support]), [enable_mesh=${enableval}])
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 46680cf3c9..9cc19f87dd 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e  bluez-5.72.tar.xz
+sha256  988cb3c4551f6e3a667708a578f5ca9f93fc896508f98f08709be4f8ab033c2f  bluez-5.75.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 3ccb63948c..26f0f4afd4 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,9 +5,11 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.72
+BLUEZ5_UTILS_VERSION = 5.75
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
+# 0001-configure.ac-Fix-disable-cups.patch
+BLUEZ5_UTILS_AUTORECONF = YES
 BLUEZ5_UTILS_INSTALL_STAGING = YES
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB

--===============1199494227070851047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1199494227070851047==--
