Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CD7C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FF9A41B61;
	Fri, 29 Jul 2022 19:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FF9A41B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0ClcwaVqewX; Fri, 29 Jul 2022 19:52:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13FD2409FE;
	Fri, 29 Jul 2022 19:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13FD2409FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EED61BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ADCD40C62
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ADCD40C62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H42mkCnGVn4R for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A47AC40C4F
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A47AC40C4F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4DCE886940; Fri, 29 Jul 2022 19:38:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 21:47:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d120dacf6a4d848e3eb31aa387fd72143f98d5a7
X-Git-Newrev: 5df2f9ff1cc15f3d71514b7c5ff6bd6380f57fd0
X-Patchwork-Hint: ignore
Message-Id: <20220729193849.4DCE886940@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: fix
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5df2f9ff1cc15f3d71514b7c5ff6bd6380f57fd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While introducing gcc bug 99410 I've named BR2_TOOLCHAIN_HAS_GCC_BUG_ to
99140 that is wrong. So let's fix this by changing bug option to
BR2_TOOLCHAIN_HAS_GCC_BUG_99410.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 5f79c07df0..ed3f6c6645 100644
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
