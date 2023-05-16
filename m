Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8400C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 20:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8148184110;
	Tue, 16 May 2023 20:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8148184110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wl1-Vb7J_7rq; Tue, 16 May 2023 20:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF7B684187;
	Tue, 16 May 2023 20:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF7B684187
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2DE21BF426
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89AF484187
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89AF484187
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNhAt3Y-Lqub for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 20:51:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A47898406A
 for <buildroot@buildroot.org>; Tue, 16 May 2023 20:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A47898406A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 909C6867AB; Tue, 16 May 2023 20:51:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 20:53:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd5afab7b643997e89e1804de686a3935f8dd724
X-Git-Newrev: 603df32a0cd416caa2d2688008cb87f14ad68ef3
X-Patchwork-Hint: ignore
Message-Id: <20230516205110.909C6867AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua: bump to version 5.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=603df32a0cd416caa2d2688008cb87f14ad68ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                         | 6 +++---
 package/lua/5.4.5/lua.hash                                  | 5 -----
 package/lua/{5.4.5 => 5.4.6}/0001-root-path.patch           | 0
 package/lua/{5.4.5 => 5.4.6}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.5 => 5.4.6}/0011-linenoise.patch           | 0
 package/lua/5.4.6/lua.hash                                  | 5 +++++
 package/lua/lua.mk                                          | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 13f67695f5..947f4606aa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -949,9 +949,9 @@ package/lua/5.1.5/0012-fix-reader-at-eoz.patch Upstream
 package/lua/5.3.6/0001-root-path.patch Upstream
 package/lua/5.3.6/0002-shared-libs-for-lua.patch Upstream
 package/lua/5.3.6/0003-linenoise.patch Upstream
-package/lua/5.4.5/0001-root-path.patch Upstream
-package/lua/5.4.5/0002-shared-libs-for-lua.patch Upstream
-package/lua/5.4.5/0011-linenoise.patch Upstream
+package/lua/5.4.6/0001-root-path.patch Upstream
+package/lua/5.4.6/0002-shared-libs-for-lua.patch Upstream
+package/lua/5.4.6/0011-linenoise.patch Upstream
 package/luajit/0001-no-bin-symlink.patch Upstream
 package/luajit/0002-install-inc.patch Upstream
 package/luasyslog/0001-remove-AX_LUA_LIBS.patch Upstream
diff --git a/package/lua/5.4.5/lua.hash b/package/lua/5.4.5/lua.hash
deleted file mode 100644
index 5526cd5125..0000000000
--- a/package/lua/5.4.5/lua.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-sha256  59df426a3d50ea535a460a452315c4c0d4e1121ba72ff0bdde58c2ef31d6f444  lua-5.4.5.tar.gz
-
-# Locally computed
-sha256  0d4ee721cf740f9cd878ef82ef75f4f2724dcf0403e56cd0b5643ad88f9de337  doc/readme.html
diff --git a/package/lua/5.4.5/0001-root-path.patch b/package/lua/5.4.6/0001-root-path.patch
similarity index 100%
rename from package/lua/5.4.5/0001-root-path.patch
rename to package/lua/5.4.6/0001-root-path.patch
diff --git a/package/lua/5.4.5/0002-shared-libs-for-lua.patch b/package/lua/5.4.6/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.5/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.6/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.5/0011-linenoise.patch b/package/lua/5.4.6/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.4.5/0011-linenoise.patch
rename to package/lua/5.4.6/0011-linenoise.patch
diff --git a/package/lua/5.4.6/lua.hash b/package/lua/5.4.6/lua.hash
new file mode 100644
index 0000000000..0b03fd563c
--- /dev/null
+++ b/package/lua/5.4.6/lua.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://www.lua.org/ftp/
+sha256  7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88  lua-5.4.6.tar.gz
+
+# Locally computed
+sha256  8f1bff27c5b0585ab679dbe4e37e75a1014af0f79732f42a79f86728321a0c6d  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index ecb86c11ed..93d4803812 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.5
+LUA_VERSION = 5.4.6
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
