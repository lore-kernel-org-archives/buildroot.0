Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29573C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 18:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D081E82909;
	Wed,  4 May 2022 18:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s59HPvdgPvFw; Wed,  4 May 2022 18:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9429827A9;
	Wed,  4 May 2022 18:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85F5A1BF3C2
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 18:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FA41827A9
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 18:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M1auBSlo_7g2 for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 18:20:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9662381B70
 for <buildroot@buildroot.org>; Wed,  4 May 2022 18:20:42 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d17so2185945plg.0
 for <buildroot@buildroot.org>; Wed, 04 May 2022 11:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4d9gCtpZlA8wq6GxhgQ5FpxB0vsHNB97sOtAIXJNTds=;
 b=JiKxFdkx3nUrp+jpsPgXlagy1pA3z2PfsRVlJYi6CkDpv0dbdMQIeY8RhFQrCZemZ+
 Ch+Qc1hNoq3aJNx2nAu35+8lin7GhpB6qeH1m3U5KKhrTPMLLxBVeq04h45bwTqXgVXT
 /SKtDv01MIre7btFmmOdjpckAjHr+R0YDdtA1PveHFWXU+61aw0xane6Hok/unG7kpZ5
 fa/lPTLXq48JQ6Klqy74plAbADGg4OV5N73pesIZatPegLG/jcD4Pc801yQ280ZpurqS
 fH0GmHy9k8EjlL/9GPx2fYHGOMBBegIYddFzdIEOic5Hmy1s62ih5c0j4arMi2JMrZLK
 hzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4d9gCtpZlA8wq6GxhgQ5FpxB0vsHNB97sOtAIXJNTds=;
 b=W/KDDD8OujCohgT3mpeXz/ufJcY3tsXDmk3639NVU7JEMYXcp/bZZ6g9zEqknCG1rv
 1KhXmMKaEkTawlMgXJqfW0ZIWBE3LyQTLsfIxoVBAWRxQC/onQfHJ0Wn1VrARiL5x34D
 KosrI/axCDwnt2QOlp/o8cp++jPFYl7sNPCxjFikb4HzJGaqqoXyrJakfuXujRQdPzVa
 m3ceLQjhzvjCLO+sP8Uw/DKFGq0TzsJsftw++z9nW5xC9G0xk7o3klIKN4kRf84LtA82
 yIoCUxEIvSP+P4u1u+rKmViRc/k/kClJ4OVmrxAR0i415HYFPAeQVR22n4QSAJBmCQkZ
 yrqQ==
X-Gm-Message-State: AOAM530E1BylgjFDPNWNKtqCDA6ZFAmYMI/XSeRbaoxUYQS5a7Soeeyp
 WHKv+lC3CxUKQ8zlNhbtL6V+aXwLMuc=
X-Google-Smtp-Source: ABdhPJzgweg6jICHbDTDJrBYPhTvpuQ6NXz1tDzkk/U6LnGwNRkmN7WhUiewqPUNeND3gVZGuwBwFA==
X-Received: by 2002:a17:902:c952:b0:15e:89be:49ea with SMTP id
 i18-20020a170902c95200b0015e89be49eamr22721485pla.32.1651688441741; 
 Wed, 04 May 2022 11:20:41 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a17090ab39700b001d77f392280sm3556835pjr.30.2022.05.04.11.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 11:20:41 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 May 2022 11:20:38 -0700
Message-Id: <20220504182038.1828037-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package: Add cpulimit
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
 package/cpulimit/cpulimit.mk                  | 24 ++++++++
 7 files changed, 135 insertions(+)
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
index 000000000000..5ac8d38e380c
--- /dev/null
+++ b/package/cpulimit/cpulimit.hash
@@ -0,0 +1,3 @@
+# sha256sum locally computed:
+sha256  64312f9ac569ddcadb615593cd002c94b76e93a0d4625d3ce1abb49e08e2c2da  v0.2.tar.gz
+sha256  920489ca9da706d842870701155e70a101315ba0783cff39765d7e15e0916a4a  LICENSE
diff --git a/package/cpulimit/cpulimit.mk b/package/cpulimit/cpulimit.mk
new file mode 100644
index 000000000000..b45e4d602245
--- /dev/null
+++ b/package/cpulimit/cpulimit.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# cpulimit
+#
+################################################################################
+
+CPULIMIT_VERSION = v0.2
+CPULIMIT_SOURCE = $(CPULIMIT_VERSION).tar.gz
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
