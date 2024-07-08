Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4165C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 08:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BD2880C79;
	Mon,  8 Jul 2024 08:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4hvjYd9LIuQ; Mon,  8 Jul 2024 08:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5441F80C7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5441F80C7A;
	Mon,  8 Jul 2024 08:49:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6DE71BF2CD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 08:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4698606B9
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 08:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhvhKSzA17vh for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 08:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B876560697
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B876560697
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 08:49:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EE0783D5D; Mon,  8 Jul 2024 08:49:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 08:42:29 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5a7cffde18dae1d1634a7f2eb93e97d41d6bfd73
X-Git-Newrev: 8fed4803e3924b67be59a7195b20749bd2e740e9
X-Patchwork-Hint: ignore
Message-Id: <20240708084933.9EE0783D5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libopenssl:
 replace engines-1.1 to engines-3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fed4803e3924b67be59a7195b20749bd2e740e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The bump to version 3.0.9 in commit 3c66f65a6a54 (package/libopenssl:
bump version to 3.0.9), and all subsequent updates, forgot to change
the directory name, which remained that of version 1.1. The patch
fixes the directory name to be consistent with the version.

In the case the library was not built with engine support, this resulted
in the presence of files in the root file system that should have been
removed.

Fixes: 3c66f65a6a549930870f2c0d98abb5ca9321d2a5
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7f9291bfe4db9f840fe0e3c4b0df2ff4acd9560c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 9ece6b745f..9d952583c8 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -166,7 +166,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
 define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
-	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-1.1
+	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-3
 endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
