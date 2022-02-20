Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC52C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 10:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D34C7408C2;
	Sun, 20 Feb 2022 10:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Occnr2z_98Is; Sun, 20 Feb 2022 10:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E002408C0;
	Sun, 20 Feb 2022 10:01:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF781BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C9E8813E9
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_Z4Rql2yx62 for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 10:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E38813E0
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 10:01:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3102781DD5; Sun, 20 Feb 2022 09:53:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 10:59:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21c07c0aaa7e43b8f676c564f173a510d345a77a
X-Git-Newrev: e0a0b8d233b86a7c1a197345936d37fce1ea22e8
X-Patchwork-Hint: ignore
Message-Id: <20220220095315.3102781DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot-pigeonhole: drop
 DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0a0b8d233b86a7c1a197345936d37fce1ea22e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG added by commit
0901355c11f051846744a12f9b2044a751faa47a which is not needed since the
addition of PPD_FIXUP_PATHS in commit
b06294e9897e90862656416e8b67fdace15488d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index dd533977f4..62d9909cf5 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -15,12 +15,4 @@ DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
 
 DOVECOT_PIGEONHOLE_CONF_OPTS = --with-dovecot=$(STAGING_DIR)/usr/lib
 
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
-	$(SED) 's,$(PER_PACKAGE_DIR)/dovecot/,$(PER_PACKAGE_DIR)/dovecot-pigeonhole/,g' \
-		$(STAGING_DIR)/usr/lib/dovecot-config
-endef
-DOVECOT_PIGEONHOLE_PRE_CONFIGURE_HOOKS = DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
