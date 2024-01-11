Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18920C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 13:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A28B983C67;
	Thu, 11 Jan 2024 13:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A28B983C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1wHx9G5maVE1; Thu, 11 Jan 2024 13:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2B7783BCD;
	Thu, 11 Jan 2024 13:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B7783BCD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D7971BF2A6
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 13:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82B154284B
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 13:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82B154284B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWxYY-6UwfKL for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 13:19:37 +0000 (UTC)
Received: from mail2.eaton.com (mail2.eaton.com [192.104.67.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A93AB4272D
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 13:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A93AB4272D
Received: from mail2.eaton.com (simtcimsva04.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C3ED8C2D5
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 08:19:35 -0500 (EST)
Received: from mail2.eaton.com (simtcimsva04.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 466CC8C2CE
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 08:19:35 -0500 (EST)
Received: from USLTCSPGWY04.napa.ad.etn.com (USLTCSPGWY04.napa.ad.etn.com
 [151.110.126.225]) by mail2.eaton.com (Postfix) with ESMTPS
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 08:19:35 -0500 (EST)
Received: from USLTCSPGWY04.napa.ad.etn.com (151.110.126.225) by
 USLTCSPGWY04.napa.ad.etn.com (151.110.126.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 11 Jan 2024 08:19:34 -0500
Received: from localhost (151.110.234.152) by USLTCSPGWY04.napa.ad.etn.com
 (151.110.126.205) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 11 Jan 2024 08:19:34 -0500
To: <buildroot@buildroot.org>
Date: Thu, 11 Jan 2024 13:19:32 +0000
Message-ID: <20240111131932.11760-1-laurentbadel@eaton.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: 96b59d02-bc1a-4a40-8c96-611cac62bce9
X-on-prem-Exchange: True
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eaton.com; 
 s=eaton-s2020-01; t=1704979176;
 bh=oiZ8CkBiHepTfcDn0ntF+xBnD8dqcrHv4qc6kjhG7R0=; h=From:To:Date;
 b=XYCjNrhyY04vOcuk34B2IJpIU6PImBTTxfoK5RXalNUn0HKPQQdoLzVxeKKBjR0oZ
 jr7yahipdDviygQsXeTNNk2s1i+vGUEnvbVhd8wMctcWiO2kCkVvAfENJx0TMhBmwj
 u6tOARfY8b/VxsQlsns0UGESTdRN+fvScgT30X+l7FiN3Neb5CoqLzqx63neq+9yYJ
 v26h+L9dXQcSSy0Gmf9yGj9X9SUfFKdGm/eJW1+zSzJgGMd4l0Sv9QSePqC3z2/9yA
 WZPLnK1GH1WSrBgbOiB83+Gp8f1KCB8n8oS2HtRe86o8Mrh7ZfdjhquqCgN4ggR3LK
 2iVCV5VscY1Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=eaton.com header.i=@eaton.com
 header.a=rsa-sha256 header.s=eaton-s2020-01 header.b=XYCjNrhy
Subject: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for zImage
 with appended DTB
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
From: Laurent Badel via buildroot <buildroot@buildroot.org>
Reply-To: Laurent Badel <laurentbadel@eaton.com>
Cc: Laurent Badel <laurentbadel@eaton.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building a zImage with appended DTB, buildroot creates a copy of
the zImage named zImage.$(LINUX_DTS_NAME). mxs-bootlets.mk does not
take this into consideration and instead passes the original zImage
(without DTB appended) to elftosb to generate the SB file. Thus,
make sure that the correct zImage is used in this process.

Note: this patch only supports a single DTS specified in the
configuration, because there is no obvious use case for multiple DTS's
with mxs-bootlets. If multiple DTS's are configured, only the first one
will be used.

Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
---
 boot/mxs-bootlets/mxs-bootlets.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index adc22767..2003b23f 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -65,9 +65,10 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
 	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
 		$(MAKE1) -C $(@D) linux_prep
 endef
+ZIMAGE_NAME=zImage$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),.$(notdir $(firstword $(LINUX_DTS_NAME))))
 define MXS_BOOTLETS_SED_LINUX
 	sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
-	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/$(ZIMAGE_NAME)";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
 endef
 endif
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
