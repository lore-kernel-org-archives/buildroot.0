Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09F3C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 17:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31FA5813B5;
	Thu,  5 May 2022 17:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIycv4SN8Nbv; Thu,  5 May 2022 17:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE1D8813A5;
	Thu,  5 May 2022 17:22:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA0EE1BF354
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 17:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7EAE4161B
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 17:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQLihtF85sKi for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 17:22:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE78A405A6
 for <buildroot@buildroot.org>; Thu,  5 May 2022 17:22:23 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id k14so4150695pga.0
 for <buildroot@buildroot.org>; Thu, 05 May 2022 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XdPEn4bQYU/8Yo5D7H28Y9cRrkkMUjUzT8a/LYlCpug=;
 b=Qy/5et+iHjf1JcKHDrvSXVq0dV448mVpPj5bq+U1Z0CwV2cC9o04F19RcV/2PohDQK
 SI8D+SS9YvV50nyKNlQ+0dhjJoyxESh21XJp7dP1m1AGtQ3icvPtHcDcj+ocYmxIT1Tr
 Q1nFtWq6DGAQ2l+YHAgDyeIIUX3/hLli7j0jB0o13aQTZXo5kFy474/OIdp0fYVIhHS1
 lV7hJlykrs2LjP1+lr13tYJdWpAeYaBKX4bDfl81sGkiY4wXpJDlERatxKnvXY4NnWnf
 qRNGm8O9pZZChUMWHmxMWmFj1zcI/7yYrLkEsBm/YnAa7hv5Wi6c/087BDjzkPr79h8r
 zYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XdPEn4bQYU/8Yo5D7H28Y9cRrkkMUjUzT8a/LYlCpug=;
 b=VSipqOS7l5zNeransAAbzTpwUn1GVYjfPlfF79SQjbewkVjrZnH3QEqPg2zzKJFUb+
 bhOtbOPRICzSxu4FKiN8IsMFxHQa7rOMNQGYDcaKO9vWNVQL8gMWFO5DjA6oPvU0DXfO
 Hl4VVKH4jZ4+unqFyFYNyv44x08RkfG0aEBE3xzqDew/Atd+ODM7Fa40L3G+4u1Blu36
 l/ZXD0yO22dNttvgxADGj19hh6TD3XwDNCkFC7ozUFyKcREmsVuyMt0a2UaaSxUFByUk
 meTyUIfmaWpRo0fx+XAfsJziGSxj4Dz1rLGWG77dZ2m4jqrs2e2kWY4QnXzy9wsJjimD
 WidQ==
X-Gm-Message-State: AOAM533QQnJtjOr7xet3zISgMA/BCUNS0QeSj0y9CQgqQyKklLKAsq4c
 ZOUr6oVEvhNRkGgc29Iiv9tnv1ivtCA=
X-Google-Smtp-Source: ABdhPJye6dvh3nNKt0T/vuEIjM42C0NpsTE6LEp5hm/hs69ZjfRsxV8wFWVBy1xhMrKNezwAynJ9Qg==
X-Received: by 2002:a63:d07:0:b0:3c2:7317:24c8 with SMTP id
 c7-20020a630d07000000b003c2731724c8mr12177582pgl.109.1651771342810; 
 Thu, 05 May 2022 10:22:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a63e006000000b003c1ee2c4242sm1578294pgh.33.2022.05.05.10.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 10:22:22 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 10:22:20 -0700
Message-Id: <20220505172220.1865729-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package: Add cpulimit
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cpulimit is a tool which limits the CPU usage of a process (expressed in
percentage, not in CPU time). It is useful to control batch jobs, when
you don't want them to eat too many CPU cycles.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v3:

- dropped CPULIMIT_SOURCE
- dropped 'v' from CPULIMIT_VERSION
- updated hash file with new tarball name

Changes in v2:

- added DEVELOPERS entry
- back ported 2 patches from upstream project pull requests to address
  build warnings
- added _GNU_SOURCE to the CFLAGS
- added hash file
- corrected check-package warnings

 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...0001-Fix-crash-and-compiler-warnings.patch | 56 +++++++++++++++++++
 ...l.h-and-add-missing-libgen.h-include.patch | 41 ++++++++++++++
 package/cpulimit/Config.in                    |  7 +++
 package/cpulimit/cpulimit.hash                |  3 +
 package/cpulimit/cpulimit.mk                  | 23 ++++++++
 7 files changed, 134 insertions(+)
 create mode 100644 package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch
 create mode 100644 package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
 create mode 100644 package/cpulimit/Config.in
 create mode 100644 package/cpulimit/cpulimit.hash
 create mode 100644 package/cpulimit/cpulimit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 292b91913715..c54b6b5c0979 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -965,6 +965,9 @@ N:	Filip Skoneczny <fskoneczny@gmail.com>
 F:	board/sinovoip/m1-plus
 F:	configs/bananapi_m1_plus_defconfig
 
+N:	Florian Fainelli <f.fainelli@gmail.com>
+F:	package/cpulimit/
+
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
 F:	package/odhcploc/
diff --git a/package/Config.in b/package/Config.in
index befeadc27b8b..889213413302 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2522,6 +2522,7 @@ menu "System tools"
 	source "package/circus/Config.in"
 	source "package/containerd/Config.in"
 	source "package/coreutils/Config.in"
+	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch b/package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch
new file mode 100644
index 000000000000..826d83097c11
--- /dev/null
+++ b/package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch
@@ -0,0 +1,56 @@
+From d1f42082590bed42cbf6ef1bf37e936df1afbf6b Mon Sep 17 00:00:00 2001
+From: Tobias Tangemann <tobias@tangemann.org>
+Date: Thu, 9 Jul 2015 23:51:07 +0200
+Subject: [PATCH] Fix crash (and compiler warnings)
+
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+---
+ src/cpulimit.c                | 2 +-
+ src/process_group.c           | 4 ++++
+ tests/process_iterator_test.c | 2 +-
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/cpulimit.c b/src/cpulimit.c
+index 50eabeacf214..42d7ca280738 100644
+--- a/src/cpulimit.c
++++ b/src/cpulimit.c
+@@ -43,7 +43,7 @@
+ #include <sys/types.h>
+ #include <sys/wait.h>
+ 
+-#ifdef __APPLE__ || __FREEBSD__
++#if defined(__APPLE__) || defined(__FREEBSD__)
+ #include <libgen.h>
+ #endif
+ 
+diff --git a/src/process_group.c b/src/process_group.c
+index 06d73a6f3541..c9e148cd1b60 100644
+--- a/src/process_group.c
++++ b/src/process_group.c
+@@ -25,6 +25,10 @@
+ #include <sys/time.h>
+ #include <signal.h>
+ 
++#if defined(__APPLE__) || defined(__FREEBSD__)
++#include <libgen.h>
++#endif
++
+ #include <assert.h>
+ 
+ #include "process_iterator.h"
+diff --git a/tests/process_iterator_test.c b/tests/process_iterator_test.c
+index 16151967eb24..1bfc167ba895 100644
+--- a/tests/process_iterator_test.c
++++ b/tests/process_iterator_test.c
+@@ -28,7 +28,7 @@
+ #include <signal.h>
+ #include <string.h>
+ 
+-#ifdef __APPLE__ || __FREEBSD__
++#if defined(__APPLE__) || defined(__FREEBSD__)
+ #include <libgen.h>
+ #endif
+ 
+-- 
+2.25.1
+
diff --git a/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch b/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
new file mode 100644
index 000000000000..283648ed67f2
--- /dev/null
+++ b/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
@@ -0,0 +1,41 @@
+From 4c1e021037550c437c7da3a276b95b5bf79e967e Mon Sep 17 00:00:00 2001
+From: Portia <stephensportia@gmail.com>
+Date: Sun, 1 May 2022 12:43:35 +1000
+Subject: [PATCH] Remove sys/sysctl.h and add missing libgen.h include
+
+- sys/sysctl.h has been deprecated and should be removed
+- Adds missing libgen.h include when calling basename()
+
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+---
+ src/cpulimit.c      | 1 -
+ src/process_group.c | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cpulimit.c b/src/cpulimit.c
+index 50eabeacf214..5b0ec4978f02 100644
+--- a/src/cpulimit.c
++++ b/src/cpulimit.c
+@@ -38,7 +38,6 @@
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+-#include <sys/sysctl.h>
+ #include <sys/resource.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
+diff --git a/src/process_group.c b/src/process_group.c
+index 06d73a6f3541..d4f6fab3385c 100644
+--- a/src/process_group.c
++++ b/src/process_group.c
+@@ -24,6 +24,7 @@
+ #include <limits.h>
+ #include <sys/time.h>
+ #include <signal.h>
++#include <libgen.h>
+ 
+ #include <assert.h>
+ 
+-- 
+2.25.1
+
diff --git a/package/cpulimit/Config.in b/package/cpulimit/Config.in
new file mode 100644
index 000000000000..f9f39474a2ab
--- /dev/null
+++ b/package/cpulimit/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CPULIMIT
+	bool "cpulimit"
+	help
+	  Cpulimit is a tool which limits the CPU usage of a process
+	  (expressed in percentage, not in CPU time)
+
+	  https://github.com/opsengine/cpulimit
diff --git a/package/cpulimit/cpulimit.hash b/package/cpulimit/cpulimit.hash
new file mode 100644
index 000000000000..c6ef4b2e69d1
--- /dev/null
+++ b/package/cpulimit/cpulimit.hash
@@ -0,0 +1,3 @@
+# sha256sum locally computed:
+sha256  64312f9ac569ddcadb615593cd002c94b76e93a0d4625d3ce1abb49e08e2c2da  cpulimit-0.2.tar.gz
+sha256  920489ca9da706d842870701155e70a101315ba0783cff39765d7e15e0916a4a  LICENSE
diff --git a/package/cpulimit/cpulimit.mk b/package/cpulimit/cpulimit.mk
new file mode 100644
index 000000000000..a864685a846f
--- /dev/null
+++ b/package/cpulimit/cpulimit.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cpulimit
+#
+################################################################################
+
+CPULIMIT_VERSION = 0.2
+CPULIMIT_SITE = $(call github,opsengine,cpulimit,v$(CPULIMIT_VERSION))
+CPULIMIT_LICENSE = GPL-2.0+
+CPULIMIT_LICENSE_FILES = LICENSE
+
+define CPULIMIT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+		LDLIBS="$(TARGET_LDFLAGS)"
+endef
+
+define CPULIMIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/cpulimit \
+		$(TARGET_DIR)/usr/bin/cpulimit
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
