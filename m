Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BE4C7115A
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 20:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A497760848;
	Sun, 15 Jun 2025 20:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZH8lweoUaq0z; Sun, 15 Jun 2025 20:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D90C9607D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D90C9607D7;
	Sun, 15 Jun 2025 20:45:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C396E151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1094401E9
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EsGCzUEuGhV for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 20:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5EFF401CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5EFF401CB
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:45:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B08C48398E; Sun, 15 Jun 2025 20:45:25 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 22:44:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30e4f03e90ee3dacb59cd1e184e4ef3b0341ceab
X-Git-Newrev: 393d7e4d2197696bf0df7c83dc1dd97e3f6253bb
X-Patchwork-Hint: ignore
Message-Id: <20250615204525.B08C48398E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua: bump to version 5.4.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=393d7e4d2197696bf0df7c83dc1dd97e3f6253bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For differences with 5.4.7, see:
https://www.lua.org/work/diffs-lua-5.4.7-lua-5.4.8.html

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to diff with previous version]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua/5.4.7/lua.hash                                  | 5 -----
 package/lua/{5.4.7 => 5.4.8}/0001-root-path.patch           | 0
 package/lua/{5.4.7 => 5.4.8}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.7 => 5.4.8}/0003-linenoise.patch           | 0
 package/lua/5.4.8/lua.hash                                  | 5 +++++
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/lua/5.4.7/lua.hash b/package/lua/5.4.7/lua.hash
deleted file mode 100644
index d67fdcf6cf..0000000000
--- a/package/lua/5.4.7/lua.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-sha256  9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30  lua-5.4.7.tar.gz
-
-# Locally computed
-sha256  33a975a766520bc54de2d71e45442e504effa0519e331e31ee3fc46eca4f98bd  doc/readme.html
diff --git a/package/lua/5.4.7/0001-root-path.patch b/package/lua/5.4.8/0001-root-path.patch
similarity index 100%
rename from package/lua/5.4.7/0001-root-path.patch
rename to package/lua/5.4.8/0001-root-path.patch
diff --git a/package/lua/5.4.7/0002-shared-libs-for-lua.patch b/package/lua/5.4.8/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.7/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.8/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.7/0003-linenoise.patch b/package/lua/5.4.8/0003-linenoise.patch
similarity index 100%
rename from package/lua/5.4.7/0003-linenoise.patch
rename to package/lua/5.4.8/0003-linenoise.patch
diff --git a/package/lua/5.4.8/lua.hash b/package/lua/5.4.8/lua.hash
new file mode 100644
index 0000000000..8494511529
--- /dev/null
+++ b/package/lua/5.4.8/lua.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://www.lua.org/ftp/
+sha256  4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae  lua-5.4.8.tar.gz
+
+# Locally computed
+sha256  3773a4900f3539c56aea9d6cd48d71c8751d495c4abc28472706bb9553d1493c  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 15772dbdf3..455b7e58b2 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.7
+LUA_VERSION = 5.4.8
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
