Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5E5C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B04B60B74;
	Wed, 11 Jan 2023 09:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B04B60B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyXexS27-gpQ; Wed, 11 Jan 2023 09:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFD4760DB2;
	Wed, 11 Jan 2023 09:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFD4760DB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2451BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC64B40AAD
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC64B40AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nic3K07zphV0 for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:33:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B14B40A4B
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B14B40A4B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F07AD878E0; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:30:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0bd18549c896f4773085447288c83141886fec34
X-Git-Newrev: a8afd5e69d045bce9e58b08b8f962b99b523e3aa
X-Patchwork-Hint: ignore
Message-Id: <20230111093332.F07AD878E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/checkpolicy: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8afd5e69d045bce9e58b08b8f962b99b523e3aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
