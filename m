Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E679CF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF61D41A89;
	Sat, 12 Oct 2024 14:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtZGfbPdU3ez; Sat, 12 Oct 2024 14:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86D1541A74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86D1541A74;
	Sat, 12 Oct 2024 14:06:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67DDF1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B92F8209F
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hd7vK7hdTjgq for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77BE0820A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77BE0820A4
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74B4884553; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:59:11 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: aeaba3875420729130e7affad8dc00fb56d43e1a
X-Git-Newrev: 4ca5d89653c9ad86ecbaa69a12027cdcfd404601
X-Patchwork-Hint: ignore
Message-Id: <20241012140530.74B4884553@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 support/dependencies/dependencies.sh: fix 'mimic' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ca5d89653c9ad86ecbaa69a12027cdcfd404601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ca4eca4bfa7e1b2603de7834433eb29e86ed1e01)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 6d5fc36037..fb0defd0c9 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -143,7 +143,7 @@ fi
 
 # Check bash
 # We only check bash is available, setting SHELL appropriately is done
-# in the top-level Makefile, and we mimick the same sequence here
+# in the top-level Makefile, and we mimic the same sequence here
 if   [ -n "${BASH}" ]; then :
 elif [ -x /bin/bash ]; then :
 elif [ -z "$( sh -c 'echo $BASH' )" ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
