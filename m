Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E7ACF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85D8F41AE3;
	Sat, 12 Oct 2024 14:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFLrNAIIZ45M; Sat, 12 Oct 2024 14:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23168416CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23168416CA;
	Sat, 12 Oct 2024 14:07:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 461381BF3DA
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68DE240896
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6_Q9ogtNsq9 for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F42740871
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F42740871
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B79884553; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:59:13 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 03824b9a6d62e6d62262ac6eaf79b20b49328e6e
X-Git-Newrev: 3d5595d8f721022d26197239e3317b4d336c5dfa
X-Patchwork-Hint: ignore
Message-Id: <20241012140530.9B79884553@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] support/misc/utils.mk:
 fix typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d5595d8f721022d26197239e3317b4d336c5dfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 146c1d38defee5114f994e1e6d3f80ce63e117bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index 4d0efcced0..5275006d6d 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -40,7 +40,7 @@ SHARP_SIGN := \#
 # In other words, every letter is substituted one by one.
 #
 # The caseconvert-helper allows us to create this definition out of the
-# [FROM] and [TO] lists, so we don't need to write down every substition
+# [FROM] and [TO] lists, so we don't need to write down every substitution
 # manually. The uses of $ and $$ quoting are chosen in order to do as
 # much expansion as possible up-front.
 #
@@ -131,7 +131,7 @@ QUOTE = '
 # Once everything has been escaped, it is passed between single quotes
 # (that's why the single-quotes are escaped they way they are, above,
 # and why the dollar sign is not escaped) to printf(1). A trailing
-# newline is apended, too.
+# newline is appended, too.
 #
 # Note: leading or trailing spaces are *not* stripped.
 #
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
