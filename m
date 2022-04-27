Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A195C4332F
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1934C41A54;
	Wed, 27 Apr 2022 19:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BN-LDpPfITYo; Wed, 27 Apr 2022 19:01:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69AE41A49;
	Wed, 27 Apr 2022 19:01:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 428D01BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40D7D8316A
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBANpAgMnQdP for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 690A7831C1
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C561E845FF; Wed, 27 Apr 2022 18:47:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 20:50:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e47efc9b90e8ecfe5b0b21f967001748fc111fbc
X-Git-Newrev: f698cbc2235a6362399cf76acdf54e0bdb0b4664
X-Patchwork-Hint: ignore
Message-Id: <20220427184726.C561E845FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_12 blind option
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

commit: https://git.buildroot.net/buildroot/commit/?id=f698cbc2235a6362399cf76acdf54e0bdb0b4664
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to add gcc 12 support for internal and external toolchain
in follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_12 symbol.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/Config.in | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index d2c81217c8..b572a89f2f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -117,7 +117,8 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
 		BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_11
+		BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
 # longer exists in gcc 8.x.
@@ -150,7 +151,8 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 config BR2_TOOLCHAIN_HAS_GCC_BUG_83143
 	bool
 	default y if BR2_sh
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
+		   BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
@@ -698,10 +700,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "12"	if BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	default "11"	if BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	default "10"	if BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	default "9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
