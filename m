Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E511C77B7E
	for <buildroot@archiver.kernel.org>; Thu, 25 May 2023 13:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B7BF616A2;
	Thu, 25 May 2023 13:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B7BF616A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRSSIXJwrfuL; Thu, 25 May 2023 13:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6996F61695;
	Thu, 25 May 2023 13:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6996F61695
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2C41BF277
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 13:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54FD48200A
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 13:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54FD48200A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbQfpHmS55oK for <buildroot@lists.busybox.net>;
 Thu, 25 May 2023 13:24:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09F4881E11
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09F4881E11
 for <buildroot@buildroot.org>; Thu, 25 May 2023 13:24:07 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 167765FD49;
 Thu, 25 May 2023 16:24:06 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Thu, 25 May 2023 16:24:06 +0300 (MSK)
From: Sergey Romanov <svromanov@sberdevices.ru>
To: <buildroot@buildroot.org>
Date: Thu, 25 May 2023 16:23:53 +0300
Message-ID: <20230525132353.89399-3-svromanov@sberdevices.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525132353.89399-1-svromanov@sberdevices.ru>
References: <20230525132353.89399-1-svromanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/05/25 04:52:00 #21357441
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1685021046;
 bh=Qe9q/qUXTImNB2pi2Is/MqdasauNif9W92JnXHjZ4eo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=GNm1xxNi+tUzE6HnXEA5pDvELiKUhKa1VVeucfOCx4MhV5VWn17ZcZUVt+lHO4Gr9
 kY6mJqRLP96+1DFBfehGbyKOuXeAPUHUnCZut7UslMG8v7Fn0mhuILWQdAIn5H410q
 SLB9n2LTmgyI+WReNTPvSi26q7Tu0oL1YHDJKVu8Xj9pHQc7I69vlj6Ab5/lCRFsXs
 hoomP6VevOeo43nw4X6kdxS4/tuEyFM1hiZc4tF0sGEaQyidPq1/WbbRQlrX+5glHZ
 or7gnVBMm8WZ+EYnwxuNsM5dpLgRi3JlgJNXS2yahRKTRedz718ggUCVUkZIfNDgbl
 bn9/vT0o/bU3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=GNm1xxNi
Subject: [Buildroot] [RFC PATCH v1 2/2] package/sysbench: new package
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
Cc: svromanov@sberdevices.ru, chip-club@ya.ru, akopytov@gmail.com,
 sbahra@repnop.org, sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

Signed-off-by: Sergey Romanov <svromanov@sberdevices.ru>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sysbench/Config.in     | 28 ++++++++++++++++++++++++++++
 package/sysbench/sysbench.hash |  3 +++
 package/sysbench/sysbench.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 package/sysbench/Config.in
 create mode 100644 package/sysbench/sysbench.hash
 create mode 100644 package/sysbench/sysbench.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4accefb251..d48cbbd145 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2628,6 +2628,7 @@ F:	package/xr819-xradio/
 
 N:	Sergey Romanov <svromanov@sberdevices.ru>
 F:	package/ck/
+F:	package/sysbench/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	board/toradex/apalis-imx6/
diff --git a/package/Config.in b/package/Config.in
index c81ddc81f6..0004f71846 100644
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
index 0000000000..a8377b5bfd
--- /dev/null
+++ b/package/sysbench/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_SYSBENCH
+	bool "sysbench"
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_CK
+	help
+	  This benchmark was designed for identifying basic
+	  system parameters, as they are important for system
+	  using MySQL (w Innodb) under intensive load.
+	  Handling of IO in case of many parallel requests,
+	  checked as well as memory allocation/transfer
+	  speed and scheduler performance.
+	  CPU is benchmarked by using 64bit integer manipulation
+	  using Euklid algorithms for prime number computation.
+	  Benchmarks are designed to show benefit of multiple
+	  CPUs as well as of multiple hard drives,
+	  battery backed up write cache.
+
+	  https://github.com/akopytov/sysbench.git
+
+if BR2_PACKAGE_SYSBENCH
+
+config BR2_PACKAGE_SYSBENCH_WITH_MYSQL
+	bool "configure with mysql"
+	select BR2_PACKAGE_MYSQL
+	help
+	  Configure with mysql
+
+endif
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
index 0000000000..748014f564
--- /dev/null
+++ b/package/sysbench/sysbench.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# SYSBENCH
+#
+################################################################################
+
+SYSBENCH_VERSION = 1.0.20
+SYSBENCH_SITE = $(call github,akopytov,sysbench,$(SYSBENCH_VERSION))
+SYSBENCH_LICENSE = GPLv2
+SYSBENCH_LICENSE_FILES = COPYING
+
+SYSBENCH_AUTORECONF = YES
+
+SYSBENCH_DEPENDENCIES = host-pkgconf
+SYSBENCH_DEPENDENCIES += ck
+SYSBENCH_DEPENDENCIES += luajit
+
+SYSBENCH_CONF_OPTS += --without-lib-prefix
+SYSBENCH_CONF_OPTS += --with-system-luajit
+SYSBENCH_CONF_OPTS += --with-system-ck
+
+ifneq ($(BR2_PACKAGE_SYSBENCH_WITH_MYSQL), y)
+SYSBENCH_CONF_OPTS += --without-mysql
+else
+SYSBENCH_DEPENDENCIES += mysql
+SYSBENCH_CONF_OPTS += --with-mysql-includes=$(STAGING_DIR)/usr/include/mysql
+SYSBENCH_CONF_OPTS += --with-mysql-libs=$(STAGING_DIR)/usr/lib
+endif
+
+$(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
