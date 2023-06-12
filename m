Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EC6C88CB2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 16:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFAC681F58;
	Mon, 12 Jun 2023 16:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFAC681F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNoh38p9YPJC; Mon, 12 Jun 2023 16:53:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 122A381F42;
	Mon, 12 Jun 2023 16:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 122A381F42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB6E61BF36D
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 16:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFCCC410B2
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 16:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFCCC410B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ln1mdfsis_rA for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 16:53:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC9C1410A5
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC9C1410A5
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 16:53:49 +0000 (UTC)
Received: from localhost.localdomain ([146.241.109.39])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8knZq09TpJMjG8knZqdFsc; Mon, 12 Jun 2023 18:53:45 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 18:53:44 +0200
Message-Id: <20230612165344.3829304-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ+krY6INi2UvSVH/8xFleVcIbNIUmuzvuMXfc+NoESQENB51bCG+pm3lMJX/Cjnfliq2qX1ttUUju/YhABF3FS9f4X02e9TCQQxFqVU7Z9tcYdZpWl2
 c2shzEANY3HuHkQWQbo29CGdpHpTBdnrr+TOWEGmSpxPZsOClWPuomdmxdYrm9geNhemwDvwL5q7sHWyL4X7S2QokBWvAUipQfxCezzOdbeATg5mLM0NBu/p
 TWd1AY8xOJHqDd4w3YKTOFIXYOFCEW+UhBy6R6QYjkJh77VL5iX2s+RIpv43iWDqz0XS1j6+d1sojXxm4AYuBH2CM/xUoIn+VLeZNl3s4UohNO2HJ9KVFzHt
 AneFsoty
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686588825; bh=kLSyOJQ05VzC67mwII6Wvxo2mHJaeK2yRKu7D0Qa/zw=;
 h=From:To:Subject:Date:MIME-Version;
 b=DWH/ZihRwkuyiSDgNLJ1QrbLXqggAmKlhusB4T2V9Mdg9uTIW/hp9k6IhSQp894Bu
 cIdsEAd75ibq4BPObSRS81EixMtFCpL0MrbSLHh97CWkyRCTL84ZPwinPj7GDvZBoC
 oCCfceXZYPaNlwlxM1S1JDcvv/V287CbP9bxnAtOCDxchkvH3W7kvyF/VkZZ7XFt9K
 i0wlQtuGZ50eyJ4W8Mk35Y1Ugfy+Hl7UXDvQrUM4MAB91IjBnMIwNBqdhVtyDAQGEr
 Lqdj066QhGoCW1jK5a4oqlqAdDHllZlChSfSJdjZNWKtKYBCOvqOC/xFIPIGjvBk83
 0Cysk7CtRYl1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=DWH/ZihR
Subject: [Buildroot] [PATCH] package/rtl8189fs: en/disable runtime debug
 according to BR2_ENABLE_RUNTIME_DEBUG
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Indrek Kruusa <indrek.kruusa@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189fs/rtl8189fs.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index dd35a166e5..6b0585073b 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -13,6 +13,10 @@ RTL8189FS_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR)
 
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
+RTL8189FS_MODULE_MAKE_OPTS += CONFIG_RTW_DEBUG=n
+endif
+
 define RTL8189FS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
