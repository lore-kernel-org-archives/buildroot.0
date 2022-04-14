Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507CBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 17:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECDE3408E1;
	Thu, 14 Apr 2022 17:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Xsl99FPahtj; Thu, 14 Apr 2022 17:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD27340605;
	Thu, 14 Apr 2022 17:44:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0885B1BF39C
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAB4D60E5A
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iII96t1bMJ85 for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 17:44:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0285C60AB0
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 17:44:20 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 69E35203A056;
 Thu, 14 Apr 2022 10:44:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 69E35203A056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649958260;
 bh=3hvN7+QBEq3Dfl6/PXnkptZ8HKQvPIEHBCnGMUSNf7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MQbpHmGd/y3uvXHhfTwY7bmDZQyTxZ3vev010KWIpNcJgmk6qd8ZI587OHA3CJ3TI
 4MzqGulTuKhDNOeHRVr8/Hs422id4lC8kViCLH/U77EaC/5274pJf/Ml+3A5Rv846V
 blN3GkRRVCEF1hYwawUMCmSsJpurjAwmYJiDBquE=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 18:43:57 +0100
Message-Id: <20220414174358.38059-3-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414174358.38059-1-flaniel@linux.microsoft.com>
References: <20220414174358.38059-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] falcosecurity-libs: add new package
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 ++++++++++
 package/falcosecurity-libs/Config.in          | 38 ++++++++++++
 .../falcosecurity-libs.hash                   |  5 ++
 .../falcosecurity-libs/falcosecurity-libs.mk  | 62 +++++++++++++++++++
 6 files changed, 141 insertions(+)
 create mode 100644 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
 create mode 100644 package/falcosecurity-libs/Config.in
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs.hash
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b997b859ed..8ca9416b7b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -969,6 +969,7 @@ F:	package/ipmitool/
 F:	package/odhcploc/
 
 N:	Francis Laniel <flaniel@linux.microsoft.com>
+F:	package/falcosecurity-libs
 F:	package/nlohmann-json
 F:	package/pahole/
 F:	package/sysdig/
diff --git a/package/Config.in b/package/Config.in
index 46df1b3540..4f2330e4fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1936,6 +1936,7 @@ menu "Other"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
+	source "package/falcosecurity-libs/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
diff --git a/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch b/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
new file mode 100644
index 0000000000..6141d8ef72
--- /dev/null
+++ b/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
@@ -0,0 +1,34 @@
+From 2e8a50cd4975df3ab60ee07c9675831cd5ad397f Mon Sep 17 00:00:00 2001
+From: Francis Laniel <flaniel@linux.microsoft.com>
+Date: Tue, 12 Apr 2022 19:54:11 +0100
+Subject: [PATCH] cmake: Permit setting GRPC_CPP_PLUGIN.
+
+This patch enables users to set GRPC_CPP_PLUGIN while calling cmake with:
+cmake -DGRPC_CPP_PLUGIN=/path
+
+Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
+---
+ cmake/modules/grpc.cmake | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/modules/grpc.cmake b/cmake/modules/grpc.cmake
+index e5fd16b8..9d8f5934 100644
+--- a/cmake/modules/grpc.cmake
++++ b/cmake/modules/grpc.cmake
+@@ -12,9 +12,11 @@ elseif(NOT USE_BUNDLED_GRPC)
+ 		set(GRPCPP_LIB gRPC::grpc++)
+ 
+ 		# gRPC C++ plugin
+-		get_target_property(GRPC_CPP_PLUGIN gRPC::grpc_cpp_plugin LOCATION)
+ 		if(NOT GRPC_CPP_PLUGIN)
+-			message(FATAL_ERROR "System grpc_cpp_plugin not found")
++			get_target_property(GRPC_CPP_PLUGIN gRPC::grpc_cpp_plugin LOCATION)
++			if(NOT GRPC_CPP_PLUGIN)
++				message(FATAL_ERROR "System grpc_cpp_plugin not found")
++			endif()
+ 		endif()
+ 
+ 		# gRPC include dir + properly handle grpc{++,pp}
+-- 
+2.25.1
+
diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
new file mode 100644
index 0000000000..9dd9221caa
--- /dev/null
+++ b/package/falcosecurity-libs/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_FALCOSECURITY_LIBS
+	bool "sysdig"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
+	depends on !BR2_STATIC_LIBS # protobuf, tbb
+	depends on BR2_TOOLCHAIN_USES_GLIBC # tbb
+	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_GRPC
+	select BR2_PACKAGE_GTEST
+	select BR2_PACKAGE_HOST_GRPC
+	select BR2_PACKAGE_HOST_PROTOBUF
+	select BR2_PACKAGE_JQ
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_LIBB64
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_TBB
+	select BR2_PACKAGE_VALIJSON
+	select BR2_PACKAGE_ZLIB
+	help
+	  falcosecurity/libs provides libsinsp, libscap, the kernel module driver
+	  and the eBPF driver sources.
+
+	  https://github.com/falcosecurity/libs
+
+comment "falcosecurity-libs needs a glibc toolchain w/ C++, threads, gcc >= 4.8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_USES_GLIBC \
+	    || !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
diff --git a/package/falcosecurity-libs/falcosecurity-libs.hash b/package/falcosecurity-libs/falcosecurity-libs.hash
new file mode 100644
index 0000000000..7608c67590
--- /dev/null
+++ b/package/falcosecurity-libs/falcosecurity-libs.hash
@@ -0,0 +1,5 @@
+# sha256 locally computed
+sha256  80903bc57b7f9c5f24298ecf1531cf66ef571681b4bd1e05f6e4db704ffb380b  falcosecurity-libs-e5c53d648f3c4694385bbe488e7d47eaa36c229a.tar.gz
+sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  driver/GPL2.txt
+sha256  e3f6a43d097ed68176e9738de925d98b938e1bccf6d6bd1bcd79395eca8f76ed  driver/MIT.txt
diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
new file mode 100644
index 0000000000..5d73770b30
--- /dev/null
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# falcosecurity-libs
+#
+################################################################################
+
+FALCOSECURITY_LIBS_VERSION = e5c53d648f3c4694385bbe488e7d47eaa36c229a
+FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_VERSION))
+FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
+FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
+FALCOSECURITY_LIBS_CPE_ID_VENDOR = falco
+FALCOSECURITY_LIBS_CONF_OPTS = \
+	-DENABLE_DKMS=OFF \
+	-DUSE_BUNDLED_DEPS=OFF \
+	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson
+FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+# falcosecurity-libs needs these two kernel options to be set:
+# CONFIG_TRACEPOINTS
+# CONFIG_HAVE_SYSCALL_TRACEPOINTS
+# https://github.com/draios/sysdig/wiki/How-to-Install-Sysdig-from-the-Source-Code#linux-and-osx
+
+FALCOSECURITY_LIBS_DEPENDENCIES = \
+	c-ares \
+	elfutils \
+	grpc \
+	gtest \
+	host-grpc \
+	host-protobuf \
+	jq \
+	jsoncpp \
+	libb64 \
+	libcurl \
+	luainterpreter \
+	openssl \
+	protobuf \
+	tbb \
+	valijson \
+	zlib
+
+# Don't build the driver as part of the 'standard' procedure, we'll
+# build it on our own with the kernel-module infra.
+# grpc_cpp_plugin is needed to build falcosecurity libs, so we give the host
+# one there.
+FALCOSECURITY_LIBS_CONF_OPTS += -DBUILD_DRIVER=OFF -DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin
+
+FALCOSECURITY_LIBS_MODULE_SUBDIRS = driver
+FALCOSECURITY_LIBS_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
+
+# falcosecurity-libs creates the module Makefile from a template, which contains
+# a single place-holder, KBUILD_FLAGS, wich is only replaced with debug flags,
+# which we don't care about here.
+# So, just replace the place-holder with the only meaningful value: nothing.
+define FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
+       $(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
+       $(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
+       $(SED) 's/@DRIVER_NAME@/falco/;' $(@D)/driver/Makefile
+endef
+FALCOSECURITY_LIBS_POST_PATCH_HOOKS += FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
+
+$(eval $(kernel-module))
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
