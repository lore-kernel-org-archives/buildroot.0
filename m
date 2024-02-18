Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A24C48BF8
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 18:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8415081F97;
	Sun, 18 Feb 2024 18:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnMrr269LeLf; Sun, 18 Feb 2024 18:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E39881FE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E39881FE2;
	Sun, 18 Feb 2024 18:45:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2641BF41F
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08E2640323
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98HdF3UclL3B for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 336A3400CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 336A3400CF
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 336A3400CF
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 18:45:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bmASrFAK1ce1vbmAUrHZIj; Sun, 18 Feb 2024 19:45:38 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 19:45:30 +0100
Message-Id: <20240218184536.1922309-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKoj9QbZm3o7ZFS7LiFVcAudpdw8zZ6vQIcsYnRdNqyQbLvWRBkN//Z/eq2ZkLkNfCHbYPDazvD1l/kMetz7vXWet7y5HRSCPBnXW3iHjTgxjyqE8kQE
 N0xCdAQQjuIKkbxDT/2oeiB21wdFvZrfdYSgioVqTe5psCLKt4YIh1bpd5uKjPf7HvEDQ9pfTxORNmxC/VxYrQEgQvNXoGHeyB3Rv4UzHEOqVMaatSS7btsV
 qsUW+cduvxAEmBR9/TX6KOw9DWxami75tIa8yLv0ajYZaNyL30a5xpOc1I5bnM/Azx645VCo6H9soR/0tKbtqz9J97wXLgqU2rp/UUrga2ZhQ/sFMz2gTOtN
 uTK7vKwz1ypQNSd1qiMBHqSaynGNIxmbZqBXIM6/MqUfu9zCC1BjoM2Oujy1S7gKDC5Atb8Rei0fm2hzhUaGoHmd5V/E920QC4vd0U5l+bGJXjABnNogbEtc
 k8t+3czUijbBeyCwjUIuS85cWc2cv42rFaKcx3Hu+rdWIyZ99e8PbVFz0A5x3kzv83gYITzhDapFANCd7VsQcbzd56rBlsZ7JaitX7F667zEACTt2kfvyRVX
 PAA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708281938; bh=SZUxqA2xSinwZnCJEWlfSbpEOySiSFZ9SdDw6BURxRE=;
 h=From:To:Subject:Date:MIME-Version;
 b=GG/vBwc98Joxo0bs0abo89NZdYNMBu86EE6m9zZ4Z8qSYkZcu6uu43njqcudJKa5C
 p0zzB9gQNYLXj89Ib/Oft7joOKBP4nhEsy3dR+43tSQPWu+k/PlL9T9NNZKjF5QnBY
 mRhz008Kabqg5Uy+By49w4dHCQSvTexueNF1Uj/xXdxtSd9ajIVIGISVZtGYb2wjbu
 XSL1Bm9DQ1ApQDKfYLrTaHRw1vsMAXzeWDrlSSxq+7IWY8pp2ajSN6XtfiX/A0K+yS
 gjN+IG637bngxlh7obWFybN1Xk3Y1nN6jtWqdX9TYpQQru4jtcBgsRFZUYiOcj4YsB
 zd4/OhSk6m9vA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=GG/vBwc9
Subject: [Buildroot] [PATCH 2/8] package/gdal: drop nios2 binutils bug 27597
 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/gdal/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index 24a1f06af2..839a1bd7ea 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_GDAL
 	# configure can't find proj, when linking statically
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_GIFLIB
@@ -26,9 +25,8 @@ config BR2_PACKAGE_GDAL
 
 	  https://gdal.org/
 
-comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 27597, threads, wchar"
+comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
