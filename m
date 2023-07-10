Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7F2EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BB10820D4;
	Mon, 10 Jul 2023 17:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BB10820D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIsk6slBOXkq; Mon, 10 Jul 2023 17:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E84A81FAC;
	Mon, 10 Jul 2023 17:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E84A81FAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 888E21BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E8F540B5F
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E8F540B5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7OupG6GCn8kJ for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:34:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 673E440B5A
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 673E440B5A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 505DB86BF6; Mon, 10 Jul 2023 17:34:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:33:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff2c69a9009341f9bd9e3a99cc984d36cfa395a6
X-Git-Newrev: b5cae6ed9973db0ca84d67ab0fd3763e554550f6
X-Patchwork-Hint: ignore
Message-Id: <20230710173404.505DB86BF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: fix cross build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5cae6ed9973db0ca84d67ab0fd3763e554550f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build error introduced by bumping bluez5_utils to 5.68 with buildroot
commit 7cac499ec46655a491e59b5bbc2a83a2137099bd due to upstream commit
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/configure.ac?id=1106b28be85ac9586d1758839226e163e9030ee2

Fixes:
http://autobuild.buildroot.net/results/564/564952e0f9c7f69ef266d7df455ca033fb52d9f7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure-Check-ell-path.patch            | 35 ++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk               |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/package/bluez5_utils/0001-configure-Check-ell-path.patch b/package/bluez5_utils/0001-configure-Check-ell-path.patch
new file mode 100644
index 0000000000..3e5f7c6516
--- /dev/null
+++ b/package/bluez5_utils/0001-configure-Check-ell-path.patch
@@ -0,0 +1,35 @@
+From 124187ef9abed60a7c40f751153e9c4516cd1f91 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 1 Jul 2023 01:31:20 +0000
+Subject: [PATCH] configure: Check ell path
+
+Use of AC_CHECK_FILE prevents cross compilation.
+Instead use test to support cross compiling.
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+
+Upstream: https://github.com/bluez/bluez/pull/546
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index eff297960..bc7edfcd3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -298,9 +298,10 @@ if (test "${enable_external_ell}" = "yes"); then
+ 	AC_SUBST(ELL_LIBS)
+ fi
+ if (test "${enable_external_ell}" != "yes"); then
+-	AC_CHECK_FILE(${srcdir}/ell/ell.h, dummy=yes,
+-			AC_CHECK_FILE(${srcdir}/../ell/ell/ell.h, dummy=yes,
+-				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)))
++	if (test ! -f ${srcdir}/ell/ell.h) &&
++			(test ! -f ${srcdir}/../ell/ell/ell.h); then
++				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)
++	fi
+ fi
+ AM_CONDITIONAL(EXTERNAL_ELL, test "${enable_external_ell}" = "yes" ||
+ 				(test "${enable_btpclient}" != "yes" &&
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 1e87041610..82800c0430 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -9,6 +9,8 @@ BLUEZ5_UTILS_VERSION = 5.68
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
+# 0001-configure-Check-ell-path.patch
+BLUEZ5_UTILS_AUTORECONF = YES
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
