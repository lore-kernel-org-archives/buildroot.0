Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1241FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C602180C3B;
	Wed,  8 Dec 2021 08:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtJ8cxmVMWG9; Wed,  8 Dec 2021 08:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379D280CDB;
	Wed,  8 Dec 2021 08:43:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 055A51BF365
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E790140147
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GvxelmQJ528M for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:43:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 243BD400EB
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:43:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 045D781992; Wed,  8 Dec 2021 08:38:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Dec 2021 09:41:12 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 87b632fd14929dfb83ff40d6c132b0bc2c35ca19
X-Git-Newrev: 266e82f0e21f2f163223c06e93bfb8ae7006a33a
X-Patchwork-Hint: ignore
Message-Id: <20211208083831.045D781992@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/smack: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=266e82f0e21f2f163223c06e93bfb8ae7006a33a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix typo added by commit 2bac81f0cb776aca8e575459d07158a8d958737d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 41e2132fbe8a8fc237ca4a2cd2eff9bd9ced09a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
