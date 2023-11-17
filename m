Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13823C072A2
	for <buildroot@archiver.kernel.org>; Fri, 17 Nov 2023 09:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B69456FB09;
	Fri, 17 Nov 2023 09:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B69456FB09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVlvQxbE6tjX; Fri, 17 Nov 2023 09:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3C4661203;
	Fri, 17 Nov 2023 09:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3C4661203
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5451BF995
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 09:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA66A61147
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 09:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA66A61147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6PCOa93oNyp for <buildroot@lists.busybox.net>;
 Fri, 17 Nov 2023 09:44:41 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92E5260F1E
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 09:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E5260F1E
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 83624120098;
 Fri, 17 Nov 2023 12:44:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 83624120098
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Fri, 17 Nov 2023 12:44:38 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 17 Nov 2023 12:44:37 +0300
To: <buildroot@buildroot.org>
Date: Fri, 17 Nov 2023 12:44:29 +0300
Message-ID: <20231117094429.30820-3-svromanov@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117094429.30820-1-svromanov@salutedevices.com>
References: <20230825233328.35c4a920@windsurf>
 <20231117094429.30820-1-svromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181430 [Nov 17 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: svromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 salutedevices.com:7.1.1; p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; github.com:7.1.1;
 100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/11/17 09:22:00
X-KSMG-LinksScanning: Clean, bases: 2023/11/17 09:21:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/17 08:13:00 #22469735
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1700214278;
 bh=9B44P3qmPEwKlDmrUU5hqqsFf3ttmxSGKxMEcs/eT3Y=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=GPS+MdLc+9F3Ju5W7uXJaBCSGR/MoKLPw/2zYc2h6sfv3e6xhmTJqsbiq3eRxhxpl
 KUvWmtvzYJXyfUl1ja0/hxNMTIuCUuz9xMqfVW3Iqsrnd/1zbrnNn+deStWvh+VwOf
 /2DSzRC731BIJTCAok4ZOmXMIxViV2hVg/rDl03u8yBU9rE+fr73qdm8XY2nrXHWTx
 ACKpd6+D1XrKDJlj8wrhplxpwRHT1/5JhhlJDwS72J8Yk2w47M5laq/sN/1UDYOxQz
 CeP5rSNZgXFqkUDI6cHBR3SeZT2S6AxSscAxPxKucNpXSdnQGvJQTr3f92ZX7zTYrK
 2Xz4OjSe1cxnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=GPS+MdLc
Subject: [Buildroot] [RFC PATCH v2 2/2] package/sysbench: new package
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
From: Sergey Romanov via buildroot <buildroot@buildroot.org>
Reply-To: Sergey Romanov <svromanov@salutedevices.com>
Cc: Sergey Romanov <svromanov@sberdevices.ru>, chip-club@ya.ru,
 akopytov@gmail.com, kernel@salutedevices.com, svromanov@salutedevices.com,
 sbahra@repnop.org, sdfw_system_team@salutedevices.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sergey Romanov <svromanov@sberdevices.ru>

This benchmark was designed for identifying basic
system parameters, as they are important for system
using MySQL (w Innodb) under intensive load.
Handling of IO in case of many parallel requests,
checked as well as memory allocation/transfer
speed and scheduler performance.
CPU is benchmarked by using 64bit integer manipulation
using Euklid algorithms for prime number computation.
Benchmarks are designed to show benefit of multiple
CPUs as well as of multiple hard drives,
battery backed up write cache.

https://github.com/akopytov/sysbench.git

Signed-off-by: Sergey Romanov <svromanov@salutedevices.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sysbench/Config.in     | 29 +++++++++++++++++++++++++++++
 package/sysbench/sysbench.hash |  3 +++
 package/sysbench/sysbench.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 65 insertions(+)
 create mode 100644 package/sysbench/Config.in
 create mode 100644 package/sysbench/sysbench.hash
 create mode 100644 package/sysbench/sysbench.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f967b46842..73d4dfe094 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2719,6 +2719,7 @@ F:	configs/snps_arc700_nsim_defconfig
 
 N:	Sergey Romanov <svromanov@salutedevices.com>
 F:	package/ck/
+F:	package/sysbench/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	board/toradex/apalis-imx6/
diff --git a/package/Config.in b/package/Config.in
index ed08cb69c6..281544900b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -152,6 +152,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/strace/Config.in"
 	source "package/stress/Config.in"
 	source "package/stress-ng/Config.in"
+	source "package/sysbench/Config.in"
 	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
 	source "package/tcf-agent/Config.in"
diff --git a/package/sysbench/Config.in b/package/sysbench/Config.in
new file mode 100644
index 0000000000..7e4987497e
--- /dev/null
+++ b/package/sysbench/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_SYSBENCH_ARCH_SUPPORTS
+	bool
+	default y if !BR2_powerpc
+
+config BR2_PACKAGE_SYSBENCH
+	bool "sysbench"
+	depends on BR2_PACKAGE_SYSBENCH_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_CK_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # luajit
+	depends on !BR2_PACKAGE_LUA # luajit
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_CK
+	select BR2_PACKAGE_PKGCONF
+	select BR2_PACKAGE_LIBTOOL
+	help
+	  This benchmark was designed for identifying basic system
+	  parameters, as they are important for system using MySQL (w
+	  Innodb) under intensive load. Handling of IO in case of many
+	  parallel requests, checked as well as memory allocation
+	  /transfer speed and scheduler performance. CPU is benchmarked
+	  by using 64bit integer manipulation using Euklid algorithms
+	  for prime number computation. Benchmarks are designed to show
+	  benefit of multiple CPUs as well as of multiple hard drives,
+	  battery backed up write cache.
+
+	  https://github.com/akopytov/sysbench.git
diff --git a/package/sysbench/sysbench.hash b/package/sysbench/sysbench.hash
new file mode 100644
index 0000000000..a31fdb1178
--- /dev/null
+++ b/package/sysbench/sysbench.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e8ee79b1f399b2d167e6a90de52ccc90e52408f7ade1b9b7135727efe181347f  sysbench-1.0.20.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sysbench/sysbench.mk b/package/sysbench/sysbench.mk
new file mode 100644
index 0000000000..33e19706e8
--- /dev/null
+++ b/package/sysbench/sysbench.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# SYSBENCH
+#
+################################################################################
+
+SYSBENCH_VERSION = 1.0.20
+SYSBENCH_SITE = $(call github,akopytov,sysbench,$(SYSBENCH_VERSION))
+SYSBENCH_LICENSE = GPL-2.0+
+SYSBENCH_LICENSE_FILES = COPYING
+
+SYSBENCH_AUTORECONF = YES
+
+SYSBENCH_DEPENDENCIES += host-pkgconf ck luajit
+
+SYSBENCH_CONF_OPTS += \
+	--without-lib-prefix \
+	--with-system-luajit \
+	--with-system-ck
+
+ifeq ($(BR2_PACKAGE_MYSQL), y)
+SYSBENCH_DEPENDENCIES += mysql
+SYSBENCH_CONF_OPTS += \
+	--with-mysql \
+	--with-mysql-includes=$(STAGING_DIR)/usr/include/mysql \
+	--with-mysql-libs=$(STAGING_DIR)/usr/lib
+else
+SYSBENCH_CONF_OPTS += --without-mysql
+endif
+
+$(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
