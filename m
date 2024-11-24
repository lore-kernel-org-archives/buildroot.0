Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76465C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C120A4EF06;
	Fri, 28 Feb 2025 16:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pM39Ueaj2oc; Fri, 28 Feb 2025 16:32:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C4914126A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C4914126A;
	Fri, 28 Feb 2025 16:31:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 143881DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B150419B2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWPMj_M_XAAj for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7CB64195D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7CB64195D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B200387A7D; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Nov 2024 19:36:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 39a54900727a359bb0285a751ff7de857088c1f4
X-Git-Newrev: 1ec30e6f11f058b4510342a98639b06de1c43358
X-Patchwork-Hint: ignore
Message-Id: <20250228162930.B200387A7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Config.in: fix _FORTIFY_SOURCE
 help string typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ec30e6f11f058b4510342a98639b06de1c43358
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The Config.in help string for BR2_FORTIFY_SOURCE_{2,3} mention
"_FORTIFY_SOURCES" (plural, with an extra "S"). The correct macro name
is "_FORTIFY_SOURCE" (without the "S"). See [1].

This commit fixes those typos.

[1] https://www.gnu.org/software/libc/manual/html_node/Source-Fortification.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
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
