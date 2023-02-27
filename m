Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9236C64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 15:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 551FD60EA7;
	Mon, 27 Feb 2023 15:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551FD60EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KK18epMi5Vhd; Mon, 27 Feb 2023 15:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 906A2600B3;
	Mon, 27 Feb 2023 15:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 906A2600B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34CDA1BF31B
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 15:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CDC640278
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 15:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CDC640278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhBlMS8auJKS for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 15:37:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49DBD4013D
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 15:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49DBD4013D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F3A586C1D; Mon, 27 Feb 2023 15:37:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 16:36:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3c4fb99b80ae2925e04676cfc9ecffd0c35c430c
X-Git-Newrev: 35ddf2f7707d33c8272fddeb2a0fae5647ed8426
X-Patchwork-Hint: ignore
Message-Id: <20230227153748.2F3A586C1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sudo: fix
 SUDO_ENABLE_SUDO_GROUP_RULE following version bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=35ddf2f7707d33c8272fddeb2a0fae5647ed8426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Since the version bump of sudo to v1.9.11p2 in commit 9b7f8da96b, the
sed magic in SUDO_ENABLE_SUDO_GROUP_RULE no longer does its job, due
to a slight change in the example sudoers file provided by upstream
sudo.

This commit fixes the regexp to match the new sudoers file.

Fixes bug #14891 (https://bugs.busybox.net/show_bug.cgi?id=14891)

Reported-by: Matthias Hardt <mhardt@berlinux-solutions.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 079fccdee5a2a10fc8275094512b8423548ea147)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 8bf1ce5e9c..c4eaafa6b1 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -82,7 +82,7 @@ define SUDO_USERS
 endef
 
 define SUDO_ENABLE_SUDO_GROUP_RULE
-	$(SED) '/^# \%sudo\tALL=(ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
+	$(SED) '/^# \%sudo\tALL=(ALL:ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
 endef
 SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
