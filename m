Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9892C3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A715683F3E;
	Tue,  2 Jul 2024 19:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_UdQgonwqgR; Tue,  2 Jul 2024 19:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB57283F3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB57283F3F;
	Tue,  2 Jul 2024 19:31:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C558B1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1EA540162
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c22arSRUqcYt for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5CC0405CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5CC0405CC
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:31:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D4D983A8F; Tue,  2 Jul 2024 19:31:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 21:27:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2c2c485310c9f5d392cb247eddf4dce35c87e09
X-Git-Newrev: 11d2ad31046263d80da5ff6b36c3d25b1bbc0d82
X-Patchwork-Hint: ignore
Message-Id: <20240702193123.8D4D983A8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] packages/openssh: install sshd-session
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

commit: https://git.buildroot.net/buildroot/commit/?id=11d2ad31046263d80da5ff6b36c3d25b1bbc0d82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In OpenSSH 9.8 the server is split into two processes: sshd and
sshd-session which results in the following error, when trying
to start sshd:

Starting sshd: /usr/libexec/sshd-session does not exist or is not executable

This patch installs the sshd-session binary.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/11
Fixes: 4ac2cc5beec0eac4991fb28f286707a5659fa67e

Signed-off-by: Niklas Yann Wettengel <niyawe@niyawe.de>
Reviewed-by: Nevo Hed <nhed+buildroot@starry.com>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/openssh/openssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 6d846f64df..7065c3ae4f 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -117,6 +117,7 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
 define OPENSSH_INSTALL_SERVER_PROGRAMS
 	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
+	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
 	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
 endef
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
