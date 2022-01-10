Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F62C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 14:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF5BD82CE5;
	Mon, 10 Jan 2022 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pyCLQYspLOVw; Mon, 10 Jan 2022 14:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BA8082CA5;
	Mon, 10 Jan 2022 14:50:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC851BF3C3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 796B340911
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6smA4Mcbt3Cv for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 14:50:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 292D740906
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:50:16 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 1C43960014;
 Mon, 10 Jan 2022 14:50:15 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 15:50:04 +0100
Message-Id: <20220110145007.133329-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110145007.133329-1-herve.codina@bootlin.com>
References: <20220110145007.133329-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/5] package/ulog: new package
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ulog library is a minimalistic logging library derived from
Android logger.

https://github.com/Parrot-Developers/ulog

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 -> v2
  - Renamed ALCHEMY_TARGET_CONFIGURE_ENV to ALCHEMY_TARGET_ENV
  - Removed $(strip ...)
  - Fixed indentation

Changes v2 -> v3
  - Installed .a files when needed (ie not shared lib only)
  - Used $(INSTALL) in all installation commands
  - Created installation directories when needed

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/ulog/Config.in | 12 ++++++++++
 package/ulog/ulog.hash |  3 +++
 package/ulog/ulog.mk   | 50 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 67 insertions(+)
 create mode 100644 package/ulog/Config.in
 create mode 100644 package/ulog/ulog.hash
 create mode 100644 package/ulog/ulog.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 79b33e9f22..31ca7bf608 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1197,6 +1197,7 @@ F:	package/php-apcu/
 F:	package/php-lua/
 F:	package/php-pam/
 F:	package/php-pecl-dbus/
+F:	package/ulog/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
 F:	support/testing/tests/package/test_php_apcu.py
diff --git a/package/Config.in b/package/Config.in
index 3a2ad30df9..39a98fcc66 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1738,6 +1738,7 @@ menu "Logging"
 	source "package/log4qt/Config.in"
 	source "package/opentracing-cpp/Config.in"
 	source "package/spdlog/Config.in"
+	source "package/ulog/Config.in"
 	source "package/zlog/Config.in"
 endmenu
 
diff --git a/package/ulog/Config.in b/package/ulog/Config.in
new file mode 100644
index 0000000000..ef155005c2
--- /dev/null
+++ b/package/ulog/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_ULOG
+	bool "ulog"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  This is a minimalistic logging library derived from
+	  Android logger.
+
+	  https://github.com/Parrot-Developers/ulog
+
+comment "ulog needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ulog/ulog.hash b/package/ulog/ulog.hash
new file mode 100644
index 0000000000..47adc093b9
--- /dev/null
+++ b/package/ulog/ulog.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  14e5773b32a79fa5380bdc7ac73a39a7cd3ab182830f57cf6f2994fb49cf38dc  ulog-0389d243352255f6182326dccdae3d56dadc078f.tar.gz
+sha256  cbb97dd2528af2aa2b9aee6c1b3ff1caed758044c17b2c811cf44b2528c496da  COPYING
diff --git a/package/ulog/ulog.mk b/package/ulog/ulog.mk
new file mode 100644
index 0000000000..4bfb913499
--- /dev/null
+++ b/package/ulog/ulog.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# ulog
+#
+################################################################################
+
+ULOG_VERSION = 0389d243352255f6182326dccdae3d56dadc078f
+ULOG_SITE = $(call github,Parrot-Developers,ulog,$(ULOG_VERSION))
+ULOG_LICENSE = Apache-2.0
+ULOG_LICENSE_FILES = COPYING
+ULOG_DEPENDENCIES = host-alchemy
+ULOG_INSTALL_STAGING = YES
+
+define ULOG_BUILD_CMDS
+	$(ALCHEMY_TARGET_ENV) \
+		$(ALCHEMY_MAKE) libulog
+endef
+
+ifeq ($(BR2_SHARED_LIBS),)
+define ULOG_INSTALL_STATIC_LIBS
+	$(INSTALL) -D -m 644 $(@D)/alchemy-out/staging/usr/lib/libulog.a \
+		$(1)/usr/lib/libulog.a
+endef
+endif
+
+define ULOG_INSTALL_HEADERS
+	mkdir -p $(1)/usr/include/
+	$(INSTALL) -m 644 $(@D)/libulog/include/* $(1)/usr/include/
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+define ULOG_INSTALL_SHARED_LIBS
+	mkdir -p $(1)/usr/lib/
+	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libulog.so* \
+		$(1)/usr/lib/
+endef
+endif
+
+define ULOG_INSTALL_TARGET_CMDS
+	$(call ULOG_INSTALL_SHARED_LIBS, $(TARGET_DIR))
+endef
+
+define ULOG_INSTALL_STAGING_CMDS
+	$(call ULOG_INSTALL_STATIC_LIBS, $(STAGING_DIR))
+	$(call ULOG_INSTALL_SHARED_LIBS, $(STAGING_DIR))
+	$(call ULOG_INSTALL_HEADERS, $(STAGING_DIR))
+	$(call ALCHEMY_INSTALL_LIB_SDK_FILE, ulog, libulog, libulog.so)
+endef
+
+$(eval $(generic-package))
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
