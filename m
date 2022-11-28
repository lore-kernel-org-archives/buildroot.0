Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC4DC43217
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 12:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B88E817B3;
	Mon, 28 Nov 2022 12:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B88E817B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSFoEL_7ES2S; Mon, 28 Nov 2022 12:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B753815AB;
	Mon, 28 Nov 2022 12:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B753815AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30B821BF334
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 189AA408ED
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 189AA408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nys7hX0iDne4 for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 12:50:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 695494091D
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
 by smtp4.osuosl.org (Postfix) with ESMTP id 695494091D
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 12:50:22 +0000 (UTC)
Received: from ubuntu-jammy.com (unknown [223.102.84.39])
 by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wDHXHroqoRjRIDfAA--.18116S4;
 Mon, 28 Nov 2022 20:34:59 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 12:34:15 +0000
Message-Id: <20221128123418.2197-3-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128123418.2197-1-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHXHroqoRjRIDfAA--.18116S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF48XF1fArykXr1UZFyUAwb_yoW5trWUpr
 s7Jr15Gr48KF1SyrZ7GF1DZr4akwsrCr18GwsIqrWjqFWUCryIqw1rta18Gry3GrnxJa4U
 tw1kGr4UW34UtaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uea0QUUUUU=
X-Originating-IP: [223.102.84.39]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBzgrHjWI0WpO6qgACsD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=c90/L
 9Sj8S+HNdwHhkvsf6vcxXK4HsjyOu9qhkPX2Kc=; b=TSBJNrVwfIqpP2o56pYEH
 IpD48qnSkHhf6ss0CtnDpcg6xvPQc7DkUrYyUQB2X/Of4mxFbHfMm7u1EFpHEQEH
 wtyUV4YSJbPAb1pZLoaBx0xBxZy+Hz02NBc45OsoilPl2s3o4BXnaraQIoNcLiuh
 jSOKSI6QzJjSlK1RQPojF8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=TSBJNrVw
Subject: [Buildroot] [PATCH/next 3/6] package/tl-expected: new package
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
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/tl-expected/Config.in        | 12 ++++++++++++
 package/tl-expected/tl-expected.hash |  3 +++
 package/tl-expected/tl-expected.mk   | 20 ++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/tl-expected/Config.in
 create mode 100644 package/tl-expected/tl-expected.hash
 create mode 100644 package/tl-expected/tl-expected.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index afab61d97e..2541a64dbf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2741,6 +2741,7 @@ N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/cli11/
 F:	package/open-isns/
 F:	package/termcolor/
+F:	package/tl-expected/
 
 N:	Tan En De <ende.tan@starfivetech.com>
 F:	package/libkcapi/
diff --git a/package/Config.in b/package/Config.in
index 535efd09ea..2e73a6e3fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2100,6 +2100,7 @@ endif
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
