Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4051EC87FC5
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 19:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C61DF41A55;
	Thu, 24 Jul 2025 19:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUvMFiJQBWZ4; Thu, 24 Jul 2025 19:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE1541A5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE1541A5B;
	Thu, 24 Jul 2025 19:24:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AFBDB83
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E49A282366
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdAg8EiRcK1v for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 19:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 185FB82364
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 185FB82364
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:24:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C919814AE; Thu, 24 Jul 2025 19:24:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 21:16:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9809795c71c1d258ca08f37f4205d079e5286dd6
X-Git-Newrev: 51cf8e5663ad98e186343ee97152e9dcdd263427
X-Patchwork-Hint: ignore
Message-Id: <20250724192423.0C919814AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avrdude: remove the obsolete hook
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=51cf8e5663ad98e186343ee97152e9dcdd263427
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its introduction in commit [1], avrdude has a post install
target hook removing a backup configuration file.

Commit [2] updated avrdude to version 7.1 and switch to the
cmake infra.

CMake recipe doesn't create a backup of the avrdude.conf.

This commit removes this hook which is no longer needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/dc776f0d0546900b22d1552f3e522be2080016c6
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/f89f3787a05d123a33f1a000c802fe42c96a487f

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: add extra info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/avrdude/avrdude.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 619987119b..79447a6205 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -29,12 +29,4 @@ ifeq ($(BR2_PACKAGE_HIDAPI),y)
 AVRDUDE_DEPENDENCIES += hidapi
 endif
 
-# if /etc/avrdude.conf exists, the installation process creates a
-# backup file, which we do not want in the context of Buildroot.
-define AVRDUDE_REMOVE_BACKUP_FILE
-	$(RM) -f $(TARGET_DIR)/etc/avrdude.conf.bak
-endef
-
-AVRDUDE_POST_INSTALL_TARGET_HOOKS += AVRDUDE_REMOVE_BACKUP_FILE
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
