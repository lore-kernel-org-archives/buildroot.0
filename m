Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A324C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 12:14:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3654F60E96
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 12:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3654F60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0299C60EAE;
	Thu, 14 Oct 2021 12:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tRXMkLglNcL; Thu, 14 Oct 2021 12:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3800660E9C;
	Thu, 14 Oct 2021 12:14:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18B3C1BF3C1
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 12:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0856560E9C
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 12:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qk7r11a78_X5 for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 12:14:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49D9960B70
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 12:14:04 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPA id 62F8440002;
 Thu, 14 Oct 2021 12:14:01 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 14:13:50 +0200
Message-Id: <20211014121350.2266078-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php-pam: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The php-pam package provides a PHP PAM (Pluggable Authentication
Modules) integration.

https://pecl.php.net/package/PAM

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 DEVELOPERS                                    |  4 +++
 package/Config.in                             |  1 +
 package/php-pam/Config.in                     | 15 +++++++++
 package/php-pam/php-pam.hash                  |  3 ++
 package/php-pam/php-pam.mk                    | 26 +++++++++++++++
 support/testing/tests/package/test_php_pam.py | 32 +++++++++++++++++++
 6 files changed, 81 insertions(+)
 create mode 100644 package/php-pam/Config.in
 create mode 100644 package/php-pam/php-pam.hash
 create mode 100644 package/php-pam/php-pam.mk
 create mode 100644 support/testing/tests/package/test_php_pam.py

diff --git a/DEVELOPERS b/DEVELOPERS
index b1439391ca..8bbac82936 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1154,8 +1154,10 @@ F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
+F:	package/php-pam/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
+F:	support/testing/tests/package/test_php_pam.py
 
 N:	Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
 F:	package/gauche/
@@ -1994,6 +1996,7 @@ F:	package/bmap-tools/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
+F:	package/php-pam/
 F:	package/php-xdebug/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
@@ -2004,6 +2007,7 @@ F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/test_bmap_tools.py
+F:	support/testing/tests/package/test_php_pam.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
diff --git a/package/Config.in b/package/Config.in
index 7971726875..b00d7b1475 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -868,6 +868,7 @@ menu "External php extensions"
 	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
 	source "package/php-memcached/Config.in"
+	source "package/php-pam/Config.in"
 	source "package/php-ssh2/Config.in"
 	source "package/php-xdebug/Config.in"
 	source "package/php-yaml/Config.in"
diff --git a/package/php-pam/Config.in b/package/php-pam/Config.in
new file mode 100644
index 0000000000..5eae1ba1c2
--- /dev/null
+++ b/package/php-pam/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PHP_PAM
+	bool "php-pam"
+	depends on BR2_ENABLE_LOCALE # linux-pam
+	depends on BR2_USE_WCHAR # linux-pam
+	depends on BR2_USE_MMU # linux-pam
+	depends on !BR2_STATIC_LIBS # linux-pam
+	select BR2_PACKAGE_LINUX_PAM
+	help
+	  PHP PAM (Pluggable Authentication Modules) integration
+
+	  https://pecl.php.net/package/PAM
+
+comment "php-pam needs a toolchain w/ wchar, locale, dynamic library"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_STATIC_LIBS
diff --git a/package/php-pam/php-pam.hash b/package/php-pam/php-pam.hash
new file mode 100644
index 0000000000..c3eb49fbe7
--- /dev/null
+++ b/package/php-pam/php-pam.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  fda3b5f719d51cb278351eedd3d7a96db75661324d81fdcf8072a4309121bc92  pam-2.2.3.tgz
+sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php-pam/php-pam.mk b/package/php-pam/php-pam.mk
new file mode 100644
index 0000000000..8e20095d86
--- /dev/null
+++ b/package/php-pam/php-pam.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# php-pam
+#
+################################################################################
+
+PHP_PAM_VERSION = 2.2.3
+PHP_PAM_SITE = http://pecl.php.net/get
+PHP_PAM_SOURCE = pam-$(PHP_PAM_VERSION).tgz
+PHP_PAM_LICENSE = PHP-3.01
+PHP_PAM_LICENSE_FILES = LICENSE
+PHP_PAM_DEPENDENCIES = php linux-pam host-autoconf host-pkgconf
+
+PHP_PAM_CONF_OPTS = \
+	--with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-pam=$(STAGING_DIR)/usr
+
+define PHP_PAM_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+PHP_PAM_PRE_CONFIGURE_HOOKS += PHP_PAM_PHPIZE
+
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_php_pam.py b/support/testing/tests/package/test_php_pam.py
new file mode 100644
index 0000000000..c4c1412e10
--- /dev/null
+++ b/support/testing/tests/package/test_php_pam.py
@@ -0,0 +1,32 @@
+import os
+
+import infra.basetest
+
+
+class TestPhpPam(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_PHP=y
+        BR2_PACKAGE_PHP_SAPI_CLI=y
+        BR2_PACKAGE_PHP_PAM=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
+
+        self.assertRunOk("mkdir /etc/php.d")
+        self.assertRunOk("echo 'extension=pam.so'> /etc/php.d/pam.ini")
+
+        output, exit_code = self.emulator.run("php --ri pam | sed '/^$/d'")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "pam")
+        self.assertEqual(output[1], "PAM support => enabled")
+        # Do not check the version value in order to avoid test failure when
+        # bumping package version
+        self.assertEqual(output[2][0:21], "Extension version => ")
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
