Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CE2C3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 06:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0E3440459;
	Mon,  8 Jul 2024 06:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YH65SmccwsKZ; Mon,  8 Jul 2024 06:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FD1D404DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FD1D404DA;
	Mon,  8 Jul 2024 06:58:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92C951BF97C
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71FA981099
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPRTNCWj9me0 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 06:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12FF80DFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B12FF80DFD
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 06:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABEA583D29; Mon,  8 Jul 2024 06:58:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 08:41:58 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: e1c896b10f56666c172e87a1aa18907862e6c178
X-Git-Newrev: 14e82c1f17a18a6d9ccb299662688e3293b87d18
X-Patchwork-Hint: ignore
Message-Id: <20240708065845.ABEA583D29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libopenssl: use
 $(RM) instead of rm
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

commit: https://git.buildroot.net/buildroot/commit/?id=14e82c1f17a18a6d9ccb299662688e3293b87d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b39286acfc134d66d56b78720c4a6a7547e16b16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index d209bb8e96..88debf114a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -135,8 +135,8 @@ endef
 
 define LIBOPENSSL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-	rm -rf $(TARGET_DIR)/usr/lib/ssl
-	rm -f $(TARGET_DIR)/usr/bin/c_rehash
+	$(RM) -rf $(TARGET_DIR)/usr/lib/ssl
+	$(RM) -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
 
 # libdl has no business in a static build
@@ -166,7 +166,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
 define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
-	rm -rf $(TARGET_DIR)/usr/lib/engines-1.1
+	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-1.1
 endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
