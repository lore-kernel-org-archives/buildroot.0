Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AC8C6FA89
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BE2B8305C;
	Tue, 13 Sep 2022 14:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BE2B8305C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzfaiDkm4ZsP; Tue, 13 Sep 2022 14:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B382882FBE;
	Tue, 13 Sep 2022 14:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B382882FBE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D18F1C1135
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67F204088C
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67F204088C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9zNQe8n72EO for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:21:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67CE340866
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67CE340866
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5676A837C6; Tue, 13 Sep 2022 14:21:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:10:49 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 1a45ad2bbe3685e9e3acc95552ccd9b58626d09f
X-Git-Newrev: d928bd39dd94e6a739191b76c2819129899d11e8
X-Patchwork-Hint: ignore
Message-Id: <20220913142155.5676A837C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] toolchain/Config.in: fix
 BR2_TOOLCHAIN_HAS_GCC_BUG_99140 number
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

commit: https://git.buildroot.net/buildroot/commit/?id=d928bd39dd94e6a739191b76c2819129899d11e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

While introducing gcc bug 99410 I've named BR2_TOOLCHAIN_HAS_GCC_BUG_ to
99140 that is wrong. So let's fix this by changing bug option to
BR2_TOOLCHAIN_HAS_GCC_BUG_99410.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5df2f9ff1cc15f3d71514b7c5ff6bd6380f57fd0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/belle-sip/belle-sip.mk | 2 +-
 toolchain/Config.in            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
index 11b96f3fd9..c9bcc3f55d 100644
--- a/package/belle-sip/belle-sip.mk
+++ b/package/belle-sip/belle-sip.mk
@@ -35,7 +35,7 @@ endif
 
 BELLE_SIP_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99140),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410),y)
 BELLE_SIP_CFLAGS += -O0
 endif
 
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 64714011e0..0c5c290a76 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -188,7 +188,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 # Error: branch offset out of range on Nios II. This bug
 # no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
 # fixed on gcc 11.x.
-config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
+config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
