Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312B3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 06:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C791860F07;
	Sat, 25 Jun 2022 06:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C791860F07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0bMs0IQTrqC; Sat, 25 Jun 2022 06:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27CB160EF4;
	Sat, 25 Jun 2022 06:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27CB160EF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 213D11BF95F
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0815260F10
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0815260F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YIC-BddoE2W for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4126660F0B
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4126660F0B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 129AE8754F; Sat, 25 Jun 2022 06:34:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 08:36:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df27a9daa68f2f9dae1315df5aed026f0e8df58d
X-Git-Newrev: 094b545270e14c8dacc6b6f9439d54d77bdc963a
X-Patchwork-Hint: ignore
Message-Id: <20220625063418.129AE8754F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/irqbalance: bump to version 1.9.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=094b545270e14c8dacc6b6f9439d54d77bdc963a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (not needed since
https://github.com/Irqbalance/irqbalance/commit/bc16d7d4d5e478f44a89b93f3d7fd460268769dd)

https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-configure.ac-use-pkg-config-to-find-numa.patch | 38 ----------------------
 package/irqbalance/irqbalance.hash                 |  2 +-
 package/irqbalance/irqbalance.mk                   |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/irqbalance/0001-configure.ac-use-pkg-config-to-find-numa.patch b/package/irqbalance/0001-configure.ac-use-pkg-config-to-find-numa.patch
deleted file mode 100644
index 751367ccfb..0000000000
--- a/package/irqbalance/0001-configure.ac-use-pkg-config-to-find-numa.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 274cb8ea470a10ce46b783e77784b0eb08cf20d8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 1 Aug 2021 23:26:01 +0200
-Subject: [PATCH] configure.ac: use pkg-config to find numa
-
-Use pkg-config to find numa and fallback to current mechanism.
-Thanks to pkg-config, numa dependencies such as -latomic will be
-retrieved.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/Irqbalance/irqbalance/pull/188]
----
- configure.ac | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c45b9ce..50c62ba 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -23,7 +23,14 @@ AC_CHECK_HEADERS([numa.h])
- 
- AC_CHECK_FUNCS(getopt_long)
- 
--AC_CHECK_LIB(numa, numa_available)
-+PKG_CHECK_MODULES([NUMA], [numa], [has_numa=yes], [AC_CHECK_LIB(numa, numa_available)])
-+AS_IF([test "x$has_numa" = "xyes"], [
-+  AC_SUBST([NUMA_CFLAGS])
-+  AC_SUBST([NUMA_LIBS])
-+  LIBS="$LIBS $NUMA_LIBS"
-+  AC_SUBST([LIBS])
-+])
-+
- AC_CHECK_LIB(m, floor)
- 
- PKG_CHECK_MODULES([GLIB2], [glib-2.0], [], [AC_MSG_ERROR([glib-2.0 is required])])
--- 
-2.30.2
-
diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index 49118f8c7d..3dd83a017f 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2e7ddb9687a6a5cc1f41626659eac2ad9d6b5875629156b92f693bd404d8ae63  irqbalance-1.8.0.tar.gz
+sha256  883d3f6296f7e4a17e09dc2c91bd972e110fe574c119d9e45ec0c4e35c7317bb  irqbalance-1.9.0.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 1efc0b7fa2..abd64e6b9e 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = 1.8.0
+IRQBALANCE_VERSION = 1.9.0
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
