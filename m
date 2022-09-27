Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C5EC07E9D
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 14:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFEB382B1B;
	Tue, 27 Sep 2022 14:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFEB382B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9E5G3dG0AJFt; Tue, 27 Sep 2022 14:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0237827CA;
	Tue, 27 Sep 2022 14:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0237827CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57A9F1BF300
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 14:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F4D2827CA
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 14:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F4D2827CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ogky22L2xQPH for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 14:26:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A754F80894
Received: from mail.aibs.ru (aibs.ru [176.107.241.33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A754F80894
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 14:26:16 +0000 (UTC)
Received: from ws04.aibs.ru (unknown [192.168.40.100])
 by mail.aibs.ru (Postfix) with ESMTPA id 9DCC5340083;
 Tue, 27 Sep 2022 14:26:13 +0000 (UTC)
From: Kirill Kranke <kk@aibs.ru>
To: buildroot@buildroot.org
Date: Tue, 27 Sep 2022 17:26:04 +0300
Message-Id: <20220927142604.17035-1-kk@aibs.ru>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sleef: add new package
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
Cc: Kirill Kranke <kk@aibs.ru>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SLEEF is a library that implements vectorized versions
of C standard math functions. This library also
includes DFT subroutines.

https://sleef.org/
Signed-off-by: Kirill Kranke <kk@aibs.ru>
---
 package/Config.in        |  1 +
 package/sleef/Config.in  | 50 ++++++++++++++++++++++++++++++++++++++++
 package/sleef/sleef.hash |  3 +++
 package/sleef/sleef.mk   | 49 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 103 insertions(+)
 create mode 100644 package/sleef/Config.in
 create mode 100644 package/sleef/sleef.hash
 create mode 100644 package/sleef/sleef.mk

diff --git a/package/Config.in b/package/Config.in
index b911c59a92..af9b0b7398 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2041,6 +2041,7 @@ endif
 	source "package/riemann-c-client/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
+	source "package/sleef/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tinycbor/Config.in"
diff --git a/package/sleef/Config.in b/package/sleef/Config.in
new file mode 100644
index 0000000000..85f93d384e
--- /dev/null
+++ b/package/sleef/Config.in
@@ -0,0 +1,50 @@
+config BR2_PACKAGE_SLEEF_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_x86_64
+	default y if BR2_powerpc64
+
+config BR2_PACKAGE_SLEEF
+	bool "sleef"
+	help
+          SLEEF is a library that implements vectorized versions
+          of C standard math functions. This library also
+          includes DFT subroutines.
+
+          https://sleef.org/
+
+if BR2_PACKAGE_SLEEF
+
+config BR2_PACKAGE_SLEEF_DFT
+        bool "compile dft"
+        default n
+        help
+          libsleefdft will be built
+
+config BR2_PACKAGE_SLEEF_QUAD
+        bool "compile quad"
+        default n
+        help
+          libsleefquad will be built
+
+config BR2_PACKAGE_SLEEF_GNUABI_LIBS
+        bool "compile gnuabi"
+        default y
+        help
+          libsleefgnuabi will be built
+
+config BR2_PACKAGE_SLEEF_SCALAR_LIB
+        bool "compile scalar"
+        default n
+        help
+          libsleefscalar will be built
+
+config BR2_PACKAGE_SLEEF_TESTS
+        bool "compile tests"
+        default n
+        help
+          Tests will be built
+
+endif
diff --git a/package/sleef/sleef.hash b/package/sleef/sleef.hash
new file mode 100644
index 0000000000..51570a5176
--- /dev/null
+++ b/package/sleef/sleef.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
+sha256  415ee9b1bcc5816989d3d4d92afd0cd3f9ee89cbd5a33eb008e69751e40438ab  sleef-3.5.1.tar.gz
diff --git a/package/sleef/sleef.mk b/package/sleef/sleef.mk
new file mode 100644
index 0000000000..46bef69f5f
--- /dev/null
+++ b/package/sleef/sleef.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# sleef
+#
+################################################################################
+
+SLEEF_VERSION = 3.5.1
+SLEEF_SITE = $(call github,shibatch,sleef,$(SLEEF_VERSION))
+SLEEF_LICENSE = BSL-1.0
+SLEEF_LICENSE_FILES = LICENSE.txt
+SLEEF_SUPPORTS_IN_SOURCE_BUILD = NO
+SLEEF_INSTALL_STAGING = YES
+
+# N.B. Need to use host sleef during cross compilation.
+SLEEF_DEPENDENCIES = host-sleef
+SLEEF_CONF_OPTS += -DNATIVE_BUILD_DIR=$(BUILD_DIR)/host-sleef-$(SLEEF_VERSION)/buildroot-build
+
+ifeq ($(BR2_PACKAGE_SLEEF_DFT),y)
+SLEEF_CONF_OPTS += -DBUILD_DFT=ON
+else
+SLEEF_CONF_OPTS += -DBUILD_DFT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SLEEF_QUAD),y)
+SLEEF_CONF_OPTS += -DBUILD_QUAD=ON
+else
+SLEEF_CONF_OPTS += -DBUILD_QUAD=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SLEEF_GNUABI_LIBS),y)
+SLEEF_CONF_OPTS += -DBUILD_GNUABI_LIBS=ON
+else
+SLEEF_CONF_OPTS += -DBUILD_GNUABI_LIBS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SLEEF_SCALAR_LIB),y)
+SLEEF_CONF_OPTS += -DBUILD_SCALAR_LIB=ON
+else
+SLEEF_CONF_OPTS += -DBUILD_SCALAR_LIB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SLEEF_TESTS),y)
+SLEEF_CONF_OPTS += -DBUILD_TESTS=ON
+else
+SLEEF_CONF_OPTS += -DBUILD_TESTS=OFF
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
