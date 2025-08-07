Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6B3C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D17B6068F;
	Thu,  7 Aug 2025 17:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dn1tazcqGYdV; Thu,  7 Aug 2025 17:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CA0D6060B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CA0D6060B;
	Thu,  7 Aug 2025 17:01:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D2AF31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D54980C3B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcWVmRNpF8eu for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9097780C0F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9097780C0F
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E71482AE0; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e9ce3c7753c2596d5724f5b7f2dd0aaf7b4c9794
X-Git-Newrev: 3f986ee14e19bf852cb6dbefcb0b4db52c9226ad
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.8E71482AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/avrdude: remove
 the obsolete hook
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3f986ee14e19bf852cb6dbefcb0b4db52c9226ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 51cf8e5663ad98e186343ee97152e9dcdd263427)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/avrdude/avrdude.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 89637d4ca6..54d83dec4b 100644
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
