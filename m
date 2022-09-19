Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEA7C54EE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 13:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F02FD40BBF;
	Mon, 19 Sep 2022 13:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F02FD40BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7AgTIKdysS0; Mon, 19 Sep 2022 13:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B35540B94;
	Mon, 19 Sep 2022 13:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B35540B94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E78161BF3C8
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 13:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C31CC82D07
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 13:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C31CC82D07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3bJUxNUXwKe for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 13:24:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11CF082B21
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11CF082B21
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 13:24:51 +0000 (UTC)
Received: from localhost.localdomain ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPSA
 id aGlVoNhALCxznaGlVoCK2f; Mon, 19 Sep 2022 15:24:50 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 15:20:35 +0200
Message-Id: <20220919132035.479510-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAdOTZo+WFm3Nml3KxE94zUzt4WPc/LUPsLmolPrwnh85obBAV59OdzXJTpNeVW/+034HZYDyCV7yv0gxSoDL/b6HnTfOo8Yll7kzywqS9qCDcmm2xF/
 YFI/xdhwTkJWDiylHCnoQH92mlKx1F/pj3H7hcpm76/OUTjKST8f5bSTGlZC41mLSocuIvBagm7oHRS+Y+F+kZ1xRa+x3unjHx/Hj9JbgwHs2xZw7YMugPKb
 Ifi7pZjccHxNQw3g/tW8HdDrSnJshLcsXZ6ARDpsCITWNx+IS2QYxCYoUQhNwoQN
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663593890; bh=W1tvXXJIRzvMBtSq+23sNSMT/UshvJ26oOTOWJcDvOM=;
 h=From:To:Subject:Date:MIME-Version;
 b=RjtUP9fv4ljzBFJfZOb2SsTyAoHyI16tOQXGh/3v3Ccuul2dc/aABtP3cBxgLSJPx
 vd9T1NNHskal4YbieqKiIW9eyjR34BjntcFk8WZKMC5Zb0iNF9TxvNzzNN6oWxeZYW
 1Slkr9ZU72JgXyk6rrdzF675vgqagvb77Hm61JBk5K1YlH/ohrpOnuMD7SshzCDyY+
 ua17HXrDCNUyNd5sxiXiaogp3FP8BPc1HvszkeIoeTZ3gcnT7xKM3ocZp1K+7MQu1Q
 1cq/epk58+hF3Csa7fSKAsSrCWc/m43Unlad7GSK64rIkX+t9VGzwRLF/EiUSta4bt
 0Ej96dNfqwnUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=RjtUP9fv
Subject: [Buildroot] [PATCH] package/rtl8723bu: fix build failure due to
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

This driver requires:
CONFIG_NET
CONFIG_WIRELESS
CONFIG_CFG80211
CONFIG_USB_SUPPORT
CONFIG_USB
to build so let's add them to RTL8723BU_LINUX_CONFIG_FIXUPS.

Fixes:
http://autobuild.buildroot.net/results/7f3637760ad88d314e6812865f3667d1de091957/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/rtl8723bu.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 3da8d9cecf..82c487b4e1 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -12,6 +12,14 @@ RTL8723BU_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR)
 
+define RTL8723BU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
 define RTL8723BU_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723b_fw.bin
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
