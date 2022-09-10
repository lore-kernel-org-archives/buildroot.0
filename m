Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30373ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 10 Sep 2022 14:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 360DA60FBB;
	Sat, 10 Sep 2022 14:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 360DA60FBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3suUA-AVvrSy; Sat, 10 Sep 2022 14:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6260560E5F;
	Sat, 10 Sep 2022 14:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6260560E5F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1725E1BF30E
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 14:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6BA484265
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 14:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BA484265
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JCPjCY3e4DdS for <buildroot@lists.busybox.net>;
 Sat, 10 Sep 2022 14:00:02 +0000 (UTC)
X-Greylist: delayed 00:07:01 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EED8284236
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id EED8284236
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 14:00:01 +0000 (UTC)
Received: from localhost.localdomain ([146.241.28.15])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X0unoChogeVWJX0unoKHyb; Sat, 10 Sep 2022 15:52:58 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 10 Sep 2022 15:52:55 +0200
Message-Id: <20220910135256.1689860-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN0Ar1pW01O8tfPIEIx17q4j5bCyiQsjhblRfJ4Tl3YoP3azP2vvdPdp7F/YYBom+XPxs27g4l3goltamllQyTF/o3iZfaweInaiQ/iBv9aVvN5QP8Z4
 obJJxtuXHKhZajzR4318g4BXGtx5hW2o33g9YvfQbO2Dvqr0qrfyvkLiNUdebH/kKBul8rmIDe84rtSTjlsDIWBgCIgZpjUNLbyCr1Wu82sA3U4Y65SY0RUK
 1aMhKtfjq8yHkSVssb7W8AeVRWRUc91n1zSZl2cWdLZ3CDDu5687ZcnbyAboUGe2mNgonibHyTOaE38NYoOjYm6WaVLgvtWelatHz39A9gfrUpzk7Z4rH93+
 066cb095Z1blZuorMEJAkqBtZtvYlM2/FHApMILhIpUFiuyIyYYuI+xhklQPd4fda8wwtcBzfImKKbhLL/WHgk4YnFRinEoMayXD0sP2dxqbf36Uy7c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662817978; bh=jSDZo11IExTrtM7u+AZImjKEUyVrFKSFOqyqsSuMgfo=;
 h=From:To:Subject:Date:MIME-Version;
 b=mZYS/prxI5gH8rqMeRMBqkukOV/RzFMMgNtSvdICtlcDncLa/b9M4qx9elybdvePq
 noc+2+f/nvZr/48cGT6V1HpwjvfSwRKd3aPLYY3tv6E1vYX87/9BeuRUFWyx7K9Sf0
 Gvv3o8aY2/DkHp5uSbZLQnDCIOL3QnPOZEKpiipnCwEiqGuVias4gMVkWNAxNyKIo6
 RX8KvE7m536zxIk7PlZmr+7jWs0XWeZy0LawGZDeGjZWNph22Azu+4U68kFADZYxOd
 spaAjzW3a7c5U8LhILmxPvWe8tMPo6d4UgZI6BNp8W1pC7fvEsB06YavX66TTbLaEL
 IZS3iOA8uzrnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=mZYS/prx
Subject: [Buildroot] [PATCH 1/2] toolchain/Config.in: update gcc bug 90620
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gcc bug 90620 reappeared with gcc 11.x so let's update
BR2_TOOLCHAIN_HAS_GCC_BUG_90620 conditions.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index fbc2f28553..16e358344d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -168,11 +168,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
 # ICE: in do_output_reload, at reload1.c:7978 on microblaze.
-# This bug no longer exists in gcc 10.x
+# This bug no longer exists in gcc 10.x but reappeared in gcc 11.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	bool
-	default y if BR2_microblaze
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on BR2_microblaze
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
 # ICE: compiler error: Segmentation fault on Nios II. This bug
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
