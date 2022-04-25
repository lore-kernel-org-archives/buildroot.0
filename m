Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E5CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 16:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE43D4017A;
	Mon, 25 Apr 2022 16:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LcQeK3eYrUjG; Mon, 25 Apr 2022 16:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E0414022C;
	Mon, 25 Apr 2022 16:44:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6E511BF31C
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 16:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B4BA41504
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 16:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KX5Q_VDg4EDK for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 16:44:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16FE9415A0
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 16:44:09 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4AAEF20E8C98;
 Mon, 25 Apr 2022 09:44:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4AAEF20E8C98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650905048;
 bh=c2xn0zVIwM0HGyieLMQQZxZXE3wN0/pQcN4NtyMKKTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LzXqIbbWk1uFWxhtwRv/bEQjcopXyyPu7XJNnC/dMC8c6KLD9wFPZfQFgV2nfO3bl
 Eg542U3KDymLpKBWYamcKnEMAB+v1DsY1YgJa2Zk2wYzpBoHxHdwGqDSgC2w1mjH+n
 rZL9nKzihJcolx6RtKpPGJCaLhMAgTsSf4m6Ncuc=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 17:43:18 +0100
Message-Id: <20220425164319.24788-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425164319.24788-1-flaniel@linux.microsoft.com>
References: <20220425164319.24788-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v4 1/2] falcosecurity-libs: add new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 ++++++++
 package/falcosecurity-libs/Config.in          | 30 +++++++
 .../falcosecurity-libs.hash                   |  5 ++
 .../falcosecurity-libs/falcosecurity-libs.mk  | 80 +++++++++++++++++++
 6 files changed, 151 insertions(+)
 create mode 100644 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
 create mode 100644 package/falcosecurity-libs/Config.in
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs.hash
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ca9decb58f..d45d3d2a7b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -969,6 +969,7 @@ F:	package/ipmitool/
 F:	package/odhcploc/
 
 N:	Francis Laniel <flaniel@linux.microsoft.com>
+F:	package/falcosecurity-libs
 F:	package/pahole/
 F:	package/sysdig/
 F:	package/tbb/
diff --git a/package/Config.in b/package/Config.in
index 24f7af5ea8..3070094cc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1935,6 +1935,7 @@ menu "Other"
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
index 0000000000..e0b5a3d134
--- /dev/null
+++ b/package/falcosecurity-libs/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_FALCOSECURITY_LIBS
+	bool
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
+	  falcosecurity/libs provides libsinsp, libscap, the kernel
+	  module driver and the eBPF driver sources.
+
+	  https://github.com/falcosecurity/libs
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
index 0000000000..96c762f336
--- /dev/null
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -0,0 +1,80 @@
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
+FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD = NO
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
+FALCOSECURITY_LIBS_DRIVER_NAME = scap
+FALCOSECURITY_LIBS_MODULE_SUBDIRS = driver
+FALCOSECURITY_LIBS_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
+
+# falcosecurity-libs module needs these two kernel options to be set:
+# CONFIG_TRACEPOINTS
+# CONFIG_HAVE_SYSCALL_TRACEPOINTS
+# https://github.com/draios/sysdig/wiki/How-to-Install-Sysdig-from-the-Source-Code#linux-and-osx
+# CONFIG_FTRACE and CONFIG_SCHED_TRACER selects CONFIG_GENERIC_TRACER which in
+# turns select CONFIG_TRACING which in turns select CONFIG_TRACEPOINTS
+define FALCOSECURITY_LIBS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SCHED_TRACER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_SYSCALL_TRACEPOINTS)
+endef
+
+# falcosecurity-libs creates the module Makefile from a template, which contains
+# a single place-holder, KBUILD_FLAGS, wich is only replaced with debug flags,
+# which we don't care about here.
+# So, just replace the place-holder with the only meaningful value: nothing.
+# For the DRIVER_NAME, we set it to FALCOSECURITY_LIBS_DRIVER_NAME.
+# So, when sysdig will be run, it will automatically load
+# FALCOSECURITY_LIBS_DRIVER_NAME.ko.
+# We also need to do the same process for driver_config.h.in.
+# PPM_API_CURRENT_VERSION_* were take from driver/API_VERSION and
+# PPM_SCHEMA_CURRENT_VERSION_* from driver/SCHEMA_VERSION.
+# For the others, it was taken by inspecting
+# falcosecurity-libs/*/CMakeLists.txt.
+define FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
+	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
+	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
+	$(SED) 's/@DRIVER_NAME@/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/Makefile
+
+	$(INSTALL) -m 0644 $(@D)/driver/driver_config.h.in $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MAJOR}/1/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MINOR}/0/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_API_CURRENT_VERSION_PATCH}/0/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MAJOR}/1/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MINOR}/0/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_PATCH}/0/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${DRIVER_VERSION}//;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${DRIVER_NAME}/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${DRIVER_DEVICE_NAME}/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${GIT_COMMIT}/0.1.1dev/;' $(@D)/driver/driver_config.h
+endef
+FALCOSECURITY_LIBS_POST_PATCH_HOOKS += FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
