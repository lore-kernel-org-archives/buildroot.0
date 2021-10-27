Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41BBC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:16:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 483E56103C
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 483E56103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E120607AF;
	Wed, 27 Oct 2021 20:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oNHcw3PXwm5n; Wed, 27 Oct 2021 20:16:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A2960B20;
	Wed, 27 Oct 2021 20:16:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE9E1BF3D4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C04760B23
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jiiPg7BnH1k9 for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:15:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09F3B60B20
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:15:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B276A88FEE; Wed, 27 Oct 2021 20:12:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 22:10:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eedbd6f97d51a0049ec512de26541465403ab06f
X-Git-Newrev: 7f9ad0ed7fd87435cc5aaf58ae23ff7a5dc40b1d
X-Patchwork-Hint: ignore
Message-Id: <20211027201222.B276A88FEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-pecl-dbus: new package
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
Content-Type: multipart/mixed; boundary="===============5278473003594316374=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5278473003594316374==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7f9ad0ed7fd87435cc5aaf58ae23ff7a5dc40b1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The php-pecl-dbus package provides a PHP extension for interaction
with D-Bus busses.

https://github.com/derickr/pecl-dbus

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |   6 +
 package/Config.in                                  |   1 +
 package/php-pecl-dbus/0001-php8-compat.patch       | 158 +++++++++++++++++++++
 ...atibility-with-php8-call_user_function_ex.patch |  32 +++++
 package/php-pecl-dbus/Config.in                    |  15 ++
 package/php-pecl-dbus/php-pecl-dbus.hash           |   3 +
 package/php-pecl-dbus/php-pecl-dbus.mk             |  24 ++++
 .../testing/tests/package/test_php_pecl_dbus.py    |  32 +++++
 8 files changed, 271 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5869971058..d2320bc184 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1154,6 +1154,10 @@ F:	package/lua-augeas/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
 
+N:	Hervé Codina <herve.codina@bootlin.com>
+F:	package/php-pecl-dbus/
+F:	support/testing/tests/package/test_php_pecl_dbus.py
+
 N:	Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
 F:	package/gauche/
 F:	package/gmrender-resurrect/
@@ -1996,6 +2000,7 @@ F:	package/bmap-tools/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
+F:	package/php-pecl-dbus/
 F:	package/php-xdebug/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
@@ -2006,6 +2011,7 @@ F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/test_bmap_tools.py
+F:	support/testing/tests/package/test_php_pecl_dbus.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
diff --git a/package/Config.in b/package/Config.in
index c153285bb1..5dd654a140 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -869,6 +869,7 @@ menu "External php extensions"
 	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
 	source "package/php-memcached/Config.in"
+	source "package/php-pecl-dbus/Config.in"
 	source "package/php-ssh2/Config.in"
 	source "package/php-xdebug/Config.in"
 	source "package/php-yaml/Config.in"
diff --git a/package/php-pecl-dbus/0001-php8-compat.patch b/package/php-pecl-dbus/0001-php8-compat.patch
new file mode 100644
index 0000000000..acca6e1d49
--- /dev/null
+++ b/package/php-pecl-dbus/0001-php8-compat.patch
@@ -0,0 +1,158 @@
+From 7fde4dd4d26d2a4b7957a1010c6ea9e4b940fc62 Mon Sep 17 00:00:00 2001
+From: Stefan Saraev <stefan@saraev.ca>
+Date: Mon, 18 Jan 2021 23:22:52 +0200
+Subject: [PATCH] php8 compat
+
+Upstream: https://github.com/derickr/pecl-dbus/pull/8
+Signed-off-by: Herve Codina <herve.codina@bootlin.com>
+---
+ dbus.c     | 55 ++++++++++++++++++++++++++++++------------------------
+ php_dbus.h | 10 ++++++++++
+ 2 files changed, 41 insertions(+), 24 deletions(-)
+
+diff --git a/dbus.c b/dbus.c
+index 9fde647..a98e2ea 100644
+--- a/dbus.c
++++ b/dbus.c
+@@ -38,6 +38,9 @@
+ #define Z_ADDREF_P(z) ((z)->refcount++)
+ #endif
+ 
++ZEND_BEGIN_ARG_INFO_EX(arginfo_void, 0, 0, 0)
++ZEND_END_ARG_INFO()
++
+ /* {{{ arginfo */
+ ZEND_BEGIN_ARG_INFO_EX(arginfo_dbus_object___call, 0, 0, 2)
+ 	ZEND_ARG_INFO(0, function_name)
+@@ -46,44 +49,44 @@ ZEND_END_ARG_INFO()
+ /* }}} */
+ 
+ const zend_function_entry dbus_funcs_dbus[] = {
+-	PHP_ME(Dbus, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
+-	PHP_ME(Dbus, addWatch,    NULL, ZEND_ACC_PUBLIC)
+-	PHP_ME(Dbus, waitLoop,    NULL, ZEND_ACC_PUBLIC)
+-	PHP_ME(Dbus, requestName, NULL, ZEND_ACC_PUBLIC)
+-	PHP_ME(Dbus, registerObject, NULL, ZEND_ACC_PUBLIC)
+-	PHP_ME(Dbus, createProxy, NULL, ZEND_ACC_PUBLIC)
++	PHP_ME(Dbus, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
++	PHP_ME(Dbus, addWatch,    arginfo_void, ZEND_ACC_PUBLIC)
++	PHP_ME(Dbus, waitLoop,    arginfo_void, ZEND_ACC_PUBLIC)
++	PHP_ME(Dbus, requestName, arginfo_void, ZEND_ACC_PUBLIC)
++	PHP_ME(Dbus, registerObject, arginfo_void, ZEND_ACC_PUBLIC)
++	PHP_ME(Dbus, createProxy, arginfo_void, ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+ };
+ 
+ const zend_function_entry dbus_funcs_dbus_object[] = {
+-	PHP_ME(DbusObject, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PRIVATE)
++	PHP_ME(DbusObject, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PRIVATE)
+ 	PHP_ME(DbusObject, __call,      arginfo_dbus_object___call, ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+ };
+ 
+ const zend_function_entry dbus_funcs_dbus_signal[] = {
+-	PHP_ME(DbusSignal, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
+-	PHP_ME(DbusSignal, matches,     NULL, ZEND_ACC_PUBLIC)
+-	PHP_ME(DbusSignal, getData,     NULL, ZEND_ACC_PUBLIC)
+-	PHP_ME(DbusSignal, send,        NULL, ZEND_ACC_PUBLIC)
++	PHP_ME(DbusSignal, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
++	PHP_ME(DbusSignal, matches,     arginfo_void, ZEND_ACC_PUBLIC)
++	PHP_ME(DbusSignal, getData,     arginfo_void, ZEND_ACC_PUBLIC)
++	PHP_ME(DbusSignal, send,        arginfo_void, ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+ };
+ 
+ const zend_function_entry dbus_funcs_dbus_array[] = {
+-	PHP_ME(DbusArray, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
+-	PHP_ME(DbusArray, getData,     NULL, ZEND_ACC_PUBLIC)
++	PHP_ME(DbusArray, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
++	PHP_ME(DbusArray, getData,     arginfo_void, ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+ };
+ 
+ const zend_function_entry dbus_funcs_dbus_dict[] = {
+-	PHP_ME(DbusDict, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
+-	PHP_ME(DbusDict, getData,     NULL, ZEND_ACC_PUBLIC)
++	PHP_ME(DbusDict, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
++	PHP_ME(DbusDict, getData,     arginfo_void, ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+ };
+ 
+ #define PHP_DBUS_INT_WRAPPER_DEF(s,t) \
+ 	const zend_function_entry dbus_funcs_dbus_##s[] = { \
+-		PHP_ME(Dbus##t, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC) \
++		PHP_ME(Dbus##t, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC) \
+ 		PHP_FE_END \
+ 	};
+ 
+@@ -98,26 +101,26 @@ PHP_DBUS_INT_WRAPPER_DEF(uint64,UInt64);
+ PHP_DBUS_INT_WRAPPER_DEF(double, Double);
+ 
+ const zend_function_entry dbus_funcs_dbus_variant[] = {
+-	PHP_ME(DbusVariant, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
+-	PHP_ME(DbusVariant, getData,     NULL, ZEND_ACC_PUBLIC)
++	PHP_ME(DbusVariant, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
++	PHP_ME(DbusVariant, getData,     arginfo_void, ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+ };
+ 
+ const zend_function_entry dbus_funcs_dbus_set[] = {
+-	PHP_ME(DbusSet, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
+-	PHP_ME(DbusSet, getData,     NULL, ZEND_ACC_PUBLIC)
++	PHP_ME(DbusSet, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
++	PHP_ME(DbusSet, getData,     arginfo_void, ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+ };
+ 
+ const zend_function_entry dbus_funcs_dbus_struct[] = {
+-	PHP_ME(DbusStruct, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
+-	PHP_ME(DbusStruct, getData,     NULL, ZEND_ACC_PUBLIC)
++	PHP_ME(DbusStruct, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
++	PHP_ME(DbusStruct, getData,     arginfo_void, ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+ };
+ 
+ const zend_function_entry dbus_funcs_dbus_object_path[] = {
+-	PHP_ME(DbusObjectPath, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
+-	PHP_ME(DbusObjectPath, getData,     NULL, ZEND_ACC_PUBLIC)
++	PHP_ME(DbusObjectPath, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
++	PHP_ME(DbusObjectPath, getData,     arginfo_void, ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+ };
+ 
+@@ -405,7 +408,11 @@ static void dbus_register_classes(TSRMLS_D)
+ 	dbus_ce_dbus = zend_register_internal_class_ex(&ce_dbus, NULL);
+ 	memcpy(&dbus_object_handlers_dbus, zend_get_std_object_handlers(), sizeof(zend_object_handlers));
+ 	dbus_object_handlers_dbus.clone_obj = dbus_object_clone_dbus;
++#if PHP_VERSION_ID < 80000
+ 	dbus_object_handlers_dbus.compare_objects = dbus_object_compare_dbus;
++#else
++	dbus_object_handlers_dbus.compare = dbus_object_compare_dbus;
++#endif
+ 
+ 	zend_declare_class_constant_long(dbus_ce_dbus, "BYTE", sizeof("BYTE")-1, DBUS_TYPE_BYTE TSRMLS_CC);
+ 	zend_declare_class_constant_long(dbus_ce_dbus, "BOOLEAN", sizeof("BOOLEAN")-1, DBUS_TYPE_BOOLEAN TSRMLS_CC);
+diff --git a/php_dbus.h b/php_dbus.h
+index 8817544..1f0f551 100644
+--- a/php_dbus.h
++++ b/php_dbus.h
+@@ -25,6 +25,16 @@
+ #include "config.h"
+ #endif
+ 
++#if PHP_VERSION_ID >= 80000
++#ifndef TSRMLS_D
++#define TSRMLS_D void
++#define TSRMLS_DC
++#define TSRMLS_C
++#define TSRMLS_CC
++#define TSRMLS_FETCH()
++#endif
++#endif /* PHP_VERSION_ID >= 80000 */
++
+ #include "Zend/zend_hash.h"
+ 
+ #define PHP_DBUS_VERSION "0.2.0"
+-- 
+2.31.1
+
diff --git a/package/php-pecl-dbus/0002-Fix-compatibility-with-php8-call_user_function_ex.patch b/package/php-pecl-dbus/0002-Fix-compatibility-with-php8-call_user_function_ex.patch
new file mode 100644
index 0000000000..5babce94b4
--- /dev/null
+++ b/package/php-pecl-dbus/0002-Fix-compatibility-with-php8-call_user_function_ex.patch
@@ -0,0 +1,32 @@
+From 8cf66c4b5dd657ca14552b27a42901db0a5e9280 Mon Sep 17 00:00:00 2001
+From: Herve Codina <herve.codina@bootlin.com>
+Date: Mon, 4 Oct 2021 17:13:45 +0200
+Subject: [PATCH] Fix compatibility with php8 - call_user_function_ex
+
+This patch fixes compatibility with php8 replacing
+call_user_function_ex by call_user_function.
+
+Upstream: https://github.com/derickr/pecl-dbus/pull/8
+Signed-off-by: Herve Codina <herve.codina@bootlin.com>
+---
+ dbus.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/dbus.c b/dbus.c
+index a98e2ea..6fa9897 100644
+--- a/dbus.c
++++ b/dbus.c
+@@ -1015,8 +1015,8 @@ php_dbus_do_method_call(php_dbus_obj *dbus,
+ 		method_args = safe_emalloc(sizeof(zval *), num_elems, 0);
+ 	}
+ 
+-	if (call_user_function_ex(EG(function_table), object, &callback, &retval,
+-				              num_elems, method_args, 0, NULL) == SUCCESS) {
++	if (call_user_function(EG(function_table), object, &callback, &retval,
++				              num_elems, method_args) == SUCCESS) {
+ 		if (!Z_ISUNDEF(retval)) {
+ 			reply = dbus_message_new_method_return(msg);
+ 			php_dbus_append_parameters(reply, &retval, NULL,
+-- 
+2.31.1
+
diff --git a/package/php-pecl-dbus/Config.in b/package/php-pecl-dbus/Config.in
new file mode 100644
index 0000000000..56c70143a5
--- /dev/null
+++ b/package/php-pecl-dbus/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PHP_PECL_DBUS
+	bool "php-pecl-dbus"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PHP_EXT_LIBXML2 # Runtime dependency
+	help
+	  PHP extension for interaction with D-Bus busses.
+
+	  https://github.com/derickr/pecl-dbus
+
+comment "php-pecl-dbus needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php-pecl-dbus/php-pecl-dbus.hash b/package/php-pecl-dbus/php-pecl-dbus.hash
new file mode 100644
index 0000000000..f8c5aa5037
--- /dev/null
+++ b/package/php-pecl-dbus/php-pecl-dbus.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256 c48761c645c6fa42b57af0e65d893217dc69bcd8d879ace74d6abbf1c5f73a8f  php-pecl-dbus-315d17558c7614d02e923d898231e51c86a25789.tar.gz
+sha256 ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
diff --git a/package/php-pecl-dbus/php-pecl-dbus.mk b/package/php-pecl-dbus/php-pecl-dbus.mk
new file mode 100644
index 0000000000..456d662554
--- /dev/null
+++ b/package/php-pecl-dbus/php-pecl-dbus.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# php-pecl-dbus
+#
+################################################################################
+
+PHP_PECL_DBUS_VERSION = 315d17558c7614d02e923d898231e51c86a25789
+PHP_PECL_DBUS_SITE = $(call github,derickr,pecl-dbus,$(PHP_PECL_DBUS_VERSION))
+PHP_PECL_DBUS_LICENSE = PHP-3.01
+PHP_PECL_DBUS_LICENSE_FILES = LICENSE
+PHP_PECL_DBUS_DEPENDENCIES = php dbus libxml2 host-autoconf host-pkgconf
+
+PHP_PECL_DBUS_CONF_OPTS = \
+	--with-php-config=$(STAGING_DIR)/usr/bin/php-config
+
+define PHP_PECL_DBUS_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+PHP_PECL_DBUS_PRE_CONFIGURE_HOOKS += PHP_PECL_DBUS_PHPIZE
+
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_php_pecl_dbus.py b/support/testing/tests/package/test_php_pecl_dbus.py
new file mode 100644
index 0000000000..65f34dfbb7
--- /dev/null
+++ b/support/testing/tests/package/test_php_pecl_dbus.py
@@ -0,0 +1,32 @@
+import os
+
+import infra.basetest
+
+
+class TestPhpPeclDbus(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_PHP=y
+        BR2_PACKAGE_PHP_SAPI_CLI=y
+        BR2_PACKAGE_PHP_PECL_DBUS=y
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
+        self.assertRunOk("echo 'extension=dbus.so'> /etc/php.d/dbus.ini")
+
+        output, exit_code = self.emulator.run("php --ri dbus | sed '/^$/d'")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "dbus")
+        self.assertEqual(output[1], "Dbus support => enabled")
+        # Do not check the version value in order to avoid test failure when
+        # bumping package version
+        self.assertEqual(output[2][0:11], "Version => ")

--===============5278473003594316374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5278473003594316374==--
