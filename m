Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FA8C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:27:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E42C60F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E42C60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDCEB404FA;
	Tue,  3 Aug 2021 23:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdMbQo1-xx6y; Tue,  3 Aug 2021 23:27:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9F184051F;
	Tue,  3 Aug 2021 23:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFC691BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B93040681
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Du7jZYAUHbM for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CEEE4068C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 713EF86A84; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 13 Jul 2021 22:19:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7ecbb956e2c6a6dd42126657e05e86072f3fc140
X-Git-Newrev: d3e2e7e9a67b4097b42d827e96f872423daca622
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.713EF86A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-lunix: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3e2e7e9a67b4097b42d827e96f872423daca622
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                               |  1 +
 package/lua-lunix/0001-fix-with-uClibc.patch    | 28 +++++++++++++++++++++++++
 package/lua-lunix/Config.in                     |  6 ++++++
 package/lua-lunix/lua-lunix.hash                |  3 +++
 package/lua-lunix/lua-lunix.mk                  | 14 +++++++++++++
 support/testing/tests/package/test_lua_lunix.py | 25 ++++++++++++++++++++++
 6 files changed, 77 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 22947edf2c..e883cf3780 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -679,6 +679,7 @@ menu "Lua libraries/modules"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
 	source "package/lua-lunitx/Config.in"
+	source "package/lua-lunix/Config.in"
 	source "package/lua-lyaml/Config.in"
 	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
diff --git a/package/lua-lunix/0001-fix-with-uClibc.patch b/package/lua-lunix/0001-fix-with-uClibc.patch
new file mode 100644
index 0000000000..236eec47a1
--- /dev/null
+++ b/package/lua-lunix/0001-fix-with-uClibc.patch
@@ -0,0 +1,28 @@
+From ee41d97a80b978f54941ac6857c00b8a8f28de24 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 6 Jun 2021 17:55:06 +0200
+Subject: [PATCH] fix with uClibc
+
+uClibc doesn't have is no sys_siglist.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ lunix-rel-20170920/src/unix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lunix-rel-20170920/src/unix.c b/lunix-rel-20170920/src/unix.c
+index 5f3a70a..e561ab2 100644
+--- a/lunix-rel-20170920/src/unix.c
++++ b/lunix-rel-20170920/src/unix.c
+@@ -438,7 +438,7 @@
+ #endif
+ 
+ #ifndef HAVE_SYS_SIGLIST
+-#define HAVE_SYS_SIGLIST (!MUSL_MAYBE && !__sun && !_AIX)
++#define HAVE_SYS_SIGLIST (!MUSL_MAYBE && !__sun && !_AIX && !__UCLIBC__)
+ #endif
+ 
+ #ifndef HAVE_UNLINKAT
+-- 
+2.30.2
+
diff --git a/package/lua-lunix/Config.in b/package/lua-lunix/Config.in
new file mode 100644
index 0000000000..ca9325a156
--- /dev/null
+++ b/package/lua-lunix/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_LUNIX
+	bool "lua-lunix"
+	help
+	  lunix is a bindings library module to common Unix system APIs.
+
+	  http://25thandclement.com/~william/projects/lunix.html
diff --git a/package/lua-lunix/lua-lunix.hash b/package/lua-lunix/lua-lunix.hash
new file mode 100644
index 0000000000..3cbf3481b5
--- /dev/null
+++ b/package/lua-lunix/lua-lunix.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 4a4007b394ae884e18e9d0319ea584e8b4a682d7bf8fa5b99c7eea9baf1e5ed6  lunix-20170920-1.src.rock
+sha256 9b74be104d59caa45bf3321ebe771f9cc7874209261a93f1cf971ceca44fbe03  lunix-rel-20170920/LICENSE
diff --git a/package/lua-lunix/lua-lunix.mk b/package/lua-lunix/lua-lunix.mk
new file mode 100644
index 0000000000..28cb2dc411
--- /dev/null
+++ b/package/lua-lunix/lua-lunix.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-lunix
+#
+################################################################################
+
+LUA_LUNIX_VERSION_UPSTREAM = 20170920
+LUA_LUNIX_VERSION = $(LUA_LUNIX_VERSION_UPSTREAM)-1
+LUA_LUNIX_NAME_UPSTREAM = lunix
+LUA_LUNIX_SUBDIR = lunix-rel-$(LUA_LUNIX_VERSION_UPSTREAM)
+LUA_LUNIX_LICENSE = MIT
+LUA_LUNIX_LICENSE_FILES = $(LUA_LUNIX_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_lunix.py b/support/testing/tests/package/test_lua_lunix.py
new file mode 100644
index 0000000000..ae0e3b260d
--- /dev/null
+++ b/support/testing/tests/package/test_lua_lunix.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLunix(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_LUNIX=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("unix")
+
+
+class TestLuajitLunix(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_LUNIX=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("unix")
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
