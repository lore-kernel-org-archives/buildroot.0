Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA40CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6361080F49;
	Sun, 21 Nov 2021 20:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGCj2u87sfgt; Sun, 21 Nov 2021 20:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C048880F3C;
	Sun, 21 Nov 2021 20:51:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1591BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A1DC80F3C
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbQtiVoWRnSW for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:51:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDA5F80F39
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:51:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BB35A8DEA7; Sun, 21 Nov 2021 20:46:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:51:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41e2132fbe8a8fc237ca4a2cd2eff9bd9ced09a6
X-Git-Newrev: a8ec47a29cd63b5532f63a991c1ef5bc8cee653e
X-Patchwork-Hint: ignore
Message-Id: <20211121204652.BB35A8DEA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smcroute: fix copy-paste error in
 .mk file from mrouted
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8ec47a29cd63b5532f63a991c1ef5bc8cee653e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/smcroute/smcroute.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 913647e7bf..7d81ab9d8e 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -32,7 +32,7 @@ SMCROUTE_POST_INSTALL_TARGET_HOOKS += SMCROUTE_PRUNE_COMPAT_SCRIPT
 
 # We will asume that CONFIG_NET and CONFIG_INET are already
 # set in the kernel configuration provided by the user.
-define MROUTED_LINUX_CONFIG_FIXUPS
+define SMCROUTE_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTICAST)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MROUTE)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
