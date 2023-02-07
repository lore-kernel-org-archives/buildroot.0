Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA1FC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E265700E0;
	Tue, 21 Feb 2023 01:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E265700E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmXPK-Nuc7PD; Tue, 21 Feb 2023 01:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 478A1700ED;
	Tue, 21 Feb 2023 01:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 478A1700ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B28CB1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 323136FE5A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 323136FE5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZlFjjOVsF1Q for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C0E36FFE7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C0E36FFE7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06C1F828C8; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 16:18:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4e4402d4efb86256a3cff9c17c03f7300e427e1a
X-Git-Newrev: 1ffbc3a9cb9d4386f6ae171207f7b85ef182e8a2
X-Patchwork-Hint: ignore
Message-Id: <20230220205253.06C1F828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tl-expected: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ffbc3a9cb9d4386f6ae171207f7b85ef182e8a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Required by micromamba.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/tl-expected/Config.in        | 12 ++++++++++++
 package/tl-expected/tl-expected.hash |  3 +++
 package/tl-expected/tl-expected.mk   | 20 ++++++++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9cc080f7a4..220a326adc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2790,6 +2790,7 @@ N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/cli11/
 F:	package/open-isns/
 F:	package/termcolor/
+F:	package/tl-expected/
 
 N:	Tan En De <ende.tan@starfivetech.com>
 F:	package/libkcapi/
diff --git a/package/Config.in b/package/Config.in
index e1a1b153b1..fa0713c311 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2132,6 +2132,7 @@ endif
 	source "package/startup-notification/Config.in"
 	source "package/tbb/Config.in"
 	source "package/tinycbor/Config.in"
+	source "package/tl-expected/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
 	source "package/uvw/Config.in"
diff --git a/package/tl-expected/Config.in b/package/tl-expected/Config.in
new file mode 100644
index 0000000000..92758ffee5
--- /dev/null
+++ b/package/tl-expected/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TL_EXPECTED
+	bool "tl-expected"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  C++11/14/17 std::expected with functional-style extensions and
+	  reference support.
+
+	  https://github.com/TartanLlama/expected
+
+comment "tl-expected needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/tl-expected/tl-expected.hash b/package/tl-expected/tl-expected.hash
new file mode 100644
index 0000000000..e5c9cc2a3e
--- /dev/null
+++ b/package/tl-expected/tl-expected.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2611769546cedcaef233ef587e71420d1f079a794eb7bb19b888dedf991ace7c  tl-expected-v1.0.0-br1.tar.gz
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  COPYING
diff --git a/package/tl-expected/tl-expected.mk b/package/tl-expected/tl-expected.mk
new file mode 100644
index 0000000000..8d62c75fea
--- /dev/null
+++ b/package/tl-expected/tl-expected.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# tl-expected
+#
+################################################################################
+
+TL_EXPECTED_VERSION = v1.0.0
+TL_EXPECTED_SITE = https://github.com/TartanLlama/expected
+TL_EXPECTED_SITE_METHOD = git
+TL_EXPECTED_GIT_SUBMODULES = YES
+TL_EXPECTED_LICENSE = CC0-1.0
+TL_EXPECTED_LICENSE_FILES = COPYING
+TL_EXPECTED_INSTALL_STAGING = YES
+TL_EXPECTED_INSTALL_TARGET = NO
+TL_EXPECTED_CONF_OPTS = \
+	-DCMAKE_MODULE_PATH=$(TL_EXPECTED_DIR)/cmake/tl-cmake \
+	-DEXPECTED_ENABLE_TESTS=OFF \
+	-DFETCHCONTENT_FULLY_DISCONNECTED=ON
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
