Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94277C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43AF441764;
	Wed, 22 Feb 2023 17:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43AF441764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFNdJ8CE1Ap3; Wed, 22 Feb 2023 17:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76F5141763;
	Wed, 22 Feb 2023 17:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76F5141763
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B12E1BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 261A340E47
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 261A340E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iT27Fjnjyx0i for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23D0840F4E
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23D0840F4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C995867D2; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:48:16 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 35b29aaa3cf1feb67fea1d4ac17d8185d95d1d6c
X-Git-Newrev: 768ecb25b245feb5b1269f2b449590486e843401
X-Patchwork-Hint: ignore
Message-Id: <20230222170819.0C995867D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/lua: properly
 handle legacy for removed version
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

commit: https://git.buildroot.net/buildroot/commit/?id=768ecb25b245feb5b1269f2b449590486e843401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit "297613f1c7 package/lua: remove 5.2.x version" tried to add
legacy handling but the new symbols are part of a choice, and Kconfig
does not enforce the select of a option from a choice.

Update the legacy entry for 2019.02, following the example described in
the beginning of the file.

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f461543d9c0f8ea1586004e51561ba0a37b8aecf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy      | 2 +-
 package/lua/Config.in | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6c3384f445..5758d408f6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -2108,9 +2108,9 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 config BR2_PACKAGE_LUA_5_2
 	bool "Lua 5.2.x version removed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_LUA_5_3
 	help
 	  The Lua 5.2.x version was removed.
+# Note: BR2_PACKAGE_LUA_5_2 is still referenced from package/lua/Config.in
 
 config BR2_TARGET_GENERIC_PASSWD_MD5
 	bool "target passwd md5 format support has been removed"
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 309dd6eec2..8fa9f9b7ab 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 
 choice
 	prompt "Lua Version"
+	default BR2_PACKAGE_LUA_5_3 if BR2_PACKAGE_LUA_5_2 # legacy
 	default BR2_PACKAGE_LUA_5_4
 	help
 	  Select the version of Lua API/ABI you wish to use.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
