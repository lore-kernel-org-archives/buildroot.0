Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB26EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E95941E14;
	Fri, 17 Dec 2021 21:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fb3QUNwBwfjQ; Fri, 17 Dec 2021 21:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9784341EE5;
	Fri, 17 Dec 2021 21:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1FF31BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8997740C26
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 261UsooHTx4C for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0606940192
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EEED3802C5; Fri, 17 Dec 2021 21:41:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:46:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ddeeffa186d8bce875ac713c1e71483c618842a
X-Git-Newrev: d49127dd4c377221c18310775e1121594cb2ed21
X-Patchwork-Hint: ignore
Message-Id: <20211217214144.EEED3802C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-lua: new package
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
Content-Type: multipart/mixed; boundary="===============1125248730742864117=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1125248730742864117==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d49127dd4c377221c18310775e1121594cb2ed21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The php-lua package provides a PHP extension that embeds the lua
interpreter and offers an OO-API to lua variables and functions.

https://pecl.php.net/package/lua

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Two patches are present and were retrieved from the following
upstream pull request in order to support PHP8:
https://github.com/laruence/php-lua/pull/47

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  4 ++
 ...LOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch | 28 +++++++++
 .../0002-php8-explicitly-declare-arginfo.patch     | 68 ++++++++++++++++++++++
 package/php-lua/Config.in                          |  8 +++
 package/php-lua/php-lua.hash                       |  2 +
 package/php-lua/php-lua.mk                         | 39 +++++++++++++
 support/testing/tests/package/test_php_lua.py      | 62 ++++++++++++++++++++
 7 files changed, 211 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0a64cb22ae..ea4fc89ebf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1162,9 +1162,11 @@ F:	package/libdbi-drivers/
 F:	package/lua-augeas/
 F:	package/modsecurity2/
 F:	package/php-apcu/
+F:	package/php-lua/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
 F:	support/testing/tests/package/test_php_apcu.py
+F:	support/testing/tests/package/test_php_lua.py
 
 N:	Hervé Codina <herve.codina@bootlin.com>
 F:	package/php-pecl-dbus/
@@ -2024,6 +2026,7 @@ F:	package/libdbi-drivers/
 F:	package/lua-augeas/
 F:	package/modsecurity2/
 F:	package/php-apcu/
+F:	package/php-lua/
 F:	package/php-pecl-dbus/
 F:	package/php-xdebug/
 F:	package/python-augeas/
@@ -2039,6 +2042,7 @@ F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_bmap_tools.py
 F:	support/testing/tests/package/test_php_apcu.py
 F:	support/testing/tests/package/test_php_pecl_dbus.py
+F:	support/testing/tests/package/test_php_lua.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
diff --git a/package/php-lua/0001-ZEND_ACC_ALLOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch b/package/php-lua/0001-ZEND_ACC_ALLOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch
new file mode 100644
index 0000000000..118c0d0763
--- /dev/null
+++ b/package/php-lua/0001-ZEND_ACC_ALLOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch
@@ -0,0 +1,28 @@
+From fd775cedbb97b56f0d1b098a41519f4477f450c7 Mon Sep 17 00:00:00 2001
+From: cdosoftei <ciprian.dosoftei@gmail.com>
+Date: Mon, 10 Aug 2020 15:37:52 -0400
+Subject: [PATCH] ZEND_ACC_ALLOW_STATIC -> ZEND_ACC_STATIC for static method
+
+[Hervé: Taken from https://github.com/laruence/php-lua/pull/47 to fix
+PHP8 compatibility.]
+Signed-off-by: Herve Codina <herve.codina@bootlin.com>
+---
+ lua.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lua.c b/lua.c
+index b05f4ef..f2648ac 100755
+--- a/lua.c
++++ b/lua.c
+@@ -822,7 +822,7 @@ zend_function_entry lua_class_methods[] = {
+ 	PHP_ME(lua, include,			arginfo_lua_include, 	ZEND_ACC_PUBLIC)
+ 	PHP_ME(lua, call,				arginfo_lua_call,  		ZEND_ACC_PUBLIC)
+ 	PHP_ME(lua, assign,				arginfo_lua_assign,		ZEND_ACC_PUBLIC)
+-	PHP_ME(lua, getVersion,			NULL, 					ZEND_ACC_PUBLIC|ZEND_ACC_ALLOW_STATIC)
++	PHP_ME(lua, getVersion,			NULL, 					ZEND_ACC_PUBLIC|ZEND_ACC_STATIC)
+ 	PHP_ME(lua, registerCallback,	arginfo_lua_register, 	ZEND_ACC_PUBLIC)
+ 	PHP_MALIAS(lua, __call, call, 	arginfo_lua_call,		ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+-- 
+2.31.1
+
diff --git a/package/php-lua/0002-php8-explicitly-declare-arginfo.patch b/package/php-lua/0002-php8-explicitly-declare-arginfo.patch
new file mode 100644
index 0000000000..5e9c44009f
--- /dev/null
+++ b/package/php-lua/0002-php8-explicitly-declare-arginfo.patch
@@ -0,0 +1,68 @@
+From 0f5132e09d970cacabcca3bab01405bc25b87d66 Mon Sep 17 00:00:00 2001
+From: cdosoftei <ciprian.dosoftei@gmail.com>
+Date: Tue, 11 Aug 2020 12:42:17 -0400
+Subject: [PATCH] php8: explicitly declare arginfo
+
+[Hervé: Taken from https://github.com/laruence/php-lua/pull/47 to fix
+PHP8 compatibility.]
+Signed-off-by: Herve Codina <herve.codina@bootlin.com>
+---
+ lua.c         | 7 +++++--
+ lua_closure.c | 5 ++++-
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/lua.c b/lua.c
+index f2648ac..bbbd623 100755
+--- a/lua.c
++++ b/lua.c
+@@ -35,6 +35,9 @@ static zend_object_handlers lua_object_handlers;
+ /** {{{ ARG_INFO
+  *
+  */
++ZEND_BEGIN_ARG_INFO_EX(arginfo_void, 0, 0, 0)
++ZEND_END_ARG_INFO()
++
+ ZEND_BEGIN_ARG_INFO_EX(arginfo_lua_call, 0, 0, 2)
+ 	ZEND_ARG_INFO(0, method)
+ 	ZEND_ARG_INFO(0, args)
+@@ -817,12 +820,12 @@ PHP_METHOD(lua, __construct) {
+  *
+  */
+ zend_function_entry lua_class_methods[] = {
+-	PHP_ME(lua, __construct,		NULL,  					ZEND_ACC_PUBLIC|ZEND_ACC_CTOR)
++	PHP_ME(lua, __construct,		arginfo_void,				ZEND_ACC_PUBLIC|ZEND_ACC_CTOR)
+ 	PHP_ME(lua, eval,          		arginfo_lua_eval,  		ZEND_ACC_PUBLIC)
+ 	PHP_ME(lua, include,			arginfo_lua_include, 	ZEND_ACC_PUBLIC)
+ 	PHP_ME(lua, call,				arginfo_lua_call,  		ZEND_ACC_PUBLIC)
+ 	PHP_ME(lua, assign,				arginfo_lua_assign,		ZEND_ACC_PUBLIC)
+-	PHP_ME(lua, getVersion,			NULL, 					ZEND_ACC_PUBLIC|ZEND_ACC_STATIC)
++	PHP_ME(lua, getVersion,			arginfo_void,				ZEND_ACC_PUBLIC|ZEND_ACC_STATIC)
+ 	PHP_ME(lua, registerCallback,	arginfo_lua_register, 	ZEND_ACC_PUBLIC)
+ 	PHP_MALIAS(lua, __call, call, 	arginfo_lua_call,		ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+diff --git a/lua_closure.c b/lua_closure.c
+index 50ef039..b0f6780 100644
+--- a/lua_closure.c
++++ b/lua_closure.c
+@@ -39,6 +39,9 @@ static zend_object_handlers lua_closure_handlers;
+ /** {{{ ARG_INFO
+  *
+  */
++ZEND_BEGIN_ARG_INFO_EX(arginfo_void, 0, 0, 0)
++ZEND_END_ARG_INFO()
++
+ ZEND_BEGIN_ARG_INFO_EX(arginfo_lua_invoke, 0, 0, 1)
+ 	ZEND_ARG_INFO(0, arg)
+ 	ZEND_ARG_INFO(0, ...)
+@@ -145,7 +148,7 @@ PHP_METHOD(lua_closure, invoke) {
+ /* {{{ lua_class_methods[]
+  */
+ zend_function_entry lua_closure_methods[] = {
+-	PHP_ME(lua_closure, __construct,		NULL,  					ZEND_ACC_PRIVATE|ZEND_ACC_CTOR)
++	PHP_ME(lua_closure, __construct,		arginfo_void,				ZEND_ACC_PRIVATE|ZEND_ACC_CTOR)
+ 	PHP_ME(lua_closure, invoke,				arginfo_lua_invoke,  	ZEND_ACC_PUBLIC)
+ 	PHP_MALIAS(lua_closure, __invoke, invoke, arginfo_lua_invoke,	ZEND_ACC_PUBLIC)
+ 	PHP_FE_END
+-- 
+2.31.1
+
diff --git a/package/php-lua/Config.in b/package/php-lua/Config.in
new file mode 100644
index 0000000000..923de2d799
--- /dev/null
+++ b/package/php-lua/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PHP_LUA
+	bool "php-lua"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  This extension embeds the lua interpreter and offers an
+	  OO-API to lua variables and functions.
+
+	  https://pecl.php.net/package/lua
diff --git a/package/php-lua/php-lua.hash b/package/php-lua/php-lua.hash
new file mode 100644
index 0000000000..841c4f7234
--- /dev/null
+++ b/package/php-lua/php-lua.hash
@@ -0,0 +1,2 @@
+sha256  86545e1e09b79e3693dd93f2a5a8f15ea161b5a1928f315c7a27107744ee8772  lua-2.0.7.tgz
+sha256  b6e00df9cb3b91977c0d64a7c4db48cb6f5041f6eeda6583c236775f70a35b78  LICENSE
diff --git a/package/php-lua/php-lua.mk b/package/php-lua/php-lua.mk
new file mode 100644
index 0000000000..529b347e42
--- /dev/null
+++ b/package/php-lua/php-lua.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# php-lua
+#
+################################################################################
+
+PHP_LUA_VERSION = 2.0.7
+PHP_LUA_SITE = http://pecl.php.net/get
+PHP_LUA_SOURCE = lua-$(PHP_LUA_VERSION).tgz
+PHP_LUA_LICENSE = PHP-3.01
+PHP_LUA_LICENSE_FILES = LICENSE
+PHP_LUA_DEPENDENCIES = php luainterpreter host-autoconf host-pkgconf
+
+PHP_LUA_CONF_OPTS = \
+	--with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-lua=$(STAGING_DIR)/usr
+
+# The php-lua package uses the following code to search for the lua library
+#      if test "$PHP_LUA_VERSION" != "yes" -a "$PHP_LUA_VERSION" != "no"; then
+#        LUA_LIB_SUFFIX=lua$PHP_LUA_VERSION
+#      else
+#        LUA_LIB_SUFFIX=lua
+#      fi
+#      LUA_LIB_NAME=lib$LUA_LIB_SUFFIX
+# luajit library name is libluajit-x.y with x.y the api version.
+# In order to use luajit, we use jit-x.y as "lua-version".
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+PHP_LUA_CONF_OPTS += --with-lua-version=jit-$(LUAINTERPRETER_ABIVER)
+endif
+
+define PHP_LUA_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+PHP_LUA_PRE_CONFIGURE_HOOKS += PHP_LUA_PHPIZE
+
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_php_lua.py b/support/testing/tests/package/test_php_lua.py
new file mode 100644
index 0000000000..2494c2bcdf
--- /dev/null
+++ b/support/testing/tests/package/test_php_lua.py
@@ -0,0 +1,62 @@
+import os
+
+import infra.basetest
+
+
+class TestPhpLuaLua(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_PHP=y
+        BR2_PACKAGE_PHP_SAPI_CLI=y
+        BR2_PACKAGE_PHP_LUA=y
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
+        self.assertRunOk("echo 'extension=lua.so' > /etc/php.d/lua.ini")
+
+        output, exit_code = self.emulator.run("php --ri lua | sed '/^$/d'")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "lua")
+        self.assertEqual(output[1], "lua support => enabled")
+        # Do not check the version value in order to avoid a test failure when
+        # bumping package version.
+        self.assertEqual(output[2][0:25], "lua extension version => ")
+
+class TestPhpLuaLuajit(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_PHP=y
+        BR2_PACKAGE_PHP_SAPI_CLI=y
+        BR2_PACKAGE_PHP_LUA=y
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
+        self.assertRunOk("echo 'extension=lua.so' > /etc/php.d/lua.ini")
+
+        output, exit_code = self.emulator.run("php --ri lua | sed '/^$/d'")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "lua")
+        self.assertEqual(output[1], "lua support => enabled")
+        # Do not check the version value in order to avoid a test failure when
+        # bumping package version.
+        self.assertEqual(output[2][0:25], "lua extension version => ")

--===============1125248730742864117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1125248730742864117==--
