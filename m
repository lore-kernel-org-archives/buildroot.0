Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C379CD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ECF381F0C;
	Sat, 31 Aug 2024 17:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xv7jdd24BFM; Sat, 31 Aug 2024 17:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EAA381F22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EAA381F22;
	Sat, 31 Aug 2024 17:24:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA35C1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2FB581F22
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNb63xyIgG3B for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F3F81F0C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7F3F81F0C
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C390686804; Sat, 31 Aug 2024 17:24:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 19:23:23 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 1160c791463809ac91797c93f0ec28bff0c42f06
X-Git-Newrev: cede5364deaf54062880c43de4221d262eed7b63
X-Patchwork-Hint: ignore
Message-Id: <20240831172415.C390686804@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/lrzsz: drop
 unused LRZSZ_POST_CONFIGURE_HOOKS
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

commit: https://git.buildroot.net/buildroot/commit/?id=cede5364deaf54062880c43de4221d262eed7b63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

As already done for LRZSZ_BUILD_HOOKS in commit
5fde4abc8d67ac2317b1de7a1b4cde8091f4e3c7, drop bogus
LRZSZ_POST_CONFIGURE_HOOKS as this hook added in 2010 is also never
called

Fixes: 4f3f291a3bfc1893cbfb4d9803c35a4f6752784d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e7c0125754f12acd18fa29a9ea21e7ca371ffc83)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lrzsz/lrzsz.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index d9be23540e..7247a4bd59 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -13,11 +13,6 @@ LRZSZ_CPE_ID_VALID = YES
 LRZSZ_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LRZSZ_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
-define LRZSZ_POST_CONFIGURE_HOOKS
-	$(SED) "s/-lnsl//;" $(@D)/src/Makefile
-	$(SED) "s~\(#define ENABLE_SYSLOG.*\)~/* \1 */~;" $(@D)/config.h
-endef
-
 define LRZSZ_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
 	$(INSTALL) -m 0755 -D $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
