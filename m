Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79382C3271F
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 324CC60733;
	Wed,  3 Jul 2024 20:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Jdk7na16yxT; Wed,  3 Jul 2024 20:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34FA160909
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34FA160909;
	Wed,  3 Jul 2024 20:22:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E670B1BF36E
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E005841A20
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhFNOShxYFSC for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 20:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBF9641A08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBF9641A08
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 20:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE1C283C17; Wed,  3 Jul 2024 20:22:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 22:20:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 145adee2445835c76d59b7c8b8ac2f3ae54fddba
X-Git-Newrev: a82ad53371e4d4181e2ba1fa3842a4f3d036a4ea
X-Patchwork-Hint: ignore
Message-Id: <20240703202240.CE1C283C17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memstat: update the patches to be
 applied with fuzz 0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a82ad53371e4d4181e2ba1fa3842a4f3d036a4ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, memstat fails to build with output:

    Applying 0001-PATH_MAX.patch using patch:
    patching file memstat.c
    Hunk #1 FAILED at 19.
    1 out of 1 hunk FAILED -- saving rejects to file memstat.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/memstat/0001-PATH_MAX.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/memstat/0001-PATH_MAX.patch b/package/memstat/0001-PATH_MAX.patch
index 0c3617a61b..14ca6a0078 100644
--- a/package/memstat/0001-PATH_MAX.patch
+++ b/package/memstat/0001-PATH_MAX.patch
@@ -1,6 +1,8 @@
 Add missing #include for PATH_MAX
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 --- memstat-0.8.org/memstat.c	2009-06-08 14:38:05.000000000 +0200
 +++ memstat-0.8/memstat.c	2014-09-12 03:55:43.096035374 +0200
@@ -11,4 +13,4 @@ Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
 +#include <limits.h>
  
  /* blacklist devices that just map physical memory */
- char *blacklist[] = { "/dev/mem",
+ char *blacklist[] = {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
