Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0888C678DA
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A044681F77;
	Wed, 11 Jan 2023 09:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A044681F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VlBSKM6EIStz; Wed, 11 Jan 2023 09:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0344C82098;
	Wed, 11 Jan 2023 09:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0344C82098
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 185E71BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A7A84056F
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A7A84056F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0SJUdq3NBJi for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6EDC40AAD
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6EDC40AAD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B56AB878E1; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:22:14 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5e84cc96b255fa7a7190d29b2bff7cca0f775cbd
X-Git-Newrev: e5f0b65f1f5cdd060c9eee1ffcd3840586899730
X-Patchwork-Hint: ignore
Message-Id: <20230111093332.B56AB878E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lrzsz: drop bogus
 LRZSZ_BUILD_HOOKS
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5f0b65f1f5cdd060c9eee1ffcd3840586899730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "4f3f291a3b lrzsz: convert to autotools infrastructure" converted
the package to use autotools infra but added a define that is never
called.

Drop the bogus define.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5fde4abc8d67ac2317b1de7a1b4cde8091f4e3c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lrzsz/lrzsz.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 45c88619e0..3897975d73 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -18,10 +18,6 @@ define LRZSZ_POST_CONFIGURE_HOOKS
 	$(SED) "s~\(#define ENABLE_SYSLOG.*\)~/* \1 */~;" $(@D)/config.h
 endef
 
-define LRZSZ_BUILD_HOOKS
-	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" prefix="$(TARGET_DIR)" -C $(@D)
-endef
-
 define LRZSZ_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
 	$(INSTALL) -m 0755 -D $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
