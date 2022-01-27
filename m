Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09FEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81A2941CD7;
	Thu, 27 Jan 2022 16:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jP7X446XONF4; Thu, 27 Jan 2022 16:55:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A274941CD4;
	Thu, 27 Jan 2022 16:55:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD451C113E
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED7D5403E0
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MREI6BlgH3aE for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:54:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22F9A403D6
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:54:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E872C821F7; Thu, 27 Jan 2022 16:47:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 17:50:50 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 679d40823bb3fc88e7358e88199b7a7d1e8c7bd8
X-Git-Newrev: c8f4ca025d3040f474977b7597bc22e226dc7b7e
X-Patchwork-Hint: ignore
Message-Id: <20220127164720.E872C821F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 support/scripts/pkg-stats: fix flake8 errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8f4ca025d3040f474977b7597bc22e226dc7b7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

support/scripts/pkg-stats:1171:8: E713 test for membership should be 'not in'
support/scripts/pkg-stats:1175:8: E713 test for membership should be 'not in'
support/scripts/pkg-stats:1179:8: E713 test for membership should be 'not in'
3     E713 test for membership should be 'not in'

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1955772278

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 02e679d8bf8acae9e110820858d1f242ff971af8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 2ccb7a8362..f6da090d22 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1130,15 +1130,15 @@ def __main__():
         pkg.set_url()
         pkg.set_ignored_cves()
         pkg.set_developers(developers)
-    if not "url" in args.disable:
+    if "url" not in args.disable:
         print("Checking URL status")
         loop = asyncio.get_event_loop()
         loop.run_until_complete(check_package_urls(packages))
-    if not "upstream" in args.disable:
+    if "upstream" not in args.disable:
         print("Getting latest versions ...")
         loop = asyncio.get_event_loop()
         loop.run_until_complete(check_package_latest_version(packages))
-    if not "cve" in args.disable and args.nvd_path:
+    if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
         check_package_cpes(args.nvd_path, packages)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
