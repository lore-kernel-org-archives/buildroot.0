Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB715C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 10:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 618A7817BD;
	Sun, 20 Feb 2022 10:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXL7soek1gEU; Sun, 20 Feb 2022 10:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 701C1817A3;
	Sun, 20 Feb 2022 10:01:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ED421BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B496A408BE
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOneQmXbVmW5 for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 10:01:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 126E9408C0
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 10:01:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 56A2281DD5; Sun, 20 Feb 2022 09:53:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 10:59:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b7c22970d4fb4cf4db30e77a291ea841e2a235e
X-Git-Newrev: a50c9f16edfe36c9ef4a210621b062493fdd09fd
X-Patchwork-Hint: ignore
Message-Id: <20220220095315.56A2281DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr-util: drop
 APR_UTIL_FIX_{LIBTOOL, RULES_MK}
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

commit: https://git.buildroot.net/buildroot/commit/?id=a50c9f16edfe36c9ef4a210621b062493fdd09fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop APR_UTIL_FIX_{LIBTOOL,RULES_MK} which were added by commit
84b4c19e551288911a230c2b73e96bc6e2ed12f9 but is not needed since the
addition of PPD_FIXUP_PATHS in commit
b06294e9897e90862656416e8b67fdace15488d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apr-util/apr-util.mk | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index f6ce7ac064..cf8407ced0 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -17,20 +17,6 @@ APR_UTIL_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config
 APR_UTIL_CONFIG_SCRIPTS = apu-1-config
 
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define APR_UTIL_FIX_LIBTOOL
-	$(SED) 's,$(PER_PACKAGE_DIR)/apr/,$(PER_PACKAGE_DIR)/apr-util/,g' \
-		$(STAGING_DIR)/usr/build-1/libtool
-endef
-APR_UTIL_POST_PREPARE_HOOKS += APR_UTIL_FIX_LIBTOOL
-
-define APR_UTIL_FIX_RULES_MK
-	$(SED) 's,$(PER_PACKAGE_DIR)/apr/,$(PER_PACKAGE_DIR)/apr-util/,g' \
-		$(@D)/build/rules.mk
-endef
-APR_UTIL_POST_CONFIGURE_HOOKS += APR_UTIL_FIX_RULES_MK
-endif
-
 # When iconv is available, then use it to provide charset conversion
 # features.
 APR_UTIL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
