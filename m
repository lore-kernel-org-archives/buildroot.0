Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20BBC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE1CA607D8;
	Mon, 15 Jul 2024 08:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abDVhLTTUfh4; Mon, 15 Jul 2024 08:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B25A60785
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B25A60785;
	Mon, 15 Jul 2024 08:28:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 119EC1BF421
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F37040491
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oz_VPqBsDp-V for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 08:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A6CE40450
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A6CE40450
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 08:28:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20D7886034; Mon, 15 Jul 2024 08:28:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 10:26:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a66711be1786b90f94cbb1648fa470def3486f8
X-Git-Newrev: a14c862c08865e053d5fce90a0d0323b8f9e4bc0
X-Patchwork-Hint: ignore
Message-Id: <20240715082823.20D7886034@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Create a .gitignore file in the
 CANONICAL_O directory
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

commit: https://git.buildroot.net/buildroot/commit/?id=a14c862c08865e053d5fce90a0d0323b8f9e4bc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This .gitignore file ignores all files in an output directory and
hence doesn't change the git status.

Remove "/output" entry from the main .gitignore file as it is already
handled by this general approach.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .gitignore | 1 -
 Makefile   | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index bb02d9f572..14b7ca5040 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,3 @@
-/output
 /dl
 /.auto.deps
 /.config.cmd
diff --git a/Makefile b/Makefile
index a97ebe78e3..faaf0f165c 100644
--- a/Makefile
+++ b/Makefile
@@ -63,6 +63,9 @@ ifneq ($(findstring @,$(CANONICAL_O)),)
 $(error The build directory can not contain a '@')
 endif
 
+# Create a default .gitignore file that ignores everything
+$(shell echo "*" > "$(CANONICAL_O)/.gitignore")
+
 CANONICAL_CURDIR = $(realpath $(CURDIR))
 
 REQ_UMASK = 0022
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
