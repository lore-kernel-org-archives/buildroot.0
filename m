Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFEAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:14:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58DBC6102A
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58DBC6102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D8BC400CC;
	Fri, 12 Nov 2021 13:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvDKdeQRR2Yj; Fri, 12 Nov 2021 13:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3379840148;
	Fri, 12 Nov 2021 13:13:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A38D11BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 939FA80ECF
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKLmmBlJUwbt for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:13:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1750D81C0A
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:13:14 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPA id 5A26620000A;
 Fri, 12 Nov 2021 13:13:13 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 14:12:57 +0100
Message-Id: <20211112131258.2671293-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112131258.2671293-1-herve.codina@bootlin.com>
References: <20211112131258.2671293-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/5] package/libshdata: new package
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The libshdata library provides lock free shared-memory tools.

https://github.com/Parrot-Developers/libshdata

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 -> v2
  - Added comment related to "patch submitted upstream" in the patch itself
  - Renamed ALCHEMY_TARGET_CONFIGURE_ENV to ALCHEMY_TARGET_ENV
  - Removed ALCHEMY_TARGET_CONFIGURE_SDKS and set ALCHEMY_TARGET_SDK_DIRS
  - Removed $(strip ...)
  - Fixed indentation
  - Added missing "depends on" in Config.in comment
  - Moved the Config.in "comment" block after the if...endif block
  - Removed unneeded LIBSHDATA_CONF_ENV

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...01-backend-Add-missing-include-files.patch | 47 +++++++++++++++
 package/libshdata/Config.in                   | 25 ++++++++
 package/libshdata/libshdata.hash              |  3 +
 package/libshdata/libshdata.mk                | 58 +++++++++++++++++++
 6 files changed, 135 insertions(+)
 create mode 100644 package/libshdata/0001-backend-Add-missing-include-files.patch
 create mode 100644 package/libshdata/Config.in
 create mode 100644 package/libshdata/libshdata.hash
 create mode 100644 package/libshdata/libshdata.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 792aae625f..461c987b94 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1154,6 +1154,7 @@ F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/libfutils/
+F:	package/libshdata/
 F:	package/lua-augeas/
 F:	package/ulog/
 F:	support/testing/tests/package/test_dtbocfg.py
diff --git a/package/Config.in b/package/Config.in
index 89d928c0e7..e2a8f64fb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1991,6 +1991,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
+	source "package/libshdata/Config.in"
 	source "package/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/libshdata/0001-backend-Add-missing-include-files.patch b/package/libshdata/0001-backend-Add-missing-include-files.patch
new file mode 100644
index 0000000000..78c9e669c3
--- /dev/null
+++ b/package/libshdata/0001-backend-Add-missing-include-files.patch
@@ -0,0 +1,47 @@
+From 3eaf11bd957555674f5993435ef79dd4717ce890 Mon Sep 17 00:00:00 2001
+From: Herve Codina <herve.codina@bootlin.com>
+Date: Tue, 26 Oct 2021 08:45:10 +0200
+Subject: [PATCH] backend: Add missing include files
+
+With some libc library (musl), shd_dev_mem.c and shd_shm.c do not
+compile. Indeed, open() needs <fcntl.h> (Cf. man open).
+
+This patch fixes the compilation issue adding this
+include file.
+
+This patch was submitted upstream.
+https://github.com/Parrot-Developers/libshdata/issues/1
+
+Signed-off-by: Herve Codina <herve.codina@bootlin.com>
+---
+ src/backend/shd_dev_mem.c | 1 +
+ src/backend/shd_shm.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/backend/shd_dev_mem.c b/src/backend/shd_dev_mem.c
+index 14573c1..a65f052 100644
+--- a/src/backend/shd_dev_mem.c
++++ b/src/backend/shd_dev_mem.c
+@@ -33,6 +33,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <unistd.h>		/* For ftruncate */
++#include <fcntl.h>		/* For open */
+ #include <sys/file.h>		/* for flock */
+ #include <sys/mman.h>		/* For shm and PROT flags */
+ #include <futils/fdutils.h>
+diff --git a/src/backend/shd_shm.c b/src/backend/shd_shm.c
+index 117bf01..1e5a38c 100644
+--- a/src/backend/shd_shm.c
++++ b/src/backend/shd_shm.c
+@@ -35,6 +35,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <unistd.h>		/* For ftruncate */
++#include <fcntl.h>		/* For open */
+ #include <limits.h>		/* For NAME_MAX macro */
+ #include <sys/file.h>		/* for flock */
+ #include <sys/mman.h>		/* For shm and PROT flags */
+-- 
+2.31.1
+
diff --git a/package/libshdata/Config.in b/package/libshdata/Config.in
new file mode 100644
index 0000000000..89d4e1393a
--- /dev/null
+++ b/package/libshdata/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_LIBSHDATA
+	bool "libshdata"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libfutils
+	depends on BR2_INSTALL_LIBSTDCPP # libfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfutils
+	select BR2_PACKAGE_LIBFUTILS
+	help
+	  This library provides lock free shared-memory tools
+
+	  https://github.com/Parrot-Developers/libshdata
+
+if BR2_PACKAGE_LIBSHDATA
+
+config BR2_PACKAGE_LIBSHDATA_STRESS
+	bool "libshdata-stress binary"
+	help
+	  Install libshdata-stress binary as well
+
+endif
+
+comment "libshdata needs a toolchain w/ C++, threads"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libshdata/libshdata.hash b/package/libshdata/libshdata.hash
new file mode 100644
index 0000000000..880404cf52
--- /dev/null
+++ b/package/libshdata/libshdata.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  1ae83ac73c2b5b17c726067737b8d446b99f190e16fe6198eb464368796ecce3  libshdata-d9ec4bdba834d8f3daf6bf9aa6da374bc462961f.tar.gz
+sha256  eca11a1c62fae8d64a1247d93271375baecff8396141d7ff8d89671ee7e3ed0d  COPYING
diff --git a/package/libshdata/libshdata.mk b/package/libshdata/libshdata.mk
new file mode 100644
index 0000000000..ed9b4579a5
--- /dev/null
+++ b/package/libshdata/libshdata.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# libshdata
+#
+################################################################################
+
+LIBSHDATA_VERSION = d9ec4bdba834d8f3daf6bf9aa6da374bc462961f
+LIBSHDATA_SITE = $(call github,Parrot-Developers,libshdata,$(LIBSHDATA_VERSION))
+LIBSHDATA_LICENSE = BSD-3-Clause
+LIBSHDATA_LICENSE_FILES = COPYING
+LIBSHDATA_DEPENDENCIES = libfutils host-alchemy
+LIBSHDATA_INSTALL_STAGING = YES
+
+LIBSHDATA_TARGETS = libshdata
+ifeq ($(BR2_PACKAGE_LIBSHDATA_STRESS),y)
+LIBSHDATA_TARGETS += libshdata-stress
+endif
+
+define LIBSHDATA_BUILD_CMDS
+	$(ALCHEMY_TARGET_ENV) \
+		ALCHEMY_TARGET_SDK_DIRS="$(ALCHEMY_SDK_BASEDIR)/libfutils" \
+		$(ALCHEMY_MAKE) $(LIBSHDATA_TARGETS)
+endef
+
+define LIBSHDATA_INSTALL_STATIC_LIBS
+	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libshdata.a $(1)/usr/lib/
+	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libshdata-section-lookup.a $(1)/usr/lib/
+endef
+
+define LIBSHDATA_INSTALL_HEADERS
+	cp -Raf $(@D)/include/* $(1)/usr/include/
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+define LIBSHDATA_INSTALL_SHARED_LIBS
+	$(INSTALL) -m 755 $(@D)/alchemy-out/staging/usr/lib/libshdata.so* $(1)/usr/lib/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSHDATA_STRESS),y)
+define LIBSHDATA_INSTALL_BIN
+	$(INSTALL) -m 755 $(@D)/alchemy-out/staging/usr/bin/libshdata-stress $(1)/usr/bin/
+endef
+endif
+
+define LIBSHDATA_INSTALL_TARGET_CMDS
+	$(call LIBSHDATA_INSTALL_SHARED_LIBS, $(TARGET_DIR))
+	$(call LIBSHDATA_INSTALL_BIN, $(TARGET_DIR))
+endef
+
+define LIBSHDATA_INSTALL_STAGING_CMDS
+	$(call LIBSHDATA_INSTALL_STATIC_LIBS, $(STAGING_DIR))
+	$(call LIBSHDATA_INSTALL_SHARED_LIBS, $(STAGING_DIR))
+	$(call LIBSHDATA_INSTALL_HEADERS, $(STAGING_DIR))
+	$(call ALCHEMY_INSTALL_LIB_SDK_FILE, libshdata, libshdata, libshdata.so)
+endef
+
+$(eval $(generic-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
