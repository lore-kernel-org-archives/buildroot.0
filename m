Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16796C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7FFC41223;
	Tue, 15 Apr 2025 19:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRcpNfu8somM; Tue, 15 Apr 2025 19:54:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BF3B40E62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BF3B40E62;
	Tue, 15 Apr 2025 19:54:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17868108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0667A611FA
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id He0XrtC-fqvS for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A25961225
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A25961225
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:54:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6379C8498A; Tue, 15 Apr 2025 19:54:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:53:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7361a155ef420a58ebe1f8f360b141a926b6d8b2
X-Git-Newrev: 06c5a024f120335d0971be6520208369f0957a52
X-Patchwork-Hint: ignore
Message-Id: <20250415195444.6379C8498A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: extend comment about vi
 symlink
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

commit: https://git.buildroot.net/buildroot/commit/?id=06c5a024f120335d0971be6520208369f0957a52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current comment is not very helpful; extend it to be more explicit.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vim/vim.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index fb8062e1fa..7d51a6ddab 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -63,7 +63,8 @@ define VIM_REMOVE_DOCS
 	$(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
 endef
 
-# Avoid oopses with vipw/vigr, lack of $EDITOR and 'vi' command expectation
+# Avoid oopses with vipw/vigr (from package shadow), lack of $EDITOR,
+# or other packages expecting plain 'vi' command to exist.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 define VIM_INSTALL_VI_SYMLINK
 	ln -sf vim $(TARGET_DIR)/usr/bin/vi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
