Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE3AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC8341F15;
	Fri, 17 Dec 2021 21:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fYcwD0dQsqJ6; Fri, 17 Dec 2021 21:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E3FF42220;
	Fri, 17 Dec 2021 21:47:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E93EF1C116E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8DFB41EA4
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TL1vCKUJPqaE for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:47:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F06BF41E14
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:47:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E2FD380288; Fri, 17 Dec 2021 21:41:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:46:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26642e4cc09666110d5105e7867579a0e48cfa09
X-Git-Newrev: 8ddeeffa186d8bce875ac713c1e71483c618842a
X-Patchwork-Hint: ignore
Message-Id: <20211217214144.E2FD380288@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-apcu: new package
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
Content-Type: multipart/mixed; boundary="===============0819499760258614524=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0819499760258614524==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8ddeeffa186d8bce875ac713c1e71483c618842a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

APCu is an in-memory key-value store for PHP.
Keys are of type string and values can be any PHP variables.
APCu only supports userland caching of variables

https://pecl.php.net/package/APCU

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  4 +++
 package/Config.in                              |  1 +
 package/php-apcu/Config.in                     |  6 +++++
 package/php-apcu/php-apcu.hash                 |  2 ++
 package/php-apcu/php-apcu.mk                   | 25 ++++++++++++++++++
 support/testing/tests/package/test_php_apcu.py | 35 ++++++++++++++++++++++++++
 6 files changed, 73 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8d9c492c43..0a64cb22ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1161,8 +1161,10 @@ F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
 F:	package/modsecurity2/
+F:	package/php-apcu/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
+F:	support/testing/tests/package/test_php_apcu.py
 
 N:	Hervé Codina <herve.codina@bootlin.com>
 F:	package/php-pecl-dbus/
@@ -2021,6 +2023,7 @@ F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
 F:	package/modsecurity2/
+F:	package/php-apcu/
 F:	package/php-pecl-dbus/
 F:	package/php-xdebug/
 F:	package/python-augeas/
@@ -2034,6 +2037,7 @@ F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_bmap_tools.py
+F:	support/testing/tests/package/test_php_apcu.py
 F:	support/testing/tests/package/test_php_pecl_dbus.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
diff --git a/package/Config.in b/package/Config.in
index bcf20bf849..136500ca40 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -866,6 +866,7 @@ if BR2_PACKAGE_PHP
 if !BR2_STATIC_LIBS
 menu "External php extensions"
 	source "package/php-amqp/Config.in"
+	source "package/php-apcu/Config.in"
 	source "package/php-geoip/Config.in"
 	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
diff --git a/package/php-apcu/Config.in b/package/php-apcu/Config.in
new file mode 100644
index 0000000000..6338980222
--- /dev/null
+++ b/package/php-apcu/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PHP_APCU
+	bool "php-apcu"
+	help
+	  APCu is an in-memory key-value store for PHP.
+
+	  https://pecl.php.net/package/APCu
diff --git a/package/php-apcu/php-apcu.hash b/package/php-apcu/php-apcu.hash
new file mode 100644
index 0000000000..8b286d5ae3
--- /dev/null
+++ b/package/php-apcu/php-apcu.hash
@@ -0,0 +1,2 @@
+sha256 b99d40fafec06f4d132fcee53e7526ddbfc1d041ea6e04e17389dfad28f9c390  apcu-5.1.20.tgz
+sha256 c48761c645c6fa42b57af0e65d893217dc69bcd8d879ace74d6abbf1c5f73a8f  LICENSE
diff --git a/package/php-apcu/php-apcu.mk b/package/php-apcu/php-apcu.mk
new file mode 100644
index 0000000000..ce59611d8f
--- /dev/null
+++ b/package/php-apcu/php-apcu.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# php-apcu
+#
+################################################################################
+
+PHP_APCU_VERSION = 5.1.20
+PHP_APCU_SITE = http://pecl.php.net/get
+PHP_APCU_SOURCE = apcu-$(PHP_APCU_VERSION).tgz
+PHP_APCU_LICENSE = PHP-3.01
+PHP_APCU_LICENSE_FILES = LICENSE
+PHP_APCU_DEPENDENCIES = php host-autoconf
+
+PHP_APCU_CONF_OPTS = \
+	--with-php-config=$(STAGING_DIR)/usr/bin/php-config
+
+define PHP_APCU_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+PHP_APCU_PRE_CONFIGURE_HOOKS += PHP_APCU_PHPIZE
+
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_php_apcu.py b/support/testing/tests/package/test_php_apcu.py
new file mode 100644
index 0000000000..7c149a5e47
--- /dev/null
+++ b/support/testing/tests/package/test_php_apcu.py
@@ -0,0 +1,35 @@
+import os
+
+import infra.basetest
+
+
+class TestPhpApcu(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_PHP=y
+        BR2_PACKAGE_PHP_SAPI_CLI=y
+        BR2_PACKAGE_PHP_APCU=y
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
+        self.assertRunOk("echo 'extension=apcu.so' > /etc/php.d/apcu.ini")
+        # enable_cli enables APC for the CLI version of PHP, which is what we
+        # use in this test case.
+        self.assertRunOk("echo 'apc.enable_cli=1' >> /etc/php.d/apcu.ini")
+
+        output, exit_code = self.emulator.run("php --ri apcu | sed '/^$/d'")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "apcu")
+        self.assertEqual(output[1], "APCu Support => Enabled")
+        # Do not check the version value in order to avoid a test failure when
+        # bumping package version.
+        self.assertEqual(output[2][0:11], "Version => ")

--===============0819499760258614524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0819499760258614524==--
