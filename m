Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA56C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 15:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3461640A49;
	Tue,  7 Feb 2023 15:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3461640A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7V4sRBgl6BBl; Tue,  7 Feb 2023 15:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5EA940A30;
	Tue,  7 Feb 2023 15:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5EA940A30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38E051BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EE2560FEA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EE2560FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvBHcd6x3uv9 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 15:18:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B4FE60FCE
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 15:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B4FE60FCE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0951F841CD; Tue,  7 Feb 2023 15:18:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 16:18:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f25b760186b72d2224d7087324ca5f2baeafb8b3
X-Git-Newrev: 4e4402d4efb86256a3cff9c17c03f7300e427e1a
X-Patchwork-Hint: ignore
Message-Id: <20230207151850.0951F841CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/termcolor: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e4402d4efb86256a3cff9c17c03f7300e427e1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required by micromamba.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/termcolor/Config.in      | 12 ++++++++++++
 package/termcolor/termcolor.hash |  3 +++
 package/termcolor/termcolor.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 830dab56f0..9cc080f7a4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2789,6 +2789,7 @@ F:	package/most/
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/cli11/
 F:	package/open-isns/
+F:	package/termcolor/
 
 N:	Tan En De <ende.tan@starfivetech.com>
 F:	package/libkcapi/
diff --git a/package/Config.in b/package/Config.in
index 3773901552..e1a1b153b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2176,6 +2176,7 @@ menu "Text and terminal handling"
 	source "package/readline/Config.in"
 	source "package/slang/Config.in"
 	source "package/tclap/Config.in"
+	source "package/termcolor/Config.in"
 	source "package/utf8proc/Config.in"
 endmenu
 
diff --git a/package/termcolor/Config.in b/package/termcolor/Config.in
new file mode 100644
index 0000000000..979ad61d81
--- /dev/null
+++ b/package/termcolor/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TERMCOLOR
+	bool "termcolor"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  Termcolor is a header-only C++ library for printing colored
+	  messages to the terminal.
+
+	  https://github.com/ikalnytskyi/termcolor
+
+comment "termcolor needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/termcolor/termcolor.hash b/package/termcolor/termcolor.hash
new file mode 100644
index 0000000000..dede06c9b0
--- /dev/null
+++ b/package/termcolor/termcolor.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  435994c32557674469404cb1527c283fdcf45746f7df75fd2996bb200d6a759f  termcolor-2.1.0.tar.gz
+sha256  bab0f53c36b248df22e2298ddf9eeea14b28783f187fcbff6a38f2c47b3a3a7d  LICENSE
diff --git a/package/termcolor/termcolor.mk b/package/termcolor/termcolor.mk
new file mode 100644
index 0000000000..0374ce8b73
--- /dev/null
+++ b/package/termcolor/termcolor.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# termcolor
+#
+################################################################################
+
+TERMCOLOR_VERSION = 2.1.0
+TERMCOLOR_SITE = $(call github,ikalnytskyi,termcolor,v$(TERMCOLOR_VERSION))
+TERMCOLOR_LICENSE = BSD-3-Clause
+TERMCOLOR_LICENSE_FILES = LICENSE
+TERMCOLOR_INSTALL_STAGING = YES
+TERMCOLOR_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
