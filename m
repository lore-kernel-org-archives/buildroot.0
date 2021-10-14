Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A82C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 09:40:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E1660E96
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 09:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60E1660E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEDB7403B6;
	Thu, 14 Oct 2021 09:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDPFXI25GUdh; Thu, 14 Oct 2021 09:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D564403CE;
	Thu, 14 Oct 2021 09:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 547841BF3D9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 09:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5154082A6C
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 09:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oR7V9F9FeyXR for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 09:40:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EA558295A
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 09:40:12 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPA id 77B871C0012;
 Thu, 14 Oct 2021 09:40:08 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 11:39:51 +0200
Message-Id: <20211014093952.1943717-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php-lua: new package
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

The php-lua package provides a PHP extension that embeds the lua
interpreter and offers an OO-API to lua variables and functions.

https://pecl.php.net/package/lua

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Two patches are present and were retrieved from the following
upstream pull request in order to support PHP8:
https://github.com/laruence/php-lua/pull/47

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 DEVELOPERS                                    |  4 ++
 package/Config.in                             |  1 +
 ...TATIC-ZEND_ACC_STATIC-for-static-met.patch | 26 ++++++++
 ...0002-php8-explicitly-declare-arginfo.patch | 66 +++++++++++++++++++
 package/php-lua/Config.in                     |  8 +++
 package/php-lua/php-lua.hash                  |  2 +
 package/php-lua/php-lua.mk                    | 39 +++++++++++
 support/testing/tests/package/test_php_lua.py | 62 +++++++++++++++++
 8 files changed, 208 insertions(+)
 create mode 100644 package/php-lua/0001-ZEND_ACC_ALLOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch
 create mode 100644 package/php-lua/0002-php8-explicitly-declare-arginfo.patch
 create mode 100644 package/php-lua/Config.in
 create mode 100644 package/php-lua/php-lua.hash
 create mode 100644 package/php-lua/php-lua.mk
 create mode 100644 support/testing/tests/package/test_php_lua.py

diff --git a/DEVELOPERS b/DEVELOPERS
index b1439391ca..74447e9ec6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1154,8 +1154,10 @@ F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
+F:	package/php-lua/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
+F:	support/testing/tests/package/test_php_lua.py
 
 N:	Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
 F:	package/gauche/
@@ -1994,6 +1996,7 @@ F:	package/bmap-tools/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
+F:	package/php-lua/
 F:	package/php-xdebug/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
@@ -2004,6 +2007,7 @@ F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/test_bmap_tools.py
+F:	support/testing/tests/package/test_php_lua.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
diff --git a/package/Config.in b/package/Config.in
index 7971726875..7965955f6e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -867,6 +867,7 @@ menu "External php extensions"
 	source "package/php-geoip/Config.in"
 	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
+	source "package/php-lua/Config.in"
 	source "package/php-memcached/Config.in"
 	source "package/php-ssh2/Config.in"
 	source "package/php-xdebug/Config.in"
diff --git a/package/php-lua/0001-ZEND_ACC_ALLOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch b/package/php-lua/0001-ZEND_ACC_ALLOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch
new file mode 100644
index 0000000000..ee1191da74
--- /dev/null
+++ b/package/php-lua/0001-ZEND_ACC_ALLOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch
@@ -0,0 +1,26 @@
+From fd775cedbb97b56f0d1b098a41519f4477f450c7 Mon Sep 17 00:00:00 2001
+From: cdosoftei <ciprian.dosoftei@gmail.com>
+Date: Mon, 10 Aug 2020 15:37:52 -0400
+Subject: [PATCH] ZEND_ACC_ALLOW_STATIC -> ZEND_ACC_STATIC for static method
+
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
index 0000000000..7eeb825c38
--- /dev/null
+++ b/package/php-lua/0002-php8-explicitly-declare-arginfo.patch
@@ -0,0 +1,66 @@
+From 0f5132e09d970cacabcca3bab01405bc25b87d66 Mon Sep 17 00:00:00 2001
+From: cdosoftei <ciprian.dosoftei@gmail.com>
+Date: Tue, 11 Aug 2020 12:42:17 -0400
+Subject: [PATCH] php8: explicitly declare arginfo
+
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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
