Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F2BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 19:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6196F60764;
	Thu, 25 Nov 2021 19:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDlCP770YWYr; Thu, 25 Nov 2021 19:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9F616074E;
	Thu, 25 Nov 2021 19:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B67E1BF401
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A1D84019F
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nCNvTQOjBaxF for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ECFF401D4
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E8FAE8F537; Thu, 25 Nov 2021 19:49:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 20:53:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bffc7a477459c5ba7abb0efa8c3691abde0c5cb8
X-Git-Newrev: 228727f046d184726b6705a1902a961b211df72c
X-Patchwork-Hint: ignore
Message-Id: <20211125194954.E8FAE8F537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/toolchain: rename
 GLIBC_COPY_NSSWITCH_FILE
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

commit: https://git.buildroot.net/buildroot/commit/?id=228727f046d184726b6705a1902a961b211df72c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain/toolchain.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 0afb12c036..18f1dbea1a 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -39,12 +39,12 @@ endif
 
 # Install default nsswitch.conf file if the skeleton doesn't provide it
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-define GLIBC_COPY_NSSWITCH_FILE
+define TOOLCHAIN_GLIBC_COPY_NSSWITCH_FILE
 	@if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
 		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
 	fi
 endef
-TOOLCHAIN_POST_INSTALL_TARGET_HOOKS += GLIBC_COPY_NSSWITCH_FILE
+TOOLCHAIN_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_GLIBC_COPY_NSSWITCH_FILE
 endif
 
 $(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
