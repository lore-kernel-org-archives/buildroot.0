Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AC7C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67E7E81076;
	Wed, 26 Oct 2022 13:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E7E81076
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NsBDsBPSLzgl; Wed, 26 Oct 2022 13:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B11C680C93;
	Wed, 26 Oct 2022 13:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B11C680C93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50BDD1BF982
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CA4060648
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CA4060648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsNbLqRd6Na2 for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:26:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9D9A60608
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9D9A60608
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:26:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ngQVojcL4uz2mngQYoqm6W; Wed, 26 Oct 2022 15:26:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 15:26:29 +0200
Message-Id: <20221026132634.999254-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
References: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJPlkSv3XL916wDjgqBW33d1zsbxKmu97AoIEcSabJdzn+Cpzw/g54taLoj+0yRkDAW6dpbuITvRmPzYqO4q75G4QURVuh/g0jrCTX6s1bYO7zfxjSJ7
 fVJOGPjVFCVliaDPtn1c6/SxXeKSWYgkBkGSxEJ72rOju3+tVtuPa/LnsjmnkD9577Govu1rDkS+mDsf+Yz0eckttmXy2zLOzU0FDF4vUQYY7MqxsnksAGek
 FRib8CFQE9b4+iHZxmz0amvbfEFa8QueMsmI0Q4iowc8sW76TrgDsLH8oFB9xaMsHuKfa80Fioy3tIJmVKlM5OJ7wTWMGeHnd+P2Iwe0Nbk6HyPafjOJkj/n
 jLD+0o640c5QvgjKMF7D9QY2RiNZ8bdEcb3GeKbQcKGBvcuFlhEQtIzqc1030y0r1D/St4e5pQFOsaE7dpKHEmZl55G1eJ1yPEMfJ4YPYOG4Zals7n4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666790799; bh=pIPMlH9XiufEumKdF3LviGiTTdgpLzmiAiUkXngHuxs=;
 h=From:To:Subject:Date:MIME-Version;
 b=G9cbeaHnDtw/NEugz4VfLC5i7205PbuudPVHUiFaLdCYZDSFpX6j+B/p7u27lMCne
 xZudEyFusrn0lIcvAkDEpLRWum2no79cAkjTnvjdDjXZO4T4Sl/VwUv+PsUL8YpMxF
 Wm/6TkIcXom2GvP7t+uzPJeEIqjMp/KanjNJsjXIbG3tTOTzoZ8vbXXrQ8yIvygDIL
 dRHlR/urW33dgu8Y4s8G/+4NK1jzQEqm54WgTaxgl9Xy+t1NMOu847wsRBNdraQsio
 9w1b7/OWnEsDa8cFEq0nIwtzeKNU3pBj6epbVhlph6SvLvpIXGNTIrtYE57+BJWCn9
 B805tVfFbiOKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=G9cbeaHn
Subject: [Buildroot] [PATCH 2/7] package/rtl8189fs: disable package for
 s390x architecture
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189fs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8189fs/Config.in b/package/rtl8189fs/Config.in
index ae69b79235..78eeed1a4f 100644
--- a/package/rtl8189fs/Config.in
+++ b/package/rtl8189fs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8189FS
 	bool "rtl8189fs"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  Wireless driver rtl8189fs.
@@ -7,4 +8,5 @@ config BR2_PACKAGE_RTL8189FS
 	  https://github.com/jwrdegoede/rtl8189ES_linux.git
 
 comment "rtl8189fs needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
