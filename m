Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F032C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:13:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B8166102A
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B8166102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00EE16063F;
	Fri, 12 Nov 2021 13:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cknlHrCetW2b; Fri, 12 Nov 2021 13:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1331A605F5;
	Fri, 12 Nov 2021 13:13:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57E491BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53E9A6060D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4cgLwLK-jaN3 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:13:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D5C9605F5
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:13:13 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPA id CFFE9200002;
 Fri, 12 Nov 2021 13:13:11 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 14:12:56 +0100
Message-Id: <20211112131258.2671293-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112131258.2671293-1-herve.codina@bootlin.com>
References: <20211112131258.2671293-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/5] package/libfutils: new package
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

The libfutils library is a library that contains some common
useful functions (list, hash, time).

https://github.com/Parrot-Developers/libfutils

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 -> v2
  - Renamed ALCHEMY_TARGET_CONFIGURE_ENV to ALCHEMY_TARGET_ENV
  - Removed ALCHEMY_TARGET_CONFIGURE_SDKS and set ALCHEMY_TARGET_SDK_DIRS
  - Removed $(strip ...)
  - Fixed indentation
  - Added missing "depends on" in Config.in comment

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libfutils/Config.in      | 15 ++++++++++
 package/libfutils/libfutils.hash |  3 ++
 package/libfutils/libfutils.mk   | 50 ++++++++++++++++++++++++++++++++
 5 files changed, 70 insertions(+)
 create mode 100644 package/libfutils/Config.in
 create mode 100644 package/libfutils/libfutils.hash
 create mode 100644 package/libfutils/libfutils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 004eb17cd4..792aae625f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1153,6 +1153,7 @@ F:	package/alchemy/
 F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
+F:	package/libfutils/
 F:	package/lua-augeas/
 F:	package/ulog/
 F:	support/testing/tests/package/test_dtbocfg.py
diff --git a/package/Config.in b/package/Config.in
index cb4acd3cf0..89d928c0e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1950,6 +1950,7 @@ menu "Other"
 	source "package/libevdev/Config.in"
 	source "package/libevent/Config.in"
 	source "package/libffi/Config.in"
+	source "package/libfutils/Config.in"
 	source "package/libgee/Config.in"
 	source "package/libgeos/Config.in"
 	source "package/libglib2/Config.in"
diff --git a/package/libfutils/Config.in b/package/libfutils/Config.in
new file mode 100644
index 0000000000..7f795fc7e0
--- /dev/null
+++ b/package/libfutils/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBFUTILS
+	bool "libfutils"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_INSTALL_LIBSTDCPP # ulog
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ulog
+	select BR2_PACKAGE_ULOG
+	help
+	  This library contains some common useful functions (list,
+	  hash, time)
+
+	  https://github.com/Parrot-Developers/libfutils
+
+comment "libfutils needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
diff --git a/package/libfutils/libfutils.hash b/package/libfutils/libfutils.hash
new file mode 100644
index 0000000000..1fdcd84b13
--- /dev/null
+++ b/package/libfutils/libfutils.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  b38d40c46b83e448d8c1716ddfb04b7ecd384f5cd2cb773db5c26c0589accdb3  libfutils-c326ce0cc2a7354381265a7664bb215be587fac6.tar.gz
+sha256  eca11a1c62fae8d64a1247d93271375baecff8396141d7ff8d89671ee7e3ed0d  COPYING
diff --git a/package/libfutils/libfutils.mk b/package/libfutils/libfutils.mk
new file mode 100644
index 0000000000..ac4ad69d71
--- /dev/null
+++ b/package/libfutils/libfutils.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# libfutils
+#
+################################################################################
+
+LIBFUTILS_VERSION = c326ce0cc2a7354381265a7664bb215be587fac6
+LIBFUTILS_SITE = $(call github,Parrot-Developers,libfutils,$(LIBFUTILS_VERSION))
+LIBFUTILS_LICENSE = BSD-3-Clause
+LIBFUTILS_LICENSE_FILES = COPYING
+LIBFUTILS_DEPENDENCIES = ulog host-alchemy
+LIBFUTILS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBFUTILS_CONF_ENV += TARGET_GLOBAL_LDLIBS='-latomic'
+endif
+
+define LIBFUTILS_BUILD_CMDS
+	$(ALCHEMY_TARGET_ENV) \
+		ALCHEMY_TARGET_SDK_DIRS="$(ALCHEMY_SDK_BASEDIR)/ulog" \
+		$(LIBFUTILS_CONF_ENV) \
+		$(ALCHEMY_MAKE) libfutils
+endef
+
+define LIBFUTILS_INSTALL_STATIC_LIBS
+	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libfutils.a $(1)/usr/lib/
+endef
+
+define LIBFUTILS_INSTALL_HEADERS
+	cp -Raf $(@D)/include/* $(1)/usr/include/
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+define LIBFUTILS_INSTALL_SHARED_LIBS
+	$(INSTALL) -m 755 $(@D)/alchemy-out/staging/usr/lib/libfutils.so* $(1)/usr/lib/
+endef
+endif
+
+define LIBFUTILS_INSTALL_TARGET_CMDS
+	$(call LIBFUTILS_INSTALL_SHARED_LIBS, $(TARGET_DIR))
+endef
+
+define LIBFUTILS_INSTALL_STAGING_CMDS
+	$(call LIBFUTILS_INSTALL_STATIC_LIBS, $(STAGING_DIR))
+	$(call LIBFUTILS_INSTALL_SHARED_LIBS, $(STAGING_DIR))
+	$(call LIBFUTILS_INSTALL_HEADERS, $(STAGING_DIR))
+	$(call ALCHEMY_INSTALL_LIB_SDK_FILE, libfutils, libfutils, libfutils.so)
+endef
+
+$(eval $(generic-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
