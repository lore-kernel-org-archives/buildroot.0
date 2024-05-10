Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0ABC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AADEF423FA;
	Fri, 10 May 2024 20:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEtbMLqsxnFA; Fri, 10 May 2024 20:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 241D842435
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 241D842435;
	Fri, 10 May 2024 20:07:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAAA01BF995
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A71F040492
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtVnwiFN69bJ for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D420940327
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D420940327
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:07:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C04EC86EC4; Fri, 10 May 2024 20:07:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 22:01:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb60c4054c25129d78651a66d1e7554aff04767f
X-Git-Newrev: 9f841969867fcd14a204780dd03403b66731d9b2
X-Patchwork-Hint: ignore
Message-Id: <20240510200701.C04EC86EC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lightningmdb: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9f841969867fcd14a204780dd03403b66731d9b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                      |  1 +
 package/lua-lightningmdb/Config.in                     | 13 +++++++++++++
 package/lua-lightningmdb/lua-lightningmdb.hash         |  3 +++
 package/lua-lightningmdb/lua-lightningmdb.mk           | 14 ++++++++++++++
 support/testing/tests/package/test_lua_lightningmdb.py | 13 +++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 14e016daf3..190b100609 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -747,6 +747,7 @@ menu "Lua libraries/modules"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-inotify/Config.in"
 	source "package/lua-lgdbm/Config.in"
+	source "package/lua-lightningmdb/Config.in"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
diff --git a/package/lua-lightningmdb/Config.in b/package/lua-lightningmdb/Config.in
new file mode 100644
index 0000000000..cd08cfbe79
--- /dev/null
+++ b/package/lua-lightningmdb/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LUA_LIGHTNINGMDB
+	bool "lua-lightningmdb"
+	depends on !BR2_PACKAGE_LUAJIT
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lmdb
+	select BR2_PACKAGE_LMDB
+	help
+	  A thin wrapper around OpenLDAP Lightning Memory-Mapped
+	  Database (LMDB).
+
+	  https://github.com/shmul/lightningmdb
+
+comment "lua-lightningmdb needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-lightningmdb/lua-lightningmdb.hash b/package/lua-lightningmdb/lua-lightningmdb.hash
new file mode 100644
index 0000000000..49ac7ea09c
--- /dev/null
+++ b/package/lua-lightningmdb/lua-lightningmdb.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  d836709e8a1374eb8913f0e9787bb3f0fc4d49b29e01112691b619f7d1355f8c  lightningmdb-0.9.22.1-1.src.rock
+sha256  3d0562e11bc52bf45a735e1d60c6f8522886927a8bcfbe7dee219a61ec30b07a  lightningmdb-0.9.22.1-1/LICENSE
diff --git a/package/lua-lightningmdb/lua-lightningmdb.mk b/package/lua-lightningmdb/lua-lightningmdb.mk
new file mode 100644
index 0000000000..f70cbc4b06
--- /dev/null
+++ b/package/lua-lightningmdb/lua-lightningmdb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-lightningmdb
+#
+################################################################################
+
+LUA_LIGHTNINGMDB_VERSION = 0.9.22.1-1
+LUA_LIGHTNINGMDB_NAME_UPSTREAM = Lightningmdb
+LUA_LIGHTNINGMDB_SUBDIR = lightningmdb-$(LUA_LIGHTNINGMDB_VERSION)
+LUA_LIGHTNINGMDB_LICENSE = MIT
+LUA_LIGHTNINGMDB_LICENSE_FILES = $(LUA_LIGHTNINGMDB_SUBDIR)/LICENSE
+LUA_LIGHTNINGMDB_DEPENDENCIES = lmdb
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_lightningmdb.py b/support/testing/tests/package/test_lua_lightningmdb.py
new file mode 100644
index 0000000000..cc5b82043b
--- /dev/null
+++ b/support/testing/tests/package/test_lua_lightningmdb.py
@@ -0,0 +1,13 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLightningmdb(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_LIGHTNINGMDB=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lightningmdb")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
