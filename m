Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCFDC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 15:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2473F40A68;
	Tue,  7 Feb 2023 15:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2473F40A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OitcStsY8M41; Tue,  7 Feb 2023 15:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 434C840A30;
	Tue,  7 Feb 2023 15:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 434C840A30
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3501BF275
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66A36417AA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A36417AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xs2mM2aRGjLf for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 15:18:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49004417A6
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 15:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49004417A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 339DA841CD; Tue,  7 Feb 2023 15:18:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 16:18:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93ce3c1be0753189d6af3ee9968b935037519c25
X-Git-Newrev: 26dd70e954a7c9142b078837ab1bbfad54d0e5cb
X-Patchwork-Hint: ignore
Message-Id: <20230207151850.339DA841CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/reproc: new package
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
