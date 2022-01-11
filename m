Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77CEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 23:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76A706FB29;
	Tue, 11 Jan 2022 23:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y3VDIjo5-LQX; Tue, 11 Jan 2022 23:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 983946FB5D;
	Tue, 11 Jan 2022 23:35:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4D0B1BF489
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B3A340132
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5h_vJsuML1mc for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 23:34:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8099840919
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 23:34:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 78D4E83509; Tue, 11 Jan 2022 23:28:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 00:27:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e88d6570f18748111e3ec81a3121e3e0376a277
X-Git-Newrev: ef5d311a84a71e52e4163c3df7277bd70286fca4
X-Patchwork-Hint: ignore
Message-Id: <20220111232835.78D4E83509@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfutils: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef5d311a84a71e52e4163c3df7277bd70286fca4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libfutils library is a library that contains some common
useful functions (list, hash, time).

https://github.com/Parrot-Developers/libfutils

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
[yann.morin.1998@free.fr:
  - do not macro-ify headers install
  - do not parameterise static libs install dest
  - reorder macros decaration and use
  - implicit module name
  - BUILD_CMDS fit on a single line
  - LIBFUTILS_TARGET_ENV is all env, not just extra env
  - add missing mkdir in shared-libs case
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libfutils/Config.in      | 15 +++++++++++
 package/libfutils/libfutils.hash |  3 +++
 package/libfutils/libfutils.mk   | 56 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 563f6df3ff..e0385c7b81 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1194,6 +1194,7 @@ F:	package/alchemy/
 F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
+F:	package/libfutils/
 F:	package/lua-augeas/
 F:	package/modsecurity2/
 F:	package/php-apcu/
diff --git a/package/Config.in b/package/Config.in
index 39a98fcc66..163fd53e12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1986,6 +1986,7 @@ menu "Other"
 	source "package/libevent/Config.in"
 	source "package/libexecinfo/Config.in"
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
index 0000000000..84b53cca3c
--- /dev/null
+++ b/package/libfutils/libfutils.mk
@@ -0,0 +1,56 @@
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
+LIBFUTILS_DEPENDENCIES = host-alchemy ulog
+LIBFUTILS_INSTALL_STAGING = YES
+
+LIBFUTILS_TARGET_ENV = \
+	$(ALCHEMY_TARGET_ENV) \
+	ALCHEMY_TARGET_SDK_DIRS="$(ALCHEMY_SDK_BASEDIR)/ulog"
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBFUTILS_TARGET_ENV += TARGET_GLOBAL_LDLIBS='-latomic'
+endif
+
+define LIBFUTILS_BUILD_CMDS
+	$(LIBFUTILS_TARGET_ENV) $(ALCHEMY_MAKE) libfutils
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+# $(1): destination directory: target or staging
+define LIBFUTILS_INSTALL_SHARED_LIBS
+	mkdir -p $(1)/usr/lib/
+	$(INSTALL) -m 644 $(@D)/alchemy-out/staging/usr/lib/libfutils.so* \
+		$(1)/usr/lib/
+endef
+endif
+
+ifeq ($(BR2_SHARED_LIBS),)
+define LIBFUTILS_INSTALL_STATIC_LIBS
+	mkdir -p $(1)/usr/lib/
+	$(INSTALL) -D -m 644 $(@D)/alchemy-out/staging/usr/lib/libfutils.a \
+		$(STAGING_DIR)/usr/lib/libfutils.a
+endef
+endif
+
+define LIBFUTILS_INSTALL_TARGET_CMDS
+	$(call LIBFUTILS_INSTALL_SHARED_LIBS, $(TARGET_DIR))
+endef
+
+define LIBFUTILS_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/futils
+	$(INSTALL) -m 644 $(@D)/include/futils/* \
+		$(STAGING_DIR)/usr/include/futils/
+	$(LIBFUTILS_INSTALL_STATIC_LIBS)
+	$(call LIBFUTILS_INSTALL_SHARED_LIBS, $(STAGING_DIR))
+	$(call ALCHEMY_INSTALL_LIB_SDK_FILE, libfutils, libfutils.so, libulog)
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
