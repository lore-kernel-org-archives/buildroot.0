Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9F2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 569E284D5E;
	Fri, 17 Dec 2021 21:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfGJ-Tye70XQ; Fri, 17 Dec 2021 21:47:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72D6284D8E;
	Fri, 17 Dec 2021 21:47:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0CF91BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC00761162
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IcFblioJwTkt for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1164961147
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 073A180288; Fri, 17 Dec 2021 21:41:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:46:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d49127dd4c377221c18310775e1121594cb2ed21
X-Git-Newrev: 403b62943b9b1c648a5e86281438e8d38e27929a
X-Patchwork-Hint: ignore
Message-Id: <20211217214145.073A180288@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-pam: new package
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
Content-Type: multipart/mixed; boundary="===============4388530577774079572=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4388530577774079572==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=403b62943b9b1c648a5e86281438e8d38e27929a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The php-pam package provides a PHP PAM (Pluggable Authentication
Modules) integration.

https://pecl.php.net/package/PAM

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  4 ++++
 package/Config.in                             |  2 ++
 package/php-pam/Config.in                     | 16 ++++++++++++++
 package/php-pam/php-pam.hash                  |  3 +++
 package/php-pam/php-pam.mk                    | 26 ++++++++++++++++++++++
 support/testing/tests/package/test_php_pam.py | 32 +++++++++++++++++++++++++++
 6 files changed, 83 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ea4fc89ebf..de960d25b0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1163,10 +1163,12 @@ F:	package/lua-augeas/
 F:	package/modsecurity2/
 F:	package/php-apcu/
 F:	package/php-lua/
+F:	package/php-pam/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
 F:	support/testing/tests/package/test_php_apcu.py
 F:	support/testing/tests/package/test_php_lua.py
+F:	support/testing/tests/package/test_php_pam.py
 
 N:	Hervé Codina <herve.codina@bootlin.com>
 F:	package/php-pecl-dbus/
@@ -2027,6 +2029,7 @@ F:	package/lua-augeas/
 F:	package/modsecurity2/
 F:	package/php-apcu/
 F:	package/php-lua/
+F:	package/php-pam/
 F:	package/php-pecl-dbus/
 F:	package/php-xdebug/
 F:	package/python-augeas/
@@ -2043,6 +2046,7 @@ F:	support/testing/tests/package/test_bmap_tools.py
 F:	support/testing/tests/package/test_php_apcu.py
 F:	support/testing/tests/package/test_php_pecl_dbus.py
 F:	support/testing/tests/package/test_php_lua.py
+F:	support/testing/tests/package/test_php_pam.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
diff --git a/package/Config.in b/package/Config.in
index 136500ca40..c61ef472e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -870,7 +870,9 @@ menu "External php extensions"
 	source "package/php-geoip/Config.in"
 	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
+	source "package/php-lua/Config.in"
 	source "package/php-memcached/Config.in"
+	source "package/php-pam/Config.in"
 	source "package/php-pecl-dbus/Config.in"
 	source "package/php-ssh2/Config.in"
 	source "package/php-xdebug/Config.in"
diff --git a/package/php-pam/Config.in b/package/php-pam/Config.in
new file mode 100644
index 0000000000..70f62a3180
--- /dev/null
+++ b/package/php-pam/Config.in
@@ -0,0 +1,16 @@
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
+	depends on BR2_USE_MMU
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR \
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

--===============4388530577774079572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4388530577774079572==--
