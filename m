Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC005C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 505C5403B7;
	Sun, 21 Nov 2021 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USrcSvXSqlAW; Sun, 21 Nov 2021 20:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D73D403AE;
	Sun, 21 Nov 2021 20:51:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2D6B1BF95F
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2BA940479
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYMyDVJx-6j7 for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:51:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2FA34046B
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:51:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B0E808DE8B; Sun, 21 Nov 2021 20:46:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:50:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb081e49239850ad6d20673403a273489cd566a0
X-Git-Newrev: 41e2132fbe8a8fc237ca4a2cd2eff9bd9ced09a6
X-Patchwork-Hint: ignore
Message-Id: <20211121204652.B0E808DE8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smack: fix
 SMAKE_LINUX_CONFIG_FIXUPS typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=41e2132fbe8a8fc237ca4a2cd2eff9bd9ced09a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo added by commit 2bac81f0cb776aca8e575459d07158a8d958737d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/smack/smack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index b7b656e644..fec3ef98c9 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -14,7 +14,7 @@ SMACK_DEPENDENCIES = host-pkgconf
 # Sources from GitHub, no configure script included.
 SMACK_AUTORECONF = YES
 
-define SMAKE_LINUX_CONFIG_FIXUPS
+define SMACK_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
