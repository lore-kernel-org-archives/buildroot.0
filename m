Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B70C433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 12:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A1E60AEA;
	Mon, 28 Nov 2022 12:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A1E60AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnfPRSnxiAkG; Mon, 28 Nov 2022 12:50:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D7C760AAF;
	Mon, 28 Nov 2022 12:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D7C760AAF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5542C1BF334
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3102B60A92
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3102B60A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41Z9Jpa0w2eE for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 12:50:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10EC160A77
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10EC160A77
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 12:50:17 +0000 (UTC)
Received: from ubuntu-jammy.com (unknown [223.102.84.39])
 by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wDHXHroqoRjRIDfAA--.18116S5;
 Mon, 28 Nov 2022 20:35:02 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 12:34:16 +0000
Message-Id: <20221128123418.2197-4-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128123418.2197-1-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHXHroqoRjRIDfAA--.18116S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw13Zw18Zw1DWr4kCw4DJwb_yoW5Zr4xpr
 43JFy5Wr48Ka1fJ39xGr129r13Arsrur1UC3Zagr4jqFyDWFyxJ34UJa15AryxXr12yw15
 Z3WxWr4YgryDtaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXiSdUUUUU=
X-Originating-IP: [223.102.84.39]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXBvHjVXl47h9WQAAsC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KFKz9
 K4xWTIozNX52sT9WzLacw4fjCo5WTbv2Z6Hf98=; b=R6R1crH0PB6QvvYmQ61oo
 wA9qaPJb7iQNFkOFw2QeNnqbjRSm6frk3x3pE+JDIrySmDN8jeka0sGnSS3p/Ag5
 PI1+uEQAUX36A3C/6PNB9Bb5Z00ziySm/dXjW3SCk3OfdU0kdTTYh/glWzH0D6Gp
 0lN143J8ofp0vGPD/946mE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=R6R1crH0
Subject: [Buildroot] [PATCH/next 4/6] package/libsolv: new package
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
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libsolv/Config.in    |  9 +++++++++
 package/libsolv/libsolv.hash |  3 +++
 package/libsolv/libsolv.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/libsolv/Config.in
 create mode 100644 package/libsolv/libsolv.hash
 create mode 100644 package/libsolv/libsolv.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2541a64dbf..572086d129 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2739,6 +2739,7 @@ F:	package/most/
 
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/cli11/
+F:	package/libsolv/
 F:	package/open-isns/
 F:	package/termcolor/
 F:	package/tl-expected/
diff --git a/package/Config.in b/package/Config.in
index 2e73a6e3fa..b682fbe0ab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2054,6 +2054,7 @@ menu "Other"
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
index 0000000000..49c52e0c74
--- /dev/null
+++ b/package/libsolv/libsolv.mk
@@ -0,0 +1,25 @@
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
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBSOLV_CONF_OPTS += -DENABLE_STATIC=ON
+endif
+
+ifeq ($(BR2_PACKAGE_MICROMAMBA),y)
+LIBSOLV_CONF_OPTS += -DENABLE_CONDA=ON
+endif
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
