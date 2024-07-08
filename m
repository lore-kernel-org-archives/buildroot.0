Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF304C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 08:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80FA181130;
	Mon,  8 Jul 2024 08:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOjpalk3oG-1; Mon,  8 Jul 2024 08:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 967F381128
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 967F381128;
	Mon,  8 Jul 2024 08:49:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D11E01BF2CD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 08:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6993606D4
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 08:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sfp_W4-vFsHY for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 08:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C15586069A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C15586069A
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 08:49:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B006E83D5A; Mon,  8 Jul 2024 08:49:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 08:48:52 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8fed4803e3924b67be59a7195b20749bd2e740e9
X-Git-Newrev: 440030c6096ddde7d8bd083e3a7502205c0cf692
X-Patchwork-Hint: ignore
Message-Id: <20240708084933.B006E83D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libopenssl: use
 consistent logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=440030c6096ddde7d8bd083e3a7502205c0cf692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The patch expresses the same condition in positive logic, consistent
with what has been coded in other parts of the module and generally
in Buildroot.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c2761b52663155e9247dc23350f7159493837d0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 9d952583c8..7376c8f399 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -164,7 +164,7 @@ endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_BIN
 endif
 
-ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),)
 define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
 	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-3
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
