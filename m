Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B7CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B444405FA;
	Sat, 12 Oct 2024 14:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhHFOLijUE8j; Sat, 12 Oct 2024 14:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C72541A8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C72541A8A;
	Sat, 12 Oct 2024 14:06:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA3CF1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB12640897
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yr70OesFGhVs for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C8B40858
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4C8B40858
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE6CF8452E; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:59:16 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 04557874c1dca323dca48b8ff98d932f41fab3d9
X-Git-Newrev: 917a81b3424fc99094756582840e4bb41940be22
X-Patchwork-Hint: ignore
Message-Id: <20241012140530.CE6CF8452E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 support/scripts/pkg-stats: fix 'dictionary' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=917a81b3424fc99094756582840e4bb41940be22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit db6a029a50a36adb86549b22f556b4f66e072417)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4dc1857a9e..f143af6446 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1209,7 +1209,7 @@ def dump_html(packages, stats, date, commit, output):
 
 
 def dump_json(packages, defconfigs, stats, date, commit, output):
-    # Format packages as a dictionnary instead of a list
+    # Format packages as a dictionary instead of a list
     # Exclude local field that does not contains real date
     excluded_fields = ['url_worker', 'name', 'tree_path']
     pkgs = {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
