Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CBBE7717B
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 09:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BCF881F77;
	Fri,  6 Dec 2024 09:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ObsV0o7KnKJ; Fri,  6 Dec 2024 09:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8783681F84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8783681F84;
	Fri,  6 Dec 2024 09:28:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A989CED3
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95DED81F7E
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKxJO9bxEMS8 for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 09:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEA3581F77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEA3581F77
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9E3A86A33; Fri,  6 Dec 2024 09:28:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 10:21:22 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5f83467a0f5aecf37148ad324594eb88b3150027
X-Git-Newrev: 8dc93af8b21a58d34a844e0e0d609d24ff3e931f
X-Patchwork-Hint: ignore
Message-Id: <20241206092844.A9E3A86A33@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Config.in: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dc93af8b21a58d34a844e0e0d609d24ff3e931f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index bfb3f75615..8d8dc967fc 100644
--- a/Config.in
+++ b/Config.in
@@ -948,7 +948,7 @@ config BR2_FORTIFY_SOURCE_2
 	# gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61164
 	depends on !BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
-	  This option sets _FORTIFY_SOURCES to 2 and some more
+	  This option sets _FORTIFY_SOURCE to 2 and some more
 	  checking is added, but some conforming programs might fail.
 	  Also adds checks at run-time (detected buffer overflow
 	  terminates the program)
@@ -957,7 +957,7 @@ config BR2_FORTIFY_SOURCE_3
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
