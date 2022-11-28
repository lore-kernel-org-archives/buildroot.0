Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14ADC43217
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 12:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 459324018A;
	Mon, 28 Nov 2022 12:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 459324018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MI2j8T8rvYNr; Mon, 28 Nov 2022 12:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74BAA40164;
	Mon, 28 Nov 2022 12:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74BAA40164
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 071911BF334
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E26F6401B7
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E26F6401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xm8ZcGqx11q3 for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 12:50:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD1CE4017A
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD1CE4017A
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 12:50:14 +0000 (UTC)
Received: from ubuntu-jammy.com (unknown [223.102.84.39])
 by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wDHXHroqoRjRIDfAA--.18116S6;
 Mon, 28 Nov 2022 20:35:04 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 12:34:17 +0000
Message-Id: <20221128123418.2197-5-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128123418.2197-1-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHXHroqoRjRIDfAA--.18116S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrW3Ww15Gr1ktFy7Zw1DZFb_yoW5Cw17pF
 43JF45Gw4xK3Z5GrZrGF17Zw1akr4q9r13Gwn3Jr1Uta48XFWUA34rJay8Ar17Jry7Aa1U
 Zw18Wr4UWry7taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRE1v3UUUUU=
X-Originating-IP: [223.102.84.39]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiGhvHjVaEDkzF6AAAs2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=quc1A
 rvWKkonQMLU4n1VV+/YRkj8Ha+PaTfNL7NgHZ0=; b=SeS3aKGu/1cA4fP0sualh
 srwvvdRiFSvKH0BplFtLj5dqQWvTNe1xR5aL8jDVadFtvqNi/0VHwwuXfO2w2mwi
 3QIp3lAwVK3OM9nEUKVnV5ZFoZ3njy/bS41VeVUrDiocYPvWkF9RyKmUXcVCkqVW
 mT0Wjsfn+caSsLUMhkRCT8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=SeS3aKGu
Subject: [Buildroot] [PATCH/next 5/6] package/reproc: new package
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
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/reproc/Config.in   | 14 ++++++++++++++
 package/reproc/reproc.hash |  3 +++
 package/reproc/reproc.mk   | 17 +++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/reproc/Config.in
 create mode 100644 package/reproc/reproc.hash
 create mode 100644 package/reproc/reproc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 572086d129..462a9511aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2741,6 +2741,7 @@ N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/cli11/
 F:	package/libsolv/
 F:	package/open-isns/
+F:	package/reproc/
 F:	package/termcolor/
 F:	package/tl-expected/
 
diff --git a/package/Config.in b/package/Config.in
index b682fbe0ab..29153048cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2094,6 +2094,7 @@ endif
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
