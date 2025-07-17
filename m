Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64A8C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83859416B7;
	Thu, 17 Jul 2025 20:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rd7Y8f_KtYDs; Thu, 17 Jul 2025 20:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8549341602
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8549341602;
	Thu, 17 Jul 2025 20:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E0DE226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F9D140142
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HosnFaR9yYSu for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57BE940042
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57BE940042
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51AA586762; Thu, 17 Jul 2025 20:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 22:43:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1796c4e405987d37501cb0deae5c2c2ebdba7007
X-Git-Newrev: 4149871af19dbe88d95801f557866474120febfc
X-Patchwork-Hint: ignore
Message-Id: <20250717204742.51AA586762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lrexlib-pcre2: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4149871af19dbe88d95801f557866474120febfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/Config.in                                  |  1 +
 package/lua-lrexlib-pcre2/Config.in                |  7 ++++++
 package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash   |  3 +++
 package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk     | 14 ++++++++++++
 .../tests/package/test_lua_lrexlib_pcre2.py        | 25 ++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9a841082c6..f8f03f1eef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -762,6 +762,7 @@ menu "Lua libraries/modules"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
+	source "package/lua-lrexlib-pcre2/Config.in"
 	source "package/lua-lsdbus/Config.in"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-lunix/Config.in"
diff --git a/package/lua-lrexlib-pcre2/Config.in b/package/lua-lrexlib-pcre2/Config.in
new file mode 100644
index 0000000000..0d73ee8d6e
--- /dev/null
+++ b/package/lua-lrexlib-pcre2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_LREXLIB_PCRE2
+	bool "lua-lrexlib-pcre2"
+	select BR2_PACKAGE_PCRE2
+	help
+	  Regular expression library binding (PCRE2 flavour).
+
+	  https://github.com/rrthomas/lrexlib
diff --git a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
new file mode 100644
index 0000000000..090b83d48a
--- /dev/null
+++ b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  9bb1cb2f307eb70d66fdab499864de732c891aace0ceb6a338194e2e6631b9c3  lrexlib-pcre2-2.9.2-1.src.rock
+sha256  067992fa7c5866e01d6c8fe93dfa1e1456a6ac81fa59ccdc72f5adcd6e5b3690  lrexlib/LICENSE
diff --git a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
new file mode 100644
index 0000000000..3d0c3c57fc
--- /dev/null
+++ b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-lrexlib-pcre2
+#
+################################################################################
+
+LUA_LREXLIB_PCRE2_VERSION = 2.9.2-1
+LUA_LREXLIB_PCRE2_NAME_UPSTREAM = Lrexlib-PCRE2
+LUA_LREXLIB_PCRE2_SUBDIR = lrexlib
+LUA_LREXLIB_PCRE2_LICENSE = MIT
+LUA_LREXLIB_PCRE2_LICENSE_FILES = $(LUA_LREXLIB_PCRE2_SUBDIR)/LICENSE
+LUA_LREXLIB_PCRE2_DEPENDENCIES = pcre2
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_lrexlib_pcre2.py b/support/testing/tests/package/test_lua_lrexlib_pcre2.py
new file mode 100644
index 0000000000..07a1a3e03b
--- /dev/null
+++ b/support/testing/tests/package/test_lua_lrexlib_pcre2.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLrexlibPCRE2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_LREXLIB_PCRE2=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("rex_pcre2")
+
+
+class TestLuajitLrexlibPCRE2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_LREXLIB_PCRE2=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("rex_pcre2")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
