Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A620AC54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 21:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67345418E8;
	Wed,  6 Mar 2024 21:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhbM2D7Tk2Bq; Wed,  6 Mar 2024 21:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 564B8418DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 564B8418DF;
	Wed,  6 Mar 2024 21:36:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BFDE1BF5E6
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0888340701
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id beNA0_1G9CxJ for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 21:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB19A41812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB19A41812
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB19A41812
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 21:36:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyvnrMrp4EG7Lhyvpr90SY; Wed, 06 Mar 2024 22:36:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 22:36:03 +0100
Message-Id: <20240306213606.2149683-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
References: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFbFN2YUNdHEYcCeZ0Epz5b3upDloJwqwT8SN9+A1r9snWGucl2h0lw3o3u1+w1cZF6dSyIq7DYPiergjbbFs44cWAlA2QYyIF61gFldkkW8bYG3mQe2
 yrkyY0rcqO3n56iGwvk7Md9EswZ2amgiCwkccBrAEoAcMnIi/ct7rHa5dhFZzGt+V4bHITPNoDAVgv7xs0AhfKRr15jL6pl9AbrtZd3X0CjSb30r1QKCfaBO
 Mwa3Zt9tztaAN//68gw/CI4aUwF+l2V1oouVp9TWyaGwCbKNS6qfw+uF77ABwlZ+PVR/64LBwPBbFnKtOcUBX3NCR0oPdvYokCsyVOBppTEYS3CG/ioi4PDQ
 WBiAJfN8sJ1YB82TJXdhbHnkakXHKPe+Cs0/2pGC7pZk3eC5j8vaF27cSsh1M/fMf/433fOa4G6uNcPaTDbx75S4MjQTwLxtue7ihOJOJ0VYmt33rBgHquLN
 Ncqj2KtGRHn9+oaUpQrmHF0D2bdBW05t9aaAs7iZtEE6RoHKEZ2bfD4y945p9BReMP6XSeA5Cc3udF++vsUuBcqehLwuVUdpog6cTN6Iglnd85NF9jykQNl5
 +DI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709760969; bh=z1hzkh09ILz/tu+sRc5dw1QM+OxUAQBE5w3hkpk3CA0=;
 h=From:To:Subject:Date:MIME-Version;
 b=O2ArXOMyPaRnSUe6DsjHNWIclv+TCLzKiHg4YxN+iiRxrJCSqrENSO3AgNZ5eHF/7
 g8qKGPfHOWEKJXGPsQ2gMkHCBSKtJ0UdsH83MN7T0lz0vpxSgE3VE5rsnnR2JfetQc
 XX/YBOnsWdkdOc/EzmCOsDW9r+4z4FWavBF3S/zn5MKl1OaCvvQTALHZvuF7YSqVQV
 yXdVr7zP/dw7yi9oeiNs6P2a3c31aq99EI+yduRyH2xgobF3Xm6DpSriJdGkJazO4l
 KF6JkWttpxMITCattLSnHN4pj2lKpP2V4LSx2YgvSGNXMx3MCUoTQ39KnLPJ2iT06D
 vQRuIN5aSu3lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=O2ArXOMy
Subject: [Buildroot] [PATCH v3 6/9] package/libgeos: drop nios2 binutils bug
 27597 dependency
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
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libgeos/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 2a27c6f2a4..76cbb9bdcd 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_LIBGEOS
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
 	  JTS Topology Suite (JTS). It aims to contain the complete
@@ -14,8 +13,7 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads not binutils bug 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
