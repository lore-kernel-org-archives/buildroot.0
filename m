Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23A6C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 00:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F45441B50;
	Sat, 14 Jan 2023 00:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F45441B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9kfE0W_aVQF; Sat, 14 Jan 2023 00:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 247CA41A58;
	Sat, 14 Jan 2023 00:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 247CA41A58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91D911BF3C3
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C951821C9
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C951821C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ychhiKC2CWqN for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 00:31:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BB74821C7
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BB74821C7
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 00:31:35 +0000 (UTC)
Received: from localhost.localdomain ([88.149.186.89])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GUSBpoy9lBXcMGUSBpPdAv; Sat, 14 Jan 2023 01:31:34 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 01:31:22 +0100
Message-Id: <20230114003122.1475047-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKRc2vC3rLhCaIlmRXUwskD/Ae5o9pD4kxlDYLvVOjXKluac4Eem9pGhNtn6PVcaYnLIBOmYfBpPJ+PTB7I9foTaZgEEUbqYRN554PtkqX8Q7A/U6AoH
 3D/ZA+w0+Ftt1OHdH0onFdGAmUnvsvbEksGaac3ZonGR0os13kOBJsUwv0F5N6d9Ur3nYZj/Zl8FgKkGgNk4MISfXXxyjjl3/lnNM1jAF9qU8uzPoQiW8dhx
 vRXePIRygzrSV5s17f0yB3jc0fn1eH4TZtxOHm4pjQoonH90bkEyXjMLK/IGMQuQL883l3X3R7gyP7Sp25V3eQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1673656294; bh=395MUJwW6WB8K5y3l4GVwcyjB4zY7m1QDni1ER6ZevU=;
 h=From:To:Subject:Date:MIME-Version;
 b=YXIhw+jvrg9FvV2ceTUVaiTlrvstTnzI6+MwQsPSWrKEpqleB+erVjB0euCEucMv/
 YNdtHcW3daYtbs8XgCXFWUrqi39gnOjyACWEI+VS7s75XkRR4TxxWH0UO1QOSAD/LS
 bgT0fW6I/tfOS1O74CVfRRtWhtTsstmXU4ZRByNEXGzw3a2RegV9042xJAY/YK3lRV
 2+sj9cv3Zk0evxCezumh5ZGhCZUiWQNfrov5cum6tDxHu/8Mqoa0BKbMZntXDKf8dz
 CrGDxwgH6/ynBBoB4edre04ESmSrVGoLnJaTv38x5LwLQwmbmesbOXiB6pfvfR8zMS
 pWB/aVEGMzcFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YXIhw+jv
Subject: [Buildroot] [PATCH v2] package/rtl8821cu: fix build failure due to
 missing Linux options
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/aea/aea6bc1e4f89bd1010dfdc9caa54c37edb567d5f/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* drop CONFIG_PLATFORM_ change
---
 package/rtl8821cu/rtl8821cu.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 18222e0014..97f50d9633 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -9,6 +9,14 @@ RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
 
+define RTL8821CU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
 RTL8821CU_USER_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 	-DCONFIG_IOCTL_CFG80211 \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
