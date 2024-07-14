Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2292C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 11:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ACF74064C;
	Sun, 14 Jul 2024 11:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkAo-rE5fEg7; Sun, 14 Jul 2024 11:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54D784064E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54D784064E;
	Sun, 14 Jul 2024 11:20:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 791C21BF3EC
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 11:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65D404064E
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 11:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEV293nJH2JQ for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 11:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 590D24064C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 590D24064C
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 11:20:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50D5A807E5; Sun, 14 Jul 2024 11:20:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 13:19:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cad947b964be5612a182413da136fcf0dc5a1f2
X-Git-Newrev: 51a58ff0624f62ca0fa0ca6494928e8bd1410f69
X-Patchwork-Hint: ignore
Message-Id: <20240714112004.50D5A807E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra/emulator.py: add
 license header
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=51a58ff0624f62ca0fa0ca6494928e8bd1410f69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we copied a piece from code from pexpect, we need to also follow
the license of pexpect. Effectively, that makes the file licensed under
both our default GPL-2.0 and pexpect's ISC license. This is already
hinted at in the comment inside _repl_sh_child, but let's make it
explicit by adding a license header to the file.

Ideally, of course, each file in Buildroot would have a license file.

This was done with the reuse tool:
    reuse annotate -l GPL-2.0 -l ISC support/testing/infra/emulator.py

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/infra/emulator.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 71aefacb80..950843e37d 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: ISC
+
 import pexpect
 import pexpect.replwrap
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
