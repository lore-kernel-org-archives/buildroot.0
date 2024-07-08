Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D037DC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 06:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 519FB40476;
	Mon,  8 Jul 2024 06:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXTbU2XsCCsc; Mon,  8 Jul 2024 06:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51BDB404AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51BDB404AE;
	Mon,  8 Jul 2024 06:58:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8390B1BF2C2
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DC4F401D8
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEnMMmsN0wFY for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 06:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 613AC401CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 613AC401CF
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 06:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D033983D28; Mon,  8 Jul 2024 06:58:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 08:51:04 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 0eccc6d090d17309c836885b785cf133a6950bb0
X-Git-Newrev: 34b358bf2cb093ebb9a1e72f8cdce07f87917cf0
X-Patchwork-Hint: ignore
Message-Id: <20240708065845.D033983D28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libopenssl: use
 `no-apps' configuration option
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

commit: https://git.buildroot.net/buildroot/commit/?id=34b358bf2cb093ebb9a1e72f8cdce07f87917cf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

With version 3.2.0 of OpenSSL, the "no-apps" configuration option was
added, which does not build apps, e.g. the openssl program. This is
handy for minimization. This option also disables tests.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e0bdc5ddb8a64e89709db72ad550334618cc0c0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index ed36fb593d..fe472e2c7a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -84,6 +84,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
 			no-afalgeng \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_BIN),,no-apps) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
@@ -156,14 +157,6 @@ endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_PERL_SCRIPTS
 endif
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL_BIN),)
-define LIBOPENSSL_REMOVE_BIN
-	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
-	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.*,c_*}
-endef
-LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_BIN
-endif
-
 ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),)
 define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
 	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
