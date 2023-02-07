Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C309C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB662700C9;
	Tue, 21 Feb 2023 01:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB662700C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uS7kp8ffjEaT; Tue, 21 Feb 2023 01:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9747F6FFEF;
	Tue, 21 Feb 2023 01:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9747F6FFEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FCF31BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E52D6FFF0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E52D6FFF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ohpPoajnwwh for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26C9D6106E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26C9D6106E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13AC481979; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 16:18:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1ffbc3a9cb9d4386f6ae171207f7b85ef182e8a2
X-Git-Newrev: 93ce3c1be0753189d6af3ee9968b935037519c25
X-Patchwork-Hint: ignore
Message-Id: <20230220205253.13AC481979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsolv: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=93ce3c1be0753189d6af3ee9968b935037519c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Required by micromamba.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[Thomas:
 - rework shared/static lib handling
 - don't pass ENABLE_CONDA=ON based on BR2_PACKAGE_MICROMAMBA=y as
   it's weird that a dependency does something different depending on
   which of its reverse dependencies is enabled]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libsolv/Config.in    |  9 +++++++++
 package/libsolv/libsolv.hash |  3 +++
 package/libsolv/libsolv.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 220a326adc..e8ddad71cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2788,6 +2788,7 @@ F:	package/most/
 
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/cli11/
+F:	package/libsolv/
 F:	package/open-isns/
 F:	package/termcolor/
 F:	package/tl-expected/
diff --git a/package/Config.in b/package/Config.in
index fa0713c311..6ca4c61959 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2085,6 +2085,7 @@ menu "Other"
 	source "package/libshdata/Config.in"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
+	source "package/libsolv/Config.in"
 	source "package/libspatialindex/Config.in"
 	source "package/libtalloc/Config.in"
 	source "package/libtasn1/Config.in"
diff --git a/package/libsolv/Config.in b/package/libsolv/Config.in
new file mode 100644
index 0000000000..1415d2bc2b
--- /dev/null
+++ b/package/libsolv/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBSOLV
+	bool "libsolv"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_ZLIB
+	help
+	  A free package dependency solver using a satisfiability
+	  algorithm.
+
+	  https://github.com/openSUSE/libsolv
diff --git a/package/libsolv/libsolv.hash b/package/libsolv/libsolv.hash
new file mode 100644
index 0000000000..162e46e54d
--- /dev/null
+++ b/package/libsolv/libsolv.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  968aef452b5493751fa0168cd58745a77c755e202a43fe8d549d791eb16034d5  libsolv-0.7.22.tar.gz
+sha256  57f15acfb29fbef7749779e096a5885c60b716633e34484a21bb717554c0198f  LICENSE.BSD
diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
new file mode 100644
index 0000000000..144ce68a83
--- /dev/null
+++ b/package/libsolv/libsolv.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libsolv
+#
+################################################################################
+
+LIBSOLV_VERSION = 0.7.22
+LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
+LIBSOLV_LICENSE = BSD-3-Clause
+LIBSOLV_LICENSE_FILES = LICENSE.BSD
+LIBSOLV_INSTALL_STAGING = YES
+LIBSOLV_DEPENDENCIES = zlib
+LIBSOLV_CONF_OPTS = -DCMAKE_CXX_COMPILER_FORCED=ON
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBSOLV_CONF_OPTS += -DENABLE_STATIC=ON
+else
+LIBSOLV_CONF_OPTS += -DDISABLE_STATIC=ON
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBSOLV_CONF_OPTS += -DENABLE_SHARED=ON
+else
+LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=ON
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
