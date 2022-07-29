Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED451C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 16:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 866E58411B;
	Fri, 29 Jul 2022 16:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 866E58411B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2BI28pWzbmG; Fri, 29 Jul 2022 16:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1C2883FAE;
	Fri, 29 Jul 2022 16:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C2883FAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB1F1C11A5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 16:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55B5960DFF
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 16:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55B5960DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxkI4JwbJNGm for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 16:24:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DDD160B98
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DDD160B98
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 16:24:33 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HSmto7cAtbMeiHSmtoQjqB; Fri, 29 Jul 2022 18:24:31 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 18:24:30 +0200
Message-Id: <20220729162430.1028453-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
References: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL2Hrn2qqiWLTZaDnujN49nEaYddaMkNW2d8Q7rzzMnE91HQHI9+ZNZ8xKTg1bL2wlttZFN1AfNAVGHJfrghwUaKOp4IDAzKgS4bWPUssYQxstXxXFyU
 R+J9Y+n+bzhARIqEtz5TGkhxoghJOrdIptlg1yqPRJGadLXVOEu6KONoSaV7jaxPM2x/sF6okvbNuxUNkWxvx9N+YJCN5PqjaPGAxB/kL7qHKfTvmefYsH2b
 z2lqfACE4kIa1LIvuyCXLVC6WFklkDYLYf6P23mG0DJJIfYPvkGW6suWG2/UUSDHCt8H+BVTFP8+vNPMO0n68BNRZkojLOjD0dRnOgvU28qJbLtji841C/UF
 AfUKijUsxJ23iBmB/XY4YJs5+GyS4p6nBL3u3HZ//mNJn3U3RRXUInzD+pi1ZjZiCmR/V8pkCt6op2H1PMzydzzF3gSASg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659111871; bh=wl907hDeOAflU2eVJiEYRABp2Ysq6agm2hit14fwFzg=;
 h=From:To:Subject:Date:MIME-Version;
 b=nFEL3PKKhX9JuRHzCXF09Zl9sXP2jU6lWROEMJwx7Nm/xjDBZkpj0IIGDnmcsuYwH
 K+ji4Hyh2RYyWKadW14sMsW1wYKSZP7x79j4LTrorQwzkTT3A5Skz100BWYpsLpm+5
 YUUbz1YzxfAv0MtAU4ir0inpMie/Vwd7ulYIvB74QUzyHp+lBfNQNeBztgPGqa7hfm
 kYowutnJ58GkOjYR+irNoZOr609nLqN7EXlU1D5umDrohzITruRL8KTC85N5XSONlR
 1gLoYMAcbTXaEuGnK4IJ/DCQcXJbAy7VSUmn+9NVCirruWA/1UK6qS2xhDV+9DDDRF
 3903oTzfNOIvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nFEL3PKK
Subject: [Buildroot] [PATCH 2/2] toolchain/Config.in: update gcc bug 99410
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

Gcc bug 99410 reappeared while building with gcc 11.x and while testing it
also shows up with gcc 12.x, so let's enable this bug for all gcc versions
except gcc 8.x.

Fixes:
autobuild.buildroot.net/results/64e/64e54ef5ba3a3dee391b788315615d57a1dd9fa2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 722bdb2de0..a71a0db83b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -186,12 +186,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
-# no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
-# fixed on gcc 11.x.
+# no longer exists in gcc 8.x but reappeared on gcc 9.x and still exists
+# on gcc 12.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
 	bool
-	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		     BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
+		     BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	depends on BR2_nios2
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
