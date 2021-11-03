Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF9BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 07:37:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FE02610FC
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 07:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FE02610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2228A40438;
	Wed,  3 Nov 2021 07:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7RJeKQgxlV8; Wed,  3 Nov 2021 07:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D4104045C;
	Wed,  3 Nov 2021 07:37:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A20671BF2C6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 07:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E6FB40175
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 07:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3qgtdU4x4dG for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 07:37:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C06C400F2
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 07:37:14 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPA id 33E6C240005;
 Wed,  3 Nov 2021 07:37:11 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 08:36:53 +0100
Message-Id: <20211103073656.1689919-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103073656.1689919-1-herve.codina@bootlin.com>
References: <20211103073656.1689919-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/ulog: new package
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

The ulog library is a minimalistic logging library derived from
Android logger.

https://github.com/Parrot-Developers/ulog

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/ulog/Config.in | 12 ++++++++++++
 package/ulog/ulog.hash |  3 +++
 package/ulog/ulog.mk   | 44 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/ulog/Config.in
 create mode 100644 package/ulog/ulog.hash
 create mode 100644 package/ulog/ulog.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 778c5c7e08..33e77285d2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1152,6 +1152,7 @@ F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
+F:	package/ulog/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
 
diff --git a/package/Config.in b/package/Config.in
index c23755a421..bbf4ea0477 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1704,6 +1704,7 @@ menu "Logging"
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
index 0000000000..e84598701b
--- /dev/null
+++ b/package/ulog/ulog.mk
@@ -0,0 +1,44 @@
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
+	$(ALCHEMY_TARGET_CONFIGURE_ENV) \
+	$(ALCHEMY_MAKE) libulog
+endef
+
+define ULOG_INSTALL_STATIC_LIBS
+	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libulog.a $(strip $(1))/usr/lib/
+endef
+
+define ULOG_INSTALL_HEADERS
+	cp -Raf $(@D)/libulog/include/* $(strip $(1))/usr/include/
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+define ULOG_INSTALL_SHARED_LIBS
+	$(INSTALL) -m 755 $(@D)/alchemy-out/staging/usr/lib/libulog.so* $(strip $(1))/usr/lib/
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
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
