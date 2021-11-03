Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAEDC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 07:38:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DC05610FC
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 07:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DC05610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 112F9608EC;
	Wed,  3 Nov 2021 07:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Idf3NFq6swbo; Wed,  3 Nov 2021 07:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39F6B608EE;
	Wed,  3 Nov 2021 07:38:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9BE61BF2C6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 07:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B97734043B
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 07:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCGJJTlk7_iD for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 07:37:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66C8340438
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 07:37:17 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPA id 103F9240005;
 Wed,  3 Nov 2021 07:37:14 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 08:36:55 +0100
Message-Id: <20211103073656.1689919-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103073656.1689919-1-herve.codina@bootlin.com>
References: <20211103073656.1689919-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/libshdata: new package
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

The provided patch was submitted upstream.
https://github.com/Parrot-Developers/libshdata/issues/1

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...01-backend-Add-missing-include-files.patch | 44 ++++++++++++++
 package/libshdata/Config.in                   | 23 ++++++++
 package/libshdata/libshdata.hash              |  3 +
 package/libshdata/libshdata.mk                | 59 +++++++++++++++++++
 6 files changed, 131 insertions(+)
 create mode 100644 package/libshdata/0001-backend-Add-missing-include-files.patch
 create mode 100644 package/libshdata/Config.in
 create mode 100644 package/libshdata/libshdata.hash
 create mode 100644 package/libshdata/libshdata.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d0207b5136..64a2098343 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1152,6 +1152,7 @@ F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/libfutils/
+F:	package/libshdata/
 F:	package/lua-augeas/
 F:	package/ulog/
 F:	support/testing/tests/package/test_dtbocfg.py
diff --git a/package/Config.in b/package/Config.in
index b805b87e0a..95371dbebb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1988,6 +1988,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
+	source "package/libshdata/Config.in"
 	source "package/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/libshdata/0001-backend-Add-missing-include-files.patch b/package/libshdata/0001-backend-Add-missing-include-files.patch
new file mode 100644
index 0000000000..75abddbee4
--- /dev/null
+++ b/package/libshdata/0001-backend-Add-missing-include-files.patch
@@ -0,0 +1,44 @@
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
index 0000000000..730fb34dff
--- /dev/null
+++ b/package/libshdata/Config.in
@@ -0,0 +1,23 @@
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
+comment "libshdata needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_LIBSHDATA
+
+config BR2_PACKAGE_LIBSHDATA_STRESS
+	bool "libshdata-stress binary"
+	help
+	  Install libshdata-stress binary as well
+
+endif
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
index 0000000000..2506b16c42
--- /dev/null
+++ b/package/libshdata/libshdata.mk
@@ -0,0 +1,59 @@
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
+	$(ALCHEMY_TARGET_CONFIGURE_ENV) \
+	$(call ALCHEMY_TARGET_CONFIGURE_SDKS, libfutils) \
+	$(LIBSHDATA_CONF_ENV) \
+	$(ALCHEMY_MAKE) $(LIBSHDATA_TARGETS)
+endef
+
+define LIBSHDATA_INSTALL_STATIC_LIBS
+	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libshdata.a $(strip $(1))/usr/lib/
+	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libshdata-section-lookup.a $(strip $(1))/usr/lib/
+endef
+
+define LIBSHDATA_INSTALL_HEADERS
+	cp -Raf $(@D)/include/* $(strip $(1))/usr/include/
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+define LIBSHDATA_INSTALL_SHARED_LIBS
+	$(INSTALL) -m 755 $(@D)/alchemy-out/staging/usr/lib/libshdata.so* $(strip $(1))/usr/lib/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSHDATA_STRESS),y)
+define LIBSHDATA_INSTALL_BIN
+	$(INSTALL) -m 755 $(@D)/alchemy-out/staging/usr/bin/libshdata-stress $(strip $(1))/usr/bin/
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
