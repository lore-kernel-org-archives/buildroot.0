Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875FFCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 529BE4188F;
	Wed,  3 Apr 2024 21:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0rQabC4j1cK; Wed,  3 Apr 2024 21:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E87B141899
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E87B141899;
	Wed,  3 Apr 2024 21:12:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E4FC1BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE4F82268
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TL6v5YbwCi0h for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C6682267
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57C6682267
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:12:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F5FF84AD2; Wed,  3 Apr 2024 21:12:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 23:12:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 338acb27ff3e07560290085d7c6a2feab633c869
X-Git-Newrev: b31443e09cb7bb67b97ae6fb7614fe3a22889d50
X-Patchwork-Hint: ignore
Message-Id: <20240403211230.4F5FF84AD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lgdbm: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b31443e09cb7bb67b97ae6fb7614fe3a22889d50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998@free.fr: propagate gdbm deps, fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                               |  1 +
 package/lua-lgdbm/Config.in                     | 15 +++++++++++++++
 package/lua-lgdbm/lua-lgdbm.hash                |  2 ++
 package/lua-lgdbm/lua-lgdbm.mk                  | 13 +++++++++++++
 support/testing/tests/package/test_lua_lgdbm.py | 13 +++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 60d8947778..0d31faf354 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -747,6 +747,7 @@ menu "Lua libraries/modules"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-inotify/Config.in"
+	source "package/lua-lgdbm/Config.in"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
diff --git a/package/lua-lgdbm/Config.in b/package/lua-lgdbm/Config.in
new file mode 100644
index 0000000000..5d8636aff4
--- /dev/null
+++ b/package/lua-lgdbm/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LUA_LGDBM
+	bool "lua-lgdbm"
+	depends on BR2_USE_MMU  # gdbm
+	depends on BR2_USE_WCHAR  #gdbm
+	depends on BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4
+	select BR2_PACKAGE_GDBM
+	help
+	  A database library for Lua using GDBM.
+
+	  http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lgdbm
+
+comment "lua-lgdbm needs needs a toolchain with wchar, Lua >= 5.3"
+	depends on !BR2_USE_MMU
+	depends on !(BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4) \
+		|| !BR2_USE_WCHAR
diff --git a/package/lua-lgdbm/lua-lgdbm.hash b/package/lua-lgdbm/lua-lgdbm.hash
new file mode 100644
index 0000000000..06f22f1509
--- /dev/null
+++ b/package/lua-lgdbm/lua-lgdbm.hash
@@ -0,0 +1,2 @@
+# computed by luarocks/buildroot
+sha256  8cb7e25254b1c9889894654f6cf26d09f2c2ee10fe966f45152eb5deb0a24f9b  lgdbm-20211118.52-0.src.rock
diff --git a/package/lua-lgdbm/lua-lgdbm.mk b/package/lua-lgdbm/lua-lgdbm.mk
new file mode 100644
index 0000000000..35ca9c93f4
--- /dev/null
+++ b/package/lua-lgdbm/lua-lgdbm.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-lgdbm
+#
+################################################################################
+
+LUA_LGDBM_VERSION = 20211118.52-0
+LUA_LGDBM_NAME_UPSTREAM = lgdbm
+LUA_LGDBM_SUBDIR = gdbm
+LUA_LGDBM_LICENSE = Public Domain
+LUA_LGDBM_DEPENDENCIES = gdbm
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_lgdbm.py b/support/testing/tests/package/test_lua_lgdbm.py
new file mode 100644
index 0000000000..4ccf759992
--- /dev/null
+++ b/support/testing/tests/package/test_lua_lgdbm.py
@@ -0,0 +1,13 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLgdbm(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_LGDBM=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("gdbm")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
