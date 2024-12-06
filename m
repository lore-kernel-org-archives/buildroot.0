Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98284E7717B
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 09:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67BCF81FE7;
	Fri,  6 Dec 2024 09:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcfkP_JEIQBS; Fri,  6 Dec 2024 09:29:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E18382675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E18382675;
	Fri,  6 Dec 2024 09:29:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C663ECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77C2A611C5
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11FTxHdISyCU for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFE83611AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFE83611AD
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D36486A35; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 10:21:26 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 8c3836ac8fd8e7b2f320dadf24f2c6190e775bfb
X-Git-Newrev: 4d1a8585527506c4ff3281aab05dd86364ffc114
X-Patchwork-Hint: ignore
Message-Id: <20241206092846.9D36486A35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] Config.in: fix
 _FORTIFY_SOURCE help string typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d1a8585527506c4ff3281aab05dd86364ffc114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

The Config.in help string for BR2_FORTIFY_SOURCE_{2,3} mention
"_FORTIFY_SOURCES" (plural, with an extra "S"). The correct macro name
is "_FORTIFY_SOURCE" (without the "S"). See [1].

This commit fixes those typos.

[1] https://www.gnu.org/software/libc/manual/html_node/Source-Fortification.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1ec30e6f11f058b4510342a98639b06de1c43358)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index df43db7eff..d7a8dc6848 100644
--- a/Config.in
+++ b/Config.in
@@ -963,7 +963,7 @@ config BR2_FORTIFY_SOURCE_2
 	# gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61164
 	depends on !BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
-	  This option sets _FORTIFY_SOURCES to 2 and some more
+	  This option sets _FORTIFY_SOURCE to 2 and some more
 	  checking is added, but some conforming programs might fail.
 	  Also adds checks at run-time (detected buffer overflow
 	  terminates the program)
@@ -972,7 +972,7 @@ config BR2_FORTIFY_SOURCE_3
 	bool "Extended"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	help
-	  This option sets _FORTIFY_SOURCES to 3 and even more
+	  This option sets _FORTIFY_SOURCE to 3 and even more
 	  checking is added compared to level 2. Extends checks at
 	  run-time that can introduce an additional performance
 	  overhead.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
