Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4307C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 946C9408AD;
	Mon, 15 Jul 2024 14:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmH1oSQK5l_9; Mon, 15 Jul 2024 14:44:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42942403FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42942403FC;
	Mon, 15 Jul 2024 14:44:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D527B1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C10CD80B4F
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vg39b1AQ0zEV for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E98580B25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E98580B25
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:44:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82ECC86CD6; Mon, 15 Jul 2024 14:44:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 16:43:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69cbb563a124002fcb3e2725c3516b502587f9cc
X-Git-Newrev: d501775773c473dd2ece04c23dbfa8c74706d19c
X-Patchwork-Hint: ignore
Message-Id: <20240715144416.82ECC86CD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua: bump to version 5.4.7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d501775773c473dd2ece04c23dbfa8c74706d19c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                                 | 6 +++---
 package/lua/5.4.6/lua.hash                                          | 5 -----
 package/lua/{5.4.6 => 5.4.7}/0001-root-path.patch                   | 0
 package/lua/{5.4.6 => 5.4.7}/0002-shared-libs-for-lua.patch         | 0
 .../lua/{5.4.6/0011-linenoise.patch => 5.4.7/0003-linenoise.patch}  | 2 +-
 package/lua/5.4.7/lua.hash                                          | 5 +++++
 package/lua/lua.mk                                                  | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0613483a13..50fd71663e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -894,9 +894,9 @@ package/lua/5.1.5/0012-fix-reader-at-eoz.patch lib_patch.Upstream
 package/lua/5.3.6/0001-root-path.patch lib_patch.Upstream
 package/lua/5.3.6/0002-shared-libs-for-lua.patch lib_patch.Upstream
 package/lua/5.3.6/0003-linenoise.patch lib_patch.Upstream
-package/lua/5.4.6/0001-root-path.patch lib_patch.Upstream
-package/lua/5.4.6/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.4.6/0011-linenoise.patch lib_patch.Upstream
+package/lua/5.4.7/0001-root-path.patch lib_patch.Upstream
+package/lua/5.4.7/0002-shared-libs-for-lua.patch lib_patch.Upstream
+package/lua/5.4.7/0003-linenoise.patch lib_patch.Upstream
 package/luajit/0001-no-bin-symlink.patch lib_patch.Upstream
 package/luajit/0002-install-inc.patch lib_patch.Upstream
 package/luasyslog/0001-remove-AX_LUA_LIBS.patch lib_patch.Upstream
diff --git a/package/lua/5.4.6/lua.hash b/package/lua/5.4.6/lua.hash
deleted file mode 100644
index 0b03fd563c..0000000000
--- a/package/lua/5.4.6/lua.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-sha256  7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88  lua-5.4.6.tar.gz
-
-# Locally computed
-sha256  8f1bff27c5b0585ab679dbe4e37e75a1014af0f79732f42a79f86728321a0c6d  doc/readme.html
diff --git a/package/lua/5.4.6/0001-root-path.patch b/package/lua/5.4.7/0001-root-path.patch
similarity index 100%
rename from package/lua/5.4.6/0001-root-path.patch
rename to package/lua/5.4.7/0001-root-path.patch
diff --git a/package/lua/5.4.6/0002-shared-libs-for-lua.patch b/package/lua/5.4.7/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.6/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.7/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.6/0011-linenoise.patch b/package/lua/5.4.7/0003-linenoise.patch
similarity index 97%
rename from package/lua/5.4.6/0011-linenoise.patch
rename to package/lua/5.4.7/0003-linenoise.patch
index 5054ae19e2..2fcbc49f6a 100644
--- a/package/lua/5.4.6/0011-linenoise.patch
+++ b/package/lua/5.4.7/0003-linenoise.patch
@@ -8,7 +8,7 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -438,6 +438,14 @@
+@@ -447,6 +447,14 @@
  #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
  
diff --git a/package/lua/5.4.7/lua.hash b/package/lua/5.4.7/lua.hash
new file mode 100644
index 0000000000..d67fdcf6cf
--- /dev/null
+++ b/package/lua/5.4.7/lua.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://www.lua.org/ftp/
+sha256  9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30  lua-5.4.7.tar.gz
+
+# Locally computed
+sha256  33a975a766520bc54de2d71e45442e504effa0519e331e31ee3fc46eca4f98bd  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 93d4803812..15772dbdf3 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.6
+LUA_VERSION = 5.4.7
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
