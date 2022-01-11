Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A43C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 23:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53EC583EF7;
	Tue, 11 Jan 2022 23:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvR4i8x-nW8a; Tue, 11 Jan 2022 23:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E6C083EF3;
	Tue, 11 Jan 2022 23:35:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 983ED1BF9AC
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83A494091B
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBPALDIW6qbh for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 23:34:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75EB940139
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 23:34:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6C4C883508; Tue, 11 Jan 2022 23:28:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 00:25:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f1f3f87868fa333833dbba9f4f07adc338b34ed
X-Git-Newrev: 4e88d6570f18748111e3ec81a3121e3e0376a277
X-Patchwork-Hint: ignore
Message-Id: <20220111232835.6C4C883508@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ulog: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e88d6570f18748111e3ec81a3121e3e0376a277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ulog library is a minimalistic logging library derived from
Android logger.

https://github.com/Parrot-Developers/ulog

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
[yann.morin.1998@free.fr:
  - do not macro-ify headers install
  - do not parameterise static libs install dest
  - reordr macros decaration and use
  - implicit module name
  - BUILD_CMDS fit on a single line
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/ulog/Config.in | 12 ++++++++++++
 package/ulog/ulog.hash |  3 +++
 package/ulog/ulog.mk   | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 33b9c1cd73..563f6df3ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1200,6 +1200,7 @@ F:	package/php-apcu/
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
index 0000000000..8e8b1aa1c1
--- /dev/null
+++ b/package/ulog/ulog.mk
@@ -0,0 +1,46 @@
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
+	$(ALCHEMY_TARGET_ENV) $(ALCHEMY_MAKE) libulog
+endef
+
+ifeq ($(BR2_SHARED_LIBS),)
+define ULOG_INSTALL_STATIC_LIBS
+	$(INSTALL) -D -m 644 $(@D)/alchemy-out/staging/usr/lib/libulog.a \
+		$(STAGING_DIR)/usr/lib/libulog.a
+endef
+endif
+
+ifeq ($(BR2_STATIC_LIBS),)
+# $(1): destination directory: target or staging
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
+	mkdir -p $(STAGING_DIR)/usr/include/
+	$(INSTALL) -m 644 $(@D)/libulog/include/* $(STAGING_DIR)/usr/include/
+	$(ULOG_INSTALL_STATIC_LIBS)
+	$(call ULOG_INSTALL_SHARED_LIBS, $(STAGING_DIR))
+	$(call ALCHEMY_INSTALL_LIB_SDK_FILE, libulog, libulog.so)
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
