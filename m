Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5AFC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB594F0A2;
	Tue, 21 Feb 2023 00:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BB594F0A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESAGdtzTCvCJ; Tue, 21 Feb 2023 00:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C6A44F16E;
	Tue, 21 Feb 2023 00:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C6A44F16E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE5181BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 726FF417BC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 726FF417BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ine0tzpkqMl for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0FDB417B7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0FDB417B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A75AF8648F; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eb8f38891b16e5fb0f010c658b271e22670a1633
X-Git-Newrev: f461543d9c0f8ea1586004e51561ba0a37b8aecf
X-Patchwork-Hint: ignore
Message-Id: <20230220205249.A75AF8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua: properly handle
 legacy for removed version
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

commit: https://git.buildroot.net/buildroot/commit/?id=f461543d9c0f8ea1586004e51561ba0a37b8aecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit "297613f1c7 package/lua: remove 5.2.x version" tried to add
legacy handling but the new symbols are part of a choice, and Kconfig
does not enforce the select of a option from a choice.

Update the legacy entry for 2019.02, following the example described in
the beginning of the file.

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy      | 2 +-
 package/lua/Config.in | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 73d8ab4ca7..22d7fbe4be 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -2224,9 +2224,9 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
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
index 456f3b8c12..888c34b21d 100644
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
