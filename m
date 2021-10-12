Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378D8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:22:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91EBC60EFE
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91EBC60EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6243C60C1A;
	Tue, 12 Oct 2021 20:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KoJL6zPqbAIc; Tue, 12 Oct 2021 20:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B5A260C1B;
	Tue, 12 Oct 2021 20:22:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 085F91BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA0E881D11
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTW6Y8zneuBR for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:21:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EF98825DF
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:21:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EB38F954D3; Tue, 12 Oct 2021 20:19:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:21:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bec8a1c297bd5125361b662bddf200bbb78db221
X-Git-Newrev: 36395e4762485e4588a7f8bf90d6b6f2a40ba77d
X-Patchwork-Hint: ignore
Message-Id: <20211012201900.EB38F954D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-augeas: new package
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
Content-Type: multipart/mixed; boundary="===============5326848355133002658=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5326848355133002658==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=36395e4762485e4588a7f8bf90d6b6f2a40ba77d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lua-augeas package provides a Lua binding for augeas

https://github.com/ncopa/lua-augeas

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                       |  4 +++
 package/Config.in                                |  1 +
 package/lua-augeas/Config.in                     | 13 ++++++++++
 package/lua-augeas/lua-augeas.hash               |  3 +++
 package/lua-augeas/lua-augeas.mk                 | 33 ++++++++++++++++++++++++
 support/testing/tests/package/test_lua_augeas.py | 27 +++++++++++++++++++
 6 files changed, 81 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b23dab7aeb..643b5f1060 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1151,7 +1151,9 @@ F:	package/json-glib/
 
 N:	Hervé Codina <herve.codina@bootlin.com>
 F:	package/dtbocfg/
+F:	package/lua-augeas/
 F:	support/testing/tests/package/test_dtbocfg.py
+F:	support/testing/tests/package/test_lua_augeas.py
 
 N:	Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
 F:	package/gauche/
@@ -1986,10 +1988,12 @@ F:	configs/galileo_defconfig
 
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/bmap-tools/
+F:	package/lua-augeas/
 F:	package/php-xdebug/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
 F:	package/python-git/
+F:	support/testing/tests/package/test_lua_augeas.py
 F:	support/testing/tests/package/sample_bmap_tools.sh
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
diff --git a/package/Config.in b/package/Config.in
index ba1ee4005c..8bfceeb820 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -660,6 +660,7 @@ menu "Lua libraries/modules"
 	source "package/lpty/Config.in"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
+	source "package/lua-augeas/Config.in"
 	source "package/lua-basexx/Config.in"
 	source "package/lua-binaryheap/Config.in"
 	source "package/lua-bit32/Config.in"
diff --git a/package/lua-augeas/Config.in b/package/lua-augeas/Config.in
new file mode 100644
index 0000000000..6470033e9b
--- /dev/null
+++ b/package/lua-augeas/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LUA_AUGEAS
+	bool "lua-augeas"
+	depends on !BR2_arc # augeas
+	depends on BR2_USE_WCHAR # augeas
+	select BR2_PACKAGE_AUGEAS
+	help
+	  Lua binding for augeas library
+
+	  https://github.com/ncopa/lua-augeas
+
+comment "lua-augeas needs a toolchain w/ wchar"
+	depends on !BR2_arc
+	depends on !BR2_USE_WCHAR
diff --git a/package/lua-augeas/lua-augeas.hash b/package/lua-augeas/lua-augeas.hash
new file mode 100644
index 0000000000..07a6a676e6
--- /dev/null
+++ b/package/lua-augeas/lua-augeas.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  694fe887eebac27b558c9695042405f70a86382e92916094e7ba5f411673fbc1  lua-augeas-a6eace5116d1a711218a7c9086a4e3c4db88ee57.tar.gz
+sha256  1f5c5ee5da981332b7f73cc5a59af660b03104279e2aa21b6b86890430c3eff0  COPYRIGHT
diff --git a/package/lua-augeas/lua-augeas.mk b/package/lua-augeas/lua-augeas.mk
new file mode 100644
index 0000000000..930cf49b86
--- /dev/null
+++ b/package/lua-augeas/lua-augeas.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# lua-augeas
+#
+################################################################################
+
+LUA_AUGEAS_VERSION = a6eace5116d1a711218a7c9086a4e3c4db88ee57
+LUA_AUGEAS_SITE = $(call github,ncopa,lua-augeas,$(LUA_AUGEAS_VERSION))
+LUA_AUGEAS_LICENSE = MIT
+LUA_AUGEAS_LICENSE_FILES = COPYRIGHT
+LUA_AUGEAS_DEPENDENCIES = luainterpreter augeas host-pkgconf
+
+# LDFLAGS=$(LDFLAGS) is present to pass LDFLAGS from environment to the command
+# line. With LDFLAGS set in the command line, related ordinary asignment present
+# in the makefile are ignored and so lua-augeas makefile cannot not add '-L/lib'
+# to this value.
+LUA_AUGEAS_CONF_OPTS= \
+	PKGCONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	LDFLAGS="$(LDFLAGS)" \
+	LUA_VERSION="$(LUAINTERPRETER_ABIVER)" \
+	INSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)"
+
+define LUA_AUGEAS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(LUA_AUGEAS_CONF_OPTS) all
+endef
+
+define LUA_AUGEAS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(LUA_AUGEAS_CONF_OPTS) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_lua_augeas.py b/support/testing/tests/package/test_lua_augeas.py
new file mode 100644
index 0000000000..2a612b6d32
--- /dev/null
+++ b/support/testing/tests/package/test_lua_augeas.py
@@ -0,0 +1,27 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaAugeas(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_AUGEAS=y
+        BR2_PACKAGE_LUA_AUGEAS=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("augeas")
+
+
+class TestLuajitLuaAugeas(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_AUGEAS=y
+        BR2_PACKAGE_LUA_AUGEAS=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("augeas")

--===============5326848355133002658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5326848355133002658==--
