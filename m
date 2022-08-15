Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363B1C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35F383F2B;
	Mon, 15 Aug 2022 09:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D35F383F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xpWcFcNKPHPQ; Mon, 15 Aug 2022 09:21:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8C1683EFC;
	Mon, 15 Aug 2022 09:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8C1683EFC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2E5D1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 021DA41680
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 021DA41680
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kPZz_Kdm1ca4 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9C6A415F0
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C6A415F0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D2AE1875A3; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:04:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1decca34752d7359fe5fa8e4a38f90c3351e1ae
X-Git-Newrev: 086968e8690aac239d4f7f14d6d1c62dcf065a5d
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.D2AE1875A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openocd: drop bogus
 BR2_PACKAGE_OPENOCD_ZY1000*
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

commit: https://git.buildroot.net/buildroot/commit/?id=086968e8690aac239d4f7f14d6d1c62dcf065a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These inexistent symbols are referenced since 2014, from commit:
'aa441aa84c openocd: bump to version 0.8.0'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openocd/openocd.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 9f53ae3ee3..37a06ca848 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -56,8 +56,6 @@ OPENOCD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOCD_VPI),--enable-jtag_vpi,--disable-jtag_vpi) \
 	$(if $(BR2_PACKAGE_OPENOCD_UBLASTER),--enable-usb-blaster,--disable-usb-blaster) \
 	$(if $(BR2_PACKAGE_OPENOCD_AMTJT),--enable-amtjtagaccel,--disable-amjtagaccel) \
-	$(if $(BR2_PACKAGE_OPENOCD_ZY1000_MASTER),--enable-zy1000-master,--disable-zy1000-master) \
-	$(if $(BR2_PACKAGE_OPENOCD_ZY1000),--enable-zy1000,--disable-zy1000) \
 	$(if $(BR2_PACKAGE_OPENOCD_EP93XX),--enable-ep93xx,--disable-ep93xx) \
 	$(if $(BR2_PACKAGE_OPENOCD_AT91RM),--enable-at91rm9200,--disable-at91rm9200) \
 	$(if $(BR2_PACKAGE_OPENOCD_BCM2835),--enable-bcm2835gpio,--disable-bcm2835gpio) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
