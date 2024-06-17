Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D00FC27C79
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 15:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24FE94094B;
	Mon, 17 Jun 2024 15:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srm9TLlujsy3; Mon, 17 Jun 2024 15:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0245409A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0245409A7;
	Mon, 17 Jun 2024 15:11:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0431BF296
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 15:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C78B81C44
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 15:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxRIZJg5WUbR for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 15:11:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=flaniel@linux.microsoft.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E081A81C67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E081A81C67
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id E081A81C67
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 15:11:23 +0000 (UTC)
Received: from pwmachine.numericable.fr
 (75.red-83-59-17.dynamicip.rima-tde.net [83.59.17.75])
 by linux.microsoft.com (Postfix) with ESMTPSA id D4D2A20B7007;
 Mon, 17 Jun 2024 08:11:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D4D2A20B7007
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 16:10:19 +0100
Message-Id: <20240617151020.31120-4-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617151020.31120-1-flaniel@linux.microsoft.com>
References: <20240617151020.31120-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1718637083;
 bh=DQzxenU0O/X6VEUYRm952DgRv3r4qfYDwj2Nr78dgBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nPxwK+h0bCw1a4fSzY2n4mQCClznMmsrKBIV+YU5MkSj/5mUgrHeqTi/uJ5IavEog
 Ox1jJT447JQXZfxVsiJUe/Idfur3wMFdSD12eO5KxkKK4Av0olOKEuxqq+QqTcfQzm
 FVVKb+iu2lavvD6oiNvHmsTmozz/kH4eO60g9TDc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=nPxwK+h0
Subject: [Buildroot] [RFC PATCH v1 3/4] package/sysdig: remove package.
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building sysdig within buildroot is a complicated task which
has changed at each of their release.
As the package seems to not be really used in buildroot, it
seems wise to remove it.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 DEVELOPERS                 |  2 --
 package/Config.in          |  1 -
 package/sysdig/Config.in   | 34 ----------------------------------
 package/sysdig/sysdig.hash |  3 ---
 package/sysdig/sysdig.mk   | 38 --------------------------------------
 5 files changed, 78 deletions(-)
 delete mode 100644 package/sysdig/Config.in
 delete mode 100644 package/sysdig/sysdig.hash
 delete mode 100644 package/sysdig/sysdig.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8bfd36f1d8..5bddb0303b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -225,7 +225,6 @@ F:	package/rtl8723ds-bt/
 F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
-F:	package/sysdig/
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
@@ -1105,7 +1104,6 @@ F:	package/odhcploc/
 N:	Francis Laniel <flaniel@linux.microsoft.com>
 F:	package/falcosecurity-libs
 F:	package/pahole/
-F:	package/sysdig/
 F:	package/tbb/
 
 N:	Francisco Gonzalez <gzmorell@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 550fdc1f41..1d0fab2695 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -153,7 +153,6 @@ menu "Debugging, profiling and benchmark"
 	source "package/strace/Config.in"
 	source "package/stress/Config.in"
 	source "package/stress-ng/Config.in"
-	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
 	source "package/tbtools/Config.in"
 	source "package/tcf-agent/Config.in"
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
deleted file mode 100644
index 3a3670f5cb..0000000000
--- a/package/sysdig/Config.in
+++ /dev/null
@@ -1,34 +0,0 @@
-config BR2_PACKAGE_SYSDIG
-	bool "sysdig"
-	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # falcosecurity-libs
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
-	depends on BR2_LINUX_KERNEL # falcosecurity-libs
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # falcosecurity-libs -> grpc -> libabseil-cpp
-	depends on BR2_TOOLCHAIN_HAS_THREADS # falcosecurity-libs
-	depends on !BR2_STATIC_LIBS # falcosecurity-libs
-	depends on BR2_TOOLCHAIN_USES_GLIBC # falcosecurity-libs
-	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # falcosecurity-libs
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # falcosecurity-libs
-	select BR2_PACKAGE_FALCOSECURITY_LIBS
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
-	select BR2_PACKAGE_YAML_CPP
-	help
-	  Sysdig is open source, system-level exploration:
-	  capture system state and activity from a running Linux
-	  instance, then save, filter and analyze.
-	  Think of it as strace + tcpdump + lsof + awesome sauce.
-	  With a little Lua cherry on top.
-
-	  https://github.com/draios/sysdig/wiki
-
-comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
-	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_USES_GLIBC \
-		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
deleted file mode 100644
index cda3de5e7c..0000000000
--- a/package/sysdig/sysdig.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# sha256 locally computed
-sha256  6b96797859002ab69a2bed4fdba1c7fe8064ecf8661621ae7d8fbf8599ffa636  sysdig-0.29.3.tar.gz
-sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
deleted file mode 100644
index bafe534a16..0000000000
--- a/package/sysdig/sysdig.mk
+++ /dev/null
@@ -1,38 +0,0 @@
-################################################################################
-#
-# sysdig
-#
-################################################################################
-
-SYSDIG_VERSION = 0.29.3
-SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
-SYSDIG_LICENSE = Apache-2.0
-SYSDIG_LICENSE_FILES = COPYING
-SYSDIG_CPE_ID_VENDOR = sysdig
-SYSDIG_CONF_OPTS = \
-	-DENABLE_DKMS=OFF \
-	-DUSE_BUNDLED_DEPS=OFF \
-	-DCREATE_TEST_TARGETS=OFF
-SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
-
-SYSDIG_DEPENDENCIES = \
-	falcosecurity-libs \
-	ncurses \
-	json-for-modern-cpp \
-	yaml-cpp
-
-# Don't build the driver as part of the 'standard' procedure, it has been built
-# by falcosecurity-libs.mk.
-# grpc_cpp_plugin is needed to build falcosecurity libs, so we give the host
-# one there.
-SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR) \
-	-DBUILD_DRIVER=OFF \
-	-DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin \
-	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME) \
-	-DENABLE_DKMS=OFF \
-	-DUSE_BUNDLED_DEPS=OFF \
-	-DWITH_CHISEL=ON \
-	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson \
-	-DSYSDIG_VERSION=$(SYSDIG_VERSION)
-
-$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
