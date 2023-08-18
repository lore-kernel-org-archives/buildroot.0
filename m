Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0590DC77B7C
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 15:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 636994204F;
	Fri, 18 Aug 2023 15:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 636994204F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jr-nRlBhuq9s; Fri, 18 Aug 2023 15:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2718D41D9F;
	Fri, 18 Aug 2023 15:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2718D41D9F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D39C1BF2EC
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC2CD83C4E
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC2CD83C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofeDOm5OfrhL for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 15:52:45 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4C8D82335
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 15:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C8D82335
Received: from pwmachine.numericable.fr (85-170-34-233.rev.numericable.fr
 [85.170.34.233])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5C1FB211F7D8;
 Fri, 18 Aug 2023 08:52:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5C1FB211F7D8
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 17:52:16 +0200
Message-Id: <20230818155219.71054-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818155219.71054-1-flaniel@linux.microsoft.com>
References: <20230818155219.71054-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1692373964;
 bh=FEnm+Xs93y48C/xfOs350ENILZ5UoeGThamvYLmvbi0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jNXmwrVnp7tFHsG93Nz6/F9qGGgEjMqEKASgHUUSSOFf0Nx/csFTG7RrGu3IxPYUQ
 OzDI5L66JUUhd3H9WQA8FbECKvvzbg93CVSBBaU5lstMpbD4SW76rnOXwiiJJgnoS/
 aciYlWcpFhjKN/tboZvn91d/lQzY2Sa4eSxYQhng=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=jNXmwrVn
Subject: [Buildroot] [RFC PATCH v3 1/3] package/falcosecurity-libs: bump to
 version 0.10.5
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

This commit adds a new patch to ensure the libscap*.so are installed to the
target as sysdig is dynamically linked.
It also modified the recipe to automatically get API_VERSION and SCHEMA_VERSION
from respecting files.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 .../0002-cmake-Install-shared-libraries.patch | 61 +++++++++++++++++++
 .../falcosecurity-libs.hash                   |  2 +-
 .../falcosecurity-libs/falcosecurity-libs.mk  | 29 +++++----
 3 files changed, 80 insertions(+), 12 deletions(-)
 create mode 100644 package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch

diff --git a/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch b/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
new file mode 100644
index 0000000000..38aaaf599b
--- /dev/null
+++ b/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
@@ -0,0 +1,61 @@
+From e730f130b5cb2c3cdef795f3be47d8139f1982cf Mon Sep 17 00:00:00 2001
+From: Francis Laniel <flaniel@linux.microsoft.com>
+Date: Fri, 28 Apr 2023 15:14:27 +0100
+Subject: [PATCH] cmake: Install shared libraries.
+
+This is needed as sysdig is compiled as a non static binary which relies on
+these libraries.
+
+Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
+---
+ cmake/modules/libelf.cmake       |  2 +-
+ userspace/libscap/CMakeLists.txt | 16 +++++++++++++++-
+ 2 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/modules/libelf.cmake b/cmake/modules/libelf.cmake
+index 8ca2f4f7..73d13d26 100644
+--- a/cmake/modules/libelf.cmake
++++ b/cmake/modules/libelf.cmake
+@@ -10,7 +10,7 @@ if(LIBELF_INCLUDE)
+     add_custom_target(libelf)
+ elseif(NOT USE_BUNDLED_LIBELF)
+     find_path(LIBELF_INCLUDE elf.h PATH_SUFFIXES elf)
+-    find_library(LIBELF_LIB NAMES libelf.a libelf.so)
++    find_library(LIBELF_LIB NAMES libelf.so)
+     if(LIBELF_LIB)
+         message(STATUS "Found LIBELF: include: ${LIBELF_INCLUDE}, lib: ${LIBELF_LIB}")
+     else()
+diff --git a/userspace/libscap/CMakeLists.txt b/userspace/libscap/CMakeLists.txt
+index ae4760df..08c401b2 100644
+--- a/userspace/libscap/CMakeLists.txt
++++ b/userspace/libscap/CMakeLists.txt
+@@ -70,7 +70,7 @@ endif()
+ 
+ include_directories(${CMAKE_CURRENT_SOURCE_DIR})
+ 
+-add_library(scap STATIC
++add_library(scap SHARED
+ 	${targetfiles})
+ 
+ if (CMAKE_SYSTEM_NAME MATCHES "SunOS")
+@@ -212,3 +212,17 @@ if(CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" AND CMAKE_SYSTEM_NAME MATCHES "Linux
+ 		target_link_libraries(scap scap_engine_gvisor)
+ 	endif()
+ endif()
++
++install(TARGETS scap COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_engine_udig COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_engine_savefile COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_engine_bpf COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_engine_noop COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_engine_source_plugin COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_engine_kmod COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_engine_nodriver COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_event_schema COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_platform COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_engine_util COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS scap_error COMPONENT ${CMAKE_PROJECT_NAME})
++install(TARGETS driver_event_schema COMPONENT ${CMAKE_PROJECT_NAME})
+-- 
+2.34.1
+
diff --git a/package/falcosecurity-libs/falcosecurity-libs.hash b/package/falcosecurity-libs/falcosecurity-libs.hash
index 2e239ca2fe..ef805cbcf6 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.hash
+++ b/package/falcosecurity-libs/falcosecurity-libs.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  80903bc57b7f9c5f24298ecf1531cf66ef571681b4bd1e05f6e4db704ffb380b  falcosecurity-libs-e5c53d648f3c4694385bbe488e7d47eaa36c229a.tar.gz
+sha256  2a4b37c08bec4ba81326314831f341385aff267062e8d4483437958689662936  falcosecurity-libs-0.10.5.tar.gz
 sha256  21ec9433a87459b3477faf542bacec419dc03af841309eac35edeffe481cf10b  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  driver/GPL2.txt
 sha256  f17d3f2c2d565a74a7d5bf96f880c43701e141897e8dff0c8aa13e5d07aaf226  driver/MIT.txt
diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
index 92d5c61832..65f4ceae4d 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.mk
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FALCOSECURITY_LIBS_VERSION = e5c53d648f3c4694385bbe488e7d47eaa36c229a
+FALCOSECURITY_LIBS_VERSION = 0.10.5
 FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_VERSION))
 FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
 FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
@@ -32,6 +32,16 @@ FALCOSECURITY_LIBS_DRIVER_NAME = scap
 FALCOSECURITY_LIBS_MODULE_SUBDIRS = driver
 FALCOSECURITY_LIBS_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
 
+API_VERSION = $(subst ., ,$(shell cat $(@D)/driver/API_VERSION))
+API_VERSION_MAJOR = $(word 1,$(API_VERSION))
+API_VERSION_MINOR = $(word 2,$(API_VERSION))
+API_VERSION_PATCH = $(word 3,$(API_VERSION))
+
+SCHEMA_VERSION = $(subst ., ,$(shell cat $(@D)/driver/SCHEMA_VERSION))
+SCHEMA_VERSION_MAJOR = $(word 1,$(SCHEMA_VERSION))
+SCHEMA_VERSION_MINOR = $(word 2,$(SCHEMA_VERSION))
+SCHEMA_VERSION_PATCH = $(word 3,$(SCHEMA_VERSION))
+
 # falcosecurity-libs module needs these two kernel options to be set:
 # CONFIG_TRACEPOINTS
 # CONFIG_HAVE_SYSCALL_TRACEPOINTS
@@ -51,9 +61,6 @@ endef
 # For the DRIVER_NAME, we set it to FALCOSECURITY_LIBS_DRIVER_NAME.
 # So, when sysdig will be run, it will automatically load
 # FALCOSECURITY_LIBS_DRIVER_NAME.ko.
-# We also need to do the same process for driver_config.h.in.
-# PPM_API_CURRENT_VERSION_* were take from driver/API_VERSION and
-# PPM_SCHEMA_CURRENT_VERSION_* from driver/SCHEMA_VERSION.
 # For the others, it was taken by inspecting
 # falcosecurity-libs/*/CMakeLists.txt, which normally creates these
 # files, but doesn't work well with the kernel-module infrastructure.
@@ -63,16 +70,16 @@ define FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
 	$(SED) 's/@DRIVER_NAME@/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/Makefile
 
 	$(INSTALL) -m 0644 $(@D)/driver/driver_config.h.in $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MAJOR}/1/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MINOR}/0/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_API_CURRENT_VERSION_PATCH}/0/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MAJOR}/1/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MINOR}/0/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_PATCH}/0/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MAJOR}/$(API_VERSION_MAJOR)/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MINOR}/$(API_VERSION_MINOR)/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_API_CURRENT_VERSION_PATCH}/$(API_VERSION_PATCH)/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MAJOR}/$(SCHEMA_VERSION_MAJOR)/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MINOR}/$(SCHEMA_VERSION_MINOR)/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_PATCH}/$(SCHEMA_VERSION_PATCH)/;' $(@D)/driver/driver_config.h
 	$(SED) 's/\$${DRIVER_VERSION}//;' $(@D)/driver/driver_config.h
 	$(SED) 's/\$${DRIVER_NAME}/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/driver_config.h
 	$(SED) 's/\$${DRIVER_DEVICE_NAME}/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${GIT_COMMIT}/0.1.1dev/;' $(@D)/driver/driver_config.h
+	$(SED) 's/\$${GIT_COMMIT}//;' $(@D)/driver/driver_config.h
 endef
 FALCOSECURITY_LIBS_POST_PATCH_HOOKS += FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
