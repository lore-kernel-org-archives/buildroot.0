Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C342C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F197A4F3D2;
	Tue, 21 Feb 2023 00:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F197A4F3D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EgXUns4WLCtf; Tue, 21 Feb 2023 00:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A24A24F3F3;
	Tue, 21 Feb 2023 00:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A24A24F3F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 564931BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DF78417D0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DF78417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqfts9Z6g2LF for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 349D14159A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 349D14159A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 238B88648F; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 16:18:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 93ce3c1be0753189d6af3ee9968b935037519c25
X-Git-Newrev: 26dd70e954a7c9142b078837ab1bbfad54d0e5cb
X-Patchwork-Hint: ignore
Message-Id: <20230220205253.238B88648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/reproc: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=26dd70e954a7c9142b078837ab1bbfad54d0e5cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Required by micromamba.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/reproc/Config.in   | 14 ++++++++++++++
 package/reproc/reproc.hash |  3 +++
 package/reproc/reproc.mk   | 17 +++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8ddad71cd..d7c4d03c4c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2790,6 +2790,7 @@ N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/cli11/
 F:	package/libsolv/
 F:	package/open-isns/
+F:	package/reproc/
 F:	package/termcolor/
 F:	package/tl-expected/
 
diff --git a/package/Config.in b/package/Config.in
index 6ca4c61959..06d0a05854 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2126,6 +2126,7 @@ endif
 	source "package/protozero/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/reproc/Config.in"
 	source "package/riemann-c-client/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
diff --git a/package/reproc/Config.in b/package/reproc/Config.in
new file mode 100644
index 0000000000..a4e9c893b1
--- /dev/null
+++ b/package/reproc/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_REPROC
+	bool "reproc"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # uses wchar_t
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
+	help
+	  reproc is a cross-platform C/C++ library that simplifies
+	  starting, stopping and communicating with external programs.
+
+	  https://github.com/DaanDeMeyer/reproc
+
+comment "reproc needs a toolchain w/ threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/reproc/reproc.hash b/package/reproc/reproc.hash
new file mode 100644
index 0000000000..6da6d0a0bb
--- /dev/null
+++ b/package/reproc/reproc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  55c780f7faa5c8cabd83ebbb84b68e5e0e09732de70a129f6b3c801e905415dd  reproc-14.2.4.tar.gz
+sha256  8f91afbe266bebac2cf1b220e0e67ace4cb9a97d2b21940abef20eb6691cfa91  LICENSE
diff --git a/package/reproc/reproc.mk b/package/reproc/reproc.mk
new file mode 100644
index 0000000000..3167911c4d
--- /dev/null
+++ b/package/reproc/reproc.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# reproc
+#
+################################################################################
+
+REPROC_VERSION = 14.2.4
+REPROC_SITE = $(call github,DaanDeMeyer,reproc,v$(REPROC_VERSION))
+REPROC_LICENSE = MIT
+REPROC_LICENSE_FILES = LICENSE
+REPROC_INSTALL_STAGING = YES
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),yy) # C++11
+REPROC_CONF_OPTS += -DREPROC++=ON
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
