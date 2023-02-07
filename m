Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D4CC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D2BA700D6;
	Tue, 21 Feb 2023 01:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D2BA700D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqcID9yPNH1p; Tue, 21 Feb 2023 01:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608FB700D0;
	Tue, 21 Feb 2023 01:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 608FB700D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 873B51BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D58806FE64
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D58806FE64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVWSmrngSqIR for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3EB46FE5C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3EB46FE5C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D640781979; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 16:18:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4a6f9d2516820c296a8af788b259ca96926cd60d
X-Git-Newrev: f25b760186b72d2224d7087324ca5f2baeafb8b3
X-Patchwork-Hint: ignore
Message-Id: <20230220205252.D640781979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cli11: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f25b760186b72d2224d7087324ca5f2baeafb8b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Required by micromamba.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/cli11/Config.in  | 13 +++++++++++++
 package/cli11/cli11.hash |  3 +++
 package/cli11/cli11.mk   | 15 +++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8dde37bd67..830dab56f0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2787,6 +2787,7 @@ N:	Sven Oliver Moll <svolli@svolli.de>
 F:	package/most/
 
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
+F:	package/cli11/
 F:	package/open-isns/
 
 N:	Tan En De <ende.tan@starfivetech.com>
diff --git a/package/Config.in b/package/Config.in
index b5418c56f6..3773901552 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2150,6 +2150,7 @@ endmenu
 
 menu "Text and terminal handling"
 	source "package/augeas/Config.in"
+	source "package/cli11/Config.in"
 	source "package/docopt-cpp/Config.in"
 	source "package/enchant/Config.in"
 	source "package/fmt/Config.in"
diff --git a/package/cli11/Config.in b/package/cli11/Config.in
new file mode 100644
index 0000000000..87db9ac8f7
--- /dev/null
+++ b/package/cli11/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_CLI11
+	bool "cli11"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  CLI11 is a command line parser for C++11 and beyond that
+	  provides a rich feature set with a simple and intuitive
+	  interface.
+
+	  https://github.com/CLIUtils/CLI11
+
+comment "cli11 needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/cli11/cli11.hash b/package/cli11/cli11.hash
new file mode 100644
index 0000000000..12e5b4fb55
--- /dev/null
+++ b/package/cli11/cli11.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  378da73d2d1d9a7b82ad6ed2b5bda3e7bc7093c4034a1d680a2e009eb067e7b2  cli11-2.3.1.tar.gz
+sha256  89022151dbf5827a22430557ef2f8a75808dd25fa1e9a12709ef5421d363e66d  LICENSE
diff --git a/package/cli11/cli11.mk b/package/cli11/cli11.mk
new file mode 100644
index 0000000000..b02bd4478f
--- /dev/null
+++ b/package/cli11/cli11.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# cli11
+#
+################################################################################
+
+CLI11_VERSION = 2.3.1
+CLI11_SITE = $(call github,CLIUtils,CLI11,v$(CLI11_VERSION))
+CLI11_LICENSE = BSD-3-Clause
+CLI11_LICENSE_FILES = LICENSE
+CLI11_INSTALL_STAGING = YES
+CLI11_INSTALL_TARGET = NO
+CLI11_CONF_OPTS = -DCLI11_BUILD_DOCS=OFF -DCLI11_BUILD_EXAMPLES=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
