Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E64C5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 21:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9915B418D3;
	Wed,  6 Mar 2024 21:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwA0I9Oth6Fb; Wed,  6 Mar 2024 21:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50F424190E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F424190E;
	Wed,  6 Mar 2024 21:36:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A24861BF5E6
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DC2E80FA8
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wr9U-TtPpLVK for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 21:36:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 682E580B00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 682E580B00
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 682E580B00
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 21:36:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyvnrMrp4EG7Lhyvpr90SG; Wed, 06 Mar 2024 22:36:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 22:36:02 +0100
Message-Id: <20240306213606.2149683-6-giulio.benetti@benettiengineering.com>
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
 t=1709760969; bh=QLHSPkcuEh2Yn8D//nH2YtuZnggryDj+tBO1VlkeUr0=;
 h=From:To:Subject:Date:MIME-Version;
 b=Wz5B/S0DVbbsM9pTw4Wx4UcP1KraxyG+Fce8P91NYLUIJW/yU/sbpAV8re3FnevWa
 fi3LsX22orfLsIFsnlsXn9Ud7aTKMgaQrbgIUe4Y5X3fw7YxwS6N9YfNttC14wBnDq
 VF7NzbP/7txj0MSmvPp39XLcawX6EADtgxVoNqHG3R2MQMwHvmBWRhY0QIhq6OilFq
 4USCtLdT2JlEXkxtlDIBPZo+qJk5z+4j33nkYC+chhXLYedXN9nhaIp8BLirYqHMVc
 feFgejHp8QAtbP79996EovYL7WsFP6s3+JPVcdw1dXmBz/2kUKQP+5AwKsFN5q1svH
 AOIqM2NNAOLjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Wz5B/S0D
Subject: [Buildroot] [PATCH v3 5/9] package/libcamera: drop nios2 binutils
 bug 27597 dependency
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
 package/libcamera/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index ccb5281b4b..e84b8d342e 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	default y
 	# Invalid packing size of ControlValue struct on m68k
 	depends on !BR2_m68k
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 
 menuconfig BR2_PACKAGE_LIBCAMERA
 	bool "libcamera"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
