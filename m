Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E787C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6596F408CF;
	Mon, 15 Jul 2024 14:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmfSxlWd4grN; Mon, 15 Jul 2024 14:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E53B7408AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E53B7408AD;
	Mon, 15 Jul 2024 14:44:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9C511BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B39F880B82
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHr1eDmNGGCF for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C010980B4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C010980B4F
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:44:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA35186CD6; Mon, 15 Jul 2024 14:44:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 16:43:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d501775773c473dd2ece04c23dbfa8c74706d19c
X-Git-Newrev: 52df03ba50c2b7bc473650015ccebd67216cc8bf
X-Patchwork-Hint: ignore
Message-Id: <20240715144416.BA35186CD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua: use Upstream: tag in patches
 that are upstream
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

commit: https://git.buildroot.net/buildroot/commit/?id=52df03ba50c2b7bc473650015ccebd67216cc8bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                            | 4 ----
 package/lua/5.1.5/0011-linenoise.patch         | 3 +--
 package/lua/5.1.5/0012-fix-reader-at-eoz.patch | 3 +--
 package/lua/5.3.6/0003-linenoise.patch         | 3 +--
 package/lua/5.4.7/0003-linenoise.patch         | 3 +--
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 50fd71663e..7a76b57f0f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -889,14 +889,10 @@ package/lua-sdl2/0001-Do-not-reference-host-directory-for-headers.patch lib_patc
 package/lua-sdl2/0002-CMakeLists-do-not-require-C.patch lib_patch.Upstream
 package/lua/5.1.5/0001-root-path.patch lib_patch.Upstream
 package/lua/5.1.5/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.1.5/0011-linenoise.patch lib_patch.Upstream
-package/lua/5.1.5/0012-fix-reader-at-eoz.patch lib_patch.Upstream
 package/lua/5.3.6/0001-root-path.patch lib_patch.Upstream
 package/lua/5.3.6/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.3.6/0003-linenoise.patch lib_patch.Upstream
 package/lua/5.4.7/0001-root-path.patch lib_patch.Upstream
 package/lua/5.4.7/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.4.7/0003-linenoise.patch lib_patch.Upstream
 package/luajit/0001-no-bin-symlink.patch lib_patch.Upstream
 package/luajit/0002-install-inc.patch lib_patch.Upstream
 package/luasyslog/0001-remove-AX_LUA_LIBS.patch lib_patch.Upstream
diff --git a/package/lua/5.1.5/0011-linenoise.patch b/package/lua/5.1.5/0011-linenoise.patch
index 488c080a1e..c0ab200bd8 100644
--- a/package/lua/5.1.5/0011-linenoise.patch
+++ b/package/lua/5.1.5/0011-linenoise.patch
@@ -1,7 +1,6 @@
 Add support of linenoise (replace readline)
 
-see discussion, http://lua-users.org/lists/lua-l/2010-03/msg00879.html
-
+Upstream: http://lua-users.org/lists/lua-l/2010-03/msg00879.html
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/luaconf.h
diff --git a/package/lua/5.1.5/0012-fix-reader-at-eoz.patch b/package/lua/5.1.5/0012-fix-reader-at-eoz.patch
index 17a28ba4c3..fd92147ea5 100644
--- a/package/lua/5.1.5/0012-fix-reader-at-eoz.patch
+++ b/package/lua/5.1.5/0012-fix-reader-at-eoz.patch
@@ -1,7 +1,6 @@
 When loading a file, Lua may call the reader function again after it returned end of input.
 
-Fetch from: http://www.lua.org/bugs.html#5.1.5-2
-
+Upstream: https://www.lua.org/bugs.html#5.1.5-2
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/lzio.c
diff --git a/package/lua/5.3.6/0003-linenoise.patch b/package/lua/5.3.6/0003-linenoise.patch
index 574e6c8f0b..495177c32d 100644
--- a/package/lua/5.3.6/0003-linenoise.patch
+++ b/package/lua/5.3.6/0003-linenoise.patch
@@ -1,7 +1,6 @@
 Add support of linenoise (replace readline)
 
-see discussion, http://lua-users.org/lists/lua-l/2010-03/msg00879.html
-
+Upstream: http://lua-users.org/lists/lua-l/2010-03/msg00879.html
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/lua.c
diff --git a/package/lua/5.4.7/0003-linenoise.patch b/package/lua/5.4.7/0003-linenoise.patch
index 2fcbc49f6a..a82c8801ad 100644
--- a/package/lua/5.4.7/0003-linenoise.patch
+++ b/package/lua/5.4.7/0003-linenoise.patch
@@ -1,7 +1,6 @@
 Add support of linenoise (replace readline)
 
-see discussion, http://lua-users.org/lists/lua-l/2010-03/msg00879.html
-
+Upstream: http://lua-users.org/lists/lua-l/2010-03/msg00879.html
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/lua.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
