Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A7EC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 08:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8F3C418DF;
	Tue, 16 May 2023 08:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8F3C418DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KuMIl5jeTBf5; Tue, 16 May 2023 08:22:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 408A4418E3;
	Tue, 16 May 2023 08:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408A4418E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFC031BF2CF
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95F50408C0
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95F50408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acXlRHI3yNpZ for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 08:22:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BDB14018F
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BDB14018F
 for <buildroot@buildroot.org>; Tue, 16 May 2023 08:22:23 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9659e9bbff5so2557332266b.1
 for <buildroot@buildroot.org>; Tue, 16 May 2023 01:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684225341; x=1686817341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JAL0L7m5RvhIMFj8R8PbLkMWxtAZ0YBpNqHFjz/f8aU=;
 b=DZ/F89EmXiKnEBof2CHMb8bdYuDci6o0uFHQl0rGF2ZJ7MmP/MTOV44BIL5M1Fr0yh
 UmSm4ILZw0Zp1KO3EEu3rUH+VfzSHfc/fVu3/66preMDsPFPz0K/oTjHIgwnGNkrCVqj
 AlabPul/zY61dj/3sODQm7ZJa9TZq5dHpsHfPruIDEArbQjzQLXy3F1OjN3tSJPtgBmv
 wYC/TraM4TggS3qHBkAMJbDNNE3dXFn8uVpRurY/Img3EdrLX+lYDzhzUIWc/L8dkbhe
 EERwQDZsE/653gyC3Hk2W+qKANgc/Rym1AMr91TzZJPVnUGzSn9lPWznCsBMJ1Xva52d
 cWyg==
X-Gm-Message-State: AC+VfDx69TJqCDaf0hBb77YmAZH6rjhPqFB4IY992wjGxblUqBRVH8gU
 2TzT+6/6RjjvUTcBYvolf/QQlPNewa/X7dMb
X-Google-Smtp-Source: ACHHUZ5eX3TS4qd5Xmzxq49U66QwcqRsmVGFEXprfTM72TzSCcuh8a8JbXWpRxnGwnZZceQFuRRFWw==
X-Received: by 2002:a17:907:2d92:b0:966:612b:c292 with SMTP id
 gt18-20020a1709072d9200b00966612bc292mr32056998ejc.11.1684225340847; 
 Tue, 16 May 2023 01:22:20 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:5cb4:21ec:50e8:94f8])
 by smtp.gmail.com with ESMTPSA id
 lt14-20020a170906fa8e00b0094efdfe60dcsm10422528ejb.206.2023.05.16.01.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:22:20 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 10:21:52 +0200
Message-Id: <20230516082155.22014-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/4] pkg-cmake: add option to select the
 Ninja generator
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, John Keeping <john@metanate.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Cmake supports multiple generators. Ninja is a small build system with a
focus on speed. It is mainly used with the meson build system, but also
cmake has very good support for it. This adds optional support for the
Ninja build system.

Usage:
<package>_CMAKE_NINJA = YES

E.g. Commit 16e5c92ff5fd2b44a1126bd7d7538c68ce838213 can now be replaced by:
WEBKITGTK_CMAKE_NINJA = YES

Packages that are selecting Ninja (or overtime another generator),
should also use the _BUILD_{ENV,OPTS} variables iso the _MAKE variables.

No _INSTALL{,_STAGING,_TARGET}_OPTS used so far, so reuse as cmake install opts:

    $ grep '_INSTALL_OPTS' $(grep -rl "cmake-package" package/*/*.mk)
    $ grep '_INSTALL_STAGING_OPTS' $(grep -rl "cmake-package" package/*/*.mk)
    $ grep '_INSTALL_TARGET_OPTS' $(grep -rl "cmake-package" package/*/*.mk)

The _MAKE_{ENV,OPTS} are copied to _BUILD_{ENV,OPTS}, involved packages:

    $ grep '_MAKE_ENV =' $(grep -rl "cmake-package" package/*/*.mk)

    package/netopeer2/netopeer2.mk:NETOPEER2_MAKE_ENV = \
    package/racehound/racehound.mk:RACEHOUND_MAKE_ENV = $(LINUX_MAKE_FLAGS)

    $ grep '_MAKE_OPTS =' $(grep -rl "cmake-package" package/*/*.mk)

    package/mariadb/mariadb.mk:HOST_MARIADB_MAKE_OPTS = import_executables
    package/zeek/zeek.mk:HOST_ZEEK_MAKE_OPTS = binpac bifcl

Only "musepack" seems to overwrite MAKE to enforce -j1, so replace it:

    $ grep '_MAKE =' $(grep -rl "cmake-package" package/*/*.mk)

    package/musepack/musepack.mk:MUSEPACK_MAKE = $(MAKE1)

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Reviewed-by: John Keeping <john@metanate.com>
---
v2:
 - made generator use more generic, other generators can now easily be added if required
v3:
 - add _GENERATOR_PROGRAM
 - add _GENERATOR_PARALLEL for make
 - dropped BUILD_OPTS
 - fix gdal.mk
v4:
 - restored _MAKE_ENV/_MAKE_OPTS for the Unix Makefiles case
 - always set -j$(PARALLEL_JOBS)
v5:
 - reword commit slightly
---
 package/musepack/musepack.mk |  2 +-
 package/pkg-cmake.mk         | 35 +++++++++++++++++++++++------------
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index fc66c684a5..d4dd08df36 100644
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -9,7 +9,7 @@ MUSEPACK_SITE = http://files.musepack.net/source
 MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
-MUSEPACK_MAKE = $(MAKE1)
+MUSEPACK_BUILD_OPTS = -j1
 MUSEPACK_LICENSE = BSD-3-Clause (*mpcdec), LGPL-2.1+ (*mpcenc)
 MUSEPACK_LICENSE_FILES = libmpcdec/COPYING libmpcenc/quant.c
 
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 8c375779cb..36ab88d3a1 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -51,11 +51,6 @@ endif
 
 define inner-cmake-package
 
-$(2)_MAKE			?= $$(MAKE)
-$(2)_INSTALL_OPTS		?= install
-$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
-$(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
-
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
 
@@ -65,6 +60,20 @@ else
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
 endif
 
+ifeq ($$($(3)_CMAKE_NINJA),YES)
+$(2)_DEPENDENCIES	+= host-ninja
+$(2)_GENERATOR		= "Ninja"
+$(2)_GENERATOR_PROGRAM	= $(HOST_DIR)/bin/ninja
+else
+$(2)_GENERATOR		= "Unix Makefiles"
+$(2)_GENERATOR_PROGRAM	= $(firstword $(BR2_MAKE))
+
+# Generator specific code (make) should be avoided,
+# but for now, copy them to the new variables.
+$(2)_BUILD_ENV		?= $$($(2)_MAKE_ENV)
+$(2)_BUILD_OPTS		?= -- $$($(2)_MAKE_OPTS)
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -88,7 +97,8 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
@@ -119,7 +129,8 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
-		-G"Unix Makefiles" \
+		-G$$($$(PKG)_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
@@ -166,11 +177,11 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
 endef
 endif
 endif
@@ -181,7 +192,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
 endef
 endif
 
@@ -191,7 +202,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(STAGING_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_STAGING_OPTS)
 endef
 endif
 
@@ -201,7 +212,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(TARGET_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_TARGET_OPTS)
 endef
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
