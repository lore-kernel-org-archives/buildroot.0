Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D1FC2BA18
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 20:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A89AB811A8;
	Sun, 23 Jun 2024 20:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QvQwozY3EeS; Sun, 23 Jun 2024 20:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C32D081196
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C32D081196;
	Sun, 23 Jun 2024 20:46:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A7251BF2EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F13B401CA
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id at1tLaEgO3Qk for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 20:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F3AA402F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F3AA402F2
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 20:46:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68A3E828EF; Sun, 23 Jun 2024 20:46:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 22:17:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2761b52663155e9247dc23350f7159493837d0e
X-Git-Newrev: e0bdc5ddb8a64e89709db72ad550334618cc0c0c
X-Patchwork-Hint: ignore
Message-Id: <20240623204629.68A3E828EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: use `no-apps'
 configuration option
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0bdc5ddb8a64e89709db72ad550334618cc0c0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With version 3.2.0 of OpenSSL, the "no-apps" configuration option was
added, which does not build apps, e.g. the openssl program. This is
handy for minimization. This option also disables tests.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
