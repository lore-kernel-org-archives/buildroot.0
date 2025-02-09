Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EA0C02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 15:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7539580AFB;
	Sun,  9 Feb 2025 15:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXPKrkul8bCY; Sun,  9 Feb 2025 15:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720F581C11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 720F581C11;
	Sun,  9 Feb 2025 15:10:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F9F76C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62243403D9
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ru_SkTvD4KCp for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29B5F40294
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29B5F40294
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1316F87458; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 12:53:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef15efdd2c422a8c0df074f46978045e7e8deeb8
X-Git-Newrev: 4f78d362aa907ee019b9f43c56c8f4322d242f3c
X-Patchwork-Hint: ignore
Message-Id: <20250209150951.1316F87458@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: fix shellcheck
 tests after update to shellcheck 0.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f78d362aa907ee019b9f43c56c8f4322d242f3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

shellcheck tests needs to be updated after shellcheck 0.9.0 update due
to changes in errors/warning reporting:

  utils/checkpackagelib/test_tool.py::test_Shellcheck[missing shebang-empty.sh--expected0] FAILED [ 98%]
  utils/checkpackagelib/test_tool.py::test_Shellcheck[2 warnings-unused.sh-unused=""-expected3] FAILED [ 99%]
  utils/checkpackagelib/test_tool.py::test_Shellcheck[tab-tab.sh-\t#!/bin/sh-expected4] FAILED [100%]

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/checkpackagelib/test_tool.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
index cfa826f57c..56326398d3 100644
--- a/utils/checkpackagelib/test_tool.py
+++ b/utils/checkpackagelib/test_tool.py
@@ -100,7 +100,7 @@ Shellcheck = [
      '',
      ["dir/empty.sh:0: run 'shellcheck' and fix the warnings",
       "In dir/empty.sh line 1:\n"
-      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.\n"
+      "^-- SC2148 (error): Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.\n"
       "For more information:\n"
       "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y..."]),
     ('sh shebang',
@@ -117,8 +117,8 @@ Shellcheck = [
      ["dir/unused.sh:0: run 'shellcheck' and fix the warnings",
       "In dir/unused.sh line 1:\n"
       'unused=""\n'
-      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.\n"
-      "^----^ SC2034: unused appears unused. Verify use (or export if used externally).\n"
+      "^-- SC2148 (error): Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.\n"
+      "^----^ SC2034 (warning): unused appears unused. Verify use (or export if used externally).\n"
       "For more information:\n"
       "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y...\n"
       "  https://www.shellcheck.net/wiki/SC2034 -- unused appears unused. Verify use..."]),
@@ -128,7 +128,7 @@ Shellcheck = [
      ["dir/tab.sh:0: run 'shellcheck' and fix the warnings",
       "In dir/tab.sh line 1:\n"
       '\t#!/bin/sh\n'
-      "^-- SC1114: Remove leading spaces before the shebang.\n"
+      "^-- SC1114 (error): Remove leading spaces before the shebang.\n"
       "For more information:\n"
       "  https://www.shellcheck.net/wiki/SC1114 -- Remove leading spaces before the ..."]),
     ]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
