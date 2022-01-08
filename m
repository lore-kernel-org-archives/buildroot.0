Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649E1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0878380A80;
	Sat,  8 Jan 2022 17:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5Qesap1nWZC; Sat,  8 Jan 2022 17:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AD0381678;
	Sat,  8 Jan 2022 17:04:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 312421BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2723C80A80
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0RgdheHUbD4g for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:04:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 591BA812AC
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:04:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A627B82A9C; Sat,  8 Jan 2022 16:58:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 18:03:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c17a9b2de86ace9754ca874707736705865dd309
X-Git-Newrev: e39379ff595d189c714bb758f5da1a0882fa1a2a
X-Patchwork-Hint: ignore
Message-Id: <20220108165832.A627B82A9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-inotify: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e39379ff595d189c714bb758f5da1a0882fa1a2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                        |  1 +
 package/Config.in                                 |  1 +
 package/lua-inotify/Config.in                     |  6 ++++++
 package/lua-inotify/lua-inotify.hash              |  3 +++
 package/lua-inotify/lua-inotify.mk                | 14 +++++++++++++
 support/testing/tests/package/test_lua_inotify.py | 25 +++++++++++++++++++++++
 6 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a64a9ef384..eb605b9170 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -983,6 +983,7 @@ F:	package/libtommath/
 F:	package/libwpe/
 F:	package/linenoise/
 F:	package/ljlinenoise/
+F:	package/lua-inotify/
 F:	package/lpeg/
 F:	package/lpty/
 F:	package/lrandom/
diff --git a/package/Config.in b/package/Config.in
index bf18d5f4fb..3b1c38db47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -685,6 +685,7 @@ menu "Lua libraries/modules"
 	source "package/lua-gd/Config.in"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
+	source "package/lua-inotify/Config.in"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
diff --git a/package/lua-inotify/Config.in b/package/lua-inotify/Config.in
new file mode 100644
index 0000000000..2b0c943c60
--- /dev/null
+++ b/package/lua-inotify/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_INOTIFY
+	bool "lua-inotify"
+	help
+	  Inotify bindings for Lua.
+
+	  http://hoelz.ro/projects/linotify
diff --git a/package/lua-inotify/lua-inotify.hash b/package/lua-inotify/lua-inotify.hash
new file mode 100644
index 0000000000..183638954c
--- /dev/null
+++ b/package/lua-inotify/lua-inotify.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 9164b5777b132d7e1e073478d8837a526262991c57e32d75d517100f533eb436  inotify-0.5-1.src.rock
+sha256 b02158adb3c7763e1183a9386672f4f037bfeaab0cb0c73d684f34f3ea1993d8  linotify-0.5/COPYRIGHT
diff --git a/package/lua-inotify/lua-inotify.mk b/package/lua-inotify/lua-inotify.mk
new file mode 100644
index 0000000000..dde7fc0fa4
--- /dev/null
+++ b/package/lua-inotify/lua-inotify.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-inotify
+#
+################################################################################
+
+LUA_INOTIFY_VERSION_UPSTREAM = 0.5
+LUA_INOTIFY_VERSION = $(LUA_INOTIFY_VERSION_UPSTREAM)-1
+LUA_INOTIFY_NAME_UPSTREAM = inotify
+LUA_INOTIFY_SUBDIR = linotify-$(LUA_INOTIFY_VERSION_UPSTREAM)
+LUA_INOTIFY_LICENSE = MIT
+LUA_INOTIFY_LICENSE_FILES = $(LUA_INOTIFY_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_inotify.py b/support/testing/tests/package/test_lua_inotify.py
new file mode 100644
index 0000000000..c951a9c5d6
--- /dev/null
+++ b/support/testing/tests/package/test_lua_inotify.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaInotify(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_INOTIFY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("inotify")
+
+
+class TestLuajitInotify(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_INOTIFY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("inotify")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
