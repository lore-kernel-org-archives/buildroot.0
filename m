Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23E7C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 16:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F9E2416F1;
	Fri, 29 Jul 2022 16:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F9E2416F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGxpmYYIJT6e; Fri, 29 Jul 2022 16:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13D73416F6;
	Fri, 29 Jul 2022 16:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13D73416F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 422151BF3BE
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 16:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EFD08400C
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 16:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EFD08400C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xl8fsu77IRRU for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 16:24:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D4E281448
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D4E281448
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 16:24:33 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HSmto7cAtbMeiHSmtoQjpf; Fri, 29 Jul 2022 18:24:31 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 18:24:29 +0200
Message-Id: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL2Hrn2qqiWLTZaDnujN49nEaYddaMkNW2d8Q7rzzMnE91HQHI9+ZNZ8xKTg1bL2wlttZFN1AfNAVGHJfrghwUaKOp4IDAzKgS4bWPUssYQxstXxXFyU
 R+J9Y+n+bzhARIqEtz5TGkhxoghJOrdIptlg1yqPRJGadLXVOEu6KONoSaV7jaxPM2x/sF6okvbNuxUNkWxvx9N+YJCN5PqjaPGAxB/kL7qHKfTvmefYsH2b
 z2lqfACE4kIa1LIvuyCXLVC6WFklkDYLYf6P23mG0DJJIfYPvkGW6suWG2/UUSDHCt8H+BVTFP8+vNPMO0n68BNRZkojLOjD0dRnOgvU28qJbLtji841C/UF
 AfUKijUsxJ23iBmB/XY4YJs5+GyS4p6nBL3u3HZ//mNJn3U3RRXUInzD+pi1ZjZiCmR/V8pkCt6op2H1PMzydzzF3gSASg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659111871; bh=JzpLjPmSsCPXY2GpsHMDrnp15/sN1MMl/RbKRLgssEM=;
 h=From:To:Subject:Date:MIME-Version;
 b=AVC1q0uGLj/kV/K317OuOWayN0jNB3S48RK3SupWjmle40BF879y/fFFVf3loS5Xo
 1ZlCzKJbM44+ppVb6sH6ooHomYnHWFrDkzDLkFoSO1aKTzGgX0nYa256sHuCNm3HGm
 KqT5WbT1M2JU3QODAewAtlVmgbDuCEgxwhfZxw0liWSFcX1JrA96d5rCjRa7bnGXen
 zfLUsJSSYzYvTAtkZ9oijMdE6DpRI3X8cptETB3Rrir8zAiUfy9m4JJSiCInHTnVnU
 dadYI6klyRhL3QMI6stoU5TT7CL2Zioabtch4358cEgywD5yorUGwDaRUIXPtUvczw
 zv71rKDD1FK/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=AVC1q0uG
Subject: [Buildroot] [PATCH 1/2] toolchain/Config.in: fix
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While introducing gcc bug 99410 I've named BR2_TOOLCHAIN_HAS_GCC_BUG_ to
99140 that is wrong. So let's fix this by changing bug option to
BR2_TOOLCHAIN_HAS_GCC_BUG_99410.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/belle-sip/belle-sip.mk | 2 +-
 toolchain/Config.in            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
index 11b96f3fd9..51e017000c 100644
--- a/package/belle-sip/belle-sip.mk
+++ b/package/belle-sip/belle-sip.mk
@@ -35,7 +35,7 @@ endif
 
 BELLE_SIP_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99140),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410)
 BELLE_SIP_CFLAGS += -O0
 endif
 
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6d12b6fed7..722bdb2de0 100644
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
