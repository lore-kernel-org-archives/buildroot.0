Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAABC021B2
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 21:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 327D3414C6;
	Thu, 20 Feb 2025 21:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKLvRe3qQ4w3; Thu, 20 Feb 2025 21:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F5A14145C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F5A14145C;
	Thu, 20 Feb 2025 21:48:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFC66194
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFBD340AD6
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byHsGHRwFGjk for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 21:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88B6E40A60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88B6E40A60
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74E4F8798C; Thu, 20 Feb 2025 21:48:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 21:39:25 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3a863002bdde72bd6bfe5d3703708fa0862acd18
X-Git-Newrev: ce0e7c7d5fe7fb1d08eaaafb290349f5903cc23a
X-Patchwork-Hint: ignore
Message-Id: <20250220214824.74E4F8798C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/openssh: install
 sshd-session
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce0e7c7d5fe7fb1d08eaaafb290349f5903cc23a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 11d2ad31046263d80da5ff6b36c3d25b1bbc0d82)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index b2ee1e715e..ab91c829a1 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -112,6 +112,7 @@ endif
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
