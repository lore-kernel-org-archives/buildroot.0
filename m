Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03C9C433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 12:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A62660A92;
	Mon, 28 Nov 2022 12:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A62660A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIUftJIdpxjv; Mon, 28 Nov 2022 12:50:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD55C60B00;
	Mon, 28 Nov 2022 12:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD55C60B00
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 285E11BF39C
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02EC94094B
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02EC94094B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Exb1Zwvrb4Pf for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 12:50:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D1814092A
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D1814092A
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 12:50:08 +0000 (UTC)
Received: from ubuntu-jammy.com (unknown [223.102.84.39])
 by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wDHXHroqoRjRIDfAA--.18116S2;
 Mon, 28 Nov 2022 20:34:49 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 12:34:13 +0000
Message-Id: <20221128123418.2197-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDHXHroqoRjRIDfAA--.18116S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryUtFWxKw15Gr47JF4xZwb_yoW5AF1xpr
 43Jr1rG3yIg3WSyrZrG3W7Zr4avr4DuF1UGwnrt34Utry5G3W8K340qa17Gr1xJry7Gw4f
 Xw18Ar4UWrWDKaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRctxkUUUUU=
X-Originating-IP: [223.102.84.39]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBzgrHjWI0WpO6qgAAsB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=px2Tn
 avVWMPYHpuobYUmHMi1vFIL98rUNUZXHA+MOac=; b=ic7jAcanFyDcv2X+QU1Kt
 QwhhEb3bgsBmDtBk36GtvtAHkN0t44hzkdc8JHn7S9FSiCjCvI5EfToGHP2S7gI5
 vv9VpbnLZPmVoclSG0N1uGfltbirLVRurCgUwJutMlsaJq6AkOF9eZgddLkwsWBl
 yY0NMsH8nB8WQCB7HAW+m0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=ic7jAcan
Subject: [Buildroot] [PATCH/next 1/6] package/cli11: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Required by micromamba.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/cli11/Config.in  | 13 +++++++++++++
 package/cli11/cli11.hash |  3 +++
 package/cli11/cli11.mk   | 15 +++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/cli11/Config.in
 create mode 100644 package/cli11/cli11.hash
 create mode 100644 package/cli11/cli11.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2aecdb1c8f..180793a91b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2738,6 +2738,7 @@ N:	Sven Oliver Moll <svolli@svolli.de>
 F:	package/most/
 
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
+F:	package/cli11/
 F:	package/open-isns/
 
 N:	Tan En De <ende.tan@starfivetech.com>
diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..a378146ac7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2118,6 +2118,7 @@ endmenu
 
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
