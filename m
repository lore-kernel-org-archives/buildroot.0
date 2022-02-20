Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4B9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 10:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 520084000B;
	Sun, 20 Feb 2022 10:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GE3QoJXYwCCg; Sun, 20 Feb 2022 10:01:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54584400F3;
	Sun, 20 Feb 2022 10:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0E991BF95E
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AFE3408C2
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZJE3iYhifoN for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 10:01:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B5B2408BF
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 10:01:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 497F6833C9; Sun, 20 Feb 2022 09:53:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 10:59:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0da90512c04f5cfcdcbe1c4a8f32e559828e0c9
X-Git-Newrev: 0b7c22970d4fb4cf4db30e77a291ea841e2a235e
X-Patchwork-Hint: ignore
Message-Id: <20220220095315.497F6833C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: drop
 APACHE_FIXUP_APR_LIBTOOL
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b7c22970d4fb4cf4db30e77a291ea841e2a235e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop APACHE_FIXUP_APR_LIBTOOL which was added by commit
b747c29c4e8eb89b7b99658dfd34f4a6b6b0744d but is not needed since the
addition of PPD_FIXUP_PATHS in commit
b06294e9897e90862656416e8b67fdace15488d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apache/apache.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 5fcb887fbc..b280d4dc3a 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -19,14 +19,6 @@ APACHE_INSTALL_STAGING = YES
 APACHE_AUTORECONF = YES
 APACHE_DEPENDENCIES = apr apr-util pcre
 
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define APACHE_FIXUP_APR_LIBTOOL
-	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apache/@g" \
-		$(STAGING_DIR)/usr/build-1/libtool
-endef
-APACHE_POST_PREPARE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
-endif
-
 APACHE_CONF_ENV= \
 	ap_cv_void_ptr_lt_long=no \
 	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
