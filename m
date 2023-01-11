Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A3FC46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 919BB82065;
	Wed, 11 Jan 2023 09:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 919BB82065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iY3kG4TyR2G4; Wed, 11 Jan 2023 09:40:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2124820C6;
	Wed, 11 Jan 2023 09:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2124820C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2CDC1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E65981FA8
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E65981FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMhVkWLpvPqR for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:40:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A105A82096
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A105A82096
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DEDD83D5C; Wed, 11 Jan 2023 09:40:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:30:53 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 1e7bac765390fb6e59bfed0ccee5b3612e2a9119
X-Git-Newrev: 03378a0a987df36152d2d5b5aedf82becec1592f
X-Patchwork-Hint: ignore
Message-Id: <20230111094011.8DEDD83D5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/checkpolicy: drop
 bogus CHECKPOLICY_STAGING_CMDS
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

commit: https://git.buildroot.net/buildroot/commit/?id=03378a0a987df36152d2d5b5aedf82becec1592f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit "b06110621d checkpolicy: allow compiling for target" contains a
typo that prevents installing to staging. It also forgot to enable
CHECKPOLICY_INSTALL_STAGING.

But the package does not install headers or libraries, only ELF and
manual files.
So instead of fixing the install to staging, drop the bogus
CHECKPOLICY_STAGING_CMDS.

Cc: Clayton Shotwell <clayton.shotwell@collins.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 14956d8908776e52ea9ace2fbb3f41716ebb4262)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/checkpolicy/checkpolicy.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index af9a58cee8..baf16fb802 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -20,11 +20,6 @@ define CHECKPOLICY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
 endef
 
-define CHECKPOLICY_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
-
-endef
-
 define CHECKPOLICY_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
