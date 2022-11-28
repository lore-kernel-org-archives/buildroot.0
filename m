Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19A3C433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 12:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07B9E4094D;
	Mon, 28 Nov 2022 12:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07B9E4094D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqd-kyZ8UlxU; Mon, 28 Nov 2022 12:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D632140866;
	Mon, 28 Nov 2022 12:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D632140866
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 053461BF39C
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D549660A92
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 12:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D549660A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHcetx7kofKO for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 12:50:06 +0000 (UTC)
X-Greylist: delayed 00:15:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2F160A98
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE2F160A98
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 12:50:04 +0000 (UTC)
Received: from ubuntu-jammy.com (unknown [223.102.84.39])
 by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wDHXHroqoRjRIDfAA--.18116S3;
 Mon, 28 Nov 2022 20:34:56 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 12:34:14 +0000
Message-Id: <20221128123418.2197-2-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128123418.2197-1-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHXHroqoRjRIDfAA--.18116S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFy5WryUtw4rtw1DtF17trb_yoW5Cr4kpr
 4xJw15Gr4vgF1ftrW3Gry7ZF13CwsFkF1UWwnxJF1jyF15GF1UZ34Uta1rCry3J347A347
 Xw15Xw4j9r90kaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRsSdQUUUUU=
X-Originating-IP: [223.102.84.39]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBzgrHjWI0WpO6qgABsA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gLB57
 q/tVvNagPVDUbES1AlJYBFfUVjPooYIG/6hajo=; b=ThnIpG7ELJswc7zJ/M+B7
 UoNGjJHdP1C1fzjvaLDUhZwOd0XtnAGU8s9biJ+pOmd3XS8nLJjWwKS3tzWBGY01
 uodBVg0qbGeoel6gnMQh1CkVkc84ZUsn7cef27rUeWaSuoA9lWXJTEI7DXxDEjy5
 jRKjWfzgW4DWlMGgfQVI/Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=ThnIpG7E
Subject: [Buildroot] [PATCH/next 2/6] package/termcolor: new package
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
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/termcolor/Config.in      | 12 ++++++++++++
 package/termcolor/termcolor.hash |  3 +++
 package/termcolor/termcolor.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/termcolor/Config.in
 create mode 100644 package/termcolor/termcolor.hash
 create mode 100644 package/termcolor/termcolor.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 180793a91b..afab61d97e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2740,6 +2740,7 @@ F:	package/most/
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/cli11/
 F:	package/open-isns/
+F:	package/termcolor/
 
 N:	Tan En De <ende.tan@starfivetech.com>
 F:	package/libkcapi/
diff --git a/package/Config.in b/package/Config.in
index a378146ac7..535efd09ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2143,6 +2143,7 @@ menu "Text and terminal handling"
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
