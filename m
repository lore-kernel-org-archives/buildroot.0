Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9244C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:08:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA6D760F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA6D760F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84A8A415DC;
	Tue,  3 Aug 2021 23:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImmV-b5gO7Bo; Tue,  3 Aug 2021 23:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD5104049A;
	Tue,  3 Aug 2021 23:08:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15C6F1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C66984066B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5rAw0RYsPCl for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20F264046D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 71F6F8674F; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Jun 2021 22:31:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 01bc4fb2f11d88489e99dd97fbcb2eabd4ff982f
X-Git-Newrev: b4fd87f9938efa5ce0b45dfec5505cf62e5d7e42
X-Patchwork-Hint: ignore
Message-Id: <20210803210952.71F6F8674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-zlib: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b4fd87f9938efa5ce0b45dfec5505cf62e5d7e42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This module is only partially compatible with lzlib (which is no longer
maintained).

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998@free.fr: amend commit log about limited compatibility]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                              |  1 +
 package/lua-zlib/Config.in                     | 10 ++++++++++
 package/lua-zlib/lua-zlib.hash                 |  2 ++
 package/lua-zlib/lua-zlib.mk                   | 12 ++++++++++++
 support/testing/tests/package/test_lua_zlib.py | 25 +++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e42f579494..388f8c1f05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -693,6 +693,7 @@ menu "Lua libraries/modules"
 	source "package/lua-testmore/Config.in"
 	source "package/lua-utf8/Config.in"
 	source "package/lua-valua/Config.in"
+	source "package/lua-zlib/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luadbi/Config.in"
 	source "package/luadbi-sqlite3/Config.in"
diff --git a/package/lua-zlib/Config.in b/package/lua-zlib/Config.in
new file mode 100644
index 0000000000..ffdb4a8e66
--- /dev/null
+++ b/package/lua-zlib/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LUA_ZLIB
+	bool "lua-zlib"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Simple streaming interface to zlib for Lua.
+	  Consists of two functions: inflate and deflate.
+	  Both functions return "stream functions" (takes a buffer
+	  of input and returns a buffer of output).
+
+	  https://github.com/brimworks/lua-zlib
diff --git a/package/lua-zlib/lua-zlib.hash b/package/lua-zlib/lua-zlib.hash
new file mode 100644
index 0000000000..8c108b39ae
--- /dev/null
+++ b/package/lua-zlib/lua-zlib.hash
@@ -0,0 +1,2 @@
+# computed by luarocks/buildroot
+sha256 42436ba2b78c9a2d515d6da59ceb12cdea7f84c9ce3c859d91addb42badd4061  lua-zlib-1.2-0.src.rock
diff --git a/package/lua-zlib/lua-zlib.mk b/package/lua-zlib/lua-zlib.mk
new file mode 100644
index 0000000000..23e2a8ae32
--- /dev/null
+++ b/package/lua-zlib/lua-zlib.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-zlib
+#
+################################################################################
+
+LUA_ZLIB_VERSION = 1.2-0
+LUA_ZLIB_SUBDIR = lua-zlib
+LUA_ZLIB_LICENSE = MIT
+LUA_ZLIB_DEPENDENCIES = zlib
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_zlib.py b/support/testing/tests/package/test_lua_zlib.py
new file mode 100644
index 0000000000..6089daa2e8
--- /dev/null
+++ b/support/testing/tests/package/test_lua_zlib.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuazlib(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_ZLIB=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("zlib")
+
+
+class TestLuajitLuazlib(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_ZLIB=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("zlib")
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
