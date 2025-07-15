Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7363AC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40EF1411CA;
	Thu, 17 Jul 2025 20:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmK6__Kh66M1; Thu, 17 Jul 2025 20:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1154B41716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1154B41716;
	Thu, 17 Jul 2025 20:33:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC51E1A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD36F40142
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2ARepnxlpsw for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 381BD403B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 381BD403B0
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2822B8668C; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 22:52:01 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 0b267a5f6cc20137c44db3521c93e83cc2d93873
X-Git-Newrev: 54773e6c1efab8aa8940ad3b09d4cb18aa923d8b
X-Patchwork-Hint: ignore
Message-Id: <20250717203256.2822B8668C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/sudo: fix
 SUDO_ENABLE_SUDO_GROUP_RULE following version bump
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54773e6c1efab8aa8940ad3b09d4cb18aa923d8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since the version bump of sudo to 1.9.17p1 [1], the sed command in
SUDO_ENABLE_SUDO_GROUP_RULE no longer matches the the line in the
example sudoers file shipped with the sudo package. This is due to
upstream commit [2].

This commit fixes the regexp to match the new sudoers file.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ee86844e632d5760355154ea4e928c9228f3dfd1
[2] https://github.com/sudo-project/sudo/commit/7c121ff8340c6fa551ba4997dde9d450cf74e40c

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: add link to upstream commit introducing the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 35708db02403b5066d4efc455e802c666ed01dc9)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/sudo/sudo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 4e1405eaf1..f57a86805a 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -73,7 +73,7 @@ define SUDO_USERS
 endef
 
 define SUDO_ENABLE_SUDO_GROUP_RULE
-	$(SED) '/^# \%sudo\tALL=(ALL:ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
+	$(SED) '/^# \%sudo ALL=(ALL:ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
 endef
 SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
