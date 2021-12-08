Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16F4C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 589F984C0E;
	Wed,  8 Dec 2021 08:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGkq1zhDmm6R; Wed,  8 Dec 2021 08:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A5A83EFC;
	Wed,  8 Dec 2021 08:43:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FC0D1BF365
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CB184042F
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pew-TapK7GKQ for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:43:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90EB740325
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:43:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E33881992; Wed,  8 Dec 2021 08:38:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Dec 2021 09:41:24 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: ff5818ca86f6b05423b217a55c473e7d97eab1d6
X-Git-Newrev: 95ea3836463f0c7fb2566afabeaed8a09a2fe6d8
X-Patchwork-Hint: ignore
Message-Id: <20211208083823.6E33881992@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/smack: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=95ea3836463f0c7fb2566afabeaed8a09a2fe6d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
